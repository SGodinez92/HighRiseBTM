
# MASS ASSIGNMENT -----------------------------------------------------------------------------------------

# Column mass
for {set i 3} {$i < $nStory} {incr i} {
	
	if {$i >= 31} {
	
		#12x12 cols
		mass [expr 1000*$i + 800 + 43] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		#mass [expr 1000*$i + 800 + 61] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#16x16 cols
		mass [expr 1000*$i + 800 + 44] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 57] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 26} {
		
		#16x16
		mass [expr 1000*$i + 800 + 43] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		#mass [expr 1000*$i + 800 + 61] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 44] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 57] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 21} {
			
		#20x20
		mass [expr 1000*$i + 800 + 43] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		#mass [expr 1000*$i + 800 + 61] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 56] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 57] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i >= 16} {
	
		#20x20
		mass [expr 1000*$i + 800 + 43] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		#mass [expr 1000*$i + 800 + 61] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 44] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 56] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 57] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 12} {
		
		#24x24
		mass [expr 1000*$i + 800 + 43] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		#mass [expr 1000*$i + 800 + 61] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 56] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 57] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i == 11} {
		
		#24x24
		mass [expr 1000*$i + 800 + 43] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 56] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 57] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i >= 6} {
	
		#12x12
		mass [expr 1000*$i + 800 +  9] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 13] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 22] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 24] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 25] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 26] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 27] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 28] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 29] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 30] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 31] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 32] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 37] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 38] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 50] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 63] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 93] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 94] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
			
		#20x20
		mass [expr 1000*$i + 800 + 23] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 33] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 34] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 35] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 36] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 39] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 49] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 52] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 62] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 66] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 43] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 44] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 56] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#40x40
		mass [expr 1000*$i + 800 + 57] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} else {
	
		#12x12
		mass [expr 1000*$i + 800 +  9] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 13] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 25] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 10] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 22] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 24] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 26] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 27] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 28] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 29] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 30] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 31] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 32] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 33] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 37] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 38] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 94] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 23] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 34] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 35] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 36] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 50] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 39] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 49] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 52] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 62] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 63] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 66] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 92] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 93] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 87] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 91] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 43] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#40x40
		mass [expr 1000*$i + 800 + 56] [expr 40.*$in*40.*$in*16.*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 40.*$in*40.*$in*16.*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#44x44
		mass [expr 1000*$i + 800 + 57] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	}
}