
set dispflag 1
set pid 0

set constraintsType Transformation
set numbererType RCM
set systemType SparseSYM

#source taskTransientBTM.tcl
source taskTransient.tcl

set recInput [open $outputDir/input.txt a+]

puts $recInput "Time-history Analysis"

# # NLTHA PARAMETERS
#set algorithmBasic [split "KrylovNewton"];
#set testBasic "NormDispIncr";
#set showTestBasic 0;
#set tolDynBasic 1e-8;
#set maxNumIterDynBasic 500;
# # NLTHA PARAMETERS FOR NON-CONVERGENCE
#set showTest 0;
#set tolDynDisp 1e-11;
#set tolDynUnb 1e-05;
#set maxNumIterDyn 2500;

# READ GROUND MOTION INPUT
set gm_dirctn_L 1;			# ground-motion direction (1 - X)
set gm_dirctn_T 2;			# ground-motion direction (2 - Y)

# set up ground-motion-analysis parameters

set gmDataFile_L [open "GroundMotions/$EQlevel/H1_RSN$RSN.dat" "r"];
set gmDataFile_T [open "GroundMotions/$EQlevel/H2_RSN$RSN.dat" "r"];

#set gmDataFile_L [open "GroundMotions/$EQlevel/H1_RSN$RSN.dat" "r"];
#set gmDataFile_T [open "GroundMotions/$EQlevel/H2_RSN$RSN.dat" "r"];

set gmData_L [read $gmDataFile_L]; 
set gmData_T [read $gmDataFile_T];

close $gmDataFile_L;
close $gmDataFile_T;

set npts_L [lindex $gmData_L 0]; 
set npts_T [lindex $gmData_T 0];

set npts [expr $npts_L - 1]

set dtRec_L [lindex $gmData_L 1]; 
set dtRec_T [lindex $gmData_T 1];

set dtRec $dtRec_L
set dtAnalysis $dtRec;
set dtAnalysis 0.01;
#set dtAnalysis 0.0025;

set gmDataInput_L {}
for {set i 1} {$i <= $npts} {incr i} {
    lappend gmDataInput_L [lindex $gmData_L [expr $i + 1]]
}

set gmDataInput_T {}
for {set i 1} {$i <= $npts} {incr i} {
    lappend gmDataInput_T [lindex $gmData_T [expr $i + 1]]
}

set percentageTime 1.0
#set percentageTime 0.2
set totalAnalysisTime		[expr $npts*$dtRec*$percentageTime];
#set totalAnalysisTime		[expr $totalAnalysisTime + 7];
#set totalAnalysisTime		15;

puts $recInput "npts $npts"
puts $recInput "dtAnalysis $dtAnalysis"
puts $recInput "totalAnalysisTime $totalAnalysisTime"

# ###################################################################################################################################################################################################
# ################################################################################# RAYLEIGH DAMPING ################################################################################################
# ###################################################################################################################################################################################################

#set w1_1 1.44269
#set w1_2 1.82877

set w1_1 [lindex $omega 0]
set w1_2 [lindex $omega 1];
set w1 [expr ($w1_1 + $w1_2)/2.];	# Average of first translational modes
set w2 [expr 2*$pi/0.7];			# Second translational mode
#set w2 [lindex $omega 4];			# Second translational mode

#set w1 [expr $w1/2.]
#set w2 5.712

puts $recInput "Damping"
puts $recInput "w1 $w1 w2 $w2"

set ksi1 0.015
set ksi2 0.02
#set ksi1 0.025
#set ksi2 0.05

set beta	[expr (2.*$w2*$ksi2 - 2.*$w1*$ksi1)/($w2*$w2 - $w1*$w1)]
set alphaM	[expr 2*$w1*($ksi1 - $beta*$w1/2.)]

set betaKinit $beta;         
set betaKcurr 0.; 			
set betaKcomm 0.;
rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm

puts $recInput "alpha $alphaM beta $beta"

close $recInput

# ###################################################################################################################################################################################################
# ################################################################################# SET LOAD PATTERN ################################################################################################
# ###################################################################################################################################################################################################

#  perform Dynamic Ground-Motion Analysis
set timeHisTag $patternTagGravity

set gmLoadTag_L $timeHisTag;	# LoadTag for Uniform ground motion excitation
incr timeHisTag

set gmLoadTag_T $timeHisTag;	# LoadTag for Uniform ground motion excitation
incr timeHisTag

set scaleFac_L 1.0;
set scaleFac_T 1.0;

set gmFact_L [expr $g*$scaleFac_L];		# data in input file is in units of g
set gmFact_T [expr $g*$scaleFac_T];		# data in input file is in units of g

set tsTag_L $gmLoadTag_L;
set tsTag_T $gmLoadTag_T;

timeSeries Path $tsTag_L -dt $dtRec -values $gmDataInput_L -factor $gmFact_L;
timeSeries Path $tsTag_T -dt $dtRec -values $gmDataInput_T -factor $gmFact_T;

pattern UniformExcitation  $gmLoadTag_L  $gm_dirctn_L -accel  $tsTag_L;		# create Uniform excitation
pattern UniformExcitation  $gmLoadTag_T  $gm_dirctn_T -accel  $tsTag_T;		# create Uniform excitation

# ###############################################################################################################################################################################
# #########################################################################  SOURCE RECORDERS  ##################################################################################
# ###############################################################################################################################################################################

source "BTM_RECORDERS_dynamic.tcl";
puts "Recorders OK"
record

#end

# ###################################################################################################################################################################################################
# ############################################################################### RUN ANALYSIS ######################################################################################################
# ###################################################################################################################################################################################################

proc runStep {testType tol iterList constraintsType numbererType systemType run_test run_algorithm dtii logTrans} {    
  set iterH [lindex $iterList 0]
  set iterM [lindex $iterList 1]
  set iterL [lindex $iterList 2]  
  
  wipeAnalysis; constraints $constraintsType; numberer $numbererType; system {*}$systemType
  eval test {*}$run_test
  algorithm {*}$run_algorithm
  set integratorType {Newmark 0.5 0.25}
  integrator {*}$integratorType; analysis Transient
  set ok [analyze 1 $dtii]
  if {[getPID] == 0 && $ok == 0} {
    set iterOpt [lindex $run_test 2]
	set pFlag [lindex $run_test 3]  
	if {[string compare $iterOpt {$iterH}] == 0} {set iter $iterH}
	if {[string compare $iterOpt {$iterM}] == 0} {set iter $iterM}
	if {[string compare $iterOpt {$iterL}] == 0} {set iter $iterL}	
	puts $logTrans "$constraintsType $numbererType {$systemType} $testType $tol $iter $pFlag {$run_algorithm} {$integratorType} $dtii"
    flush $logTrans  
  }  
  return $ok	    
}

set finc 1
set fdec 1
set runTest 1
set dti $dtAnalysis
set dtii $dti
set step 1	

puts "transient running..."  
set recTrans [open $outputDir/transient.txt w]	
set logTrans [open $outputDir/logTrans.txt w]


set currentTime [getTime]
while {$currentTime < $totalAnalysisTime} {	
      set ok -3	
	  
	  
	  if {$runTest == 1} {
        set dtmax [expr {$dti*1.}];# use 1,2,4
		set dtmin [expr {$dti/2.**8}];# use 4,8,12,16
	    set rinc 2;# use 2,4
		set rdec 4;# use 2,4,16
	  } elseif {$runTest == 2} {
	    set dtmax [expr {$dti*1.}]
		set dtmin [expr {$dti/2.**12}]
	    set rinc 2
		set rdec 4
	  } elseif {$runTest == 3} {
	    set dtmax [expr {$dti*2.}]
		set dtmin [expr {$dti/2.**16}]
	    set rinc 2
		set rdec 4
		#set dtmax $dti
		#set dtmin $dti
	    #set rinc 1
		#set rdec 1
	  } elseif {$runTest == 4} {
	    set dtmax [expr {$dti*2.}]
		set dtmin [expr {$dti/2.**16}]
	    set rinc 2
		set rdec 2
	  } elseif {$runTest == 5} {
	    set dtmax [expr {$dti*1.}]
		set dtmin [expr {$dti/2.**8}]
	    set rinc 2
		set rdec 4
	  } elseif {$runTest == 6} {
	    set dtmax [expr {$dti*1.}]
		set dtmin [expr {$dti/2.**12}]
	    set rinc 2
		set rdec 4
	  } elseif {$runTest == 7} {
	    set dtmax [expr {$dti*2.}]
		set dtmin [expr {$dti/2.**16}]
	    set rinc 2
		set rdec 4
	  } else {
	    set dtmax [expr {$dti*2.}]
		set dtmin [expr {$dti/2.**16}]
	    set rinc 2
		set rdec 2
	  }  
	  
	  	  
	  if {$runTest == 1} {
      if {$ok != 0 && $run1a} {
        set algoType "$step.$dtii $currentTime    1a. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans]    
	  }
      if {$ok != 0 && $run2a} {
        set algoType "$step.$dtii $currentTime    2a. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans]        
      }
      if {$ok != 0 && $run3a} {
        set algoType "$step.$dtii $currentTime    3a. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans]		
      }
      if {$ok != 0 && $run4a} {
        set algoType "$step.$dtii $currentTime    4a. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans]        
      }
      if {$ok != 0 && $run5a} {
        set algoType "$step.$dtii $currentTime    5a. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run6a} {
        set algoType "$step.$dtii $currentTime    6a. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run7a} {
        set algoType "$step.$dtii $currentTime    7a. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run8a} {
        set algoType "$step.$dtii $currentTime    8a. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType1 $tol1 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans]
      }
	  };# $runTest == 1
          
      
      if {$runTest == 2} {	  
      if {$ok != 0 && $run1b} {
        set algoType "$step.$dtii $currentTime    1b. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run2b} {
        set algoType "$step.$dtii $currentTime    2b. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run3b} {
        set algoType "$step.$dtii $currentTime    3b. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run4b} {
        set algoType "$step.$dtii $currentTime    4b. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run5b} {
        set algoType "$step.$dtii $currentTime    5b. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run6b} {
        set algoType "$step.$dtii $currentTime    6b. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run7b} {
        set algoType "$step.$dtii $currentTime    7b. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run8b} {
        set algoType "$step.$dtii $currentTime    8b. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType2 $tol2 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans]
      }
      };# $runTest == 2
	  
      
	  if {$runTest == 3} {	
      if {$ok != 0 && $run1c} {
        set algoType "$step.$dtii $currentTime    1c. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run2c} {
        set algoType "$step.$dtii $currentTime    2c. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run3c} {
        set algoType "$step.$dtii $currentTime    3c. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run4c} {
        set algoType "$step.$dtii $currentTime    4c. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run5c} {
        set algoType "$step.$dtii $currentTime    5c. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run6c} {
        set algoType "$step.$dtii $currentTime    6c. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run7c} {
        set algoType "$step.$dtii $currentTime    7c. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run8c} {
        set algoType "$step.$dtii $currentTime    8c. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType3 $tol3 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans]
      }     
      };# $runTest == 3
	  
   
      if {$runTest == 4} {
      if {$ok != 0 && $run1d} {
        set algoType "$step.$dtii $currentTime    1d. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run2d} {
        set algoType "$step.$dtii $currentTime    2d. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run3d} {
        set algoType "$step.$dtii $currentTime    3d. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run4d} {
        set algoType "$step.$dtii $currentTime    4d. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run5d} {
        set algoType "$step.$dtii $currentTime    5d. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run6d} {
        set algoType "$step.$dtii $currentTime    6d. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run7d} {
        set algoType "$step.$dtii $currentTime    7d. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run8d} {
        set algoType "$step.$dtii $currentTime    8d. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType4 $tol4 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans]
      }
	  };# $runTest == 4
          
      
      if {$runTest == 5} {	  
      if {$ok != 0 && $run1e} {
        set algoType "$step.$dtii $currentTime    1e. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run2e} {
        set algoType "$step.$dtii $currentTime    2e. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run3e} {
        set algoType "$step.$dtii $currentTime    3e. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run4e} {
        set algoType "$step.$dtii $currentTime    4e. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run5e} {
        set algoType "$step.$dtii $currentTime    5e. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run6e} {
        set algoType "$step.$dtii $currentTime    6e. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run7e} {
        set algoType "$step.$dtii $currentTime    7e. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans]
      }
      if {$ok != 0 && $run8e} {
        set algoType "$step.$dtii $currentTime    8e. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType5 $tol5 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans] 
      }
	  };# $runTest == 5
          
         
      if {$runTest == 6} {		 
      if {$ok != 0 && $run1f} {
        set algoType "$step.$dtii $currentTime    1f. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run2f} {
        set algoType "$step.$dtii $currentTime    2f. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run3f} {
        set algoType "$step.$dtii $currentTime    3f. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run4f} {
        set algoType "$step.$dtii $currentTime    4f. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run5f} {
        set algoType "$step.$dtii $currentTime    5f. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run6f} {
        set algoType "$step.$dtii $currentTime    6f. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run7f} {
        set algoType "$step.$dtii $currentTime    7f. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run8f} {
        set algoType "$step.$dtii $currentTime    8f. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType6 $tol6 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans] 
      }
	  };# $runTest == 6
	  
	  
	  if {$runTest == 7} {		 
      if {$ok != 0 && $run1g} {
        set algoType "$step.$dtii $currentTime    1g. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run2g} {
        set algoType "$step.$dtii $currentTime    2g. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run3g} {
        set algoType "$step.$dtii $currentTime    3g. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run4g} {
        set algoType "$step.$dtii $currentTime    4g. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run5g} {
        set algoType "$step.$dtii $currentTime    5g. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run6g} {
        set algoType "$step.$dtii $currentTime    6g. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run7g} {
        set algoType "$step.$dtii $currentTime    7g. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run8g} {
        set algoType "$step.$dtii $currentTime    8g. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType7 $tol7 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans] 
      }
	  };# $runTest == 7
	  
	  
	  if {$runTest == 8} {		 
      if {$ok != 0 && $run1h} {
        set algoType "$step.$dtii $currentTime    1h. $run1_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run1_test $run1_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run2h} {
        set algoType "$step.$dtii $currentTime    2h. $run2_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run2_test $run2_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run3h} {
        set algoType "$step.$dtii $currentTime    3h. $run3_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run3_test $run3_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run4h} {
        set algoType "$step.$dtii $currentTime    4h. $run4_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run4_test $run4_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run5h} {
        set algoType "$step.$dtii $currentTime    5h. $run5_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run5_test $run5_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run6h} {
        set algoType "$step.$dtii $currentTime    6h. $run6_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run6_test $run6_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run7h} {
        set algoType "$step.$dtii $currentTime    7h. $run7_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run7_test $run7_algorithm $dtii $logTrans] 
      }
      if {$ok != 0 && $run8h} {
        set algoType "$step.$dtii $currentTime    8h. $run8_algoType"
        if {$pid == 0 && $dispflag} {puts $algoType}
        set ok [runStep $testType8 $tol8 $iterList $constraintsType $numbererType $systemType $run8_test $run8_algorithm $dtii $logTrans] 
      }
	  };# $runTest == 8
	  	  
      	
      if {$ok == 0} {
		set finc 1.
        set fdec 1.			
        set runTest 1		
		set dtii $dti
        set currentTime [getTime]        
        if {$pid == 0} {
		  set tfStep [clock seconds]
          set processDuration [expr {$tfStep - $tiTask}]
		  puts $recTrans "$algoType [testIter] $currentTime $processDuration"	  
          flush $recTrans
		}
        incr step      		
      } else {
        set finc [expr {$finc*$rinc}]
        set dtii [expr {$dti*$finc}]
        if {$dtii <= $dtmax} {
          if {$pid == 0 && $dispflag} {puts "-Increasing step------------------>>"}
        } else {
      	  set fdec [expr {$fdec*$rdec}]
      	  set dtii [expr {$dti/$fdec}]
      	  if {$dtii >= $dtmin} {
            if {$pid == 0 && $dispflag} {puts "-Decreasing step------------------>>"}          
      	  } else {           
			if {$runTest < 8} {;# <-- 8
			  set finc 1.
              set fdec 1.	
			  incr runTest
              set dtii $dti			  			  
			} else {			  
			  barrier
			  break
			}
      	  }
      	}						
      }	

};# while {$currentTime < $TmaxAnalysis}

if {$ok == 0} {
  if {$pid == 0} {
    puts "transient: done!"
	puts $recTrans "transient: done!"
	set tfTask [clock seconds]
    set taskDuration [expr {$tfTask - $tiTask}]
	puts "task duration: $taskDuration sec"
	puts $recTrans "task duration: $taskDuration sec"
	close $recTrans
    close $logTrans
  }
  
} else {
  if {$pid == 0} {
    puts "transient: ERROR!"
	puts $recTrans "transient: ERROR!"
    set tfTask [clock seconds]
    set taskDuration [expr {$tfTask - $tiTask}]
	puts "task duration: $taskDuration sec"
	puts $recTrans "task duration: $taskDuration sec"
	close $recTrans
	close $logTrans
    #
    puts "A N A L Y S I S   F A I L E D" 
    set tFinish [clock seconds]
    set analysisDuration [expr {$tFinish - $tStart}]
    puts "analysis duration: $analysisDuration sec"	
  } 
  barrier
  wipe  
  exit
}

# Don't forget to
remove recorders