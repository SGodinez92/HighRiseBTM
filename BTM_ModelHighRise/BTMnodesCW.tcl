# nodes
if {$dispflag} {puts "\nnodes story$story"}; puts $recInput "\nnodes story$story"
#set Nodes {}

set nStoryBTM $story
set flagChangePID 0

# Cshapes
proc nodesCompX {xoComp yoComp zoComp nIncCShapeX nIncCShapeZ story coreWallTag compTag incCshapeX nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM} {
set Nodes {}
set nodeNum 1
for {set verAxis 1} {$verAxis <= [expr {$nIncCShapeX + 1}]} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= [expr {$nIncCShapeZ + 1}]} {incr horAxis} {
    if {$horAxis == 1} {
      if {$story == 1 || $nStoryBTM == 1} {
	    set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}] 
	  } else {
	    set nodeTag [expr {($coreWallTag-100000) + $compTag + ($nIncCShapeZbelow+1)*$verAxis}]
	  }	  
    } else {
      set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}]
    }
	set coordx [expr {$xoComp + ($verAxis-1)*$incCshapeX}]
    set coordy $yoComp
    if {$horAxis <= [expr {$nIncPierZ + 1}]} {
      set coordz [expr {$zoComp + ($horAxis-1)*$incPierZ}]
    } else {
      set coordz [expr {$zoComp + $hPier + ($horAxis-($nIncPierZ+1))*$incPanelZ}]			
    }
	if {$horAxis == 1} {
      if {$story == 1 || $flagChangePID || $nStoryBTM == 1} {
	    node $nodeTag $coordx $coordy $coordz
		lappend Nodes $nodeTag
        puts $recInput "node $nodeTag $coordx $coordy $coordz"		
	  }      
    } else {
        node $nodeTag $coordx $coordy $coordz
		lappend Nodes $nodeTag
        puts $recInput "node $nodeTag $coordx $coordy $coordz"
    }	
	incr nodeNum
  }
}
# fix
if {$story == 1} {
  puts $recInput "fix"
  for {set VerAxis 1} {$VerAxis <= [expr {$nIncCShapeX + 1}]} {incr VerAxis} {
    set nodeTag [expr {$coreWallTag + $compTag + ($VerAxis-1)*($nIncCShapeZ+1) + 1}]	
    #fix $nodeTag (ndf $constrValues)
    fix $nodeTag 1 1 1 1 1 1
    puts $recInput "fix $nodeTag 1 1 1 1 1 1"    
  }
}
return $Nodes
};# proc nodesCompX

proc nodesCompY {xoComp yoComp zoComp nIncCShapeY nIncCShapeZ story coreWallTag compTag incCshapeY nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM} {
set Nodes {}
set nodeNum 1
for {set verAxis 1} {$verAxis <= [expr {$nIncCShapeY + 1}]} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= [expr {$nIncCShapeZ + 1}]} {incr horAxis} {
    if {$horAxis == 1} {
      if {$story == 1 || $nStoryBTM == 1} {
	    set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}] 		
	  } else {
	    set nodeTag [expr {($coreWallTag-100000) + $compTag + ($nIncCShapeZbelow+1)*$verAxis}]
	  }	  
    } else {
      set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}]
    }
	set coordx $xoComp
    set coordy [expr {$yoComp + ($verAxis-1)*$incCshapeY}]
    if {$horAxis <= [expr {$nIncPierZ + 1}]} {
      set coordz [expr {$zoComp + ($horAxis-1)*$incPierZ}]
    } else {
      set coordz [expr {$zoComp + $hPier + ($horAxis-($nIncPierZ+1))*$incPanelZ}]			
    }
	if {$verAxis > 1 && $verAxis < [expr {$nIncCShapeY + 1}]} {
	  if {$horAxis == 1} {
        if {$story == 1 || $flagChangePID || $nStoryBTM == 1} {
	      node $nodeTag $coordx $coordy $coordz
		  lappend Nodes $nodeTag
          puts $recInput "node $nodeTag $coordx $coordy $coordz"		  
	    }        
      } else {
          node $nodeTag $coordx $coordy $coordz
		  lappend Nodes $nodeTag
          puts $recInput "node $nodeTag $coordx $coordy $coordz"
      }
    }	
	incr nodeNum
  }
}
# fix
if {$story == 1} {
  puts $recInput "fix"
  for {set VerAxis 2} {$VerAxis <= $nIncCShapeY} {incr VerAxis} {
    set nodeTag [expr {$coreWallTag + $compTag + ($VerAxis-1)*($nIncCShapeZ+1) + 1}]    
	#fix $nodeTag (ndf $constrValues)
    fix $nodeTag 1 1 1 1 1 1
    puts $recInput "fix $nodeTag 1 1 1 1 1 1"    
  }
}
return $Nodes
};# proc nodesCompY

#For SPM output purposes
set coordzSPM [expr {$zo + $hPier + $hPanel}];	#For SPM output purposes
set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncPierZ + $nIncPanelZ + 1]
set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncPierZ + $nIncPanelZ + 1]
set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncPierZ + $nIncPanelZ + 1)*($nIncCShapeX+1)]
set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncPierZ + $nIncPanelZ + 1)*($nIncCShapeX+1)]

set incCoordX [expr $lCshapeX*2 + $sCshape]
set incCoordY [expr $lCshapeY]

puts $ModelFile "node $nodeTagSWe $xo $yo $coordzSPM"
puts $ModelFile "node $nodeTagNWe $xo [expr $yo + $incCoordY] $coordzSPM"
puts $ModelFile "node $nodeTagSEa [expr $xo + $incCoordX] $yo $coordzSPM"
puts $ModelFile "node $nodeTagNEa [expr $xo + $incCoordX] [expr $yo + $incCoordY] $coordzSPM"

puts $recInput "component dirX, southwest"
set compTag $compSoWeTag
set xoComp $xo
set yoComp $yo
set zoComp $zo
#proc nodesCompX {xoComp yoComp zoComp nIncCShapeX nIncCShapeZ story coreWallTag compTag incCshapeX nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM}
append Nodes { } [nodesCompX $xoComp $yoComp $zoComp $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $incCshapeX $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]

puts $recInput "component dirX, northwest"
set compTag $compNoWeTag
set xoComp $xo
set yoComp [expr {$yo + $lCshapeY}]
set zoComp $zo
#proc nodesCompX {xoComp yoComp zoComp nIncCShapeX nIncCShapeZ story coreWallTag compTag incCshapeX nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM}
append Nodes { } [nodesCompX $xoComp $yoComp $zoComp $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $incCshapeX $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]

puts $recInput "component dirY, west"
set compTag $compWeTag
set xoComp $xo
set yoComp $yo
set zoComp $zo
#proc nodesCompY {xoComp yoComp zoComp nIncCShapeY nIncCShapeZ story coreWallTag compTag incCshapeY nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM}
append Nodes { } [nodesCompY $xoComp $yoComp $zoComp $nIncCShapeY $nIncCShapeZ $story $coreWallTag $compTag $incCshapeY $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]


puts $recInput "component dirX, southeast"
set compTag $compSoEaTag
set xoComp [expr {$xo + $lCshapeX + $sCshape}]
set yoComp $yo
set zoComp $zo
#proc nodesCompX {xoComp yoComp zoComp nIncCShapeX nIncCShapeZ story coreWallTag compTag incCshapeX nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM}
append Nodes { } [nodesCompX $xoComp $yoComp $zoComp $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $incCshapeX $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]

puts $recInput "component dirX, northeast"
set compTag $compNoEaTag
set xoComp [expr {$xo + $lCshapeX + $sCshape}]
set yoComp [expr {$yo + $lCshapeY}]
set zoComp $zo
#proc nodesCompX {xoComp yoComp zoComp nIncCShapeX nIncCShapeZ story coreWallTag compTag incCshapeX nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput nStoryBTM}
append Nodes { } [nodesCompX $xoComp $yoComp $zoComp $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $incCshapeX $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]

puts $recInput "component dirY, east"
set compTag $compEaTag
set xoComp [expr {$xo + $lCshapeX*2. + $sCshape}]
set yoComp $yo
set zoComp $zo
#proc nodesCompY {xoComp yoComp zoComp nIncCShapeY nIncCShapeZ story coreWallTag compTag incCshapeY nIncPierZ incPierZ hPier incPanelZ flagChangePID nIncCShapeZbelow recInput}
append Nodes { } [nodesCompY $xoComp $yoComp $zoComp $nIncCShapeY $nIncCShapeZ $story $coreWallTag $compTag $incCshapeY $nIncPierZ $incPierZ $hPier $incPanelZ $flagChangePID $nIncCShapeZbelow $recInput $nStoryBTM]




# coupling beams
proc nodesCB {xoCB yoCB zoCB lCshapeX sCshape lCB hPier lCshapeZ coreWallTag cbTag compLeftTag compRightTag nIncCShapeX nIncPierZ nIncCShapeZ recInput} {
set Nodes {}

set lrig [expr {($sCshape-$lCB)/2.}]
set coordx1 [expr {$xoCB + $lCshapeX}]
set coordx2 [expr {$xoCB + $lCshapeX + $lrig}]
set coordx3 [expr {$xoCB + $lCshapeX + $sCshape/2.}]
set coordx4 [expr {$xoCB + $lCshapeX + $lrig + $lCB}]
set coordx5 [expr {$xoCB + $lCshapeX + $sCshape}]
set coordy1 $yoCB
set coordz1 [expr {$zoCB + $hPier}]
set coordz2 [expr {$zoCB + ($hPier+$lCshapeZ)/2.}]
set coordz3 [expr {$zoCB + $lCshapeZ}]

node [expr {$coreWallTag + $cbTag + 1}] $coordx1 $coordy1 $coordz1
node [expr {$coreWallTag + $cbTag + 2}] $coordx1 $coordy1 $coordz2
node [expr {$coreWallTag + $cbTag + 3}] $coordx1 $coordy1 $coordz3
node [expr {$coreWallTag + $cbTag + 4}] $coordx2 $coordy1 $coordz1
node [expr {$coreWallTag + $cbTag + 5}] $coordx2 $coordy1 $coordz2
node [expr {$coreWallTag + $cbTag + 6}] $coordx2 $coordy1 $coordz3
node [expr {$coreWallTag + $cbTag + 7}] $coordx3 $coordy1 $coordz1
node [expr {$coreWallTag + $cbTag + 8}] $coordx3 $coordy1 $coordz2
node [expr {$coreWallTag + $cbTag + 9}] $coordx3 $coordy1 $coordz3
node [expr {$coreWallTag + $cbTag + 10}] $coordx4 $coordy1 $coordz1
node [expr {$coreWallTag + $cbTag + 11}] $coordx4 $coordy1 $coordz2
node [expr {$coreWallTag + $cbTag + 12}] $coordx4 $coordy1 $coordz3
node [expr {$coreWallTag + $cbTag + 13}] $coordx5 $coordy1 $coordz1
node [expr {$coreWallTag + $cbTag + 14}] $coordx5 $coordy1 $coordz2
node [expr {$coreWallTag + $cbTag + 15}] $coordx5 $coordy1 $coordz3

lappend Nodes [expr {$coreWallTag + $cbTag + 1}]
lappend Nodes [expr {$coreWallTag + $cbTag + 2}]
lappend Nodes [expr {$coreWallTag + $cbTag + 3}]
lappend Nodes [expr {$coreWallTag + $cbTag + 4}]
lappend Nodes [expr {$coreWallTag + $cbTag + 5}]
lappend Nodes [expr {$coreWallTag + $cbTag + 6}]
lappend Nodes [expr {$coreWallTag + $cbTag + 7}]
lappend Nodes [expr {$coreWallTag + $cbTag + 8}]
lappend Nodes [expr {$coreWallTag + $cbTag + 9}]
lappend Nodes [expr {$coreWallTag + $cbTag + 10}]
lappend Nodes [expr {$coreWallTag + $cbTag + 11}]
lappend Nodes [expr {$coreWallTag + $cbTag + 12}]
lappend Nodes [expr {$coreWallTag + $cbTag + 13}]
lappend Nodes [expr {$coreWallTag + $cbTag + 14}]
lappend Nodes [expr {$coreWallTag + $cbTag + 15}]

# puts $recInput "node [expr {$coreWallTag + $cbTag + 1}] $coordx1 $coordy1 $coordz1"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 2}] $coordx1 $coordy1 $coordz2"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 3}] $coordx1 $coordy1 $coordz3"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 4}] $coordx2 $coordy1 $coordz1"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 5}] $coordx2 $coordy1 $coordz2"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 6}] $coordx2 $coordy1 $coordz3"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 7}] $coordx3 $coordy1 $coordz1"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 8}] $coordx3 $coordy1 $coordz2"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 9}] $coordx3 $coordy1 $coordz3"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 10}] $coordx4 $coordy1 $coordz1"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 11}] $coordx4 $coordy1 $coordz2"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 12}] $coordx4 $coordy1 $coordz3"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 13}] $coordx5 $coordy1 $coordz1"
# #puts $recInput "node [expr {$coreWallTag + $cbTag + 14}] $coordx5 $coordy1 $coordz2"
# puts $recInput "node [expr {$coreWallTag + $cbTag + 15}] $coordx5 $coordy1 $coordz3"

puts $recInput "equalDOF"
set rNodeTag1 [expr {$coreWallTag + $compLeftTag + ($nIncCShapeZ+1)*$nIncCShapeX + $nIncPierZ + 1}]
set rNodeTag2 [expr {$coreWallTag + $compLeftTag + ($nIncCShapeZ+1)*$nIncCShapeX + $nIncCShapeZ + 1}]
set rNodeTag3 [expr {$coreWallTag + $compRightTag + $nIncPierZ + 1}]
set rNodeTag4 [expr {$coreWallTag + $compRightTag + $nIncCShapeZ + 1}]

#equalDOF $rNodeTag $cNodeTag $dof1 $dof2 ...
equalDOF $rNodeTag1 [expr {$coreWallTag + $cbTag + 1}] 1 2 3 4 6
equalDOF $rNodeTag2 [expr {$coreWallTag + $cbTag + 3}] 1 2 3 4 6
equalDOF $rNodeTag3 [expr {$coreWallTag + $cbTag + 13}] 1 2 3 4 6
equalDOF $rNodeTag4 [expr {$coreWallTag + $cbTag + 15}] 1 2 3 4 6

puts $recInput "equalDOF $rNodeTag1 [expr {$coreWallTag + $cbTag + 1}] 1 2 3 4 6"
puts $recInput "equalDOF $rNodeTag2 [expr {$coreWallTag + $cbTag + 3}] 1 2 3 4 6"
puts $recInput "equalDOF $rNodeTag3 [expr {$coreWallTag + $cbTag + 13}] 1 2 3 4 6"
puts $recInput "equalDOF $rNodeTag4 [expr {$coreWallTag + $cbTag + 15}] 1 2 3 4 6"

if {[expr ($nIncCShapeZ - $nIncPierZ)] == 2} {
	
	set rNodeTag5 [expr {$coreWallTag + $compLeftTag + ($nIncCShapeZ+1)*$nIncCShapeX + $nIncPierZ + 2}]
	set rNodeTag6 [expr {$coreWallTag + $compRightTag + $nIncPierZ + 2}]
	
	equalDOF $rNodeTag5 [expr {$coreWallTag + $cbTag + 2}] 1 2 3 4 6
	equalDOF $rNodeTag6 [expr {$coreWallTag + $cbTag + 14}] 1 2 3 4 6

	puts $recInput "equalDOF $rNodeTag5 [expr {$coreWallTag + $cbTag + 2}] 1 2 3 4 6"
	puts $recInput "equalDOF $rNodeTag6 [expr {$coreWallTag + $cbTag + 14}] 1 2 3 4 6"

}

return $Nodes
};# proc nodesCB




puts $recInput "coupling beam, south"
set cbTag $cbSoTag
set compLeftTag $compSoWeTag
set compRightTag $compSoEaTag
set xoCB $xo
set yoCB $yo
set zoCB $zo
#proc nodesCB {xoCB yoCB zoCB lCshapeX sCshape lCB hPier lCshapeZ coreWallTag cbTag compLeftTag compRightTag nIncCShapeX nIncPierZ nIncCShapeZ recInput}
append Nodes { } [nodesCB $xoCB $yoCB $zoCB $lCshapeX $sCshape $lCB $hPier $lCshapeZ $coreWallTag $cbTag $compLeftTag $compRightTag $nIncCShapeX $nIncPierZ $nIncCShapeZ $recInput]

puts $recInput "coupling beam, north"
set cbTag $cbNoTag
set compLeftTag $compNoWeTag
set compRightTag $compNoEaTag
set xoCB $xo
set yoCB [expr {$yo + $lCshapeY}]
set zoCB $zo
#proc nodesCB {xoCB yoCB zoCB lCshapeX sCshape lCB hPier lCshapeZ coreWallTag cbTag compLeftTag compRightTag nIncCShapeX nIncPierZ nIncCShapeZ recInput}
append Nodes { } [nodesCB $xoCB $yoCB $zoCB $lCshapeX $sCshape $lCB $hPier $lCshapeZ $coreWallTag $cbTag $compLeftTag $compRightTag $nIncCShapeX $nIncPierZ $nIncCShapeZ $recInput]



# anchorage coupling beams
proc nodesAnchorCB {story coreWallTag cbTag compLeftTag compRightTag incCshapeX incPierZ lCshapeX sCshape xoCB yoCB zoCB recInput} {
set Nodes {}

if {$story == 1} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*2 + 20.}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*2 + 20.}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*3}]

} elseif {$story < 4} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*2 + 20.}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*2 + 20.}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ*3}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*4}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + 12.5625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + 12.5625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ}]

} elseif {$story == 4} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3 + 24.5}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*4}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3 + 24.5}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*4}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*4}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + 12.5625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*4}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + 12.5625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX}] $yoCB [expr {$zoCB + $incPierZ}]

} elseif {$story < 7} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3 + 24.5}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*4}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3 + 24.5}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*4}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ + 4.75}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ + 4.75}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2}]

} elseif {$story == 7} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3 + 9.3125}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*4}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3 + 9.3125}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*4}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ + 3.5625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ + 3.5625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2}]

} elseif {$story < 13} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3 + 9.3125}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*4}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3 + 9.3125}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*4}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*3}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ}]

} elseif {$story == 13} {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2 + 16.875}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2 + 16.875}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*3}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ}]

} else {

node [expr {$coreWallTag + $cbTag + 16}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 17}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*2 + 16.875}]
node [expr {$coreWallTag + $cbTag + 18}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ*3}]
node [expr {$coreWallTag + $cbTag + 19}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2}]
node [expr {$coreWallTag + $cbTag + 20}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*2 + 16.875}]
node [expr {$coreWallTag + $cbTag + 21}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ*3}]

node [expr {$coreWallTag + $cbTag + 22}] [expr {$xoCB + $incCshapeX*3}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 23}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 24}] [expr {$xoCB + $incCshapeX*3}] $yoCB [expr {$zoCB + $incPierZ}]
node [expr {$coreWallTag + $cbTag + 25}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB $zoCB
node [expr {$coreWallTag + $cbTag + 26}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + 21.0625}]
node [expr {$coreWallTag + $cbTag + 27}] [expr {$xoCB + $lCshapeX + $sCshape + $incCshapeX*2}] $yoCB [expr {$zoCB + $incPierZ}]

}



if {$story == 1} {

lappend Nodes [expr {$coreWallTag + $cbTag + 16}]
lappend Nodes [expr {$coreWallTag + $cbTag + 17}]
lappend Nodes [expr {$coreWallTag + $cbTag + 18}]
lappend Nodes [expr {$coreWallTag + $cbTag + 19}]
lappend Nodes [expr {$coreWallTag + $cbTag + 20}]
lappend Nodes [expr {$coreWallTag + $cbTag + 21}]

} else {

lappend Nodes [expr {$coreWallTag + $cbTag + 16}]
lappend Nodes [expr {$coreWallTag + $cbTag + 17}]
lappend Nodes [expr {$coreWallTag + $cbTag + 18}]
lappend Nodes [expr {$coreWallTag + $cbTag + 19}]
lappend Nodes [expr {$coreWallTag + $cbTag + 20}]
lappend Nodes [expr {$coreWallTag + $cbTag + 21}]

lappend Nodes [expr {$coreWallTag + $cbTag + 22}]
lappend Nodes [expr {$coreWallTag + $cbTag + 23}]
lappend Nodes [expr {$coreWallTag + $cbTag + 24}]
lappend Nodes [expr {$coreWallTag + $cbTag + 25}]
lappend Nodes [expr {$coreWallTag + $cbTag + 26}]
lappend Nodes [expr {$coreWallTag + $cbTag + 27}]

}


if {$story == 1} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 23}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 24}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 8}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 9}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

} elseif {$story < 4} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 23}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 24}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 8}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 9}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  -100000 + 25}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 22}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag -100000 + 10}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 7}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} elseif {$story == 4} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 28}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 29}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 20}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 21}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  -100000 + 25}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 34}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag -100000 + 10}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 10}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} elseif {$story < 7} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 28}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 29}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 20}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 21}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  + 26}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 27}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 18}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 19}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} elseif {$story == 7} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 22}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6 
equalDOF [expr {$coreWallTag + $compLeftTag  + 23}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6 
equalDOF [expr {$coreWallTag + $compRightTag + 16}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6 
equalDOF [expr {$coreWallTag + $compRightTag + 17}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6 

equalDOF [expr {$coreWallTag + $compLeftTag  + 20}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 21}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 14}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 15}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} elseif {$story < 13} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 22}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 23}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 16}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 17}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  -100000 + 24}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 20}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag -100000 + 18}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 14}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} elseif {$story == 13} {

equalDOF [expr {$coreWallTag + $compLeftTag  + 18}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 19}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 13}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 14}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  -100000 + 24}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 17}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag -100000 + 18}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 12}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

} else {

equalDOF [expr {$coreWallTag + $compLeftTag  + 18}] [expr {$coreWallTag + $cbTag + 16}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 19}] [expr {$coreWallTag + $cbTag + 18}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 13}] [expr {$coreWallTag + $cbTag + 19}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 14}] [expr {$coreWallTag + $cbTag + 21}] 1 2 3 4 6

equalDOF [expr {$coreWallTag + $compLeftTag  -100000 + 20}] [expr {$coreWallTag + $cbTag + 22}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compLeftTag  + 17}] [expr {$coreWallTag + $cbTag + 24}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag -100000 + 15}] [expr {$coreWallTag + $cbTag + 25}] 1 2 3 4 6
equalDOF [expr {$coreWallTag + $compRightTag + 12}] [expr {$coreWallTag + $cbTag + 27}] 1 2 3 4 6

}

return $Nodes
};# proc nodesAnchorCB


if {$anchorageCB} {
# nodes anchor coupling beam
puts $recInput "Anchor nodes for south coupling beam"
set cbTag $cbSoTag
set compLeftTag $compSoWeTag
set compRightTag $compSoEaTag
set xoCB $xo
set yoCB $yo
set zoCB $zo
#nodesAnchorCB {story coreWallTag cbTag compLeftTag compRightTag incCshapeX incPierZ lCshapeX sCshape xoCB yoCB zoCB recInput}
append Nodes { } [nodesAnchorCB $story $coreWallTag $cbTag $compLeftTag $compRightTag $incCshapeX $incPierZ $sCshape $lCshapeX $xoCB $yoCB $zoCB $recInput]

puts $recInput "Anchor nodes for north coupling beam"
set cbTag $cbNoTag
set compLeftTag $compNoWeTag
set compRightTag $compNoEaTag
set xoCB $xo
set yoCB [expr {$yo + $lCshapeY}]
set zoCB $zo
#nodesAnchorCB {story coreWallTag cbTag compLeftTag compRightTag incCshapeX incPierZ lCshapeX sCshape xoCB yoCB zoCB recInput}
append Nodes { } [nodesAnchorCB $story $coreWallTag $cbTag $compLeftTag $compRightTag $incCshapeX $incPierZ $lCshapeX $sCshape $xoCB $yoCB $zoCB $recInput]
}