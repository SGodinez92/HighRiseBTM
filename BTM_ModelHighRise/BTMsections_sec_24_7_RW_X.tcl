# sections_sec1
if {$dispflag} {puts "\nsections_sec_20_6_RW_X story$story"}; puts $recInput "\nsections_sec_20_6_RW_X story$story"
# definitions
set tWall 24;				#Thickness of the rec wall
set lWall $lCshape;			#Total length of wall in
set cov 1.00;				#Concrete cover
set AbNo4 [areaCirc 0.5];		
set AbNo8 [areaCirc 1.000];
set AbNo10 [areaCirc 1.270];

set prHor 0.00128;	#Shear reinforcement ratio of  wall
set prVer 0.005;	#Longitudinal reinforcement ratio of  wall
set prVerB 0.01175;	#Longitudinal reinforcement ratio of boundary element

set Ec $EcWall6
set secTag 1


# #########################################
#
#                   Y
#                   ^
#                   |
#                   |
#                   |
#        Z<---------|           
#
#
# #########################################



proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ} {
global path
set pathT $path; append pathT BTMprocedures.tcl; source $pathT
set GJ [expr {$fGJ*0.38*$Ec*[Jconst $bSec $hSec]}]
set ySec [expr {$bSec/2.}]
set yCore [expr {($bSec - $cov*2.)/2.}]
set zSec [expr {$hSec/2.}]
set NydivCov 1
set NydivCen 8
set Nzdiv 1
set AeSec [expr {$bSec*$hSec*$prDum/4.}]
#section Fiber $secTag <-GJ $GJ>	
section Fiber $secTag -GJ $GJ {
  #patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ
  patch rect $concCover $NydivCov $Nzdiv [expr $yCore - $eccY] [expr -$zSec - $eccZ] [expr $ySec - $eccY] [expr $zSec - $eccZ];# cover +y
  patch rect $concCore  $NydivCen $Nzdiv [expr -$yCore - $eccY] [expr -$zSec - $eccZ] [expr $yCore - $eccY] [expr $zSec - $eccZ];# core
  patch rect $concCover $NydivCov $Nzdiv [expr -$ySec - $eccY] [expr -$zSec - $eccZ] [expr -$yCore - $eccY] [expr $zSec - $eccZ];# cover -y
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd 
  layer straight $steel $nFiberSteel $AbSec [expr -$yRebar - $eccY] [expr 0 - $eccZ] [expr $yRebar - $eccY] [expr 0 - $eccZ]
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd
  
  layer straight $eMat 2 $AeSec [expr {-$bSec/4. - $eccY}] [expr {-$hSec/4. - $eccZ}] [expr {-$bSec/4. - $eccY}] [expr {$hSec/4. - $eccZ}]
  layer straight $eMat 2 $AeSec [expr { $bSec/4. - $eccY}] [expr {-$hSec/4. - $eccZ}] [expr { $bSec/4. - $eccY}] [expr {$hSec/4. - $eccZ}]
}
};# proc pinSecFiberFreeLocY

proc pinSecFiberFreeLocZ {secTag bSec hSec Ec cov eccY eccZ zRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ} {
global path
set pathT $path; append pathT BTMprocedures.tcl; source $pathT
set GJ [expr {$fGJ*0.38*$Ec*[Jconst $bSec $hSec]}]
set zSec [expr {$bSec/2.}]
set zCore [expr {($bSec - $cov*2.)/2.}]
set ySec [expr {$hSec/2.}]
set NzdivCov 1
set NzdivCen 8
set Nydiv 1
set AeSec [expr {$bSec*$hSec*$prDum/4.}]
#section Fiber $secTag <-GJ $GJ>	
section Fiber $secTag -GJ $GJ {
  #patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ
  patch rect $concCover $Nydiv $NzdivCov [expr -$ySec - $eccY] [expr $zCore - $eccZ] [expr $ySec - $eccY] [expr $zSec - $eccZ]; # cover +z  
  patch rect $concCore  $Nydiv $NzdivCen [expr -$ySec - $eccY] [expr -$zCore - $eccZ] [expr $ySec - $eccY] [expr $zCore - $eccZ];# core    
  patch rect $concCover $Nydiv $NzdivCov [expr -$ySec - $eccY] [expr -$zSec - $eccZ] [expr $ySec - $eccY] [expr -$zCore - $eccZ];# cover -z
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd 
  layer straight $steel $nFiberSteel $AbSec [expr 0 - $eccY] [expr -$zRebar - $eccZ] [expr 0 - $eccY] [expr $zRebar - $eccZ]
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd  
  
  layer straight $eMat 2 $AeSec [expr {-$hSec/4. - $eccY}] [expr {-$bSec/4. - $eccZ}] [expr {-$hSec/4. - $eccY}] [expr {$bSec/4. - $eccZ}]
  layer straight $eMat 2 $AeSec [expr { $hSec/4. - $eccY}] [expr {-$bSec/4. - $eccZ}] [expr { $hSec/4. - $eccY}] [expr {$bSec/4. - $eccZ}]
}
};# proc pinSecFiberFreeLocZ

proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ} {
global path
set pathT $path; append pathT BTMprocedures.tcl; source $pathT
set GJ [expr {$fGJ*0.38*$Ec*[Jconst $bSec $hSec]}]
set ySec [expr {$bSec/2.}]
set yCore [expr {($bSec - $cov*2.)/2.}]
set zSec [expr {$hSec/2.}]
set NydivCov 1
set NydivCen 8
set Nzdiv 10
set AeSec [expr {$bSec*$hSec*$prDum/4.}]
#section Fiber $secTag <-GJ $GJ>	
section Fiber $secTag -GJ $GJ {
  #patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ
  patch rect $concCover $NydivCov $Nzdiv [expr $yCore - $eccY] [expr -$zSec - $eccZ] [expr $ySec - $eccY] [expr $zSec - $eccZ]; # cover +y
  patch rect $concCore  $NydivCen $Nzdiv [expr -$yCore - $eccY] [expr -$zSec - $eccZ] [expr $yCore - $eccY] [expr $zSec - $eccZ]; # core
  patch rect $concCover $NydivCov $Nzdiv [expr -$ySec - $eccY] [expr -$zSec - $eccZ] [expr -$yCore - $eccY] [expr $zSec - $eccZ];# cover -y
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd 
  layer straight $steel $nFiberSteelY $AbSec [expr -$yRebar - $eccY] [expr -$zRebar - $eccZ] [expr $yRebar - $eccY] [expr -$zRebar - $eccZ]
  layer straight $steel $nFiberSteelY $AbSec [expr -$yRebar - $eccY] [expr $zRebar - $eccZ] [expr $yRebar - $eccY] [expr $zRebar - $eccZ]
  set incZ [expr {(2.*$zRebar)/($nFiberSteelZ-1)}]
  for {set zz 1} {$zz <= [expr {$nFiberSteelZ-2}]} {incr zz} {
    set zLayer [expr {-$zRebar + $zz*$incZ}]
	#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd 
    layer straight $steel 2 $AbSec [expr -$yRebar - $eccY] [expr $zLayer - $eccZ] [expr $yRebar - $eccY] [expr $zLayer - $eccZ]   
  }   
  #layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd
  
  layer straight $eMat 2 $AeSec [expr {-$bSec/4. - $eccY}] [expr {-$hSec/4. - $eccZ}] [expr {-$bSec/4. - $eccY}] [expr {$hSec/4. - $eccZ}]
  layer straight $eMat 2 $AeSec [expr { $bSec/4. - $eccY}] [expr {-$hSec/4. - $eccZ}] [expr { $bSec/4. - $eccY}] [expr {$hSec/4. - $eccZ}]
}
};# proc boundSecFiber

# ####### component dirX
puts $recInput "component dirX"

# X-Wall
# component dirX pier corner boundary web (vertical)
# Boundary element in pier west 1
set sec_cxPibwW1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwW1 $sec_cxPibwW1"
set bSec $tWall
set hSec 36.
set AbSec $AbNo8
set eccY 0.
#set eccZ -6.
set eccZ 0.
set yRebar 7.5
set zRebar 15.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwW1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 6 $eMat $fGJ

# component dirX pier corner boundary web (vertical)
# Boundary element in pier west 2
set sec_cxPibwW2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwW2 $sec_cxPibwW2"
set bSec $tWall
set hSec 42.
set AbSec $AbNo8
set eccY 0.
#set eccZ 3.
set eccZ 0.
set yRebar 7.5
set zRebar 19.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwW2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 8 $eMat $fGJ

# component dirX pier adjustment west (vertical)
set sec_cxPiawW [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiawW $sec_cxPiawW"
set bSec $tWall
set hSec 54.
set AbSec [expr {$bSec*$hSec*$prVer/2.}]
set eccY 0.
#set eccZ 3.
set eccZ 0.
set yRebar 7.5
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiawW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ

# component dirX pier field (vertical)
set sec_cxPiaw [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiaw $sec_cxPiaw"
set bSec $tWall
set hSec 48.
set AbSec [expr {$bSec*$hSec*$prVer/2.}]
set eccY 0.
set eccZ 0.
set yRebar 7.5
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiaw $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ

# component dirX pier adjustment east (vertical)
set sec_cxPiawE [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiawE $sec_cxPiawE"
set bSec $tWall
set hSec 54.
set AbSec [expr {$bSec*$hSec*$prVer/2.}]
set eccY 0.
#set eccZ -3.
set eccZ 0.
set yRebar 7.5
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiawE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ

# component dirX pier corner boundary web (vertical)
# Boundary element in pier east 2
set sec_cxPibwE2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwE2 $sec_cxPibwE2"
set bSec $tWall
set hSec 42.
set AbSec $AbNo8
set eccY 0.
#set eccZ -3.
set eccZ 0.
set yRebar 7.5
set zRebar 19.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwE2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 8 $eMat $fGJ

# Boundary element in pier east 1
set sec_cxPibwE1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwE1 $sec_cxPibwE1"
set bSec $tWall
set hSec 36.
set AbSec $AbNo8
set eccY 0.
#set eccZ 6.
set eccZ 0.
set yRebar 7.5
set zRebar 15.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwE1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 6 $eMat $fGJ

# component dirX pier horizontal
set sec_cxPih [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPih $sec_cxPih"
set bSec $tWall
set hSec $incPierZ
set AbSec [expr {$bSec*$hSec*$prHor/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPih $bSec $hSec $Ec $cov 0. 0. 7.5 $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ

# component dirX slab horizontal
set sec_cxSlab [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxSlab $sec_cxSlab"
set bSec $tWall
set hSec $incPierZ
set AbSec [expr {$bSec*$hSec*$prHor/2.}]
set A_string [expr 18.*$AbNo10/2.];	# Add stringer area to the wall at slab level to carry drag forces
set AbSec [expr $AbSec + $A_string]
set AbSec 0.;	# Elastic
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxSlab $bSec $hSec $Ec $cov 0. 0. 7.5 $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ
pinSecFiberFreeLocY $sec_cxSlab $bSec $hSec $Ec $cov 0. 0. 7.5 $AbSec $prDum $eConc $eConc $SteelMatTag 2 $eMat $fGJ

# component dirX diagonals
set beffPier [expr {$incPierZ*$incCshape/$incDpier}]
set areaDiaPier [expr {$beffPier*$tWall}]
puts $recInput "areaDiaPier $areaDiaPier"

# slab beam
set sec_slab [expr {$coreWallTag + $secTag}]
incr secTag 1

set blink [expr 4.*$tWall]
if {$story == 3 || $story == 11} {
	set hlink 12.
} else {	
	set hlink 8.
}

puts $recInput "sec_slab $sec_slab"
set Eslab $Ec
set Gslab [expr {0.38*$Ec}]
set Jslab [expr {0.333*$blink*pow($hlink,3)}]
set Aslab [expr $blink*$hlink*$fStiffA]
set Izslab [expr {$hlink*pow($blink,3)/12.*0.7}]
set Iyslab [expr {$blink*pow($hlink,3)/12.*0.0001}]
#section Elastic $secTag $E $A $Iz $Iy $G $J <$alphaY $alphaZ>
section Elastic $sec_slab $Eslab $Aslab $Izslab $Iyslab $Gslab $Jslab
puts $recInput "section Elastic $sec_slab $Eslab $Aslab $Izslab $Iyslab $Gslab $Jslab"


# list of DBE sections
set secListCx "$sec_cxPibwW1 $sec_cxPibwW2 $sec_cxPiawW $sec_cxPiaw $sec_cxPiawE $sec_cxPibwE2 $sec_cxPibwE1"
#set secListCxHorz "$sec_cxPih $sec_cxSlab"
set secListCxHorz "$sec_cxPih $sec_cxPih"