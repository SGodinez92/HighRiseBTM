# procedures

# calculate regularized strain at crushing strength eu
proc euReg {fc Ec ec Le} {
set A [expr {$fc/(0.5*($Ec*$ec + $fc))}]
set Lr [expr 600./25.4]
set eu1 [expr {(1-$A)*$ec + $Lr/$Le*(-0.002 + $A*$ec)}]
set eu [expr {min($ec-0.002,$eu1)}]
return $eu
}

#regularized strain diagonal elements
proc euRegD {fc Ec ec Le} {
set A [expr {$fc/(0.5*($Ec*$ec + $fc))}]
set Lr [expr 850./25.4]
set eu1 [expr {(1-$A)*$ec + $Lr/$Le*(-0.002 + $A*$ec)}]
set eu [expr {min($ec-0.002,$eu1)}]
return $eu
}

proc ecuRegGf {fc Ec ec Le} {
# Input units consider kips, in as basic units
set ksi 6.89476
set in 25.4
set fc [expr {abs($fc)*$ksi}];# MPa
set Ec [expr {$Ec*$ksi}];# MPa
set Le [expr {$Le*$in}];# mm 
set ec [expr {abs($ec)}]
set Gf 87.6;# N/mm
set eu [expr {max($Gf/(0.6*$fc*$Le) - 0.8*$fc/$Ec + $ec, 3*$ec)}];# Coleman and Spacone 2001, minimum 3ec to avoid steep branch Arteta 2021
return -$eu
}

proc eccuRegGf {fc Ec ecs fcc Le ecc} {
set ksi 6.89476
set in 25.4
set fc [expr {abs($fc)*$ksi}];# MPa
set Ec [expr {$Ec*$ksi}];# MPa
set ecs [expr {abs($ecs)}]
set fcc [expr {abs($fcc)*$ksi}];# MPa
set Le [expr {$Le*$in}];# mm 
set ecc [expr {abs($ecc)}]
set Gf [expr {min(max(87.6, 437.8*($fcc/$fc - 0.85)), 218.9)}];# N/mm
set eu [expr {max($Gf/(0.6*$fcc*$Le) - 0.8*$fcc/$Ec + $ecs, $ecs + 2*$ecc)}];# <-- 1*$ecc-3*$ecc
return -$eu
}

proc ecuRegGf_D {fc Ec ecs fcc Le ecc} {
set ksi 6.89476
set in 25.4
set fc [expr {abs($fc)*$ksi}];# MPa
set Ec [expr {$Ec*$ksi}];# MPa
set ecs [expr {abs($ecs)}]
set fcc [expr {abs($fcc)*$ksi}];# MPa
set Le [expr {$Le*$in}];# mm 
set ecc [expr {abs($ecc)}]
set Gf [expr {min(max(87.6, 437.8*($fcc/$fc - 0.85)), 218.9)}];# N/mm
set eu [expr {max($Gf/(0.6*$fcc*$Le) - 0.8*$fcc/$Ec + $ecs, $ecs + 6*$ecc)}];# <-- 1*$ecc-3*$ecc
return -$eu
}

# calculates regularized residual strain tension softening etres (ConcretewBeta) 
proc etresReg {etres Lr Le} { 
#set etres_reg [expr {max($etres,$Lr/($Le*1.0)*$etres)}]
set etres_reg $etres;# eliminate regularization 
return $etres_reg
}

# calculates regularized factor for biaxial effect Beta (ConcretewBeta)
proc BetaReg {Le} {
set Lr [expr {1494/25.4}];# in
set ebint [expr {max(0.01,$Lr/$Le*0.01)}]
set ebres [expr {max(0.035,$Lr/$Le*0.035)}] 
return [list $ebint $ebres]
}

# calculates factor F2 of Hsu and Mo (2010), Beta = F1*F2
proc BetaF2 {fc} {
  set fc [expr {$fc*6.89476}];# MPa
  #set F2 [expr {min(5.8/sqrt(abs($fc)),1.)}]
  set F2 1.;# eliminate F2 
return $F2
}

# calculates polar moment of inertia J for rectangular section
proc Jconst {d1 d2} {
if {$d1 >= $d2} {
  set a $d1
  set b $d2
} else {
  set a $d2
  set b $d1
}
return [expr {$a*pow($b,3.)*(1/3.-0.21*$b/$a*(1.-pow($b,4.)/12./pow($a,4.)))}]
}

# calculates area of circle
proc areaCirc {d} {
set pi [expr {2*asin(1.0)}]
return [expr {$pi*($d/2.)**2}] 
}