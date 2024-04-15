
# ################################################################################################################
# ############################################## P-T Forces ######################################################
# ################################################################################################################

# Columns loads
set patternTagPT $patternTagGravity

#pattern Plain $patternTag $tsTag <-fact $cFactor> {
#load...
#eleLoad...
#sp...
#...
#}

#load $nodeTag (ndf $LoadValues)

set compSoWeTag 10000;
set compNoWeTag 20000;
set compSoEaTag 40000;
set compNoEaTag 50000;

set nIncCShapeX 5;
set nIncCShapeY 14;

pattern Plain $patternTagPT "Linear" {
	for {set i 4} {$i <= $nStory} {incr i 1} {	
			
		if {$i <= 3 || $i > 12} {
			set nIncZ 4;	# UPDATE FROM BTMcoreWall.tcl
		} elseif {$i <= 6} {
			set nIncZ 7;	# UPDATE FROM BTMcoreWall.tcl
		} else {
			set nIncZ 5;
		}
		
		if {$i == 4 || $i == 5 || $i == 6} {
			set nIncRecZ 4;		# UPDATE FROM BTMrecWall.tcl
		} else {
			set nIncRecZ 3;		# UPDATE FROM BTMrecWall.tcl
		}
			
		set coreWallTag [expr {10000000 + 100000*$i}];
		set recWallTag1 [expr {30000000 + 100000*$i}];
		set recWallTag2 [expr {40000000 + 100000*$i}];
		set recWallTag3 [expr {50000000 + 100000*$i}];
		
		set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncZ + 1]
		set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncZ + 1]
		set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
		set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
		
		set nodeTagRecXW1 [expr $recWallTag1 + $nIncRecZ + 1]
		set nodeTagRecYS1 [expr $recWallTag2 + $nIncRecZ + 1]
		set nodeTagRecYS2 [expr $recWallTag3 + $nIncRecZ + 1]
		
		set nodeTagRecXE1 [expr $recWallTag1 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
		set nodeTagRecYN1 [expr $recWallTag2 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
		set nodeTagRecYN2 [expr $recWallTag3 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
		
		if {$i > 11} {
			
			# Perimeter
			load [expr 1000*$i + 800 + 43] [expr 300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 55] [expr 300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 56] 0. [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. [expr 650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. [expr 650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. [expr 300.*$kip] 0. 0. 0. 0.
			#load [expr 1000*$i + 800 + 60] 0. [expr 600.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 46] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 60] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 71] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 70] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 67] [expr  600.*$kip] 0. 0. 0. 0. 0.
			#load [expr 1000*$i + 800 + 71] [expr -600.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 76] [expr  600.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 80] [expr -600.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 86] [expr 300.*$kip] [expr -300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 87] 0. [expr -600.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -600.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -600.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 92] [expr -300.*$kip] [expr -300.*$kip] 0. 0. 0. 0.
			
			# Core walls
			load $nodeTagNWe [expr -600.*$kip] [expr  650.*$kip] 0. 0. 0. 0.
			load $nodeTagSWe [expr -600.*$kip] [expr -650.*$kip] 0. 0. 0. 0.
			load $nodeTagNEa [expr  600.*$kip] [expr  650.*$kip] 0. 0. 0. 0.
			load $nodeTagSEa [expr  600.*$kip] [expr -650.*$kip] 0. 0. 0. 0.
			
		} elseif {$i == 11} {
		
			# Perimeter
			load [expr 1000*$i + 800 +  9] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 10] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. [expr 240.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 13] [expr -120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 22] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 24] [expr -240.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 25] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 26] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. [expr 260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. [expr 260.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 33] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 37] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 38] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 50] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 51] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 63] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 64] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 72] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 73] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 81] [expr -240.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 82] [expr 120.*$kip] [expr -120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 83] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. [expr -240.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 94] [expr -120.*$kip] [expr -120.*$kip] 0. 0. 0. 0.
			
			# Core Walls
			load $nodeTagNWe [expr -240.*$kip] [expr  240.*$kip] 0. 0. 0. 0.
			load $nodeTagSWe [expr -240.*$kip] [expr -240.*$kip] 0. 0. 0. 0.
			load $nodeTagNEa [expr  240.*$kip] [expr  240.*$kip] 0. 0. 0. 0.
			load $nodeTagSEa [expr  240.*$kip] [expr -240.*$kip] 0. 0. 0. 0.
			
			# Rec Walls
			load $nodeTagRecXW1 [expr -240.*$kip] 0. 0. 0. 0. 0.
			load $nodeTagRecXE1 [expr  240.*$kip] 0. 0. 0. 0. 0.
			
			load $nodeTagRecYS1 0. [expr -240.*$kip] 0. 0. 0. 0.
			load $nodeTagRecYN1 0. [expr  240.*$kip] 0. 0. 0. 0.
			
			load $nodeTagRecYS2 0. [expr -240.*$kip] 0. 0. 0. 0.
			load $nodeTagRecYN2 0. [expr  240.*$kip] 0. 0. 0. 0.
		
		} else {
		
			# Perimeter
			load [expr 1000*$i + 800 +  9] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 10] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. [expr 840.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 13] [expr -420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 22] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 24] [expr -840.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 25] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 26] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. [expr 910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. [expr 910.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 33] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 37] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 38] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 50] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 51] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 63] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 64] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 72] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 73] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 81] [expr -840.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 82] [expr 420.*$kip] [expr -420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 83] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. [expr -840.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 94] [expr -420.*$kip] [expr -420.*$kip] 0. 0. 0. 0.
			
			# Core Walls
			load $nodeTagNWe [expr -840.*$kip] [expr  910.*$kip] 0. 0. 0. 0.
			load $nodeTagSWe [expr -840.*$kip] [expr -910.*$kip] 0. 0. 0. 0.
			load $nodeTagNEa [expr  840.*$kip] [expr  910.*$kip] 0. 0. 0. 0.
			load $nodeTagSEa [expr  840.*$kip] [expr -910.*$kip] 0. 0. 0. 0.
			
			# Rec Walls
			load $nodeTagRecXW1 [expr -840.*$kip] 0. 0. 0. 0. 0.
			load $nodeTagRecXE1 [expr  840.*$kip] 0. 0. 0. 0. 0.
			
			load $nodeTagRecYS1 0. [expr -840.*$kip] 0. 0. 0. 0.
			load $nodeTagRecYN1 0. [expr  840.*$kip] 0. 0. 0. 0.
			
			load $nodeTagRecYS2 0. [expr -840.*$kip] 0. 0. 0. 0.
			load $nodeTagRecYN2 0. [expr  840.*$kip] 0. 0. 0. 0.
		} 
	}
}
incr patternTagGravity 1