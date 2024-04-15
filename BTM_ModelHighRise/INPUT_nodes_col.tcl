
# All columns nodes

set z 0.; # Current node height

# Basements
for {set i 0} {$i <= $nBaseStory} {incr i 1} {

	if {$i == 0} {
	} else {
		set H [lindex $storyH $i]; # H = storyH(i)
		set z [expr $z + $H]; # z = z + H
	}
	
	set nodeTag [expr 1000*$i + 800]
	
	node [expr $nodeTag + 1] $x0 $y0 $z
	node [expr $nodeTag + 2] [expr 24.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 3] [expr 48.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 4] [expr 72.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 5] [expr 96.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 6] [expr 120.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 7] [expr 144.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 8] [expr 174.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 9] [expr 198.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 10] [expr 222.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 11] [expr 246.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 12] [expr 270.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 13] [expr 294.*$ft + $x0] $y0 $z
	
	
	node [expr $nodeTag + 14] $x0 [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 15] [expr 24.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 16] [expr 48.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 17] [expr 72.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 18] [expr 96.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 19] [expr 120.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 20] [expr 144.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 21] [expr 174.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 22] [expr 198.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 23] [expr 270.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 24] [expr 294.*$ft + $x0] [expr 24.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 25] $x0 [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 26] [expr 24.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 27] [expr 48.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 28] [expr 72.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 29] [expr 96.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 30] [expr 120.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 31] [expr 144.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 32] [expr 174.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 33] [expr 198.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 34] [expr 222.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 35] [expr 246.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 36] [expr 270.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 37] [expr 294.*$ft + $x0] [expr 48.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 38] $x0 [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 39] [expr 24.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 40] [expr 48.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 41] [expr 72.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 42] [expr 96.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 47] [expr 222.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 48] [expr 246.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 49] [expr 270.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 50] [expr 294.*$ft + $x0] [expr 72.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 51] $x0 [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 52] [expr 24.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 53] [expr 48.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 54] [expr 72.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 55] [expr 96.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 61] [expr 246.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 62] [expr 270.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 63] [expr 294.*$ft + $x0] [expr 96.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 64] $x0 [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 65] [expr 24.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 66] [expr 72.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 67] [expr 96.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 72] [expr 294.*$ft + $x0] [expr 120.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 73] $x0 [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 74] [expr 24.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 75] [expr 72.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 76] [expr 96.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 81] [expr 294.*$ft + $x0] [expr 144.*$ft + $y0] $z
	
	
	node [expr $nodeTag + 82] $x0 [expr 168.*$ft  + $y0] $z
	node [expr $nodeTag + 83] [expr 24.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 84] [expr 48.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 85] [expr 72.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 86] [expr 96.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 93] [expr 270.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 94] [expr 294.*$ft + $x0] [expr 168.*$ft + $y0] $z
	
	if {$matFoundation == "Yes"} {
		if {$i == 0} {
			## 3x3 mat
			equalDOF 1011001 [expr $nodeTag +  1] 1 2 3 4 5 6
			equalDOF 1011004 [expr $nodeTag +  2] 1 2 3 4 5 6
			equalDOF 1011007 [expr $nodeTag +  3] 1 2 3 4 5 6
			equalDOF 1011010 [expr $nodeTag +  4] 1 2 3 4 5 6
			equalDOF 1011013 [expr $nodeTag +  5] 1 2 3 4 5 6
			equalDOF 1011016 [expr $nodeTag +  6] 1 2 3 4 5 6
			equalDOF 1011019 [expr $nodeTag +  7] 1 2 3 4 5 6
			equalDOF 1011022 [expr $nodeTag +  8] 1 2 3 4 5 6
			equalDOF 1011025 [expr $nodeTag +  9] 1 2 3 4 5 6
			equalDOF 1011028 [expr $nodeTag + 10] 1 2 3 4 5 6
			equalDOF 1011031 [expr $nodeTag + 11] 1 2 3 4 5 6
			equalDOF 1011034 [expr $nodeTag + 12] 1 2 3 4 5 6
			equalDOF 1011037 [expr $nodeTag + 13] 1 2 3 4 5 6
			equalDOF 1021001 [expr $nodeTag + 14] 1 2 3 4 5 6
			equalDOF 1021004 [expr $nodeTag + 15] 1 2 3 4 5 6
			equalDOF 1021007 [expr $nodeTag + 16] 1 2 3 4 5 6
			equalDOF 1021010 [expr $nodeTag + 17] 1 2 3 4 5 6
			equalDOF 1021013 [expr $nodeTag + 18] 1 2 3 4 5 6
			equalDOF 1021016 [expr $nodeTag + 19] 1 2 3 4 5 6
			equalDOF 1021019 [expr $nodeTag + 20] 1 2 3 4 5 6
			equalDOF 1021022 [expr $nodeTag + 21] 1 2 3 4 5 6
			equalDOF 1021025 [expr $nodeTag + 22] 1 2 3 4 5 6
			equalDOF 1021034 [expr $nodeTag + 23] 1 2 3 4 5 6
			equalDOF 1021037 [expr $nodeTag + 24] 1 2 3 4 5 6
			equalDOF 1031001 [expr $nodeTag + 25] 1 2 3 4 5 6
			equalDOF 1031004 [expr $nodeTag + 26] 1 2 3 4 5 6
			equalDOF 1031007 [expr $nodeTag + 27] 1 2 3 4 5 6
			equalDOF 1031010 [expr $nodeTag + 28] 1 2 3 4 5 6
			equalDOF 1031013 [expr $nodeTag + 29] 1 2 3 4 5 6
			equalDOF 1031016 [expr $nodeTag + 30] 1 2 3 4 5 6
			equalDOF 1031019 [expr $nodeTag + 31] 1 2 3 4 5 6
			equalDOF 1031022 [expr $nodeTag + 32] 1 2 3 4 5 6
			equalDOF 1031025 [expr $nodeTag + 33] 1 2 3 4 5 6
			equalDOF 1031028 [expr $nodeTag + 34] 1 2 3 4 5 6
			equalDOF 1031031 [expr $nodeTag + 35] 1 2 3 4 5 6
			equalDOF 1031034 [expr $nodeTag + 36] 1 2 3 4 5 6
			equalDOF 1031037 [expr $nodeTag + 37] 1 2 3 4 5 6
			equalDOF 1041001 [expr $nodeTag + 38] 1 2 3 4 5 6
			equalDOF 1041004 [expr $nodeTag + 39] 1 2 3 4 5 6
			equalDOF 1041007 [expr $nodeTag + 40] 1 2 3 4 5 6
			equalDOF 1041010 [expr $nodeTag + 41] 1 2 3 4 5 6
			equalDOF 1041013 [expr $nodeTag + 42] 1 2 3 4 5 6
			equalDOF 1041016 [expr $nodeTag + 43] 1 2 3 4 5 6
			equalDOF 1041019 [expr $nodeTag + 44] 1 2 3 4 5 6
			equalDOF 1041022 [expr $nodeTag + 45] 1 2 3 4 5 6
			equalDOF 1041025 [expr $nodeTag + 46] 1 2 3 4 5 6
			equalDOF 1041028 [expr $nodeTag + 47] 1 2 3 4 5 6
			equalDOF 1041031 [expr $nodeTag + 48] 1 2 3 4 5 6
			equalDOF 1041034 [expr $nodeTag + 49] 1 2 3 4 5 6
			equalDOF 1041037 [expr $nodeTag + 50] 1 2 3 4 5 6
			equalDOF 1051001 [expr $nodeTag + 51] 1 2 3 4 5 6
			equalDOF 1051004 [expr $nodeTag + 52] 1 2 3 4 5 6
			equalDOF 1051007 [expr $nodeTag + 53] 1 2 3 4 5 6
			equalDOF 1051010 [expr $nodeTag + 54] 1 2 3 4 5 6
			equalDOF 1051013 [expr $nodeTag + 55] 1 2 3 4 5 6
			equalDOF 1051016 [expr $nodeTag + 56] 1 2 3 4 5 6
			equalDOF 1051019 [expr $nodeTag + 57] 1 2 3 4 5 6
			equalDOF 1051022 [expr $nodeTag + 58] 1 2 3 4 5 6
			equalDOF 1051025 [expr $nodeTag + 59] 1 2 3 4 5 6
			equalDOF 1051028 [expr $nodeTag + 60] 1 2 3 4 5 6
			equalDOF 1051031 [expr $nodeTag + 61] 1 2 3 4 5 6
			equalDOF 1051034 [expr $nodeTag + 62] 1 2 3 4 5 6
			equalDOF 1051037 [expr $nodeTag + 63] 1 2 3 4 5 6
			equalDOF 1061001 [expr $nodeTag + 64] 1 2 3 4 5 6
			equalDOF 1061004 [expr $nodeTag + 65] 1 2 3 4 5 6
			equalDOF 1061010 [expr $nodeTag + 66] 1 2 3 4 5 6
			equalDOF 1061013 [expr $nodeTag + 67] 1 2 3 4 5 6
			equalDOF 1061016 [expr $nodeTag + 68] 1 2 3 4 5 6
			equalDOF 1061025 [expr $nodeTag + 69] 1 2 3 4 5 6
			equalDOF 1061028 [expr $nodeTag + 70] 1 2 3 4 5 6
			equalDOF 1061031 [expr $nodeTag + 71] 1 2 3 4 5 6
			equalDOF 1061037 [expr $nodeTag + 72] 1 2 3 4 5 6
			equalDOF 1071001 [expr $nodeTag + 73] 1 2 3 4 5 6
			equalDOF 1071004 [expr $nodeTag + 74] 1 2 3 4 5 6
			equalDOF 1071010 [expr $nodeTag + 75] 1 2 3 4 5 6
			equalDOF 1071013 [expr $nodeTag + 76] 1 2 3 4 5 6
			equalDOF 1071016 [expr $nodeTag + 77] 1 2 3 4 5 6
			equalDOF 1071025 [expr $nodeTag + 78] 1 2 3 4 5 6
			equalDOF 1071028 [expr $nodeTag + 79] 1 2 3 4 5 6
			equalDOF 1071031 [expr $nodeTag + 80] 1 2 3 4 5 6
			equalDOF 1071037 [expr $nodeTag + 81] 1 2 3 4 5 6
			equalDOF 1081001 [expr $nodeTag + 82] 1 2 3 4 5 6
			equalDOF 1081004 [expr $nodeTag + 83] 1 2 3 4 5 6
			equalDOF 1081007 [expr $nodeTag + 84] 1 2 3 4 5 6
			equalDOF 1081010 [expr $nodeTag + 85] 1 2 3 4 5 6
			equalDOF 1081013 [expr $nodeTag + 86] 1 2 3 4 5 6
			equalDOF 1081016 [expr $nodeTag + 87] 1 2 3 4 5 6
			equalDOF 1081019 [expr $nodeTag + 88] 1 2 3 4 5 6
			equalDOF 1081022 [expr $nodeTag + 89] 1 2 3 4 5 6
			equalDOF 1081025 [expr $nodeTag + 90] 1 2 3 4 5 6
			equalDOF 1081028 [expr $nodeTag + 91] 1 2 3 4 5 6
			equalDOF 1081031 [expr $nodeTag + 92] 1 2 3 4 5 6
			equalDOF 1081034 [expr $nodeTag + 93] 1 2 3 4 5 6
			equalDOF 1081037 [expr $nodeTag + 94] 1 2 3 4 5 6
			
			
			#### 5x5 mat
			#equalDOF 1011001 [expr $nodeTag +  1] 1 2 3 4 5 6
			#equalDOF 1011006 [expr $nodeTag +  2] 1 2 3 4 5 6
			#equalDOF 1011011 [expr $nodeTag +  3] 1 2 3 4 5 6
			#equalDOF 1011016 [expr $nodeTag +  4] 1 2 3 4 5 6
			#equalDOF 1011021 [expr $nodeTag +  5] 1 2 3 4 5 6
			#equalDOF 1011026 [expr $nodeTag +  6] 1 2 3 4 5 6
			#equalDOF 1011031 [expr $nodeTag +  7] 1 2 3 4 5 6
			#equalDOF 1011036 [expr $nodeTag +  8] 1 2 3 4 5 6
			#equalDOF 1011041 [expr $nodeTag +  9] 1 2 3 4 5 6
			#equalDOF 1011046 [expr $nodeTag + 10] 1 2 3 4 5 6
			#equalDOF 1011051 [expr $nodeTag + 11] 1 2 3 4 5 6
			#equalDOF 1011056 [expr $nodeTag + 12] 1 2 3 4 5 6
			#equalDOF 1011061 [expr $nodeTag + 13] 1 2 3 4 5 6
			#equalDOF 1021001 [expr $nodeTag + 14] 1 2 3 4 5 6
			#equalDOF 1021006 [expr $nodeTag + 15] 1 2 3 4 5 6
			#equalDOF 1021011 [expr $nodeTag + 16] 1 2 3 4 5 6
			#equalDOF 1021016 [expr $nodeTag + 17] 1 2 3 4 5 6
			#equalDOF 1021021 [expr $nodeTag + 18] 1 2 3 4 5 6
			#equalDOF 1021026 [expr $nodeTag + 19] 1 2 3 4 5 6
			#equalDOF 1021031 [expr $nodeTag + 20] 1 2 3 4 5 6
			#equalDOF 1021036 [expr $nodeTag + 21] 1 2 3 4 5 6
			#equalDOF 1021041 [expr $nodeTag + 22] 1 2 3 4 5 6
			#equalDOF 1021056 [expr $nodeTag + 23] 1 2 3 4 5 6
			#equalDOF 1021061 [expr $nodeTag + 24] 1 2 3 4 5 6
			#equalDOF 1031001 [expr $nodeTag + 25] 1 2 3 4 5 6
			#equalDOF 1031006 [expr $nodeTag + 26] 1 2 3 4 5 6
			#equalDOF 1031011 [expr $nodeTag + 27] 1 2 3 4 5 6
			#equalDOF 1031016 [expr $nodeTag + 28] 1 2 3 4 5 6
			#equalDOF 1031021 [expr $nodeTag + 29] 1 2 3 4 5 6
			#equalDOF 1031026 [expr $nodeTag + 30] 1 2 3 4 5 6
			#equalDOF 1031031 [expr $nodeTag + 31] 1 2 3 4 5 6
			#equalDOF 1031036 [expr $nodeTag + 32] 1 2 3 4 5 6
			#equalDOF 1031041 [expr $nodeTag + 33] 1 2 3 4 5 6
			#equalDOF 1031046 [expr $nodeTag + 34] 1 2 3 4 5 6
			#equalDOF 1031051 [expr $nodeTag + 35] 1 2 3 4 5 6
			#equalDOF 1031056 [expr $nodeTag + 36] 1 2 3 4 5 6
			#equalDOF 1031061 [expr $nodeTag + 37] 1 2 3 4 5 6
			#equalDOF 1041001 [expr $nodeTag + 38] 1 2 3 4 5 6
			#equalDOF 1041006 [expr $nodeTag + 39] 1 2 3 4 5 6
			#equalDOF 1041011 [expr $nodeTag + 40] 1 2 3 4 5 6
			#equalDOF 1041016 [expr $nodeTag + 41] 1 2 3 4 5 6
			#equalDOF 1041021 [expr $nodeTag + 42] 1 2 3 4 5 6
			#equalDOF 1041026 [expr $nodeTag + 43] 1 2 3 4 5 6
			#equalDOF 1041031 [expr $nodeTag + 44] 1 2 3 4 5 6
			#equalDOF 1041036 [expr $nodeTag + 45] 1 2 3 4 5 6
			#equalDOF 1041041 [expr $nodeTag + 46] 1 2 3 4 5 6
			#equalDOF 1041046 [expr $nodeTag + 47] 1 2 3 4 5 6
			#equalDOF 1041051 [expr $nodeTag + 48] 1 2 3 4 5 6
			#equalDOF 1041056 [expr $nodeTag + 49] 1 2 3 4 5 6
			#equalDOF 1041061 [expr $nodeTag + 50] 1 2 3 4 5 6
			#equalDOF 1051001 [expr $nodeTag + 51] 1 2 3 4 5 6
			#equalDOF 1051006 [expr $nodeTag + 52] 1 2 3 4 5 6
			#equalDOF 1051011 [expr $nodeTag + 53] 1 2 3 4 5 6
			#equalDOF 1051016 [expr $nodeTag + 54] 1 2 3 4 5 6
			#equalDOF 1051021 [expr $nodeTag + 55] 1 2 3 4 5 6
			#equalDOF 1051026 [expr $nodeTag + 56] 1 2 3 4 5 6
			#equalDOF 1051031 [expr $nodeTag + 57] 1 2 3 4 5 6
			#equalDOF 1051036 [expr $nodeTag + 58] 1 2 3 4 5 6
			#equalDOF 1051041 [expr $nodeTag + 59] 1 2 3 4 5 6
			#equalDOF 1051046 [expr $nodeTag + 60] 1 2 3 4 5 6
			#equalDOF 1051051 [expr $nodeTag + 61] 1 2 3 4 5 6
			#equalDOF 1051056 [expr $nodeTag + 62] 1 2 3 4 5 6
			#equalDOF 1051061 [expr $nodeTag + 63] 1 2 3 4 5 6
			#equalDOF 1061001 [expr $nodeTag + 64] 1 2 3 4 5 6
			#equalDOF 1061006 [expr $nodeTag + 65] 1 2 3 4 5 6
			#equalDOF 1061016 [expr $nodeTag + 66] 1 2 3 4 5 6
			#equalDOF 1061021 [expr $nodeTag + 67] 1 2 3 4 5 6
			#equalDOF 1061026 [expr $nodeTag + 68] 1 2 3 4 5 6
			#equalDOF 1061041 [expr $nodeTag + 69] 1 2 3 4 5 6
			#equalDOF 1061046 [expr $nodeTag + 70] 1 2 3 4 5 6
			#equalDOF 1061051 [expr $nodeTag + 71] 1 2 3 4 5 6
			#equalDOF 1061061 [expr $nodeTag + 72] 1 2 3 4 5 6
			#equalDOF 1071001 [expr $nodeTag + 73] 1 2 3 4 5 6
			#equalDOF 1071006 [expr $nodeTag + 74] 1 2 3 4 5 6
			#equalDOF 1071016 [expr $nodeTag + 75] 1 2 3 4 5 6
			#equalDOF 1071021 [expr $nodeTag + 76] 1 2 3 4 5 6
			#equalDOF 1071026 [expr $nodeTag + 77] 1 2 3 4 5 6
			#equalDOF 1071041 [expr $nodeTag + 78] 1 2 3 4 5 6
			#equalDOF 1071046 [expr $nodeTag + 79] 1 2 3 4 5 6
			#equalDOF 1071051 [expr $nodeTag + 80] 1 2 3 4 5 6
			#equalDOF 1071061 [expr $nodeTag + 81] 1 2 3 4 5 6
			#equalDOF 1081001 [expr $nodeTag + 82] 1 2 3 4 5 6
			#equalDOF 1081006 [expr $nodeTag + 83] 1 2 3 4 5 6
			#equalDOF 1081011 [expr $nodeTag + 84] 1 2 3 4 5 6
			#equalDOF 1081016 [expr $nodeTag + 85] 1 2 3 4 5 6
			#equalDOF 1081021 [expr $nodeTag + 86] 1 2 3 4 5 6
			#equalDOF 1081026 [expr $nodeTag + 87] 1 2 3 4 5 6
			#equalDOF 1081031 [expr $nodeTag + 88] 1 2 3 4 5 6
			#equalDOF 1081036 [expr $nodeTag + 89] 1 2 3 4 5 6
			#equalDOF 1081041 [expr $nodeTag + 90] 1 2 3 4 5 6
			#equalDOF 1081046 [expr $nodeTag + 91] 1 2 3 4 5 6
			#equalDOF 1081051 [expr $nodeTag + 92] 1 2 3 4 5 6
			#equalDOF 1081056 [expr $nodeTag + 93] 1 2 3 4 5 6
			#equalDOF 1081061 [expr $nodeTag + 94] 1 2 3 4 5 6
		}
	}
	
	puts $ModelFile "node [expr $nodeTag + 1] $x0 $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 2] [expr 24.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 3] [expr 48.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 4] [expr 72.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 5] [expr 96.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 6] [expr 120.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 7] [expr 144.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 8] [expr 174.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 9] [expr 198.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 222.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 246.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 270.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 294.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 14] $x0 [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 15] [expr 24.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 16] [expr 48.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 17] [expr 72.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 18] [expr 96.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 19] [expr 120.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 20] [expr 144.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 21] [expr 174.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 22] [expr 198.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 23] [expr 270.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 24] [expr 294.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 25] $x0 [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 26] [expr 24.*$ft + $x0] [expr 48.*$ft + $y0] $z "
	puts $ModelFile "node [expr $nodeTag + 27] [expr 48.*$ft + $x0] [expr 48.*$ft + $y0] $z "
	puts $ModelFile "node [expr $nodeTag + 28] [expr 72.*$ft + $x0] [expr 48.*$ft + $y0] $z "
	puts $ModelFile "node [expr $nodeTag + 29] [expr 96.*$ft + $x0] [expr 48.*$ft + $y0] $z "
	puts $ModelFile "node [expr $nodeTag + 30] [expr 120.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 31] [expr 144.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 32] [expr 174.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 33] [expr 198.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 34] [expr 222.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 35] [expr 246.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 36] [expr 270.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 37] [expr 294.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 38] $x0 [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 39] [expr 24.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 40] [expr 48.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 41] [expr 72.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 42] [expr 96.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 47] [expr 222.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 48] [expr 246.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 49] [expr 270.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 50] [expr 294.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 51] $x0 [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 52] [expr 24.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 53] [expr 48.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 54] [expr 72.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr 96.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 61] [expr 246.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 62] [expr 270.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 63] [expr 294.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 64] $x0 [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 65] [expr 24.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 66] [expr 72.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr 96.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 72] [expr 294.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 73] $x0 [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 74] [expr 24.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 75] [expr 72.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr 96.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 81] [expr 294.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 82] $x0 [expr 168.*$ft  + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 83] [expr 24.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 84] [expr 48.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 85] [expr 72.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr 96.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 93] [expr 270.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 94] [expr 294.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	
	
	for {set j 1} {$j <= 94} {incr j 1} {
		if {$i == 0} {
			if {$matFoundation == "Yes" || $masterNodeFlag} {
			} else {
				fix [expr $nodeTag + $j] 1 1 1 1 1 1
			}
			lappend Nodes [expr $nodeTag + $j]
		} else {
			lappend Nodes [expr $nodeTag + $j]
		}
	}
}

#Podiums and offices
for {set i 4} {$i <= 11} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	set z [expr $z + $H]; # z = z + H
	
	set nodeTag [expr 1000*$i + 800]
	
	node [expr $nodeTag + 9] [expr 198.*$ft + $x0] $y0 $z
	node [expr $nodeTag + 10] [expr 222.*$ft  + $x0] $y0 $z
	node [expr $nodeTag + 11] [expr 246.*$ft  + $x0] $y0 $z
	node [expr $nodeTag + 12] [expr 270.*$ft  + $x0] $y0 $z
	node [expr $nodeTag + 13] [expr 294.*$ft  + $x0] $y0 $z
	
	puts $ModelFile "node [expr $nodeTag + 9] [expr 198.*$ft + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 222.*$ft  + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 246.*$ft  + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 270.*$ft  + $x0] $y0 $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 294.*$ft  + $x0] $y0 $z"
	
	for {set j 9} {$j <= 13} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 22] [expr 198.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 23] [expr 270.*$ft + $x0] [expr 24.*$ft + $y0] $z
	node [expr $nodeTag + 24] [expr 294.*$ft + $x0] [expr 24.*$ft + $y0] $z
	
	node [expr $nodeTag + 25] $x0 [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 26] [expr 24.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 27] [expr 48.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 28] [expr 72.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 29] [expr 96.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 30] [expr 120.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 31] [expr 144.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 32] [expr 174.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 33] [expr 198.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 34] [expr 222.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 35] [expr 246.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 36] [expr 270.*$ft + $x0] [expr 48.*$ft + $y0] $z
	node [expr $nodeTag + 37] [expr 294.*$ft + $x0] [expr 48.*$ft + $y0] $z
	
	node [expr $nodeTag + 38] $x0 [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 39] [expr 24.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 40] [expr 48.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 41] [expr 72.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 42] [expr 96.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 47] [expr 222.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 48] [expr 246.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 49] [expr 270.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 50] [expr 294.*$ft + $x0] [expr 72.*$ft + $y0] $z
	
	node [expr $nodeTag + 51] $x0 [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 52] [expr 24.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 53] [expr 48.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 54] [expr 72.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 55] [expr 96.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 61] [expr 246.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 62] [expr 270.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 63] [expr 294.*$ft + $x0] [expr 96.*$ft + $y0] $z
	
	node [expr $nodeTag + 64] $x0 [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 65] [expr 24.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 66] [expr 72.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 67] [expr 96.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 72] [expr 294.*$ft + $x0] [expr 120.*$ft + $y0] $z
	
	node [expr $nodeTag + 73] $x0 [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 74] [expr 24.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 75] [expr 72.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 76] [expr 96.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 81] [expr 294.*$ft + $x0] [expr 144.*$ft + $y0] $z
	
	node [expr $nodeTag + 82] $x0 [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 83] [expr 24.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 84] [expr 48.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 85] [expr 72.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 86] [expr 96.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 93] [expr 270.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 94] [expr 294.*$ft + $x0] [expr 168.*$ft + $y0] $z
	
	for {set j 22} {$j <= 94} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	
	puts $ModelFile "node [expr $nodeTag + 22] [expr 198.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 23] [expr 270.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 24] [expr 294.*$ft + $x0] [expr 24.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 25] $x0 [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 26] [expr 24.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 27] [expr 48.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 28] [expr 72.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 29] [expr 96.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 30] [expr 120.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 31] [expr 144.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 32] [expr 174.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 33] [expr 198.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 34] [expr 222.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 35] [expr 246.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 36] [expr 270.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 37] [expr 294.*$ft + $x0] [expr 48.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 38] $x0 [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 39] [expr 24.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 40] [expr 48.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 41] [expr 72.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 42] [expr 96.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 47] [expr 222.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 48] [expr 246.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 49] [expr 270.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 50] [expr 294.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 51] $x0 [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 52] [expr 24.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 53] [expr 48.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 54] [expr 72.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr 96.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 61] [expr 246.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 62] [expr 270.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 63] [expr 294.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 64] $x0 [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 65] [expr 24.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 66] [expr 72.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr 96.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 72] [expr 294.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 73] $x0 [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 74] [expr 24.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 75] [expr 72.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr 96.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 81] [expr 294.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 82] $x0 [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 83] [expr 24.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 84] [expr 48.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 85] [expr 72.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr 96.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 93] [expr 270.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 94] [expr 294.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	
}

#Typical stories
for {set i 12} {$i <= $nStory} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	set z [expr $z + $H]; # z = z + H
	
	set nodeTag [expr 1000*$i + 800]
		
	node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z
	node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z
	
	for {set j 43} {$j <= 46} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 55] [expr 96.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z
	node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z
	
	for {set j 55} {$j < 61} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}

	node [expr $nodeTag + 67] [expr 96.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z
	node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z
	
	for {set j 67} {$j <= 71} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 76] [expr 96.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z
	node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z
	
	for {set j 76} {$j <= 80} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 86] [expr 96.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z
	node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z
	
	for {set j 86} {$j <= 92} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 174.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 198.*$ft + $x0] [expr 72.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr  96.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 174.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 198.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 222.*$ft + $x0] [expr 96.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr  96.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 198.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 222.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 246.*$ft + $x0] [expr 120.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr  96.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 198.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 222.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 246.*$ft + $x0] [expr 144.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr  96.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 174.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 198.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 222.*$ft + $x0] [expr 168.*$ft + $y0] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 246.*$ft + $x0] [expr 168.*$ft + $y0] $z"

}