# loadControl

  puts "loadControl"
  set tiTask [clock seconds]  

set dispflag 1
set pid 0

#set testType0 EnergyIncr
#set tol0 1e-08
#set iter0 100
#set algorithmType0 Newton
#set testType1 EnergyIncr
#set tol1 1e-06
#set testType2 NormDispIncr
#set tol2 1e-06
#set testType3 NormUnbalance
#set tol3 1e-06
#set testType4 RelativeNormDispIncr
#set tol4 1e-03
#set testType5 RelativeEnergyIncr
#set tol5 1e-03
#set testType6 RelativeNormUnbalance
#set tol6 1e-03
#set iterH 2000
#set iterM 1000
#set iterL 500

set pathT $path; append pathT taskLoadControl.tcl; source $pathT
#constraints $constraintsType
#numberer $numbererType
#system {*}$systemType
#test $testType0 $tol0 $iter0 0
#algorithm $algorithmType0
set nStep 10
set lambda [expr {1./$nStep}]
#integrator LoadControl $lambda
#analysis Static



  puts "loadControl: running..."
  set recLoadCtr [open $outputDir/loadControl.txt w]	

for {set ii 1} {$ii <= $nStep} {incr ii} {
  set algoType "$ii/$nStep    $algorithmType0"
  if {$pid == 0 && $dispflag} {puts $algoType}
  #wipeAnalysis;
  constraints $constraintsType; numberer $numbererType; system {*}$systemType
  test $testType0 $tol0 $iter0 0
  algorithm $algorithmType0 -initial
  integrator LoadControl $lambda; analysis Static  
  set ok [analyze 1]

  
  if {$ok != 0 && $run1a} {
    set algoType "$ii/$nStep    1a. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }	
  if {$ok != 0 && $run2a} {
    set algoType "$ii/$nStep    2a. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3a} {
    set algoType "$ii/$nStep    3a. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4a} {
    set algoType "$ii/$nStep    4a. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5a} {
    set algoType "$ii/$nStep    5a. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6a} {
    set algoType "$ii/$nStep    6a. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterM 0
    algorithm BFGS
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7a} {
    set algoType "$ii/$nStep    7a. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8a} {
    set algoType "$ii/$nStep    8a. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType1 $tol1 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
     
     
  if {$ok != 0 && $run1b} {
    set algoType "$ii/$nStep    1b. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run2b} {
    set algoType "$ii/$nStep    2b. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3b} {
    set algoType "$ii/$nStep    3b. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4b} {
    set algoType "$ii/$nStep    4b. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5b} {
    set algoType "$ii/$nStep    5b. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6b} {
    set algoType "$ii/$nStep    6b. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterM 0
    algorithm BFGS 
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7b} {
    set algoType "$ii/$nStep    7b. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8b} {
    set algoType "$ii/$nStep    8b. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType2 $tol2 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }

	
  if {$ok != 0 && $run1c} {
    set algoType "$ii/$nStep    1c. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run2c} {
    set algoType "$ii/$nStep    2c. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3c} {
    set algoType "$ii/$nStep    3c. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4c} {
    set algoType "$ii/$nStep    4c. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5c} {
    set algoType "$ii/$nStep    5c. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6c} {
    set algoType "$ii/$nStep    6c. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterM 0
    algorithm BFGS
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7c} {
    set algoType "$ii/$nStep    7c. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8c} {
    set algoType "$ii/$nStep    8c. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType3 $tol3 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }     
   
  
  if {$ok != 0 && $run1d} {
    set algoType "$ii/$nStep    1d. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run2d} {
    set algoType "$ii/$nStep    2d. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	onstraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3d} {
    set algoType "$ii/$nStep    3d. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4d} {
    set algoType "$ii/$nStep    4d. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5d} {
    set algoType "$ii/$nStep    5d. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6d} {
    set algoType "$ii/$nStep    6d. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterM 0
    algorithm BFGS
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7d} {
    set algoType "$ii/$nStep    7d. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8d} {
    set algoType "$ii/$nStep    8d. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType4 $tol4 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
     
     
  if {$ok != 0 && $run1e} {
    set algoType "$ii/$nStep    1e. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run2e} {
    set algoType "$ii/$nStep    2e. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3e} {
    set algoType "$ii/$nStep    3e. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4e} {
    set algoType "$ii/$nStep    4e. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5e} {
    set algoType "$ii/$nStep    5e. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6e} {
    set algoType "$ii/$nStep    6e. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterM 0
    algorithm BFGS
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7e} {
    set algoType "$ii/$nStep    7e. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8e} {
    set algoType "$ii/$nStep    8e. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType5 $tol5 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
	 
      
  if {$ok != 0 && $run1f} {
    set algoType "$ii/$nStep    1f. Newton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterL 0
    algorithm Newton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run2f} {
    set algoType "$ii/$nStep    2f. Newton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterH 0
    algorithm Newton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run3f} {
    set algoType "$ii/$nStep    3f. ModifiedNewton Initial..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterH 0
    algorithm ModifiedNewton -initial
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run4f} {
    set algoType "$ii/$nStep    4f. ModifiedNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterH 0
    algorithm ModifiedNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run5f} {
    set algoType "$ii/$nStep    5f. NewtonWithLineSearch..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterM 0
    algorithm NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run6f} {
    set algoType "$ii/$nStep    6f. BFGS..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterM 0
    algorithm BFGS
    integrator LoadControl $lambda; analysis Static  	
    set ok [analyze 1]
  }
  if {$ok != 0 && $run7f} {
    set algoType "$ii/$nStep    7f. Broyden..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterM 0
    algorithm Broyden 8
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  if {$ok != 0 && $run8f} {
    set algoType "$ii/$nStep    8f. KrylovNewton..."
    if {$pid == 0 && $dispflag} {puts $algoType}
    #wipeAnalysis;
	constraints $constraintsType; numberer $numbererType; system {*}$systemType
	test $testType6 $tol6 $iterM 0
    algorithm KrylovNewton
	integrator LoadControl $lambda; analysis Static  
    set ok [analyze 1]
  }
  
  if {$ok == 0} {
    if {$pid == 0} {
	  puts $recLoadCtr $algoType
	  flush $recLoadCtr
    }
  } else {  
    break
  }
}

if {$ok == 0} {
  if {$pid == 0} {
    puts "loadControl: done!"
	puts $recLoadCtr "loadControl: done!"
	set tfTask [clock seconds]
    set taskDuration [expr {$tfTask - $tiTask}]
	puts "task duration: $taskDuration sec"
	puts $recLoadCtr "task duration: $taskDuration sec"
	close $recLoadCtr
	set GravityAnalysisDone "Yes";
  }
  
} else {
  if {$pid == 0} {
    puts "loadControl: ERROR!"
	puts $recLoadCtr "loadControl: ERROR!"
    set tfTask [clock seconds]
    set taskDuration [expr {$tfTask - $tiTask}]
	puts "task duration: $taskDuration sec"
	puts $recLoadCtr "task duration: $taskDuration sec"
	close $recLoadCtr
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

#loadConst <-time $pseudoTime> 	
loadConst -time 0.0
