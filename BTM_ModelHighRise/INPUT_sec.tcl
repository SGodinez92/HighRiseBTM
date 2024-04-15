# Updated reinforcement, more steel in walls
set secTag 1

# Rebar area
set Adb6	[expr $pi*pow((0.75),2)/4.]
set Adb7	[expr $pi*pow((0.875),2)/4.]
set Adb8	[expr $pi*pow((1.0),2)/4.]
set Adb9	[expr $pi*pow((1.128),2)/4.]
set Adb10	[expr $pi*pow((1.27),2)/4.]
set Adb11	[expr $pi*pow((1.41),2)/4.]

# WALLS SECTIONS --------------------------------------------------------------------------

#           ____________		    ____________
#          |  __________|		   |__________  |	
#          | | ^ y                         y ^| |     
#          | | |                             || |     
#          | | |                             || |     
#          | | o-----> z                     o----> z 
#          | |                                | |     
#          | |                                | |     
#          | |__________            __________| |
#          |____________|          |____________|
#          

# local y-z axis defined for C - wall section (left wall)

# WALL SECTION 40 in 8 ksi
# EAST
set secWall40_8_E $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*144.*$in*pow(40.*$in,3)*0.281]
set JWall [expr $JWall + 252.*$in*pow(40.*$in,3)*0.302]

set thick 	[expr 40.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall40_8_E -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW_8_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] [expr $Centr - $thick/2.]
patch rect $unconfinedConc8 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  [expr $Centr - $thick/2.]

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW_8_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc8 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]
};

# RIGHT
set secWall40_8_W $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*144.*$in*pow(40.*$in,3)*0.281]
set JWall [expr $JWall + 252.*$in*pow(40.*$in,3)*0.302]

set thick 	[expr 40.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall40_8_W -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2-$be] [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $cover]
patch rect $confinedConcW_8_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2-$be] [expr $C_dim1 + $thick/2. - $cover]  [expr $C_dim2 - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $be]			[expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be]	[expr -$C_dim1 + $thick/2.]          [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 - $thick/2.] [expr $C_dim2 - $be]				[expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be] 	[expr $C_dim1 + $thick/2.]           [expr $C_dim2 - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $cover] [expr -$C_dim1 + $thick/2.] [expr $C_dim2]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 - $thick/2.]  [expr $C_dim2 - $cover] [expr $C_dim1 + $thick/2.]  [expr $C_dim2]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2.] [expr -$C_dim1 + $thick/2.] [expr $C_dim2 - $be]
patch rect $unconfinedConc8 8 32 [expr $C_dim1 - $thick/2.]  [expr -$Centr + $thick/2.] [expr $C_dim1 + $thick/2.]  [expr $C_dim2 - $be]

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2. - $cover]
patch rect $confinedConcW_8_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2.]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr -$Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 6 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc8 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - 10]
};


# WALL SECTION 36 in 8 ksi
# EAST
set secWall36_8_E $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*144.*$in*pow(36.*$in,3)*0.281]
set JWall [expr $JWall + 252.*$in*pow(36.*$in,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_8_E -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW_8_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] [expr $Centr - $thick/2.]
patch rect $unconfinedConc8 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  [expr $Centr - $thick/2.]

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW_8_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc8 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]
};

# WEST
set secWall36_8_W $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*144.*$in*pow(36.*$in,3)*0.281]
set JWall [expr $JWall + 252.*$in*pow(36.*$in,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_8_W -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2-$be] [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $cover]
patch rect $confinedConcW_8_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2-$be] [expr $C_dim1 + $thick/2. - $cover]  [expr $C_dim2 - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $be]			[expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be]	[expr -$C_dim1 + $thick/2.]          [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 - $thick/2.] [expr $C_dim2 - $be]				[expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2 - $cover]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be] 	[expr $C_dim1 + $thick/2.]           [expr $C_dim2 - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $cover] [expr -$C_dim1 + $thick/2.] [expr $C_dim2]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 - $thick/2.]  [expr $C_dim2 - $cover] [expr $C_dim1 + $thick/2.]  [expr $C_dim2]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2.] [expr -$C_dim1 + $thick/2.] [expr $C_dim2 - $be]
patch rect $unconfinedConc8 8 32 [expr $C_dim1 - $thick/2.]  [expr -$Centr + $thick/2.] [expr $C_dim1 + $thick/2.]  [expr $C_dim2 - $be]

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2. - $cover]
patch rect $confinedConcW_8_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2.]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr -$Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 6 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc8 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - 10]
};


# ################################################
# WALL SECTION 36 in 7 ksi
# EAST
set secWall36_7_E $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*12.*$ft*pow(3.*$ft,3)*0.281]
set JWall [expr $JWall + 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_7_E -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW_7_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] [expr $Centr - $thick/2.]
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  [expr $Centr - $thick/2.]

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]

};

# WEST
set secWall36_7_W $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*12.*$ft*pow(3.*$ft,3)*0.281]
set JWall [expr $JWall + 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_7_W -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2-$be] [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $cover]
patch rect $confinedConcW_7_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2-$be] [expr $C_dim1 + $thick/2. - $cover]  [expr $C_dim2 - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $be]			[expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be]	[expr -$C_dim1 + $thick/2.]          [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr $C_dim2 - $be]				[expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be] 	[expr $C_dim1 + $thick/2.]           [expr $C_dim2 - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $cover] [expr -$C_dim1 + $thick/2.] [expr $C_dim2]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr $C_dim2 - $cover] [expr $C_dim1 + $thick/2.]  [expr $C_dim2]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2.] [expr -$C_dim1 + $thick/2.] [expr $C_dim2 - $be]
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$Centr + $thick/2.] [expr $C_dim1 + $thick/2.]  [expr $C_dim2 - $be]

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2. - $cover]
patch rect $confinedConcW_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr -$Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr $C_dim2 - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr $C_dim2 - $cover - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - 10]
};


# ################################################
# WALL SECTION 28 in 7 ksi
# EAST
set secWall28_7_E $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*140.*$in*pow(28*$in,3)*0.291]
set JWall [expr $JWall + 260.*$in*pow(28*$in,3)*0.310]

set thick 	[expr 28.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 8.*$in]

section Fiber $secWall28_7_E -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_ce 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW_7_ce 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] $Centr
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  $Centr

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]

};

# WEST
set secWall28_7_W $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*140.*$in*pow(28*$in,3)*0.291]
set JWall [expr $JWall + 260.*$in*pow(28*$in,3)*0.310]

set thick 	[expr 28.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 8.*$in]

section Fiber $secWall28_7_W -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_ce 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2-$be] [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $cover]
patch rect $confinedConcW_7_ce 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2-$be] [expr $C_dim1 + $thick/2. - $cover]  [expr $C_dim2 - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $be]			[expr -$C_dim1 - $thick/2. + $cover] [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be]	[expr -$C_dim1 + $thick/2.]          [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr $C_dim2 - $be]				[expr $C_dim1 - $thick/2. + $cover]  [expr $C_dim2 - $cover]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr $C_dim2 - $be] 	[expr $C_dim1 + $thick/2.]           [expr $C_dim2 - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr $C_dim2 - $cover] [expr -$C_dim1 + $thick/2.] [expr $C_dim2]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr $C_dim2 - $cover] [expr $C_dim1 + $thick/2.]  [expr $C_dim2]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2.] [expr -$C_dim1 + $thick/2.] [expr $C_dim2 - $be]
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$Centr + $thick/2.] [expr $C_dim1 + $thick/2.]  [expr $C_dim2 - $be]

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2. - $cover]
patch rect $confinedConcW_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr -$Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr -$Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr -$Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr -$Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr -$Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr -$Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be - 8]

#Steel rebar in web
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr $C_dim2 - $be + 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr $C_dim2 - $cover - 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr $C_dim2 - $cover - 1]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $C_dim2 - $cover - 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr $C_dim2 - $be + 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr $C_dim2 - $be + 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr $C_dim2 - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr $C_dim2 - $cover - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr -$Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr -$Centr + $thick/2. - 10]
};

# ############################################################################

# WALL COMPONENTS

set secWall40_8_flangeW $secTag
incr secTag 1

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWallflange [expr 144.*$in*pow(40.*$in,3)*0.281]
set JWallweb [expr 252.*$in*pow(40.*$in,3)*0.302]

set thick 	[expr 40.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]
#set ce		$thick
set Lf		[expr 13.*$ft + 2.*$in]

section Fiber $secWall40_8_flangeW -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$thick/2. + $cover] [expr $Lf/2. - $be] [expr $thick/2. - $cover] [expr $Lf/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$thick/2.] [expr $Lf/2. - $be] [expr -$thick/2. + $cover] [expr $Lf/2. - $cover]
patch rect $unconfinedConc8 2 8 [expr $thick/2. - $cover] [expr $Lf/2. - $be] [expr $thick/2.] [expr $Lf/2. - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$thick/2.] [expr $Lf/2. - $cover] [expr $thick/2.] [expr $Lf/2.]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$thick/2.] [expr -$Lf/2. + $thick] [expr $thick/2.] [expr $Lf/2. - $be]

#Confined concrete in corner element
#patch rect $confinedConcW_8_ce 16 12 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr -$thick/2. + $ce] [expr -$Lf/2. + $thick - $cover]
patch rect $confinedConcW_8_ce 12 6 [expr -$thick/2. + $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $thick - $cover]

#Unconfined concrete vertical patch in corner
#patch rect $unconfinedConc8 8 2 [expr -$thick/2.] [expr -$Lf/2.] [expr -$thick/2. + $ce] [expr -$Lf/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$thick/2.] [expr -$Lf/2. + $thick/2.] [expr $thick/2.] [expr -$Lf/2. + $thick/2. + $cover]

#Unconfined concrete horizontal patch in corner
#patch rect $unconfinedConc8 2 6 [expr $thick/2. - $cover] [expr -$Lf/2. + $cover] [expr $thick/2.] [expr -$Lf/2. + $thick - $cover]
patch rect $unconfinedConc8 2 3 [expr $thick/2. - $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2.] [expr -$Lf/2. + $thick - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $cover - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $cover + 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + 10.] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + 10] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - 10]

#layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick/2. + $cover + 1]
#layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]

};


set secWall40_8_flangeE $secTag
incr secTag 1

section Fiber $secWall40_8_flangeE -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$thick/2.] [expr -$Lf/2.] [expr -$thick/2. + $cover] [expr -$Lf/2. + $be]
patch rect $unconfinedConc8 2 8 [expr $thick/2. - $cover] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$thick/2.] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$thick/2.] [expr -$Lf/2. + $be] [expr $thick/2.] [expr $Lf/2. - $thick]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 12 6 [expr -$thick/2. + $cover] [expr $Lf/2. - $thick] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$thick/2.] [expr $Lf/2. - $thick/2. - $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 3 [expr $thick/2. - $cover] [expr $Lf/2. - $thick + $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $be - 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $be - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $cover - 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - 10.] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - 10] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + 10]

#layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick/2. - $cover - 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick/2. - $cover - 1]
#layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]

};

# 
set secWall40_8_web $secTag
incr secTag 1

section Fiber $secWall40_8_web -GJ [expr $GcWall*$JWallweb*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 - $thick/2. + $ce] [expr -$thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2.]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $thick/2. - $cover - 1]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 6 12 [expr -$C_dim1 + $cover] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2. - $cover]
patch rect $confinedConcW_8_ce 6 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2. + $cover] [expr $C_dim1 - $cover] [expr $thick/2. - $cover]

#Unconfined concrete in corner element
patch rect $unconfinedConc8 6 2 [expr -$C_dim1] [expr -$thick/2.] [expr -$C_dim1 + $ce - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc8 6 2 [expr -$C_dim1] [expr $thick/2. - $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2.]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2.] [expr $C_dim1 - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2. - $cover] [expr $C_dim1 - $thick/2.] [expr $thick/2.]

#layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 + $cover + 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $cover + 1] [expr +$thick/2. - $cover]
#layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 + $ce - 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce - 1] [expr +$thick/2. - $cover]
#layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 - $cover - 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $cover - 1] [expr +$thick/2. - $cover]
#layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 - $ce + 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $ce + 1] [expr +$thick/2. - $cover]

layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$thick/2. + $cover] [expr -$C_dim1 -$thick/2. + $cover + 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 + $ce/2. - 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce/2. - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 - $ce/2. + 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $ce/2. + 1] [expr $thick/2. - $cover]

};


# WEST
set secWall36_8_flangeW $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWallflange [expr 12.*$ft*pow(3.*$ft,3)*0.281]
set JWallweb [expr 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]
#set ce		$thick
set Lf 		[expr 13.*$ft]

section Fiber $secWall36_8_flangeW -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$thick/2. + $cover] [expr $Lf/2. - $be] [expr $thick/2. - $cover] [expr $Lf/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$thick/2.] [expr $Lf/2. - $be] [expr -$thick/2. + $cover] [expr $Lf/2. - $cover]
patch rect $unconfinedConc8 2 8 [expr $thick/2. - $cover] [expr $Lf/2. - $be] [expr $thick/2.] [expr $Lf/2. - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$thick/2.] [expr $Lf/2. - $cover] [expr $thick/2.] [expr $Lf/2.]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$thick/2.] [expr -$Lf/2. + $thick] [expr $thick/2.] [expr $Lf/2. - $be]

#Confined concrete in corner element
#patch rect $confinedConcW_8_ce 16 12 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr -$thick/2. + $ce] [expr -$Lf/2. + $thick - $cover]
patch rect $confinedConcW_8_ce 12 6 [expr -$thick/2. + $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $thick - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$thick/2.] [expr -$Lf/2. + $thick/2.] [expr $thick/2.] [expr -$Lf/2. + $thick/2. + $cover]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 3 [expr $thick/2. - $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2.] [expr -$Lf/2. + $thick - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $cover - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $cover + 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + 10.] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + 10] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - 10]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]

};


set secWall36_8_flangeE $secTag
incr secTag 1

section Fiber $secWall36_8_flangeE -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_8_be 12 16 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$thick/2.] [expr -$Lf/2.] [expr -$thick/2. + $cover] [expr -$Lf/2. + $be]
patch rect $unconfinedConc8 2 8 [expr $thick/2. - $cover] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$thick/2.] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$thick/2.] [expr -$Lf/2. + $be] [expr $thick/2.] [expr $Lf/2. - $thick]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 12 6 [expr -$thick/2. + $cover] [expr $Lf/2. - $thick] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$thick/2.] [expr $Lf/2. - $thick/2. - $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 3 [expr $thick/2. - $cover] [expr $Lf/2. - $thick + $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $be - 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $be - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $cover - 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - 10.] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - 10] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + 10]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]

};

# RIGHT
set secWall36_8_web $secTag
incr secTag 1

section Fiber $secWall36_8_web -GJ [expr $GcWall*$JWallweb*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 - $thick/2. + $ce] [expr -$thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2.]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $thick/2. - $cover - 1]

#Confined concrete in corner element
patch rect $confinedConcW_8_ce 6 12 [expr -$C_dim1 + $cover] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2. - $cover]
patch rect $confinedConcW_8_ce 6 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2. + $cover] [expr $C_dim1 - $cover] [expr $thick/2. - $cover]

#Unconfined concrete in corner element
patch rect $unconfinedConc8 6 2 [expr -$C_dim1] [expr -$thick/2.] [expr -$C_dim1 + $ce - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc8 6 2 [expr -$C_dim1] [expr $thick/2. - $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2.]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2.] [expr $C_dim1 - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2. - $cover] [expr $C_dim1 - $thick/2.] [expr $thick/2.]

#Corner element steel
layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$thick/2. + $cover] [expr -$C_dim1 -$thick/2. + $cover + 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 + $ce/2. - 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce/2. - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 - $ce/2. + 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $ce/2. + 1] [expr $thick/2. - $cover]


};


# WEST
set secWall36_7_flangeW $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWallflange [expr 12.*$ft*pow(3.*$ft,3)*0.281]
set JWallweb [expr 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]
#set ce		$thick

section Fiber $secWall36_7_flangeW -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$thick/2. + $cover] [expr $Lf/2. - $be] [expr $thick/2. - $cover] [expr $Lf/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$thick/2.] [expr $Lf/2. - $be] [expr -$thick/2. + $cover] [expr $Lf/2. - $cover]
patch rect $unconfinedConc7 2 8 [expr $thick/2. - $cover] [expr $Lf/2. - $be] [expr $thick/2.] [expr $Lf/2. - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$thick/2.] [expr $Lf/2. - $cover] [expr $thick/2.] [expr $Lf/2.]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$thick/2.] [expr -$Lf/2. + $thick] [expr $thick/2.] [expr $Lf/2. - $be]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 12 6 [expr -$thick/2. + $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $thick - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$thick/2.] [expr -$Lf/2. + $thick/2.] [expr $thick/2.] [expr -$Lf/2. + $thick/2. + $cover]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 3 [expr $thick/2. - $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2.] [expr -$Lf/2. + $thick - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $be + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $cover - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $cover + 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + 10.] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + 10] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - 10]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]


};

set secWall36_7_flangeE $secTag
incr secTag 1

section Fiber $secWall36_7_flangeE -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$thick/2.] [expr -$Lf/2.] [expr -$thick/2. + $cover] [expr -$Lf/2. + $be]
patch rect $unconfinedConc7 2 8 [expr $thick/2. - $cover] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$thick/2.] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$thick/2.] [expr -$Lf/2. + $be] [expr $thick/2.] [expr $Lf/2. - $thick]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 12 6 [expr -$thick/2. + $cover] [expr $Lf/2. - $thick] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$thick/2.] [expr $Lf/2. - $thick/2. - $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 3 [expr $thick/2. - $cover] [expr $Lf/2. - $thick + $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $be - 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $be - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $cover - 1]
#layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - 10.] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + 10]
#layer straight $SteelMatTag 3 $Adb10 [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - 10] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + 10]

layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 5 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]


};


# RIGHT
set secWall36_7_web $secTag
incr secTag 1

section Fiber $secWall36_7_web -GJ [expr $GcWall*$JWallweb*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 - $thick/2. + $ce] [expr -$thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2.]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $thick/2. - $cover - 1]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 6 12 [expr -$C_dim1 + $cover] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2. - $cover]
patch rect $confinedConcW_7_ce 6 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2. + $cover] [expr $C_dim1 - $cover] [expr $thick/2. - $cover]

#Unconfined concrete in corner element
patch rect $unconfinedConc7 6 2 [expr -$C_dim1] [expr -$thick/2.] [expr -$C_dim1 + $ce - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc7 6 2 [expr -$C_dim1] [expr $thick/2. - $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2.]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2.] [expr $C_dim1 - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2. - $cover] [expr $C_dim1 - $thick/2.] [expr $thick/2.]

#Corner element steel
layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$thick/2. + $cover] [expr -$C_dim1 -$thick/2. + $cover + 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr -$C_dim1 + $ce/2. - 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce/2. - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb10 [expr $C_dim1 - $ce/2. + 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $ce/2. + 1] [expr $thick/2. - $cover]


};


# WEST
set secWall28_7_flangeW $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWallflange [expr 12.*$ft*pow(28.,3)*0.281]
set JWallweb [expr 21.*$ft*pow(28.,3)*0.302]

set thick 	[expr 28.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 8.*$in]
#set ce		$thick
set Lf		[expr 12.*$ft + 8.*$in]

section Fiber $secWall28_7_flangeW -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$thick/2. + $cover] [expr $Lf/2. - $be] [expr $thick/2. - $cover] [expr $Lf/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$thick/2.] [expr $Lf/2. - $be] [expr -$thick/2. + $cover] [expr $Lf/2. - $cover]
patch rect $unconfinedConc7 2 8 [expr $thick/2. - $cover] [expr $Lf/2. - $be] [expr $thick/2.] [expr $Lf/2. - $cover]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$thick/2.] [expr $Lf/2. - $cover] [expr $thick/2.] [expr $Lf/2.]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$thick/2.] [expr -$Lf/2. + $thick] [expr $thick/2.] [expr $Lf/2. - $be]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 12 6 [expr -$thick/2. + $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $thick - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$thick/2.] [expr -$Lf/2. + $thick/2.] [expr $thick/2.] [expr -$Lf/2. + $thick/2. + $cover]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 3 [expr $thick/2. - $cover] [expr -$Lf/2. + $thick/2. + $cover] [expr $thick/2.] [expr -$Lf/2. + $thick - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 10 $Adb6 [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be - 8]
layer straight $SteelMatTag 10 $Adb6 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 7 $Adb10 [expr $thick/2. - $cover - 1] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $be + 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $be + 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$thick/2. + $cover + 6] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 6] [expr $Lf/2. - $cover - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $cover + 1]
#layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]
#layer straight $SteelMatTag 2 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + 10.] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - 10]
#layer straight $SteelMatTag 2 $Adb8 [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + 10] [expr -$thick/2. + $ce - $cover - 1] [expr -$Lf/2. + $thick - 10]

layer straight $SteelMatTag 4 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 4 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $thick - $cover - 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $thick - $cover - 1]


};

set secWall28_7_flangeE $secTag
incr secTag 1

section Fiber $secWall28_7_flangeE -GJ [expr $GcWall*$JWallflange*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 12 16 [expr -$thick/2. + $cover] [expr -$Lf/2. + $cover] [expr $thick/2. - $cover] [expr -$Lf/2. + $be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$thick/2.] [expr -$Lf/2.] [expr -$thick/2. + $cover] [expr -$Lf/2. + $be]
patch rect $unconfinedConc7 2 8 [expr $thick/2. - $cover] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$thick/2.] [expr -$Lf/2.] [expr $thick/2.] [expr -$Lf/2. + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$thick/2.] [expr -$Lf/2. + $be] [expr $thick/2.] [expr $Lf/2. - $thick]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 12 6 [expr -$thick/2. + $cover] [expr $Lf/2. - $thick] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$thick/2.] [expr $Lf/2. - $cover] [expr -$thick/2. + $ce] [expr $Lf/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 3 [expr $thick/2. - $cover] [expr $Lf/2. - $thick + $cover] [expr $thick/2.] [expr $Lf/2. - $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 10 $Adb6 [expr 2.*$Adb8] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be + 8] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick - 8]
layer straight $SteelMatTag 10 $Adb6 [expr 2.*$Adb8] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be + 8] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick - 8]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 7 $Adb10 [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$Lf/2. + $be - 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $cover + 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $cover + 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$thick/2. + $cover + 6] [expr -$Lf/2. + $be - 1] [expr $thick/2. - $cover - 6] [expr -$Lf/2. + $be - 1]

#Steel rebars in corner elements
#layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $cover - 1]
#layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]
#layer straight $SteelMatTag 2 $Adb8 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - 10.] [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + 10]
#layer straight $SteelMatTag 2 $Adb8 [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - 10] [expr -$thick/2. + $ce - $cover - 1] [expr $Lf/2. - $thick + 10]

layer straight $SteelMatTag 4 $Adb8 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $cover - 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $cover - 1]
layer straight $SteelMatTag 4 $Adb8 [expr -$thick/2. + $cover + 1] [expr $Lf/2. - $thick + $cover + 1] [expr $thick/2. - $cover - 1] [expr $Lf/2. - $thick + $cover + 1]

};

# RIGHT
set secWall28_7_web $secTag
incr secTag 1

section Fiber $secWall28_7_web -GJ [expr $GcWall*$JWallweb*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 - $thick/2. + $ce] [expr -$thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2.]

#Steel rebar in web
layer straight $SteelMatTag 37 $Adb6 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr -$thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr -$thick/2. + $cover + 1]
layer straight $SteelMatTag 37 $Adb6 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $thick/2. - $cover - 1]

#Confined concrete in corner element
patch rect $confinedConcW_7_ce 6 12 [expr -$C_dim1 + $cover] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2. - $cover]
patch rect $confinedConcW_7_ce 6 12 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2. + $cover] [expr $C_dim1 - $cover] [expr $thick/2. - $cover]

#Unconfined concrete in corner element
patch rect $unconfinedConc7 6 2 [expr -$C_dim1] [expr -$thick/2.] [expr -$C_dim1 + $ce - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc7 6 2 [expr -$C_dim1] [expr $thick/2. - $cover] [expr -$C_dim1 + $ce - $thick/2.] [expr $thick/2.]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr -$thick/2.] [expr $C_dim1 - $thick/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 + $thick/2. - $ce] [expr $thick/2. - $cover] [expr $C_dim1 - $thick/2.] [expr $thick/2.]

#Corner element steel
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$thick/2. + $cover] [expr -$C_dim1 -$thick/2. + $cover + 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 + $ce/2. - 1] [expr -$thick/2. + $cover] [expr -$C_dim1 + $ce/2. - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $thick/2. - $cover]
layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 - $ce/2. + 1] [expr -$thick/2. + $cover] [expr $C_dim1 - $ce/2. + 1] [expr $thick/2. - $cover]



};


# COUPLING BEAM SECTIONS --------------------------------------------------------------------------

# ################################################
# COUPLING BEAM 40x36
set CB40x36 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr pow(40*$in,4)*0.141]

section Fiber $CB40x36 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.623*40.*$in*36.*$in] $confinedConcCB40x36

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 8.*$Adb8] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 40x60
set CB40x60 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 60.*$in*pow(40.*$in,3)*0.207]

section Fiber $CB40x60 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.513*40.*$in*60.*$in] $confinedConcCB40x60

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 15.*$Adb11] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 40x42
set CB40x42 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 42.*$in*pow(40.*$in,3)*0.159]

section Fiber $CB40x42 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.746*40.*$in*42.*$in] $confinedConcCB40x42

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb11] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 40x30
set CB40x30 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 36*$in*pow(30*$in,3)*0.141]

section Fiber $CB40x30 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.856*36.*$in*30.*$in] $confinedConcCB40x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb10] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 36x30
set CB36x30 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 36*$in*pow(30*$in,3)*0.141]

section Fiber $CB36x30 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.856*36.*$in*30.*$in] $confinedConcCB36x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 10.*$Adb10] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 36x30_7
set CB36x30_7 $secTag
incr secTag 1

set EcCB	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 36.*$in*pow(30.*$in,3)*0.141]

section Fiber $CB36x30_7 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.856*36.*$in*30.*$in] $confinedConcCB36x30_7

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 10.*$Adb10] $SteelMatTagCB
}

# ################################################
# COUPLING BEAM 32x30
# set CB32x30 $secTag
# incr secTag 1
# 
# set EcCB	$EcWall7;	# Young's Modulus of Concrete
# set nuc 0.2;														# Poisson's Ratio of Concrete
# set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
# set J_CB 	[expr 32*$in*pow(30*$in,3)*0.141]
# 
# section Fiber $CB32x30 -GJ [expr $GcCB*$J_CB*$fGJ] {
# #fiber $yLoc $zLoc $A $matTag
# 
# #Equivalent concrete fiber
# fiber 0 0 [expr 0.856*32.*$in*30.*$in] $confinedConcCB32x30
# 
# #Steel diagonal reinforcement fiber
# fiber 0 0 [expr 8.*$Adb11] $SteelMatTagCB
# }

# ################################################
# COUPLING BEAM 28x30
set CB28x30 $secTag
incr secTag 1

set EcCB	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 30*$in*pow(28*$in,3)*0.141]

section Fiber $CB28x30 -GJ [expr $GcCB*$J_CB*$fGJ] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.856*28.*$in*30.*$in] $confinedConcCB28x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 8.*$Adb9] $SteelMatTagCB
}


# ################################################
# COUPLING BEAM 20x30
# set CB20x30 $secTag
# incr secTag 1
# 
# set EcCB	$EcWall6;	# Young's Modulus of Concrete
# set nuc 0.2;														# Poisson's Ratio of Concrete
# set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
# set J_CB 	[expr 30*$in*pow(20*$in,3)*0.196]
# 
# section Fiber $CB20x30 -GJ [expr $GcCB*$J_CB*$fGJ] {
# #fiber $yLoc $zLoc $A $matTag
# 
# #Equivalent concrete fiber
# fiber 0 0 [expr 0.856*20.*$in*30.*$in] $confinedConcCB20x30
# 
# #Steel diagonal reinforcement fiber
# fiber 0 0 [expr 8.*$Adb10] $SteelMatTagCB
# }

# COLUMN SECTIONS -----------------------------------------------------------------------------
# ################################
set fGJ 0.01
set cover [expr 1.0*$in]

# Col 12x12 6 ksi
set C12_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 12*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C12_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 4 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 4 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 6 6 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 16x16 6 ksi
set C16_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 16*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C16_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 4 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 4 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 7 7 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 20x20 6 ksi
set C20_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 20*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C20_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 6 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 9 9 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] -3. [expr -$dim/2. + 2.] 3.
layer straight $SteelMatTag 2 $Adb7 [expr $dim/2. - 2.] -3. [expr $dim/2. - 2.] 3.

}

# ################################
# Col 24x24 6 ksi
set C24_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 24*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C24_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 11 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 11 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 11 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 11 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 11 11 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 5 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 5 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr -3.5*$in] [expr $dim/2. - 2.] [expr -3.5*$in]
layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr 3.5*$in] [expr $dim/2. - 2.] [expr 3.5*$in]

}

# ################################
# Col 28x28 6 ksi
set C28_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 28*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C28_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 13 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 13 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 13 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 13 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 13 13 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 6 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 6 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -4.*$in] [expr $dim/2. - 2.] [expr -4.*$in]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr 4.*$in] [expr $dim/2. - 2.] [expr 4.*$in]

}

# ################################
# Col 32x32 6 ksi
set C32_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 32*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C32_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 15 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 15 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 15 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 15 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 15 15 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 4 $Adb8 [expr -$dim/2. + 2.] [expr -8.*$in] [expr -$dim/2. + 2.] [expr 8.*$in]
layer straight $SteelMatTag 4 $Adb8 [expr $dim/2. - 2.] [expr -8.*$in] [expr $dim/2. - 2.] [expr 8.*$in]

}

# ################################
# Col 36x36 6 ksi
set C36_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 36*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C36_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 17 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 17 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 17 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 17 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 17 17 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 5 $Adb8 [expr -$dim/2. + 2.] [expr -10.*$in] [expr -$dim/2. + 2.] [expr 10.*$in]
layer straight $SteelMatTag 5 $Adb8 [expr $dim/2. - 2.] [expr -10.*$in] [expr $dim/2. - 2.] [expr 10.*$in]

}

# ################################
# Col 40x40 6 ksi
set C40_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 40*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C40_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 19 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 19 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 19 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 19 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 19 19 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 8 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 8 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr -12.5*$in] [expr -$dim/2. + 2.] [expr 12.5*$in]
layer straight $SteelMatTag 6 $Adb8 [expr $dim/2. - 2.] [expr -12.5*$in] [expr $dim/2. - 2.] [expr 12.5*$in]

}

# ################################
# Col 44x44 6 ksi
set C44_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 44*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C44_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 21 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 21 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 21 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 21 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 21 21 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 9 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 9 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr -15.*$in] [expr -$dim/2. + 2.] [expr 15.*$in]
layer straight $SteelMatTag 7 $Adb8 [expr $dim/2. - 2.] [expr -15.*$in] [expr $dim/2. - 2.] [expr 15.*$in]

}

# RECTANGULAR WALL SECTIONS -------------------------------------------------------------------

#           ___                                       y
#          |   |                                      ^
#          |   |                                      |
#          |   |                                      |
#          |   |        ____________________          |
#          |   |       |                    |         o----->z
#          |   |       |____________________|
#          |   |           
#          |   | 
#          |___|
#      

# ################################################
# WALL SECTION 24 in 7 ksi PODIUMS
set recWall24_7_X $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 312.*$in*pow(24*$in,3)*0.333]

set thick 	[expr 24.*$in]
set length	[expr 312.*$in]
set cover 	[expr 1.*$in]
set be		[expr 6.5*$ft]

section Fiber $recWall24_7_X -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 8 32 [expr -$thick/2. + $cover] [expr -$length/2. + $cover] [expr $thick/2. - $cover] [expr -$length/2. + $be]
patch rect $confinedConcW_7_be 8 32 [expr -$thick/2. + $cover] [expr $length/2. - $be] [expr $thick/2. - $cover] [expr $length/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 1 12 [expr -$thick/2.] [expr -$length/2.] [expr -$thick/2. + $cover] [expr -$length/2. + $be]
patch rect $unconfinedConc7 1 12 [expr $thick/2. - $cover] [expr -$length/2.] [expr $thick/2.] [expr -$length/2. + $be]
patch rect $unconfinedConc7 1 12 [expr -$thick/2.] [expr $length/2. - $be] [expr -$thick/2. + $cover] [expr $length/2.]
patch rect $unconfinedConc7 1 12 [expr $thick/2. - $cover] [expr $length/2. - $be] [expr $thick/2.] [expr $length/2.]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 1 [expr -$thick/2. + $cover] [expr -$length/2.] [expr $thick/2. - $cover] [expr -$length/2. + $cover]
patch rect $unconfinedConc7 6 1 [expr -$thick/2. + $cover] [expr $length/2. - $cover] [expr $thick/2. - $cover] [expr $length/2.]

#Unconfined concrete web
patch rect $unconfinedConc7 4 40 [expr -$thick/2.] [expr -$length/2. + $be] [expr $thick/2.] [expr $length/2. - $be]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in web
layer straight $SteelMatTag 12 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$length/2. + 11] [expr -$thick/2. + $cover + 1] [expr $length/2. - 11]
layer straight $SteelMatTag 12 $Adb8 [expr $thick/2. - $cover - 1] [expr -$length/2. + 11] [expr $thick/2. - $cover - 1] [expr $length/2. - 11]

#Steel rebars in boundary elements
layer straight $SteelMatTag 12 $Adb10 [expr -$thick/2. + $cover + 1] [expr -$length/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 12 $Adb10 [expr $thick/2. - $cover - 1] [expr -$length/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 2 $Adb10 [expr -2.5*$in] [expr -$length/2. + $cover + 1] [expr 2.5*$in] [expr -$length/2. + $cover + 1]
layer straight $SteelMatTag 2 $Adb10 [expr -2.5*$in] [expr -$length/2. + $be - 1] [expr 2.5*$in] [expr -$length/2. + $be - 1]

layer straight $SteelMatTag 12 $Adb10 [expr -$thick/2. + $cover + 1] [expr $length/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $length/2. - $cover - 1]
layer straight $SteelMatTag 12 $Adb10 [expr $thick/2. - $cover - 1] [expr $length/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $length/2. - 1]
layer straight $SteelMatTag 2 $Adb10 [expr -2.5*$in] [expr $length/2. - $be + 1] [expr 2.5*$in] [expr $length/2. - $be + 1]
layer straight $SteelMatTag 2 $Adb10 [expr -2.5*$in] [expr $length/2. - $cover - 1] [expr 2.5*$in] [expr $length/2. - $cover - 1]

};

# WALL SECTION 24 in 7 ksi PODIUMS
set recWall24_7_Y $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 312.*$in*pow(24*$in,3)*0.333]

set thick 	[expr 24.*$in]
set length	[expr 312.*$in]
set cover 	[expr 1.*$in]
set be		[expr 6.5*$ft]

section Fiber $recWall24_7_Y -GJ [expr $GcWall*$JWall*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW_7_be 32 8 [expr -$length/2. + $cover] [expr -$thick/2. + $cover] [expr -$length/2. + $be] [expr $thick/2. - $cover]
patch rect $confinedConcW_7_be 32 8 [expr $length/2. - $be] [expr -$thick/2. + $cover] [expr $length/2. - $cover] [expr $thick/2. - $cover] 

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 12 1 [expr -$length/2.] [expr -$thick/2.] [expr -$length/2. + $be] [expr -$thick/2. + $cover] 
patch rect $unconfinedConc7 12 1 [expr -$length/2.] [expr $thick/2. - $cover] [expr -$length/2. + $be] [expr $thick/2.] 
patch rect $unconfinedConc7 12 1 [expr $length/2. - $be] [expr -$thick/2.] [expr $length/2.] [expr -$thick/2. + $cover]
patch rect $unconfinedConc7 12 1 [expr $length/2. - $be] [expr $thick/2. - $cover] [expr $length/2.] [expr $thick/2.]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 1 6 [expr -$length/2.] [expr -$thick/2. + $cover] [expr -$length/2. + $cover] [expr $thick/2. - $cover] 
patch rect $unconfinedConc7 1 6 [expr $length/2. - $cover] [expr -$thick/2. + $cover] [expr $length/2.] [expr $thick/2. - $cover] 

#Unconfined concrete web
patch rect $unconfinedConc7 40 4 [expr -$length/2. + $be] [expr -$thick/2.] [expr $length/2. - $be] [expr $thick/2.]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in web
layer straight $SteelMatTag 12 $Adb8 [expr -$length/2. + 11] [expr -$thick/2. + $cover + 1] [expr $length/2. - 11] [expr -$thick/2. + $cover + 1]
layer straight $SteelMatTag 12 $Adb8 [expr -$length/2. + 11] [expr $thick/2. - $cover - 1] [expr $length/2. - 11] [expr $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 12 $Adb10 [expr -$length/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$length/2. + $be - 1] [expr -$thick/2. + $cover + 1] 
layer straight $SteelMatTag 12 $Adb10 [expr -$length/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$length/2. + $be - 1] [expr $thick/2. - $cover - 1] 
layer straight $SteelMatTag 2 $Adb10 [expr -$length/2. + $cover + 1] [expr -2.5*$in] [expr -$length/2. + $cover + 1] [expr 2.5*$in]
layer straight $SteelMatTag 2 $Adb10 [expr -$length/2. + $be - 1] [expr -2.5*$in] [expr -$length/2. + $be - 1] [expr 2.5*$in]

layer straight $SteelMatTag 12 $Adb10 [expr $length/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $length/2. - $cover - 1] [expr -$thick/2. + $cover + 1] 
layer straight $SteelMatTag 12 $Adb10 [expr $length/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $length/2. - 1] [expr $thick/2. - $cover - 1] 
layer straight $SteelMatTag 2 $Adb10 [expr $length/2. - $be + 1] [expr -2.5*$in] [expr $length/2. - $be + 1] [expr 2.5*$in] 
layer straight $SteelMatTag 2 $Adb10 [expr $length/2. - $cover - 1] [expr -2.5*$in] [expr $length/2. - $cover - 1] [expr 2.5*$in] 

};

# RIGID LINK SECTION --------------------------------------------------------------------------
set ARigid [expr 1e13];
set JRigid [expr 1e15];
set IyRigid [expr 1e15];
set IzRigid [expr 1e15];