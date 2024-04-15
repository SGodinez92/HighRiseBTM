# materials_sec1
# Concrete 8 ksi, 3 basements
if {$dispflag} {puts "\nmaterials_sec_36_8 story$story"}; puts $recInput "\nmaterials_sec_36_8 story$story"

set prVerW 0.01412;	#Longitudinal reinforcement ratio of Web
set prVerF 0.01295;	#Longitudinal reinforcement ratio of flange
set prVerC 0.01466;	#Longitudinal reinforcement ratio of corner element
set prVerB 0.0253;	#Longitudinal reinforcement ratio of boundary element
set prCB 0.0029;	#Longitudinal reinforcement ratio of CB

set matTag 1

# auxiliar elastic material 
puts $recInput "auxiliar elastic material" 
set eMat [expr {$coreWallTag + $matTag}]
incr matTag 1 
set Es 29000.
puts $recInput "eMat $eMat"
puts $recInput "Es $Es"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial Elastic $eMat $Es
puts $recInput "uniaxialMaterial Elastic $eMat $Es"

# stiff elastic material 
puts $recInput "stiff elastic material" 
set sMat [expr {$coreWallTag + $matTag}]
incr matTag 1
set Es [expr {29000.*$fStiff}]
puts $recInput "sMat $sMat"
puts $recInput "Es $Es"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial Elastic $sMat $Es
puts $recInput "uniaxialMaterial Elastic $sMat $Es"

# stiff elastic no-tension material 
puts $recInput "stiff elastic material" 
set sEntMat [expr {$coreWallTag + $matTag}]
incr matTag 1
set Es [expr {29000.*$fStiff}]
puts $recInput "sEntMat $sEntMat"
puts $recInput "Es $Es"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial ENT $sEntMat $Es
puts $recInput "uniaxialMaterial ENT $sEntMat $Es"

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

# rebar Steel02 parameter values recommended by Carreño et al 2020, except fy (LATBSDC)
puts $recInput "rebar A706 Gr 80" 
set A706_80 [expr {$coreWallTag + $matTag}]
incr matTag 1 
set Fy 85.
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
puts $recInput "A706_80 $A706_80"
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
uniaxialMaterial Steel02 $A706_80 $Fy $E $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4 $sigInit
puts $recInput "uniaxialMaterial Steel02 $A706_80 $Fy $E $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4 $sigInit"

# unconfined concrete
puts $recInput "unconfined concrete"
set fc -10.4;			#1.3f'ce (f'ce specified from ETABS)
#set fc -8.;			#1.3f'ce (f'ce specified from ETABS)
set Eco [expr 33000.*pow(0.140 + abs($fc)/1000.,1.5)*pow(abs($fc),0.5)];	#Tadros et al 2003 K1=K2=1.0
set Ec $Eco
set ec [expr 2.*$fc/$Ec]
set fr [expr {5.7*sqrt(10400.)*$psi}];	#Zheng et al 2001
set et [expr {$fr/$Ec}]
set etres [expr {8.*$fr/$Ec}]
puts $recInput "fc $fc"
puts $recInput "ec $ec"
puts $recInput "Ec $Ec"
puts $recInput "fr $fr"
puts $recInput "et $et"
puts $recInput "etres $etres"

# auxiliar elastic concrete 
puts $recInput "auxiliar elastic concrete" 
set eConc [expr {$coreWallTag + $matTag}]
incr matTag 1 
set Ec $Eco
puts $recInput "eConc $eConc"
puts $recInput "Ec $Ec"
#uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg> 
uniaxialMaterial Elastic $eConc $Ec
puts $recInput "uniaxialMaterial Elastic $eConc $Ec"

# ######## unconfined concrete vertical pier
puts $recInput "unconfined concrete vertical pier"
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

# ######## unconfined concrete vertical panel Concrete02
puts $recInput "unconfined concrete vertical panel"
set uconcv_panel [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconcv_panel $uconcv_panel"

# Concrete 02
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incPanelZ]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*1.}]
set etR [expr {$et*1.}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incPanelZ];	
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
uniaxialMaterial ConcretewBeta $uconcv_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconcv_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconcv_panel $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconcv_panel $fc $ec $fcres $ecres $lambda $ftR $Ets"

}

# ######## unconfined concrete vertical CB
puts $recInput "unconfined concrete vertical CB"
set uconcv_CB [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconcv_CB $uconcv_CB"

# Concrete02
set fcres [expr {$fc*$ffcres}]
set ecres [euReg $fc $Ec $ec $incVCB]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incVCB];	
set ecres [expr $ecres*$fecres]
set fcint [expr ($fc + $fcres)/2.]
set ecint [expr ($ec + $ecres)/2.]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set ftresR 0.
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
uniaxialMaterial ConcretewBeta $uconcv_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconcv_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconcv_CB $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconcv_CB $fc $ec $fcres $ecres $lambda $ftR $Ets"
}

# ######## unconfined concrete horizontal wallX
puts $recInput "unconfined concrete horizontal wallX"
set uconch_wallX [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconch_wallX $uconch_wallX"

# Concrete 02
set fcres [expr {$fc*$ffcres}]
set ecres [euReg $fc $Ec $ec $incCshapeX]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incCshapeX];	
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

# unconfined concrete horizontal wallY
puts $recInput "unconfined concrete horizontal wallY"
set uconch_wallY [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconch_wallY $uconch_wallY"

# Concrete02
set fcres [expr {$fc*$ffcres}]
set ecres [euReg $fc $Ec $ec $incCshapeY]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*$fftR}]
set etR [expr {$et*$fftR}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incCshapeY];	
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
uniaxialMaterial ConcretewBeta $uconch_wallY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconch_wallY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconch_wallY $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconch_wallY $fc $ec $fcres $ecres $lambda $ftR $Ets"

}

# unconfined concrete horizontal CB
puts $recInput "unconfined concrete horizontal CB"
set uconch_CB [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "uconch_CB $uconch_CB"

# Concrete02
set fcres [expr {$fc*$ffcres}]
set ecres [euReg $fc $Ec $ec $incHCB]
set ecres [expr $ecres*$fecres]
set ftR [expr {$fr*1.}]
set etR [expr {$et*1.}]
set lambda [expr 0.25*$flambda]
set Ets [expr $fEts*$Ec]

# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [ecuRegGf $fc $Ec $ec $incHCB];	
set ecres [expr $ecres*$fecres]
set fcint [expr ($fc + $fcres)/2.]
set ecint [expr ($ec + $ecres)/2.]
set ftR [expr {$fr*1.0}]
set etR [expr {$et*1.0}]
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
uniaxialMaterial ConcretewBeta $uconch_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha
puts $recInput "uniaxialMaterial ConcretewBeta $uconch_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha"

} else {

puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "Ets $Ets"
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
uniaxialMaterial Concrete02 $uconch_CB $fc $ec $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $uconch_CB $fc $ec $fcres $ecres $lambda $ftR $Ets"

}

# biaxial concrete diagonals pierX
puts $recInput "biaxial concrete diagonals pierX"
set bconcd_pierX [expr {$coreWallTag + $matTag}]
incr matTag 1
set fcres [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDpierX];
#set ecres [euRegGf_D $fc $Ec $ec $fc $incDpierX $ec]
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcres)/2.}]
set ecint [expr {($ec + $ecres)/2.}]
set ftR [expr {$fr*$fftRD}]
set etR [expr {$et*$fftRD}]
set ftresR [expr {$fr*0.}]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}
set eb [BetaReg $incDpierX]
set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
puts $recInput "bconcd_pierX $bconcd_pierX"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_pierX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_pierX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# biaxial concrete diagonals pierY
puts $recInput "biaxial concrete diagonals pierY"
set bconcd_pierY [expr {$coreWallTag + $matTag}]
incr matTag 1
set fcres [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDpierY]
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcres)/2.}]
set ecint [expr {($ec + $ecres)/2.}]
set ftR [expr {$fr*$fftRD}]
set etR [expr {$et*$fftRD}]
set ftresR [expr {$fr*0.}]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}
set eb [BetaReg $incDpierY]
set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
puts $recInput "bconcd_pierY $bconcd_pierY"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_pierY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_pierY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# biaxial concrete diagonals panelX
puts $recInput "biaxial concrete diagonals panelX"
set bconcd_panelX [expr {$coreWallTag + $matTag}]
incr matTag 1
set fcres [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDpanelX]
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcres)/2.}]
set ecint [expr {($ec + $ecres)/2.}]
set ftR [expr {$fr*$fftRD}]
set etR [expr {$et*$fftRD}]
set ftresR [expr {$fr*0.}]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}
set eb [BetaReg $incDpanelX]
set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
puts $recInput "bconcd_panelX $bconcd_panelX"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_panelX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_panelX $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# biaxial concrete diagonals panelY
puts $recInput "biaxial concrete diagonals panelY"
set bconcd_panelY [expr {$coreWallTag + $matTag}]
incr matTag 1
set fcres [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDpanelY]
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcres)/2.}]
set ecint [expr {($ec + $ecres)/2.}]
set ftR [expr {$fr*$fftRD}]
set etR [expr {$et*$fftRD}]
set ftresR [expr {$fr*0.}]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}
set eb [BetaReg $incDpanelY]
set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
puts $recInput "bconcd_panelY $bconcd_panelY"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_panelY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_panelY $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# biaxial concrete diagonals CB
puts $recInput "biaxial concrete diagonals CB"
set bconcd_CB [expr {$coreWallTag + $matTag}]
incr matTag 1
set fcres [expr {$fc*$ffcresD}]
set ecres [ecuRegGf $fc $Ec $ec $incDCB]
set ecres [expr $ecres*$fecresD]
set fcint [expr {($fc + $fcres)/2.}]
set ecint [expr {($ec + $ecres)/2.}]
set ftR [expr {$fr*$fftRD}]
#if {$story < 4} {
#	set ftR [expr 344.3*$psi]
#} else {
#	set ftR [expr 486.6*$psi]
#}
set etR [expr {$ftR/$Ec}]
set ftresR [expr {$fr*0.}]
set etresR [expr 8.*$ftR/$Ec]
set ftint [expr {($ftR + $ftresR)/2.}]
set etint [expr {($etR + $etresR)/2.}]
if {$ftR > 0.} {set alpha [expr {abs($falpha*$fc/$ftR)}]} else {set alpha 1.}
set eb [BetaReg $incDCB]
set beta_bint [expr $beta_F1int*[BetaF2 $fc]]
set beta_bres [expr $beta_F1res*[BetaF2 $fc]]
puts $recInput "bconcd_CB $bconcd_CB"
puts $recInput "fcres $fcres"
puts $recInput "ecres $ecres"
puts $recInput "fcint $fcint"
puts $recInput "ecint $ecint"
puts $recInput "ftR $ftR"
puts $recInput "etR $etR"
puts $recInput "ftresR $ftresR"
puts $recInput "etresR $etresR"
puts $recInput "ftint $ftint"
puts $recInput "etint $etint"
puts $recInput "alpha $alpha"
puts $recInput "eb $eb"
#uniaxialMaterial ConcretewBeta $matTag $fpc $ec0 $fcint $ecint $fcres $ecres $ft $ftint $etint $ftres $etres <-lambda $lambda> <-alpha $alpha> <-beta $bint $ebint $bres $ebres> <-M $M> <-E $Ec> <-conf $fcc $ecc>
uniaxialMaterial ConcretewBeta $bconcd_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec
puts $recInput "uniaxialMaterial ConcretewBeta $bconcd_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -beta $beta_bint [lindex $eb 0] $beta_bres [lindex $eb 1] -E $Ec"

# confined concrete CB
set fcc -14.32;# <--
set ecc -0.0068;# <--
set ecs -0.0115;# <--

# confined concrete horizontal CB
puts $recInput "confined concrete horizontal CB"
set cconch_CB [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "cconch_CB $cconch_CB"

if {$flagConcwBeta} {
# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incHCB $ecc]	
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
uniaxialMaterial ConcretewBeta $cconch_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc
puts $recInput "uniaxialMaterial ConcretewBeta $cconch_CB $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc"

} else {
# Concrete 02
set ecc [expr 2.*$fcc/$Ec]
set fcres [expr {$fcc*$ffcres}]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incHCB $ecc]
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
uniaxialMaterial Concrete02 $cconch_CB $fcc $ecc $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $cconch_CB $fcc $ecc $fcres $ecres $lambda $ftR $Ets"

}


# confined concrete boundary
set fcc -13.72;# <--
set ecc -0.0062;# <--
set ecs -0.0099;# <--

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

# confined concrete vertical panel boundary
puts $recInput "confined concrete vertical panel boundary"
set cconcb_panel [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "cconcb_panel $cconcb_panel"

if {$flagConcwBeta} {
# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPanelZ $ecc]	
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
uniaxialMaterial ConcretewBeta $cconcb_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc
puts $recInput "uniaxialMaterial ConcretewBeta $cconcb_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc"

} else {

# Concrete02
set fcres [expr {$fcc*$ffcres}]
set ecc [expr 2*$fcc/$Ec]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPanelZ $ecc]	
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
uniaxialMaterial Concrete02 $cconcb_panel $fcc $ecc $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $cconcb_panel $fcc $ecc $fcres $ecres $lambda $ftR $Ets"

}

# confined concrete corner
set fcc -12.21;# <--
set ecc -0.0049;# <--
set ecs -0.0065;# <--

# confined concrete vertical pier corner
puts $recInput "confined concrete vertical pier corner"
set cconcc_pier [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "cconcc_pier $cconcc_pier"

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
uniaxialMaterial ConcretewBeta $cconcc_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc
puts $recInput "uniaxialMaterial ConcretewBeta $cconcc_pier $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc"

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
uniaxialMaterial Concrete02 $cconcc_pier $fcc $ecc $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $cconcc_pier $fcc $ecc $fcres $ecres $lambda $ftR $Ets"

}

# confined concrete vertical panel corner
puts $recInput "confined concrete vertical panel corner"
set cconcc_panel [expr {$coreWallTag + $matTag}]
incr matTag 1
puts $recInput "cconcc_panel $cconcc_panel"

if {$flagConcwBeta} {
# ConcretewBeta
set fcres [expr {$fc*$ffcres}]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPanelZ $ecc]	
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
uniaxialMaterial ConcretewBeta $cconcc_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc
puts $recInput "uniaxialMaterial ConcretewBeta $cconcc_panel $fc $ec $fcint $ecint $fcres $ecres $ftR $ftint $etint $ftresR $etresR -alpha $alpha -conf $fcc $ecc"

} else {

# Concrete02
set fcres [expr {$fcc*$ffcres}]
set ecc [expr 2.*$fcc/$Ec]
set ecres [eccuRegGf $fc $Ec $ecs $fcc $incPanelZ $ecc]	
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
uniaxialMaterial Concrete02 $cconcc_panel $fcc $ecc $fcres $ecres $lambda $ftR $Ets
puts $recInput "uniaxialMaterial Concrete02 $cconcc_panel $fcc $ecc $fcres $ecres $lambda $ftR $Ets"

}

# confined concrete vertical pier flange
set cconcf_pier $uconcv_pier

# confined concrete vertical panel flange
set cconcf_panel $uconcv_panel

# confined concrete vertical pier web
set cconcw_pier $uconcv_pier

# confined concrete vertical panel web
set cconcw_panel $uconcv_panel

set SteelMatTag $A706_60
set SteelMatTagCB $A706_80