
# ################################################################################################################
# ######################################## GRAVITY ANALYSIS ######################################################
# ################################################################################################################

# Columns loads
set patternTagGravity 1

#pattern Plain $patternTag $tsTag <-fact $cFactor> {
#load...
#eleLoad...
#sp...
#...
#}

set liveFac	0.20;			#Percentage of live load used

#load $nodeTag (ndf $LoadValues)


# Shell loads (applied to columns as point loads)
pattern Plain $patternTagGravity "Linear" {
	for {set i 1} {$i <= $nStory} {incr i 1} {

		if {$i == 3 || $i == 11} {
			set thickness [expr 12.*$in]
		} else {
			set thickness [expr 8.*$in]
		}
		
		if {$i < 3} {
			set w_DL [expr 10.*$psf]
		} else {
			set w_DL [expr 20.*$psf]
		}
		
		if {$i == 36} {
			set w_LL [expr 20.*$psf]
		} elseif {$i < 3 || $i > 11} {
			set w_LL [expr 40.*$psf]
		} elseif {$i < 6 || $i == 11} {
			set w_LL [expr 100.*$psf]
		} else {
			set w_LL [expr 50.*$psf]
		}
		
		set w_SL [expr $thickness*150.*$pcf]
		set w_SDL [expr $w_DL + $w_SL]
		
		set w_tot [expr $w_SDL + $w_LL*$liveFac]
		
		# Column loads
		if {$i > 11} {

			load [expr 1000*$i + 800 + 43] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -$w_tot*$ft*$ft*432.] 0. 0. 0.
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -$w_tot*$ft*$ft*432.] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			
		} elseif {$i > 3} {
		
			load [expr 1000*$i + 800 +  9] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 10] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 13] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 22] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 23] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 24] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 25] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 26] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 33] 0. 0. [expr -$w_tot*$ft*$ft*432.] 0. 0. 0.
			load [expr 1000*$i + 800 + 34] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 35] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 36] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 37] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 38] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 39] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 40] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 41] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 42] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 47] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 48] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 49] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 50] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 51] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 52] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 53] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 54] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 62] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 63] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 64] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 65] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 66] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 72] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 73] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 74] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 75] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 81] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 82] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 83] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 94] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.

		} else {

			load [expr 1000*$i + 800 +  1] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 +  2] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 +  3] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 +  4] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 +  5] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 +  6] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 +  7] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 +  8] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 +  9] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 10] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 13] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 14] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 15] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 16] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 17] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 18] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 19] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 20] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 21] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 22] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 23] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 24] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 25] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 26] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 33] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 34] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 35] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 36] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 37] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 38] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 39] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 40] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 41] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 42] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 47] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 48] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 49] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 50] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 51] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 52] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 53] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 54] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -$w_tot*$ft*$ft*624.] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 62] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 63] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 64] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 65] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 66] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 72] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 73] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 74] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 75] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -$w_tot*$ft*$ft*576.] 0. 0. 0.
			load [expr 1000*$i + 800 + 81] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 82] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.
			load [expr 1000*$i + 800 + 83] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -$w_tot*$ft*$ft*312.] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. 0. [expr -$w_tot*$ft*$ft*288.] 0. 0. 0.
			load [expr 1000*$i + 800 + 94] 0. 0. [expr -$w_tot*$ft*$ft*144.] 0. 0. 0.

		}
	}
}
incr patternTagGravity 1





# Column loads
pattern Plain $patternTagGravity "Linear" {
	for {set i 1} {$i < [expr $nStory - 1]} {incr i} {

		if {$i >= 31} {

			#12x12 cols
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -12.*$in*12.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			
			#16x16 cols                                                                 
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#20x20
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 26} {

			#16x16
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -16.*$in*16.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#20x20
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#24x24
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 21} {

			#20x20
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#24x24
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#32x32
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 16} {

			#20x20
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -20.*$in*20.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#24x24
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#28x28
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -28.*$in*28.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -28.*$in*28.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#36x36
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 12} {

			#24x24
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			#load [expr 1000*$i + 800 + 61] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -24.*$in*24.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#32x32
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -32.*$in*32.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

			#36x36
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -36.*$in*36.*$in*9.75*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i == 11} {

			#24x24
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -24.*$in*24.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#32x32
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#36x36
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 6} {

			#12x12
			load [expr 1000*$i + 800 +  9] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 10] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 13] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 22] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 24] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 25] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 26] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 37] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 38] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 50] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 51] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 63] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 64] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 72] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 73] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 81] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 82] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 83] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 94] 0. 0. [expr -12.*$in*12.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#20x20
			load [expr 1000*$i + 800 + 23] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 33] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 34] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 35] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 36] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 39] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 40] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 41] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 42] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 48] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 49] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 52] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 53] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 54] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 62] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 65] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 66] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 74] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 75] 0. 0. [expr -20.*$in*20.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#28x28
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 47] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -28.*$in*28.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#32x32
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -32.*$in*32.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#36x36
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -36.*$in*36.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

			#40x40
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -40.*$in*40.*$in*12.5*$ft*150.*$pcf] 0. 0. 0.

		} elseif {$i >= 3} {

			#12x12
			load [expr 1000*$i + 800 +  9] 0. 0. [expr -12.*$in*12.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 13] 0. 0. [expr -12.*$in*12.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 25] 0. 0. [expr -12.*$in*12.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -12.*$in*12.*$in*16.*$ft*150.*$pcf] 0. 0. 0.

			#20x20
			load [expr 1000*$i + 800 + 10] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 22] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 24] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 26] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 33] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 37] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 38] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 51] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 64] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 73] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 83] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 94] 0. 0. [expr -20.*$in*20.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#24x24
			load [expr 1000*$i + 800 + 23] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 34] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 35] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 36] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 50] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 65] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 74] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. 0. [expr -24.*$in*24.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#28x28
			load [expr 1000*$i + 800 + 39] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 40] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 41] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 42] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 48] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 49] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 52] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 53] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 54] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 62] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 63] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 66] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 72] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 75] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 81] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. 0. [expr -28.*$in*28.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#32x32
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -32.*$in*32.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -32.*$in*32.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -32.*$in*32.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -32.*$in*32.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -32.*$in*32.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#36x36
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 47] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -36.*$in*36.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#40x40
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -40.*$in*40.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -40.*$in*40.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			
			#44x44
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -44.*$in*44.*$in*16.*$ft*150.*$pcf] 0. 0. 0.
		
		} else {
			
			#12x12
			load [expr 1000*$i + 800 +  9] 0. 0. [expr -12.*$in*12.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 13] 0. 0. [expr -12.*$in*12.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 25] 0. 0. [expr -12.*$in*12.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -12.*$in*12.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#16x16                                                  
			load [expr 1000*$i + 800 + 15] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 16] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 17] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 18] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 19] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 20] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 21] 0. 0. [expr -16.*$in*16.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#20x20                                                  
			load [expr 1000*$i + 800 + 10] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 22] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 24] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 26] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 33] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 37] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 38] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 51] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 64] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 73] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 83] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 94] 0. 0. [expr -20.*$in*20.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#24x24                                                  
			load [expr 1000*$i + 800 + 23] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 34] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 35] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 36] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 50] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 65] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 74] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. 0. [expr -24.*$in*24.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#28x28                                                  
			load [expr 1000*$i + 800 + 39] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 40] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 41] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 42] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 48] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 49] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 52] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 53] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 54] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 62] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 63] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 66] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 72] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 75] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 81] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. 0. [expr -28.*$in*28.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#32x32                                                  
			load [expr 1000*$i + 800 + 87] 0. 0. [expr -32.*$in*32.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. 0. [expr -32.*$in*32.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. 0. [expr -32.*$in*32.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. 0. [expr -32.*$in*32.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. 0. [expr -32.*$in*32.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#36x36                                                  
			load [expr 1000*$i + 800 + 43] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 46] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 47] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 55] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 61] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 67] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 71] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 76] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 80] 0. 0. [expr -36.*$in*36.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#40x40                                                  
			load [expr 1000*$i + 800 + 56] 0. 0. [expr -40.*$in*40.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. 0. [expr -40.*$in*40.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
	
			#44x44                                                  
			load [expr 1000*$i + 800 + 57] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 58] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 68] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 69] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 70] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 77] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 78] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
			load [expr 1000*$i + 800 + 79] 0. 0. [expr -44.*$in*44.*$in*10.5*$ft*150.*$pcf] 0. 0. 0.
		
		}
	}
}
incr patternTagGravity 1




# Input PT forces

if {$PT == "Yes"} {

	source INPUT_PT_forcesBTM.tcl

}


source loadControl.tcl