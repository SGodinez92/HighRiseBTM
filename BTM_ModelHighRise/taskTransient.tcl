# load/displacement/transient

set testType1 EnergyIncr
set testType2 EnergyIncr
set testType3 EnergyIncr
set testType4 EnergyIncr
set testType5 NormDispIncr
set testType6 NormDispIncr
set testType7 NormDispIncr
set testType8 NormDispIncr
if {$BTMflag == 0} {
set tol1 1e-7
set tol2 1e-6
set tol3 1e-5
set tol4 1e-4
} else {
set tol1 1e-6
set tol2 1e-5
set tol3 1e-4
set tol4 1e-4
}
set tol5 1e-6
set tol6 1e-5
set tol7 1e-4
set tol8 1e-4
set iterH 150;# 200
set iterM 100;# 100
set iterL 25;# 50
set iterList "$iterH $iterM $iterL"

# run1
set run1_algoType "Newton..."
set run1_test {$testType $tol $iterL 0}
set run1_algorithm {Newton}
# run2
set run2_algoType "Newton Initial..."
set run2_test {$testType $tol $iterH 0}
set run2_algorithm {Newton -initial}
# run3
set run3_algoType "ModifiedNewton Initial..."
set run3_test {$testType $tol $iterH 0}
set run3_algorithm {ModifiedNewton -initial}
# run4
set run4_algoType "ModifiedNewton..."
set run4_test {$testType $tol $iterH 0}
set run4_algorithm {ModifiedNewton}
# run5
set run5_algoType "NewtonWithLineSearch..."
set run5_test {$testType $tol $iterM 0}
set run5_algorithm {NewtonLineSearch -type InitialInterpoled -tol .8 -maxIter 10 -minEta 0.1 -maxEta 10}
# run6
set run6_algoType "BFGS..."
set run6_test {$testType $tol $iterM 0}
set run6_algorithm {BFGS}
# run7
set run7_algoType "Broyden..."
set run7_test {$testType $tol $iterM 0}
set run7_algorithm {Broyden 8}
# run8
set run8_algoType "KrylovNewton..."
set run8_test {$testType $tol $iterM 0}
#set run8_test {$testType $tol $iterH 0}
set run8_algorithm {KrylovNewton}

# testType1 $tol1
set run1a 0
set run2a 0
set run3a 0
set run4a 0
set run5a 0
set run6a 0
set run7a 0
set run8a 1
# testType2 $tol2
set run1b 0
set run2b 0
set run3b 0
set run4b 0
set run5b 0
set run6b 0
set run7b 0
set run8b 1
# testType3 $tol3
set run1c 0
set run2c 0
set run3c 0
set run4c 0
set run5c 0
set run6c 0
set run7c 0
set run8c 0
# testType4 $tol4
set run1d 0
set run2d 0
set run3d 0
set run4d 0
set run5d 0
set run6d 0
set run7d 0
set run8d 0
# testType5 $tol5
set run1e 0
set run2e 0
set run3e 0
set run4e 0
set run5e 0
set run6e 0
set run7e 0
set run8e 0
# testType6 $tol6
set run1f 0
set run2f 0
set run3f 0
set run4f 0
set run5f 0
set run6f 0
set run7f 0
set run8f 0
# testType7 $tol7
set run1g 0
set run2g 0
set run3g 0
set run4g 0
set run5g 0
set run6g 0
set run7g 0
set run8g 0
# testType8 $tol8
set run1h 0
set run2h 0
set run3h 0
set run4h 0
set run5h 0
set run6h 0
set run7h 0
set run8h 0