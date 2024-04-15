
 ############################# Columns #######################################
 
 #Columns are defined as elasticBeamColumn elements in this tcl file
 
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete
set nuc 0.2;													# Poisson's Ratio of Concrete
set Gc6 [expr $Ec6/(2.0*(1.0 + $nuc))];							# Shear Modulus of Concrete

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete
set Gc5 [expr $Ec5/(2.0*(1.0 + $nuc))];							# Shear Modulus of Concrete
 
 # 6 - 11
 # 11 - 16
 # 16 - 21
 # 21 - 26
 # 26 - 31
 # 31 - 36
 
 # 0 - 3 Basements
 for {set i 1} {$i <= 3} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
	
	#12x12 6 ksi
	set dim [expr 12.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	#element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#16x16 6 ksi
	set dim [expr 16.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 15] [expr $iNode + 15] [expr $jNode + 15] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 16] [expr $iNode + 16] [expr $jNode + 16] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 17] [expr $iNode + 17] [expr $jNode + 17] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 18] [expr $iNode + 18] [expr $jNode + 18] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 19] [expr $iNode + 19] [expr $jNode + 19] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 20] [expr $iNode + 20] [expr $jNode + 20] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 21] [expr $iNode + 21] [expr $jNode + 21] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 15] [expr $iNode + 15] [expr $jNode + 15] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 16] [expr $iNode + 16] [expr $jNode + 16] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 17] [expr $iNode + 17] [expr $jNode + 17] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 18] [expr $iNode + 18] [expr $jNode + 18] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 19] [expr $iNode + 19] [expr $jNode + 19] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 20] [expr $iNode + 20] [expr $jNode + 20] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 21] [expr $iNode + 21] [expr $jNode + 21] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"

	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"

	#32x32 6 ksi
	set dim [expr 32.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]

	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX

	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"

	#36x36 6 ksi
	set dim [expr 36.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#40x40 6 ksi
	set dim [expr 40.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]

	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX

	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#44x44 6 ksi
	set dim [expr 44.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

 # 3 - 6 Podiums
for {set i 4} {$i <= 6} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#12x12 6 ksi
	set dim [expr 12.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	#element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	element elasticBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#32x32 6 ksi
	set dim [expr 32.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#36x36 6 ksi
	set dim [expr 36.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"

	#40x40 6 ksi
	set dim [expr 40.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#44x44 6 ksi
	set dim [expr 44.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

 # 6 - 11 Offices
for {set i 7} {$i <= 11} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	#12x12 6 ksi
	set dim [expr 12.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag +  9] [expr $iNode + 9] [expr $jNode + 9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag +  9] [expr $iNode + 9] [expr $jNode + 9] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#32x32 6 ksi
	set dim [expr 32.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#36x36 6 ksi
	set dim [expr 36.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#40x40 6 ksi
	set dim [expr 40.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

 # 11 - 16 Residential
for {set i 12} {$i <= 16} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#  ##########24x24 6 ksi
	#  #########set dim [expr 24.*$in]
	#  #########set Jcol [expr 0.141*pow($dim,4)*0.1]
	#  #########set Icol [expr 1/12.*pow($dim,4)*0.7]
	#  #########set Acol [expr $dim*$dim]

	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	#puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#32x32 6 ksi
	set dim [expr 32.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56]  $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59]  $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56]  $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59]  $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#36x36 6 ksi
	set dim [expr 36.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

# 17 - 21 Residential
for {set i 17} {$i <= 21} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	# ##########20x20 6 ksi
	# #########set dim [expr 20.*$in]
	# #########set Jcol [expr 0.141*pow($dim,4)*0.1]
	# #########set Icol [expr 1/12.*pow($dim,4)*0.7]
	# #########set Acol [expr $dim*$dim]
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	#puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#28x28 6 ksi
	set dim [expr 28.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#36x36 6 ksi
	set dim [expr 36.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

# 22 - 26 Residential
for {set i 22} {$i <= 26} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	#puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#32x32 6 ksi
	set dim [expr 32.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

# 27 - 31 Residential
for {set i 27} {$i <= 31} {incr i 1} {
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#16x16 6 ksi
	set dim [expr 16.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	#puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#24x24 6 ksi
	set dim [expr 24.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}

# 32 - 36 Residential
for {set i 32} {$i <= 36} {incr i 1} {
		
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]
	
	#12x12 6 ksi
	set dim [expr 12.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	#element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	#puts $ModelFile "element elasticBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"	
	
	#16x16 6 ksi
	set dim [expr 16.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
	#20x20 6 ksi
	set dim [expr 20.*$in]
	set Jcol [expr 0.141*pow($dim,4)*0.1]
	set Icol [expr 1/12.*pow($dim,4)*0.7]
	set Acol [expr $dim*$dim]
	
	element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX
	
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	puts $ModelFile "element elasticBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $Acol $Ec6 $Gc6 $Jcol $Icol $Icol $transfTagVertRecX"
	
}