# load/displacement/transient
set constraintsType Transformation

set numbererType RCM
set systemType SparseSYM
#set systemType ProfileSPD

set testType0 EnergyIncr;# default
set tol0 1e-6;# default
set iter0 35;# default
set algorithmType0 ModifiedNewton;# default, added -initial
set dD 0.01
set testType1 EnergyIncr
set testType2 EnergyIncr
set testType3 EnergyIncr
set testType4 EnergyIncr
set testType5 EnergyIncr
set testType6 EnergyIncr
set tol1 1e-6
set tol2 5e-6
set tol3 1e-5
set tol4 5e-5
set tol5 1e-4
set tol6 5e-4
set iterH 200
set iterM 50
set iterL 25
# testType1 $tol1
set run1a 0;# Newton/iterL
set run2a 0;# Newton Initial/iterH
set run3a 1;# ModifiedNewton Initial/iterH
set run4a 0;# ModifiedNewton/iterH
set run5a 0;# NewtonWithLineSearch/iterM 
set run6a 0;# BFGS/iterM
set run7a 0;# Broyden/iterM
set run8a 0;# KrylovNewton/iterM
# testType2 $tol2
set run1b 0;# Newton/iterL
set run2b 0;# Newton Initial/iterH
set run3b 1;# ModifiedNewton Initial/iterH
set run4b 0;# ModifiedNewton/iterH
set run5b 0;# NewtonWithLineSearch/iterM 
set run6b 0;# BFGS/iterM
set run7b 0;# Broyden/iterM
set run8b 0;# KrylovNewton/iterM
# testType3 $tol3
set run1c 0;# Newton/iterL
set run2c 0;# Newton Initial/iterH
set run3c 1;# ModifiedNewton Initial/iterH
set run4c 0;# ModifiedNewton/iterH
set run5c 0;# NewtonWithLineSearch/iterM 
set run6c 0;# BFGS/iterM
set run7c 0;# Broyden/iterM
set run8c 0;# KrylovNewton/iterM
# testType4 $tol4
set run1d 0;# Newton/iterL
set run2d 0;# Newton Initial/iterH
set run3d 1;# ModifiedNewton Initial/iterH
set run4d 0;# ModifiedNewton/iterH
set run5d 0;# NewtonWithLineSearch/iterM 
set run6d 0;# BFGS/iterM
set run7d 0;# Broyden/iterM
set run8d 0;# KrylovNewton/iterM
# testType5 $tol5
set run1e 0;# Newton/iterL
set run2e 0;# Newton Initial/iterH
set run3e 0;# ModifiedNewton Initial/iterH
set run4e 0;# ModifiedNewton/iterH
set run5e 0;# NewtonWithLineSearch/iterM 
set run6e 0;# BFGS/iterM
set run7e 0;# Broyden/iterM
set run8e 0;# KrylovNewton/iterM
# testType6 $tol6
set run1f 0;# Newton/iterL
set run2f 0;# Newton Initial/iterH
set run3f 0;# ModifiedNewton Initial/iterH
set run4f 0;# ModifiedNewton/iterH
set run5f 0;# NewtonWithLineSearch/iterM 
set run6f 0;# BFGS/iterM
set run7f 0;# Broyden/iterM
set run8f 0;# KrylovNewton/iterM
