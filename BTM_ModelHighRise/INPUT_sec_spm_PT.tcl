# Stringers sections

puts $ModelFile "INPUT_sec_spm_PT.tcl"

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

#set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(5.)*$ksi];	# Young's Modulus of Concrete 5 ksi
#set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Es [expr 29000.*$ksi]

set nuc 0.2

set Ec5String $matTag
incr matTag 1

set Ec6String $matTag
incr matTag 1

set stiffFac 0.5

uniaxialMaterial Elastic $Ec5String [expr $stiffFac*$Ec5]
uniaxialMaterial Elastic $Ec6String [expr $stiffFac*$Ec6]

puts $ModelFile "Steel Material"

# Reinforcing steel
set SteelString $matTag
incr matTag 1

# uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 <$a1 $a2 $a3 $a4 $sigInit>

set Fy	[expr 69.*$ksi];		# Expected yield strength
set Es	[expr 29000.*$ksi];		# Steel Young's modulus
set b 	0.012;					# Strain hardening ratio
set R0	20.;
set cR1	0.9;
set cR2	0.05;

set a1 0.039;
set a2 0.029;
set a3 0.0;
set a4 1.0;

uniaxialMaterial Steel02 $SteelString $Fy $Es $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4
puts $ModelFile "uniaxialMaterial Steel02 $SteelString $Fy $Es $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4"

# The tensile strength is also reduced by 2 factors
# Factor fx_1 is to consider that the strut is not going to develop the full tensile strength, strain distribution in the width is not linear and cracks do not spread through the entire width
# Factor fx_2 is to consider that in reality the stringer is not purely in tension, thre is vibration, bending, and other forces/stresses 

set fx_1 0.4
set fx_2 1.0

# 5 ksi
set stringConc5_eff $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets

set fpc		[expr 6.5*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec5;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(6500.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.0001];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc5_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc5_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# 6 ksi
set stringConc6_12_eff $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi*$fx_1*$fx_2];			# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.0001];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc6_12_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc6_12_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"


# ###################################

puts $ModelFile "Concrete material, immediate cracking"
set fx_1 0.25
set fx_2 0.2

# 5 ksi
set stringConc5 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets

set fpc		[expr 6.5*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec5;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(6500.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.0001];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc5 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc5 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# 6 ksi
set stringConc6_12 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.0001];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc6_12 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc6_12 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# ##############################################################################################################################################################################################
# ############################################################################ ELASTIC SECTIONS ################################################################################################
# ##############################################################################################################################################################################################

# STRINGER SECTION (8" thickness diaphragm) Story 12-36, Story 4-10, Story 1-2
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_elastic $secTag
incr secTag 1

section Fiber $string12x8_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec5String;	# Elastic section

}

set string12x8_CB_elastic $secTag
incr secTag 1

section Fiber $string12x8_CB_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec5String;	# Elastic section

}

set string14x8_elastic $secTag
incr secTag 1

section Fiber $string14x8_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w2] $Ec5String;	# Elastic section

}

# STRINGER SECTION (12" thickness diaphragm) Story 11 and story 3
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x12_elastic $secTag
incr secTag 1

section Fiber $string12x12_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec6String;	# Elastic section

}

set string12x12_CB_elastic $secTag
incr secTag 1

section Fiber $string12x12_CB_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec6String;	# Elastic section

}

set string14x12_elastic $secTag
incr secTag 1

section Fiber $string14x12_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w2] $Ec6String;	# Elastic section

}

# ##############################################################################################################################################################################################
# ########################################################################## NONLINEAR SECTIONS ################################################################################################
# ##############################################################################################################################################################################################

# Two concrete fibers are defined, one considering the effective area in tension (starting point, 4*thickness) and the other considering the rest of the area with immediate cracking
# Thus, for the 8" thickness and 12', the effective area ratio is 144/(4*8)=4.5
# Thus, for the 8" thickness and 15', the effective area ratio is 180/(4*8)=5.625
# Thus, for the 12" thickness and 12', the effective area ratio is 144/(4*12)=3
# Thus, for the 12" thickness and 15', the effective area ratio is 180/(4*12)=3.75
# Thus, for the 14" thickness and 12', the effective area ratio is 144/(4*14)=2.57
# Thus, for the 14" thickness and 15', the effective area ratio is 180/(4*14)=3.21

# A minimum steel area of 1% of the effective slab area is assigned to the stringers

# Rebar area
set Adb4	[expr $pi*pow((0.5),2)/4.]
set Adb6	[expr $pi*pow((0.75),2)/4.]
set Adb8	[expr $pi*pow((1.0),2)/4.]
set Adb10	[expr $pi*pow((1.27),2)/4.]
set Adb12	[expr $pi*pow((1.77),2)/4.]


# ############### STRINGER SECTIONS (8" thickness diaphragm) Story 12-36
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 15.*12*$in]

set string12x8_12_36 $secTag
incr secTag 1

section Fiber $string12x8_12_36 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string12x8_12_36_10num8 $secTag
incr secTag 1

section Fiber $string12x8_12_36_10num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 10.*$Adb8] $SteelString;

}

set string15x8_12_36 $secTag
incr secTag 1

section Fiber $string15x8_12_36 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

# ######################## STRINGER SECTIONS (12" thickness diaphragm) Story 11
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 15.*12*$in]

set string12x12_11 $secTag
incr secTag 1

section Fiber $string12x12_11 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 11.*$Adb4] $SteelString;

}

set string12x12_11_6num6 $secTag
incr secTag 1

section Fiber $string12x12_11_6num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb6] $SteelString;

}

set string12x12_11_12num6 $secTag
incr secTag 1

section Fiber $string12x12_11_12num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 12.*$Adb6] $SteelString;

}

set string12x12_11_6num8 $secTag
incr secTag 1

section Fiber $string12x12_11_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x12_11_12num8 $secTag
incr secTag 1

section Fiber $string12x12_11_12num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 12.*$Adb8] $SteelString;

}

set string12x12_11_8num8 $secTag
incr secTag 1

section Fiber $string12x12_11_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string12x12_11_16num8 $secTag
incr secTag 1

section Fiber $string12x12_11_16num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 16.*$Adb8] $SteelString;

}

set string12x12_11_16num12 $secTag
incr secTag 1

section Fiber $string12x12_11_16num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 16.*$Adb12] $SteelString;

}

set string12x12_11_7num10 $secTag
incr secTag 1

section Fiber $string12x12_11_7num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 7.*$Adb10] $SteelString;

}

set string12x15_11 $secTag
incr secTag 1

section Fiber $string12x15_11 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.75/3.75] $stringConc6_12;
fiber 0 0 [expr 11.*$Adb4] $SteelString;

}

set string12x15_11_6num8 $secTag
incr secTag 1

section Fiber $string12x15_11_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.75/3.75] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x15_11_8num8 $secTag
incr secTag 1

section Fiber $string12x15_11_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.75/3.75] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string12x15_11_7num10 $secTag
incr secTag 1

section Fiber $string12x15_11_7num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.75/3.75] $stringConc6_12;
fiber 0 0 [expr 7.*$Adb10] $SteelString;

}

# ############################################## STRINGER SECTION (8" thickness diaphragm) Story 4-10
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 15.*12*$in]

set string12x8_4_10 $secTag
incr secTag 1

section Fiber $string12x8_4_10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string12x8_4_10_8num10 $secTag
incr secTag 1

section Fiber $string12x8_4_10_8num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 8.*$Adb10] $SteelString;

}

set string15x8_4_10 $secTag
incr secTag 1

section Fiber $string15x8_4_10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

# ############################################## STRINGER SECTION (12" thickness diaphragm) Story 3
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 15.*12*$in]

set string12x12_3 $secTag
incr secTag 1

section Fiber $string12x12_3 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 11.*$Adb4] $SteelString;

}

set string12x12_3_6num6 $secTag
incr secTag 1

section Fiber $string12x12_3_6num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb6] $SteelString;

}

set string12x12_3_6num8 $secTag
incr secTag 1

section Fiber $string12x12_3_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x12_3_8num8 $secTag
incr secTag 1

section Fiber $string12x12_3_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string12x12_3_7num10 $secTag
incr secTag 1

section Fiber $string12x12_3_7num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 7.*$Adb10] $SteelString;

}

set string12x12_3_9num10 $secTag
incr secTag 1

section Fiber $string12x12_3_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}

set string12x12_3_8num12 $secTag
incr secTag 1

section Fiber $string12x12_3_8num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb12] $SteelString;

}

set string12x12_3_10num12 $secTag
incr secTag 1

section Fiber $string12x12_3_10num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb12] $SteelString;

}

set string12x12_3_14num12 $secTag
incr secTag 1

section Fiber $string12x12_3_14num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 14.*$Adb12] $SteelString;

}

set string15x12_3_6num8 $secTag
incr secTag 1

section Fiber $string15x12_3_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.75] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string15x12_3_8num8 $secTag
incr secTag 1

section Fiber $string15x12_3_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.75] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string15x12_3_7num10 $secTag
incr secTag 1

section Fiber $string15x12_3_7num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.75] $stringConc6_12;
fiber 0 0 [expr 7.*$Adb10] $SteelString;

}

set string15x12_3_8num12 $secTag
incr secTag 1

section Fiber $string15x12_3_8num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.75] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb12] $SteelString;

}

set string15x12_3_10num12 $secTag
incr secTag 1

section Fiber $string15x12_3_10num12 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.75] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.75] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb12] $SteelString;

}


# ############################################## STRINGER SECTION (8" thickness diaphragm) Story 1-2
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 15.*12*$in]

set string12x8_1_2 $secTag
incr secTag 1

section Fiber $string12x8_1_2 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string12x8_1_2_4num6 $secTag
incr secTag 1

section Fiber $string12x8_1_2_4num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb6] $SteelString;

}

set string12x8_1_2_6num6 $secTag
incr secTag 1

section Fiber $string12x8_1_2_6num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb6] $SteelString;

}

set string12x8_1_2_6num8 $secTag
incr secTag 1

section Fiber $string12x8_1_2_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x8_1_2_6num10 $secTag
incr secTag 1

section Fiber $string12x8_1_2_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string15x8_1_2 $secTag
incr secTag 1

section Fiber $string15x8_1_2 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string15x8_1_2_6num6 $secTag
incr secTag 1

section Fiber $string15x8_1_2_6num6 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb6] $SteelString;

}

set string15x8_1_2_6num8 $secTag
incr secTag 1

section Fiber $string15x8_1_2_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string15x8_1_2_6num10 $secTag
incr secTag 1

section Fiber $string15x8_1_2_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.625] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.625/5.625] $stringConc5;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

# ##############################################################################################################################################################################################
# ############################################################################## PANEL SECTIONS ################################################################################################
# ##############################################################################################################################################################################################

# All values from MCFT procedure

# ############################################### Story 1-2
#uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
set panel1_2_rho0035 $matTag;
incr matTag 1

set tauCrack [expr 242.1*$psi]
set gammaCrack 0.000103
set tauYield [expr 484.3*$psi]
set gammaYield 0.010403
set tauHard [expr 968.6*$psi]
set gammaHard 2.0704
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel1_2_rho0035 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec1_2_rho0035 $secTag
incr secTag 1

section Fiber $panelSec1_2_rho0035 -GJ 0.0 {

fiber 0 0 1.0 $panel1_2_rho0035;	# Panel section

}

# ############################################### Story 3
#uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
# rho=0.41%
set panel3_rho0041 $matTag;
incr matTag 1

set tauCrack [expr 282.8*$psi]
set gammaCrack 0.000109
set tauYield [expr 565.5*$psi]
set gammaYield 0.011009
set tauHard [expr 1131.*$psi]
set gammaHard 2.191
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel3_rho0041 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec3_rho0041 $secTag
incr secTag 1

section Fiber $panelSec3_rho0041 -GJ 0.0 {

fiber 0 0 1.0 $panel3_rho0041;	# Panel section

}

# rho=0.55%
set panel3_rho0055 $matTag;
incr matTag 1

set tauCrack [expr 313.2*$psi]
set gammaCrack 0.00012
set tauYield [expr 379.9*$psi]
set gammaYield 0.00438
#set gammaYield 0.00014;
set tauHard [expr 759.8*$psi]
set gammaHard 0.0772
#set gammaHard 0.025237;
# ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel3_rho0055 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec3_rho0055 $secTag
incr secTag 1

section Fiber $panelSec3_rho0055 -GJ 0.0 {

fiber 0 0 1.0 $panel3_rho0055;	# Panel section

}

# rho=0.85%
set panel3_rho0085 $matTag;
incr matTag 1

set tauCrack [expr 314.7*$psi]
set gammaCrack 0.000121
set tauYield [expr 586.5*$psi]
set gammaYield 0.00637
#set gammaYield 0.000384;	#ALTERNATIVE
set tauHard [expr 1173.0*$psi]
set gammaHard 0.118
#set gammaHard 0.0388;	#ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel3_rho0085 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec3_rho0085 $secTag
incr secTag 1

section Fiber $panelSec3_rho0085 -GJ 0.0 {

fiber 0 0 1.0 $panel3_rho0085;	# Panel section

}

# rho=1.28%
set panel3_rho0128 $matTag;
incr matTag 1

set tauCrack [expr 314.7*$psi]
set gammaCrack 0.000121
set tauYield [expr 883.1*$psi]
set gammaYield 0.00738
#set gammaYield 0.000578;	#ALTERNATIVE 
set tauHard [expr 1766.1*$psi]
set gammaHard 0.1758
#set gammaHard 0.0584;	#ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel3_rho0128 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec3_rho0128 $secTag
incr secTag 1

section Fiber $panelSec3_rho0128 -GJ 0.0 {

fiber 0 0 1.0 $panel3_rho0128;	# Panel section

}

# rho=1.46%
set panel3_rho0146 $matTag;
incr matTag 1

set tauCrack [expr 314.7*$psi]
set gammaCrack 0.000121
set tauYield [expr 1007.8*$psi]
set gammaYield 0.00764
#set gammaYield 0.00066;	#ALTERNATIVE
set tauHard [expr 2015.5*$psi]
set gammaHard 0.1998
#set gammaHard 0.0666;	#ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel3_rho0146 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec3_rho0146 $secTag
incr secTag 1

section Fiber $panelSec3_rho0146 -GJ 0.0 {

fiber 0 0 1.0 $panel3_rho0146;	# Panel section

}



# ############################################### Story 4-10
#uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
#rho = 0.35%
set panel4_10_rho0035 $matTag;
incr matTag 1

set tauCrack [expr 242.1*$psi]
set gammaCrack 0.000103
set tauYield [expr 484.3*$psi]
set gammaYield 0.010403
set tauHard [expr 968.6*$psi]
set gammaHard 2.0704
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel4_10_rho0035 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec4_10_rho0035 $secTag
incr secTag 1

section Fiber $panelSec4_10_rho0035 -GJ 0.0 {

fiber 0 0 1.0 $panel4_10_rho0035;	# Panel section

}

#rho = 0.82%
set panel4_10_rho0082 $matTag;
incr matTag 1

set tauCrack [expr 287.1*$psi]
set gammaCrack 0.000123
set tauYield [expr 565.5*$psi]
set gammaYield 0.00656
#set gammaYield 0.000406;	#ALTERNATIVE
set tauHard [expr 848.3*$psi]
set gammaHard 0.33456
#set gammaHard 0.040982;	#ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel4_10_rho0082 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec4_10_rho0082 $secTag
incr secTag 1

section Fiber $panelSec4_10_rho0082 -GJ 0.0 {

fiber 0 0 1.0 $panel4_10_rho0082;	# Panel section

}

# ############################################### Story 11
#uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
# rho=0.41%
set panel11_rho0041 $matTag;
incr matTag 1

set tauCrack [expr 282.8*$psi]
set gammaCrack 0.000109
set tauYield [expr 565.5*$psi]
set gammaYield 0.011009
set tauHard [expr 1131.*$psi]
set gammaHard 2.191
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel11_rho0041 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec11_rho0041 $secTag
incr secTag 1

section Fiber $panelSec11_rho0041 -GJ 0.0 {

fiber 0 0 1.0 $panel11_rho0041;	# Panel section

}

# rho=0.55%
set panel11_rho0055 $matTag;
incr matTag 1

set tauCrack [expr 313.2*$psi]
set gammaCrack 0.00012
set tauYield [expr 379.9*$psi]
set gammaYield 0.00438
#set gammaYield 0.00025;	#ALTERNATIVE
set tauHard [expr 759.8*$psi]
set gammaHard 0.442
#set gammaHard 0.0252;	#ALTERNATIVE
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel11_rho0055 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec11_rho0055 $secTag
incr secTag 1

section Fiber $panelSec11_rho0055 -GJ 0.0 {

fiber 0 0 1.0 $panel11_rho0055;	# Panel section

}

# ############################################### Story 12-36
#uniaxialMaterial Hysteretic $matTag $s1p $e1p $s2p $e2p <$s3p $e3p> $s1n $e1n $s2n $e2n <$s3n $e3n> $pinchX $pinchY $damage1 $damage2 <$beta>
#rho = 0.35%
set panel12_36_rho0035 $matTag;
incr matTag 1

set tauCrack [expr 242.1*$psi]
set gammaCrack 0.000103
set tauYield [expr 484.3*$psi]
set gammaYield 0.010403
set tauHard [expr 968.6*$psi]
set gammaHard 2.0704
set pinchX 0.8
set pinchY 0.2
set damage1 0.0
set damage2 0.0
set beta 0.0

set s1p $tauCrack
set e1p $gammaCrack
set s2p $tauYield
set e2p $gammaYield
set s3p $tauHard
set e3p $gammaHard
set s1n -$s1p
set e1n -$e1p
set s2n -$s2p
set e2n -$e2p
set s3n -$s3p
set e3n -$e3p

#puts "s1p $tauCrack"
#puts "e1p $gammaCrack"
#puts "s2p $tauYield"
#puts "e2p $gammaYield"
#puts "s3p $tauHard"
#puts "e3p $gammaHard"
#puts "s1n -$s1p"
#puts "e1n -$e1p"
#puts "s2n -$s2p"
#puts "e2n -$e2p"
#puts "s3n -$s3p"
#puts "e3n -$e3p"

uniaxialMaterial Hysteretic $panel12_36_rho0035 $s1p $e1p $s2p $e2p $s3p $e3p $s1n $e1n $s2n $e2n $s3n $e3n $pinchX $pinchY $damage1 $damage2 $beta

set panelSec12_36_rho0035 $secTag
incr secTag 1

section Fiber $panelSec12_36_rho0035 -GJ 0.0 {

fiber 0 0 1.0 $panel12_36_rho0035;	# Panel section

}