# nodes
if {$dispflag} {puts "\nnodes story$story"}; puts $recInput "\nnodes story$story"
#set region_node {}

# RectangularWalls
proc nodesCompX {xoComp yoComp zoComp nIncCShape nIncCShapeZ story coreWallTag incCshape nIncPierZ incPierZ nIncCShapeZbelow recInput} {
#set region_node {}
set nodeNum 1
for {set verAxis 1} {$verAxis <= [expr {$nIncCShape + 1}]} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= [expr {$nIncCShapeZ + 1}]} {incr horAxis} {
    if {$horAxis == 1} {
      if {$story == 1} {
	    set nodeTag [expr {$coreWallTag + $nodeNum}] 
	  } else {
	    set nodeTag [expr {($coreWallTag-100000) + ($nIncCShapeZbelow+1)*$verAxis}]
	  }	  
    } else {
      set nodeTag [expr {$coreWallTag + $nodeNum}]
    }
	set coordx [expr {$xoComp + ($verAxis-1)*$incCshape}]
    set coordy $yoComp
    set coordz [expr {$zoComp + ($horAxis-1)*$incPierZ}]
	if {$horAxis == 1} {
      if {$story == 1} {
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
  for {set VerAxis 1} {$VerAxis <= [expr {$nIncCShape + 1}]} {incr VerAxis} {
    set nodeTag [expr {$coreWallTag + ($VerAxis-1)*($nIncCShapeZ+1) + 1}]
    #fix $nodeTag (ndf $constrValues)
    fix $nodeTag 1 1 1 1 1 1
    puts $recInput "fix $nodeTag 1 1 1 1 1 1"    
  }
}
return $Nodes
#return $region_node
};# proc nodesCompX


#For SPM output purposes
set coordzSPM [expr {$zo + $hStory}];	#For SPM output purposes
set nodeTagWe [expr $coreWallTag + $nIncPierZ + 1]
set nodeTagEa [expr $coreWallTag +($nIncPierZ + 1)*($nIncCShape+1)]

puts $recInput "component dirX"
set xoComp $xo
set yoComp $yo
set zoComp $zo
#proc nodesCompX {xoComp yoComp zoComp nIncCShape nIncCShapeZ story coreWallTag incCshape nIncPierZ incPierZ nIncCShapeZbelow recInput}
append Nodes { } [nodesCompX $xoComp $yoComp $zoComp $nIncCShape $nIncCShapeZ $story $coreWallTag $incCshape $nIncPierZ $incPierZ $nIncCShapeZbelow $recInput]
puts $ModelFile "node $nodeTagWe $xoComp $yoComp $coordzSPM"
puts $ModelFile "node $nodeTagEa [expr $xoComp+$lCshape] $yoComp $coordzSPM"

# region
#region $regTag <-ele ($ele1 $ele2 ...)> <-eleOnly ($ele1 $ele2 ...)> <-eleRange $startEle $endEle> <-eleOnlyRange $startEle $endEle>
#<-node ($node1 $node2 ...)> <-nodeOnly ($node1 $node2 ...)> <-nodeRange $startNode $endNode> <-nodeOnlyRange $startNode $endNode>
#<-node all> <-rayleigh $alphaM $betaK $betaKinit $betaKcomm>
#eval region [expr {1000 + $story}] -node $region_node