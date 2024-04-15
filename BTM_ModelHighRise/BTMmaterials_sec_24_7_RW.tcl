# materials_sec1
# Concrete 6 ksi, podiums
if {$dispflag} {puts "\nmaterials_sec_24_6_RW story$story"}; puts $recInput "\nmaterials_sec_24_6_RW story$story"

#set prVer 0.005;	#Longitudinal reinforcement ratio of  wall
#set prVerB 0.01175;	#Longitudinal reinforcement ratio of boundary element

set matTag 1

# auxiliar elastic material 
puts $recInput "auxiliar elastic material" 
set eMat [expr $coreWallTag + $matTag]
incr matTag 1 
set Es [expr 29000.*$ksi]
puts $recInput "eMat $eMat"
puts $recInput "Es $Es"
uniaxialMaterial Elastic $eMat $Es

# stiff elastic material 
puts $recInput "stiff elastic material" 
set sMat [expr {$coreWallTag + $matTag}]
incr matTag 1
set Es [expr {29000.*$fStiff}]
puts $recInput "sMat $sMat"
puts $recInput "Es $Es"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial Elastic $sMat $Es

# stiff elastic no-compression material 
puts $recInput "stiff elastic no-compression material" 
set sEncMat [expr {$coreWallTag + $matTag}]
incr matTag 1
set Es 29000.
puts $recInput "sEncMat $sEncMat"
puts $recInput "Es $Es"
#uniaxialMaterial ElasticBilin $matTag $EP1 $EP2 $epsP2 <$EN1 $EN2 $epsN2>
uniaxialMaterial ElasticBilin $sEncMat $Es 0 0.1 0. 0. -0.1
puts $recInput "uniaxialMaterial ElasticBilin $sEncMat $Es 0 0.1 0. 0. -0.1"

# rebar
# rebar Steel02 parameter values recommended by Carreño et al 2020, except fy (LATBSDC)
puts $recInput "rebar A706 Gr 60" 
set A706_60 [expr {$coreWallTag + $matTag}]
incr matTag 1 
set Fy 69.
set E 29300.
set b 0.012
set R0 20.
set cR1 0.9
set cR2 0.08
set a1 0.039
set a2 1.
set a3 0.029
set a4 1.
set sigInit 0.
puts $recInput "A706_60 $A706_60"
puts $recInput "Fy $Fy"
puts $recInput "E $E"
puts $recInput "b $b"
puts $recInput "R0 $R0"
puts $recInput "cR1 $cR1"
puts $recInput "cR2 $cR2"
puts $recInput "a1 $a1"
puts $recInput "a2 $a2"
puts $recInput "a3 $a3"
puts $recInput "a4 $a4"
puts $recInput "sigInit $sigInit"
#uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 <$a1 $a2 $a3 $a4 $sigInit>
uniaxialMaterial Steel02 $A706_60 $Fy $E $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4 $sigInit
puts $recInput "uniaxialMaterial Steel02 $A706_60 $Fy $E $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4 $sigInit"

# unconfined concrete
# Already defined as unconfinedConc8

set EcWall6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];
#set EcWall6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(6.)*$ksi];

set fc		[expr -7.8*$ksi];										# Unconfined Concrete Strength
set Ec		$EcWall6;												# Young's Modulus of Concrete
set ec		[expr 2.*$fc/$Ec];										# Concrete strength at maximum strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength
set et 		[expr $fr/$Ec]
set etres 	[expr 8.*$fr/$Ec]

puts $recInput "fc $fc"
puts $recInput "Ec $Ec"
puts $recInput "ec $ec"
puts $recInput "fr $fr"
puts $recInput "et $et"
puts $recInput "etres $etres"

# auxiliar elastic concrete 
puts $recInput "auxiliar elastic concrete" 
set eConc [expr {$coreWallTag + $matTag}]
incr matTag 1 
set Ec $EcWall6
puts $recInput "eConc $eConc"
puts $recInput "Ec $Ec"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial Elastic $eConc $Ec
puts $recInput "uniaxialMaterial Elastic $eConc $Ec"

set uconcv_pier [expr {$coreWallTag + $matTag}]
incr matTag 1

puts $recInput "uconcv_pier $uconcv_pier"

# Concrete 02
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incPierZ]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*1.}]
set etR [expr {$et*1.}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incPierZ];	
set ecres [expr $ecres*$fecres]
set fcint [expr ($fc + $fcres)/2.]
set ecint [expr ($ec + $ecres)/2.]
set ftR [expr {$fr*1.}]
set etR [expr {$et*1.}]
set ftresR [expr $ftR*0.01]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}

if {$flagConcwBeta} {
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "alpha $alpha"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $uconcv_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconcv_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconcv_pier $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconcv_pier $fc $ec $fcres $ecres $lambda $ftR $Ets"
}


# ######## unconfined concrete horizontal wallX
puts $recInput "unconfined concrete horizontal wallX"
set uconch_wallX [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconch_wallX $uconch_wallX"

# Concrete 02
set fcres [expr {$fc*$ffcres}]
set ecres [euReg $fc $Ec $ec $incCshape]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incCshape];	
set ecres [expr $ecres*$fecres]
set fcint [expr ($fc + $fcres)/2.]
set ecint [expr ($ec + $ecres)/2.]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set ftresR [expr $ftR*0.01]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}

if {$flagConcwBeta} {
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "alpha $alpha"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $uconch_wallX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconch_wallX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconch_wallX $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconch_wallX $fc $ec $fcres $ecres $lambda $ftR $Ets"

}

# biaxial concrete diagonals
puts $recInput "biaxial concrete diagonals pierX"
set bconcd_pierX [expr $coreWallTag + $matTag]
incr matTag 1

set fcresD [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDpier];
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcresD)/2.}]
set ecint [expr {(-$ec + $ecres)/2.}]
set ftRD [expr {$fr*$fftRD}]
set etRD [expr $ftRD/$Ec]
set ftresR [expr $fr*0.]
set etresR [expr 8.*$ftR/$Ec];
set ftint [expr {($ftRD + $ftresR)/2.}]
set etint [expr {($etRD + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftRD)}]} else {set alpha 1.}
set eb [BetaReg $incDpier];			# Check literature
#set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
#set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
set beta_bint 0.4;
set beta_bres 0.1;

puts $recInput "bconcd_pierX $bconcd_pierX"
puts $recInput "fcres $fcresD"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftRD"
puts $recInput "etR $etRD"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_pierX $fc $ec $fcint $ecint $fcresD $ecres $ftRD $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_pierX $fc $ec $fcint $ecint $fcresD $ecres $ftRD $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# Wall 24 6 ksi boundary element

# confined concrete boundary
set fcc -10.43;# <--
set ecc -0.0068;# <--
set ecs -0.0100;# <--

# confined concrete vertical pier boundary
puts $recInput "confined concrete vertical pier boundary"
set cconcb_pier [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "cconcb_pier $cconcb_pier"


if {$flagConcwBeta} {
# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPierZ $ecc]	
set ecres [expr $ecres*$fecres]
set fcint $fcc
set ecint $ecs
set ftR [expr {$fr*1.0}]
set etR [expr {$et*1.0}]
set ftresR [expr $ftR*0.01]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}

puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "alpha $alpha"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $cconcb_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc
puts $recInput "uniaxialMaterial ConcretewBeta $cconcb_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc"

} else {
# Concrete02
set fcres [expr {$fcc*$ffcres}]
set ecc [expr 2.*$fcc/$Ec]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPierZ $ecc]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*1.}]
set etR [expr {$et*1.}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $cconcb_pier $fcc $ecc $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $cconcb_pier $fcc $ecc $fcres $ecres $lambda $ftR $Ets"

}

set SteelMatTag $A706_60

# confined concrete base effect (NOT CONSIDERED)