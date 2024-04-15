# Core Wall for OpenSees.exe
# Sergio Godinez, Summer 2021

# main

#close stderr
set dispflag 0

set path ""
set pathT $path; append pathT $modelScale/$EQlevel/$RSN/Results
set outputDir $pathT

set void [catch {file delete -force {*}[glob $pathT*]}];		#Deletes existing Results folder
set tryfile 1
while {[catch {file mkdir $outputDir}] && $tryfile <= 1000} {incr tryfile};	#Creates Results directory

set nStory 36;			#Total number of storys (including basements if any)

set pathT $path; append pathT units.tcl;		source $pathT;
set pathT $path; append pathT BTMcoreWall.tcl;	source $pathT;	#Includes procedure called "BTMcoreWall" to model Core Wall using BTM
set pathT $path; append pathT BTMrecWall.tcl;	source $pathT;	#Includes procedure called "BTMrecWall" to model Rectangular Wall using BTM

# Core Wall Geometry and discretization for BTM
set lCshapeX 126.;	#Distance of extreme vertical elements of C shape wall in the x direction (flange) 
set lCshapeY 288.;	#Distance of extreme vertical elements of C shape wall in the y direction (web)

set lCB 84.;		#Length of the coupling beam
set sCshape 108.;	#Distance in between flanges (from boundary element centroid to boundary element centroid)

set storyElev {0.0}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set H [lindex $storyH $i];
	
	set ind [expr $i - 1]
	set elev [lindex $storyElev $ind]
	set elev [expr $elev + $H]
	
	lappend storyElev $elev
}

#set recInputH [open $outputDir/height.txt a+];	#a+ at the end creates the file if it doesn't already exists
#puts $recInputH "storyElev $storyElev"

set xo [expr 1728. + $x0];	# X coordinate of southwest corner of CW
set yo [expr 1440. + $y0];	# Y coordinate of southwest corner of CW

set xoRWX [expr 2664. + $x0]; 	#left or bottom edge of rectangular wall
set xoRWY1 [expr 576. + $x0];	# left or bottom edge of rectangular wall
set xoRWY2 [expr 3240. + $x0];	# left or bottom edge of rectangular wall

set yoRWX [expr 288. + $y0];	# left or bottom edge of rectangular wall
set yoRWY1 [expr 1440. + $y0];	# left or bottom edge of rectangular wall
set yoRWY2 [expr 1440. + $y0];	# left or bottom edge of rectangular wall

set inputFileCW1 "inputCW1.txt"
set inputFileRX "inputRWX.txt"
set inputFileRY1 "inputRWY1.txt"
set inputFileRY2 "inputRWY2.txt"

set NodesCW {};

set NodesDisp {};

set anchorageCBflag 1;	#0 if anchorage of CB is not to be included, 1 if it is to be included

#proc coreWallBTM {story outputDir materials sections nStory path hPier hPanel nIncPierZ nIncCShapeZbelow xo yo zo CWtag}
for {set i 0} {$i < $nStory} {incr i 1} {
	set story [expr $i + 1]
	
	if {$i < 3} {
		set hPier 97.6875
		set hPanel 28.3125
	} elseif {$i < 6} {
		set hPier 146.25
		set hPanel 45.75
	} elseif {$i < 12} {
		set hPier 121.625
		set hPanel 28.375
	} else {
		set hPier 96.4375
		set hPanel 20.5625
	}
	
	if {$i < 3} {
		set nIncPierZ 3;	# UPDATE IN INPUT_BTMspm.tcl IF CHANGED HERE
	} elseif {$i < 6} {
		set nIncPierZ 5;	# UPDATE IN INPUT_BTMspm.tcl IF CHANGED HERE
	} elseif {$i < 12} {
		set nIncPierZ 4;
	} else {
		set nIncPierZ 3;
	}
	
	if {$i > 12} {
		set nIncCShapeZbelow 4
	} elseif {$i > 6} {
		set nIncCShapeZbelow 5
	} elseif {$i > 3} {
		set nIncCShapeZbelow 7
	} else {
		set nIncCShapeZbelow 4
	}
	
	if {$i == 0} {
		set nIncCShapeZbelow 0
	}
	
	#proc coreWallBTM {story outputDir materials sections nStory path hPier hPanel nIncPierZ nIncCShapeZbelow xo yo zo CWtag ModelFile Nodes inputFile}
	
	if {$story <= 21} {
		append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_sec_40_8 BTMsections_sec_40_8 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $NodesDisp $inputFileCW1 $anchorageCBflag]
	} elseif {$story <= 26} {
		append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_sec_36_8 BTMsections_sec_36_8 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $NodesDisp $inputFileCW1 $anchorageCBflag]
	} elseif {$story <= 31} {
		append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_sec_36_7 BTMsections_sec_36_7 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $NodesDisp $inputFileCW1 $anchorageCBflag]
	} else {
		append NodesCW { } [coreWallBTM $story $outputDir BTMmaterials_sec_28_7 BTMsections_sec_28_7 $nStory $path $hPier $hPanel $nIncPierZ $nIncCShapeZbelow $xo $yo [lindex $storyElev $i] 1 $ModelFile $NodesDisp $inputFileCW1 $anchorageCBflag]
	}
	
	if {$story == 4 || $story == 5 || $story == 6} {
		set nIncPierZ 4
	} else {
		set nIncPierZ 3
	}
	
	if {$story == 5 || $story == 6 || $story == 7} {
		set nIncCShapeZbelow 4
	} else {
		set nIncCShapeZbelow 3
	}
	
	set hStory [expr $hPanel + $hPier]
	
	if {$story <= 11} {
		#proc recWallBTM {story outputDir materials sections nodesRoutine gravity nStory path hStory nIncPierZ nIncCShapeZbelow xo yo zo CWtag ModelFile}
		recWallBTM $story $outputDir BTMmaterials_sec_24_7_RW BTMsections_sec_24_7_RW_X BTMnodesRW_X BTMgravityRW_X $nStory $path $hStory $nIncPierZ $nIncCShapeZbelow $xoRWX $yoRWX [lindex $storyElev $i] 3 $ModelFile $Nodes $inputFileRX
		recWallBTM $story $outputDir BTMmaterials_sec_24_7_RW BTMsections_sec_24_7_RW_Y BTMnodesRW_Y BTMgravityRW_Y $nStory $path $hStory $nIncPierZ $nIncCShapeZbelow $xoRWY1 $yoRWY1 [lindex $storyElev $i] 4 $ModelFile $Nodes $inputFileRY1
		recWallBTM $story $outputDir BTMmaterials_sec_24_7_RW BTMsections_sec_24_7_RW_Y BTMnodesRW_Y BTMgravityRW_Y $nStory $path $hStory $nIncPierZ $nIncCShapeZbelow $xoRWY2 $yoRWY2 [lindex $storyElev $i] 5 $ModelFile $Nodes $inputFileRY2 
	}
}

puts "BTM part of the model: done!"

#set inputNodesCW1 "nodesCW.txt"
#set nodesCWdir [open $outputDir/$inputNodesCW1 a+];
#
#for {set i 1} {$i <= [llength $NodesCW]} {incr i} {
#	set nodeTag [lindex $NodesCW [expr $i - 1]]
#	set nodeCrd [nodeCoord $nodeTag]
#	#puts "set nodeTag [lindex $Nodes [expr $i - 1]]"
#	#puts "set nodeCrd [nodeCoord $nodeTag]"
#	puts $nodesCWdir "$nodeTag $nodeCrd"
#}