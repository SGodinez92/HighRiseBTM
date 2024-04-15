# sections_sec1
if {$dispflag} {puts "\nsections_sec_36_8 story$story"}; puts $recInput "\nsections_sec_36_8 story$story"
# definitions
set tWall 36;								#Thickness of the core wall
set hBE 48.;								#Length of boundary element (the distance that is not the thickness)
set bCE 48.;								#Length of corner element (the distance that is not the thickness)
set lWallX [expr {$lCshapeX + $tWall/2. + ($sCshape - $lCB)/2.}];		#Total length of wall in X direction
set lWallY [expr {$lCshapeY + $tWall}];		#Total length of wall in Y direction
set hBeam 36;								#Height of CB
set cov 1.00;								#Concrete cover
set AbNo4 [areaCirc 0.5];		
set AbNo5 [areaCirc 0.625];
set AbNo8 [areaCirc 1.000];
set AbNo9 [areaCirc 1.128];
set AbNo10 [areaCirc 1.270];
set AbNo11 [areaCirc 1.410];
set prVerW 0.01412;	#Longitudinal reinforcement ratio of Web
set prVerF 0.01295;	#Longitudinal reinforcement ratio of flange
set prVerC 0.01466;	#Longitudinal reinforcement ratio of corner element
set prVerB 0.0253;	#Longitudinal reinforcement ratio of boundary element
set prHorX 0.0098;	#Horizontal reinforcement ratio
set prHorY 0.0098;	#Horizontal reinforcement ratio
set prCB 0.0029;	#Longitudinal reinforcement ratio of CB

#set Ec $EcWall8
set secTag 1

puts $recInput "pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}"
puts $recInput "pinSecFiberFreeLocZ {secTag bSec hSec Ec cov eccY eccZ zRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}"
puts $recInput "boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}"

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
  layer straight $steel $nFiberSteel $AbSec [expr -$yRebar - $eccY] [expr 0 - $eccZ] [expr $yRebar - $eccY] [expr 0 -$eccZ]
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

# component dirX pier corner boundary web 1 (vertical)
# Corner element in pier south
set sec_cxPibwS [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwS $sec_cxPibwS"
set bSec 28.25
set hSec $tWall
set AbSec $AbNo10
#set eccY 3.75
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 4 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 4 5 $eMat $fGJ"

# component dirX pier corner boundary web 1 (vertical)
# Corner element in pier north
set sec_cxPibwN [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibwN $sec_cxPibwN"
set bSec 28.25
set hSec $tWall
set AbSec $AbNo10
#set eccY -3.75
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibwN $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 4 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibwN $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 4 5 $eMat $fGJ"

# component dirX panel corner boundary web (vertical)
# Corner element in panel south
set sec_cxPabwS [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabwS $sec_cxPabwS"
set bSec 28.25
set hSec $tWall
set AbSec $AbNo10
#set eccY 3.75
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 4 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 4 5 $eMat $fGJ"

# component dirX panel corner boundary web (vertical)
# Corner element in panel north
set sec_cxPabwN [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabwN $sec_cxPabwN"
set bSec 28.25
set hSec $tWall
set AbSec $AbNo10
#set eccY -3.75
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabwN $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 4 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabwN $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 4 5 $eMat $fGJ"

# component dirX pier boundary flange (vertical), flange boundary extreme element
# Boundary element in pier west 1
set sec_cxPibfW1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibfW1 $sec_cxPibfW1"
set bSec $tWall
set hSec 23.5
set AbSec $AbNo11
set eccY 0.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibfW1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 7 4 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibfW1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 7 4 $eMat $fGJ"

# component dirX pier boundary flange (vertical), flange boundary extreme element
# Boundary element in pier east 1
set sec_cxPibfE1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibfE1 $sec_cxPibfE1"
set bSec $tWall
set hSec 23.5
set AbSec $AbNo11
set eccY 0.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibfE1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 7 4 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibfE1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 7 4 $eMat $fGJ"

# component dirX panel boundary flange (vertical), flange boundary extreme element
# Boundary element in panel west 1 
set sec_cxPabfW1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabfW1 $sec_cxPabfW1"
set bSec $tWall
set hSec 23.5
set AbSec $AbNo11
set eccY 0.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabfW1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 7 4 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabfW1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 7 4 $eMat $fGJ"

# component dirX panel boundary flange (vertical), flange boundary extreme element
# Boundary element in panel east 1
set sec_cxPabfE1 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabfE1 $sec_cxPabfE1"
set bSec $tWall
set hSec 23.5
set AbSec $AbNo11
set eccY 0.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabfE1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 7 4 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabfE1 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 7 4 $eMat $fGJ"

# component dirX pier boundary flange (vertical), flange boundary second element
# Boundary element in pier west 2
set sec_cxPibfW2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibfW2 $sec_cxPibfW2"
set bSec $tWall
set hSec 24.5
set AbSec $AbNo11
set eccY 0.
#set eccZ 1.
set eccZ 0.
set yRebar 16.0
set zRebar 11.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibfW2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibfW2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 5 $eMat $fGJ"

# component dirX pier boundary flange (vertical), flange boundary second element
# Boundary element in pier east 1
set sec_cxPibfE2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPibfE2 $sec_cxPibfE2"
set bSec $tWall
set hSec 24.5
set AbSec $AbNo11
set eccY 0.
#set eccZ -1.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPibfE2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPibfE2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcb_pier $SteelMatTag 2 5 $eMat $fGJ"

# component dirX panel boundary flange (vertical), flange boundary second element
# Boundary element in panel west 1
set sec_cxPabfW2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabfW2 $sec_cxPabfW2"
set bSec $tWall
set hSec 24.5
set AbSec $AbNo11
set eccY 0.
#set eccZ 1.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabfW2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 2 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabfW2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 2 5 $eMat $fGJ"

# component dirX panel boundary flange (vertical), flange boundary second element
# Boundary element in panel east
set sec_cxPabfE2 [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPabfE2 $sec_cxPabfE2"
set bSec $tWall
set hSec 24.5
set AbSec $AbNo11
set eccY 0.
#set eccZ -1.
set eccZ 0.
set yRebar 16.0
set zRebar 10.0
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cxPabfE2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 2 5 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cxPabfE2 $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcb_panel $SteelMatTag 2 5 $eMat $fGJ"

# component dirX pier adjustment web (vertical) west
set sec_cxPiawW [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiawW $sec_cxPiawW"
set bSec $tWall
set hSec 16.25
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ -3.3125
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiawW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPiawW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirX pier adjustment web (vertical) east
set sec_cxPiawE [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiawE $sec_cxPiawE"
set bSec $tWall
set hSec 16.25
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ 3.3125
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiawE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPiawE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirX panel adjustment web (vertical) west
set sec_cxPaawW [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaawW $sec_cxPaawW"
set bSec $tWall
set hSec 16.25
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ -3.3125
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPaawW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPaawW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"

# component dirX panel adjustment web (vertical) east
set sec_cxPaawE [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaawE $sec_cxPaawE"
set bSec $tWall
set hSec 16.25
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ 3.3125
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPaawE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPaawE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"

# component dirX pier adjustment flange (vertical) west
set sec_cxPiafW [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiafW $sec_cxPiafW"
set bSec $tWall
set hSec 21.
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ 1.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPiafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirX pier adjustment flange (vertical) east
set sec_cxPiafE [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiafE $sec_cxPiafE"
set bSec $tWall
set hSec 21.
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ -1.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxPiafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
pinSecFiberFreeLocY $sec_cxPiafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPiafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirX panel adjustment flange (vertical) west
set sec_cxPaafW [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaafW $sec_cxPaafW"
set bSec $tWall
set hSec 21.
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ 1.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxPaafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
pinSecFiberFreeLocY $sec_cxPaafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPaafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"

# component dirX panel adjustment flange (vertical) east
set sec_cxPaafE [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaafE $sec_cxPaafE"
set bSec $tWall
set hSec 21.
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
#set eccZ -1.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxPaafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
pinSecFiberFreeLocY $sec_cxPaafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPaafE $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"

# component dirX pier vertical (field)
set sec_cxPiaField [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPiaField $sec_cxPiaField"
set bSec $tWall
set hSec $incCshapeX
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPiaField $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPiaField $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirX panel adjustment flange (vertical) west
set sec_cxPaaField [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaaField $sec_cxPaaField"
set bSec $tWall
set hSec $incCshapeX
set AbSec [expr {$bSec*$hSec*$prVerF/2.}]
set eccY 0.
set eccZ 0.
set yRebar 16.
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxPaafW $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
pinSecFiberFreeLocY $sec_cxPaaField $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPaaField $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"

# component dirX pier horizontal
set sec_cxPih [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPih $sec_cxPih"
set bSec $tWall
set hSec $incPierZ
set AbSec [expr {$bSec*$hSec*$prHorX/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPih $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPih $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ"

# component dirX pier-panel horizontal
set sec_cxPPh [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPPh $sec_cxPPh"
set bSec $tWall
set hSec [expr {$incPierZ/2. + $incPanelZ/2.}]
set AbSec [expr {$bSec*$hSec*$prHorX/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPPh $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPPh $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ"

# component dirX panel horizontal
set sec_cxPah [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPah $sec_cxPah"
set bSec $tWall
set hSec $incPanelZ
set AbSec [expr {$bSec*$hSec*$prHorX/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cxPah $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cxPah $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ"

# component dirX panel-slab horizontal
set sec_cxPaSlab [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cxPaSlab $sec_cxPaSlab"
set bSec $tWall
set hSec [expr {$incPierZ/2. + $incPanelZ/2.}]
set AbSec [expr {$bSec*$hSec*$prHorX/2.}]
set A_string [expr 18.*$AbNo10/2.];	# Add stringer area to the wall at slab level to carry drag forces
set AbSec [expr $AbSec + $A_string]
set AbSec 0.;	# Elastic section at slab intersection
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cxPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ;		#Inelastic
#puts $recInput "pinSecFiberFreeLocY $sec_cxPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallX $uconch_wallX $SteelMatTag 2 $eMat $fGJ"
pinSecFiberFreeLocY $sec_cxPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $eConc $eConc $SteelMatTag 2 $eMat $fGJ;						#Elastic
puts $recInput "pinSecFiberFreeLocY $sec_cxPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $eConc $eConc $SteelMatTag 2 $eMat $fGJ"

# component dirX diagonals
set beffPierX [expr {$incPierZ*$incCshapeX/$incDpierX}]
set areaDiaPierX [expr {$beffPierX*$tWall}]
puts $recInput "areaDiaPierX $areaDiaPierX"
set beffPanelX [expr {$incPanelZ*$incCshapeX/$incDpanelX}]
set areaDiaPanelX [expr {$beffPanelX*$tWall}]
puts $recInput "areaDiaPanelX $areaDiaPanelX"


# ####### component dirY
puts $recInput "component dirY"

# component dirY pier corner boundary web 2 (vertical)
# Corner element in pier south, second corner
set sec_cyPibwS [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPibwS $sec_cyPibwS"
set bSec $incCshapeY
set hSec $tWall
set AbSec $AbNo10
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cyPibwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 3 2 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cyPibwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_pier $cconcc_pier $SteelMatTag 3 2 $eMat $fGJ"

# component dirX pier corner boundary web 1 (vertical)
# Corner element in pier north, second corner
set sec_cyPibwN $sec_cyPibwS
puts $recInput "sec_cxPibwN $sec_cxPibwN"

# component dirX panel corner boundary web (vertical)
# Corner element in panel south
set sec_cyPabwS [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPabwS $sec_cyPabwS"
set bSec $incCshapeY
set hSec $tWall
set AbSec $AbNo10
set eccY 0.
set eccZ 0.
set yRebar 12.
set zRebar 16.
#proc boundSecFiber {secTag bSec hSec Ec cov eccY eccZ yRebar zRebar AbSec prDum concCover concCore steel nFiberSteelY nFiberSteelZ eMat fGJ}
boundSecFiber $sec_cyPabwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 3 2 $eMat $fGJ
puts $recInput "boundSecFiber $sec_cyPabwS $bSec $hSec $Ec $cov $eccY $eccZ $yRebar $zRebar $AbSec $prDum $uconcv_panel $cconcc_panel $SteelMatTag 3 2 $eMat $fGJ"

# component dirX panel corner boundary web (vertical)
# Corner element in panel north
set sec_cyPabwN $sec_cyPabwS

# component dirY pier vertical(field)
set sec_cyPiv [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPiv $sec_cyPiv"
set bSec $tWall
set hSec $incCshapeY
set AbSec [expr {$bSec*$hSec*$prVerW/2.}]
set zRebar 16.
#proc pinSecFiberFreeLocZ {secTag bSec hSec Ec cov eccY eccZ zRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocZ $sec_cyPiv $bSec $hSec $Ec $cov 0. 0. $zRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocZ $sec_cyPiv $bSec $hSec $Ec $cov 0. 0. $zRebar $AbSec $prDum $uconcv_pier $uconcv_pier $SteelMatTag 2 $eMat $fGJ"

# component dirY panel vertical(field)
set sec_cyPav [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPav $sec_cyPav"
set bSec $tWall
set hSec $incCshapeY
set AbSec [expr {$bSec*$hSec*$prVerW/2.}]
set zRebar 16.
#proc pinSecFiberFreeLocZ {secTag bSec hSec Ec cov eccY eccZ zRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocZ $sec_cyPav $bSec $hSec $Ec $cov 0. 0. $zRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocZ $sec_cyPav $bSec $hSec $Ec $cov 0. 0. $zRebar $AbSec $prDum $uconcv_panel $uconcv_panel $SteelMatTag 2 $eMat $fGJ"


# component dirY pier horizontal
set sec_cyPih [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPih $sec_cyPih"
set bSec $tWall
set hSec $incPierZ
set AbSec [expr {$bSec*$hSec*$prHorY/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cyPih $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cyPih $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ"

# component dirY pier-panel horizontal
set sec_cyPPh [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPPh $sec_cyPPh"
set bSec $tWall
set hSec [expr {$incPierZ/2. + $incPanelZ/2.}]
set AbSec [expr {$bSec*$hSec*$prHorY/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cyPPh $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cyPPh $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ"

# component dirY panel horizontal
set sec_cyPah [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPah $sec_cyPah"
set bSec $tWall
set hSec $incPanelZ
set AbSec [expr {$bSec*$hSec*$prHorY/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_cyPah $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_cyPah $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ"

# component dirY panel-slab horizontal
set sec_cyPaSlab [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_cyPaSlab $sec_cyPaSlab"
set bSec $tWall
set hSec [expr {$incPierZ/2. + $incPanelZ/2.}]
set AbSec [expr {$bSec*$hSec*$prHorY/2.}]
set A_string [expr 18.*$AbNo10/2.];	# Add stringer area to the wall at slab level to carry drag forces
set AbSec [expr $AbSec + $A_string]
set AbSec 0.;		# Elastic section
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
#pinSecFiberFreeLocY $sec_cyPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ;		# Inelastic
#puts $recInput "pinSecFiberFreeLocY $sec_cyPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_wallY $uconch_wallY $SteelMatTag 2 $eMat $fGJ"
pinSecFiberFreeLocY $sec_cyPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $eConc $eConc $SteelMatTag 2 $eMat $fGJ;		# Elastic
puts $recInput "pinSecFiberFreeLocY $sec_cyPaSlab $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $eConc $eConc $SteelMatTag 2 $eMat $fGJ"

# component dirY diagonals
set beffPierY [expr {$incPierZ*$incCshapeY/$incDpierY}]
set areaDiaPierY [expr {$beffPierY*$tWall}]
puts $recInput "areaDiaPierY $areaDiaPierY"
set beffPanelY [expr {$incPanelZ*$incCshapeY/$incDpanelY}]
set areaDiaPanelY [expr {$beffPanelY*$tWall}]
puts $recInput "areaDiaPanelY $areaDiaPanelY"



# ######### coupling beams
puts $recInput "coupling beams"

# coupling beam vertical
set sec_CBv [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_CBv $sec_CBv"
set bSec $tWall
set hSec $incHCB
set AbSec [expr {$AbNo4*$hSec/3.}]; # ties at 3 inches
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_CBv $bSec $hSec $Ec $cov 0. 0. 12.0 $AbSec $prDum $uconcv_CB $uconcv_CB $SteelMatTag 7 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_CBv $bSec $hSec $Ec $cov 0. 0. 12.0 $AbSec $prDum $uconcv_CB $uconcv_CB $SteelMatTag 7 $eMat $fGJ"

# coupling beam horizontal field
set sec_CBhf [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_CBhf $sec_CBhf"
set bSec $tWall
set hSec $incVCB
set AbSec [expr {$bSec*$hSec*$prCB/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_CBhf $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_CB $cconch_CB $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_CBhf $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_CB $cconch_CB $SteelMatTag 2 $eMat $fGJ"

# coupling beam horizontal end
set sec_CBhe [expr {$coreWallTag + $secTag}]
incr secTag 1
puts $recInput "sec_CBhe $sec_CBhe"
set bSec $tWall
set hSec [expr {($hBeam - $incVCB)/2.}]
set AbSec [expr {$bSec*$hSec*$prCB/2.}]
#proc pinSecFiberFreeLocY {secTag bSec hSec Ec cov eccY eccZ yRebar AbSec prDum concCover concCore steel nFiberSteel eMat fGJ}
pinSecFiberFreeLocY $sec_CBhe $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_CB $cconch_CB $SteelMatTag 2 $eMat $fGJ
puts $recInput "pinSecFiberFreeLocY $sec_CBhe $bSec $hSec $Ec $cov 0. 0. 12. $AbSec $prDum $uconch_CB $cconch_CB $SteelMatTag 2 $eMat $fGJ"

# coupling beam diagonal
set beffCB [expr {$incVCB*$incHCB/$incDCB}]
set areaDiaCB [expr {$beffCB*$tWall}]

if {$story < 4} {
	#set areaDiaCB [expr 973.4*$in*$in]
	set AsDiaCB [expr 8.*$AbNo8]
} else {
	#set areaDiaCB [expr 1222.4*$in*$in]
	set AsDiaCB [expr 15.*$AbNo11]
}
puts $recInput "areaDiaCB $areaDiaCB"
puts $recInput "AsDiaCB $AsDiaCB"



# slab coupling beam
set sec_CBslab [expr {$coreWallTag + $secTag}]
incr secTag 1

set blink [expr 4.*$tWall]
if {$story == 3 || $story == 11} {
	set hlink 12.
} else {	
	set hlink 8.
}

puts $recInput "sec_CBslab $sec_CBslab"
set Eslab $Ec
set Gslab [expr {0.38*$Ec}]
set Jslab [expr {0.333*$blink*pow($hlink,3)}]
set Aslab [expr $blink*$hlink*$fStiffA]
set Izslab [expr {$hlink*pow($blink,3)/12.*0.7}]
set Iyslab [expr {$blink*pow($hlink,3)/12.*0.0001}]
#section Elastic $secTag $E $A $Iz $Iy $G $J <$alphaY $alphaZ>
section Elastic $sec_CBslab $Eslab $Aslab $Izslab $Iyslab $Gslab $Jslab
puts $recInput "section Elastic $sec_CBslab $Eslab $Aslab $Izslab $Iyslab $Gslab $Jslab"

# list of DBE sections
set secListCxVertSWe "$sec_cxPibwS $sec_cxPiawW $sec_cxPiaField $sec_cxPiafW $sec_cxPibfW2 $sec_cxPibfW1 $sec_cxPabwS $sec_cxPaawW $sec_cxPaaField $sec_cxPaafW $sec_cxPabfW2 $sec_cxPabfW1"
set secListCxVertNWe "$sec_cxPibwN $sec_cxPiawW $sec_cxPiaField $sec_cxPiafW $sec_cxPibfW2 $sec_cxPibfW1 $sec_cxPabwN $sec_cxPaawW $sec_cxPaaField $sec_cxPaafW $sec_cxPabfW2 $sec_cxPabfW1"
set secListCxVertSEa "$sec_cxPibfE1 $sec_cxPibfE2 $sec_cxPiafE $sec_cxPiaField $sec_cxPiawE $sec_cxPibwS $sec_cxPabfE1 $sec_cxPabfE2 $sec_cxPaafE $sec_cxPaaField $sec_cxPaawE $sec_cxPabwS"
set secListCxVertNEa "$sec_cxPibfE1 $sec_cxPibfE2 $sec_cxPiafE $sec_cxPiaField $sec_cxPiawE $sec_cxPibwN $sec_cxPabfE1 $sec_cxPabfE2 $sec_cxPaafE $sec_cxPaaField $sec_cxPaawE $sec_cxPabwN"
set secListCyVert "$sec_cyPibwS $sec_cyPiv $sec_cyPibwN $sec_cyPabwS $sec_cyPav $sec_cyPabwN"
#set secListCxHorz "$sec_cxPih $sec_cxPPh $sec_cxPah $sec_cxPaSlab"
#set secListCyHorz "$sec_cyPih $sec_cyPPh $sec_cyPah $sec_cyPaSlab"
set secListCxHorz "$sec_cxPih $sec_cxPPh $sec_cxPah $sec_cxPah"
set secListCyHorz "$sec_cyPih $sec_cyPPh $sec_cyPah $sec_cyPah"