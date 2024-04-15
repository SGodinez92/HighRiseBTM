# coreWallBTM
proc coreWallBTM {story outputDir materials sections nStory path hPier hPanel nIncPierZ nIncCShapeZbelow xo yo zo CWtag ModelFile Nodes inputFile anchorageCBflag} {

set recInput [open $outputDir/$inputFile a+];	#a+ at the end creates the file if it doesn't already exists
set dispflag 0
if {$dispflag} {puts "\ncoreWallBTM story_$story $materials $sections"}; puts $recInput "\ncoreWallBTM story$story $materials $sections"

# general
set NipBound 2
set NipField 2
set prDum 1e-6
set eIter -
set eTol -
set fStiff 10.
#set fStiffA 100.
set fStiffA 1.
set fStiffLink 100.
#set fStiffCB 100.
set fStiffCB 500.
set falpha 0.045;		# falpha = alpha*ft/fc
set fGJ 0.10
set beta_F1int 0.45;		# 0.4
set beta_F1res 0.25;		# 0.1
set ffcresD 0.2;		# fcres = ffcresD*fc, diagonal elements
set ffcres 0.2;			# fcres = ffcres*fc, vertical & horizontal elements
set fecresD 1.;			# ecres = fecresD*ecres, diagonal elements
set fecres 1.;			# ecres = fecres*ecres, vertical & horizontal elements
set fftRD 0.01;			# ftRD = fr*fftRD , etR = $et*fftRD, diagonal elements
set fftR 0.01;			# ftR = fr*fftR , etR = $et*fftR, horizontal elements
set flagConfTies 1;		# confine corners, flange and web because of ties = 1
set flambda 1;			# factor to multiply lambda = 0.25 for Concrete02 (ratio between unloading slope at $epscu and initial slope)
set fEts 0.1;			# factor of Ec of the tension stiffness of concrete (linear tension softening for Concrete02)

set anchorageCB $anchorageCBflag;		#0 if anchorage of CB is not to be included, 1 if it is to be included
set flagConcwBeta 1;					#1 if ConcretewBeta is to be used for all elements, 0 if Concrete02 is to be used

# grid
if {$story == 4 || $story == 5 || $story ==6} {
	set nIncPanelZ 2;		# Number of spacings within the CB projection of the wall
} else {
	set nIncPanelZ 1
}

set nIncCShapeZ [expr {$nIncPierZ + $nIncPanelZ}]

set lCshapeX 126.;
set lCshapeY 288.;

set lCB 84.;		# Length of coupling beam
set sCshape 108.;	# Length between boundary element of core walls

set nIncCShapeX 5;	# UPDATE IN INPUT_BTMspm.tcl IF CHANGED HERE and INPUT_PT_forcesBTM.tcl
set nIncCShapeY 14;

set lCshapeZ [expr {$hPier + $hPanel}]
set incCshapeX [expr {$lCshapeX/$nIncCShapeX}] 
set incCshapeY [expr {$lCshapeY/$nIncCShapeY}]
set incPierZ [expr {$hPier/$nIncPierZ}]
set incPanelZ [expr {$hPanel/$nIncPanelZ}]
set incDpierX [expr {sqrt($incCshapeX**2. + $incPierZ**2.)}]
set incDpierY [expr {sqrt($incCshapeY**2. + $incPierZ**2.)}]
set incDpanelX [expr {sqrt($incCshapeX**2. + $incPanelZ**2.)}]
set incDpanelY [expr {sqrt($incCshapeY**2. + $incPanelZ**2.)}]
set incHCB [expr {$lCB/2.}];										# only 2 elements in the coupling beam panel
set incVCB [expr {$hPanel/2.}];										# only 2 elements in the coupling beam panel
set incDCB [expr {sqrt($incHCB**2. + $incVCB**2.)}]

# Coordinates of southwest corner of core wall
set xo $xo;	# x coordinate
set yo $yo;	# y coordinate
set zo $zo; # z coordinate

# tags
set coreWallTag [expr {10000000*$CWtag + 100000*$story}];
set compSoWeTag 10000;
set compNoWeTag 20000;
set compWeTag 30000;
set compSoEaTag 40000;
set compNoEaTag 50000;
set compEaTag 60000;
set cbSoTag 70000;
set cbNoTag 80000;
set diaElemTag 1000;
set verElemTag 2000;
set horElemTag 3000;

# geometric transformation
set geomType PDelta;		# Linear, PDelta, Corotational
set truss2Type Truss2;	# Truss2, CorotTruss2
set trussType truss;	# truss, corotTruss

# model
set pathT $path; append pathT UNITS.tcl;              source $pathT 
set pathT $path; append pathT BTMprocedures.tcl;      source $pathT 
set pathT $path; append pathT $materials.tcl;         source $pathT 
set pathT $path; append pathT $sections.tcl;          source $pathT 
set pathT $path; append pathT BTMnodesCW.tcl;         source $pathT 
set pathT $path; append pathT BTMelementsCW.tcl;      source $pathT 
set pathT $path; append pathT BTMgravityCW.tcl;       source $pathT 
set pathT $path; append pathT BTMmassCW.tcl;          source $pathT 
close $recInput

return $Nodes

};# proc coreWall