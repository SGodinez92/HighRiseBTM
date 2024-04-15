# recWallBTM
proc recWallBTM {story outputDir materials sections nodesRoutine gravity nStory path hStory nIncPierZ nIncCShapeZbelow xo yo zo CWtag ModelFile Nodes inputFile} {

set recInput [open $outputDir/$inputFile a+];	#a+ at the end creates the file if it doesn't already exists
set dispflag 0
if {$dispflag} {puts "\ncoreWallBTM story_$story $materials $sections"}; puts $recInput "\ncoreWallBTM story$story $materials $sections"

# general
set NipBound 2
set NipField 2
set prDum 1e-6
set eIter -
set eTol -
#set fStiffA 100.
set fStiffA 1.
set fStiff 100.
set fStiffLink 100.
set falpha 0.045;		# falpha = alpha*ft/fc
set fGJ 0.10
#set inplaneBound 1;		# no in-plane rig in corner & flange bound = 0, in-plane rig in corner & flange bound = 1, in-plane rig in corner but not in flange bound = 2
set beta_F1int 0.45;		# 0.4
set beta_F1res 0.25;		# 0.1
set ffcresD 0.2;		# fcres = ffcresD*fc, diagonal elements
set ffcres 0.2;			# fcres = ffcres*fc, vertical & horizontal elements
set fecresD 1.;			# ecres = fecresD*ecres, diagonal elements
set fecres 1.;			# ecres = fecres*ecres, vertical & horizontal elements
set fftRD 0.01;			# ftRD = fr*fftRD , etR = $et*fftRD, diagonal elements
set fftR 0.01;			# ftR = fr*fftR , etR = $et*fftR, horizontal elements
set flagConfTies 1;		# confine corners, flange and web because of ties = 1
#set flagConfBase 1;		# confine corners, flange and web because of base = 1
set flambda 1;			# factor to multiply lambda = 0.25 for Concrete02 (ratio between unloading slope at $epscu and initial slope)
set fEts 0.1;			# factor of Ec of the tension stiffness of concrete (linear tension softening for Concrete02)

# grid
set lCshape 288.;

set flagConcwBeta 1;	#1 if ConcretewBeta is to be used for all elements, 0 if Concrete02 is to be used

set nIncCShape 6;	# UPDATE IN INPUT_BTMspm.tcl IF CHANGED HERE

set nIncCShapeZ $nIncPierZ

set lCshapeZ $hStory;
set incCshape [expr {$lCshape/$nIncCShape}] 
set incPierZ [expr {$hStory/$nIncPierZ}]
set incDpier [expr {sqrt($incCshape**2. + $incPierZ**2.)}]

# Coordinates of southwest corner of core wall
set xo $xo;	# x coordinate
set yo $yo;	# y coordinate
set zo $zo; # z coordinate

# tags
set coreWallTag [expr {10000000*$CWtag + 100000*$story}];
set diaElemTag 1000;
set verElemTag 2000;
set horElemTag 3000;

# geometric transformation
set geomType PDelta;		# Linear, PDelta, Corotational
set truss2Type Truss2;	# Truss2, CorotTruss2
set trussType truss;	# truss, corotTruss

# model
set pathT $path; append pathT UNITS.tcl;            source $pathT 
set pathT $path; append pathT BTMprocedures.tcl;    source $pathT 
set pathT $path; append pathT $materials.tcl;       source $pathT 
set pathT $path; append pathT $sections.tcl;        source $pathT 
set pathT $path; append pathT $nodesRoutine.tcl;	source $pathT 
set pathT $path; append pathT BTMelementsRW.tcl;    source $pathT 
set pathT $path; append pathT $gravity.tcl;       	source $pathT
set pathT $path; append pathT BTMmassRW.tcl;          source $pathT 
close $recInput


};# proc coreWall