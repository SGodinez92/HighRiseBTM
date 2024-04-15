# mass
if {$dispflag} {puts "\nmass CW story$story"}; puts $recInput "\nmass CW story$story"

# Lumped masses
# The mass assigned to each corner is the mass corresponding to the selfweight of the core wall, the rest of the mass will be assigned to the StringPanelLin.

#[expr {(wall self weight + coupling beam weight)*2 + superimposed dead load}]

set gama_conc [expr 150.*$pcf]

set xWall [expr $lCshapeX + ($sCshape - $lCB)/2. + $tWall/2]
set yWall [expr $lCshapeY - $tWall]
set hWall [expr $hPanel + $hPier]

puts $recInput "xWall $xWall"
puts $recInput "yWall $yWall"
puts $recInput "hWall $hWall"

set vWall [expr $tWall*($xWall*2 + $yWall)*$hWall];	# Volume of wall
set wWall [expr $vWall*$gama_conc];					# Weight of wall

puts $recInput "vWall $vWall"
puts $recInput "wWall $wWall"

set CB_w [expr $gama_conc*$tWall*$lCB*$hPanel]

puts $recInput "CB_w $CB_w"

set massStory [expr 2*($CB_w+$wWall)/$g]

set massNode [expr {$massStory/4.}]

puts $recInput "massNode $massNode"

set node1 [expr {$nIncCShapeZ + 1}]
set node2 [expr {$node1*($nIncCShapeX + 1)}]

set nodeSoWe [expr {$coreWallTag + $compSoWeTag + $node1}]
set nodeNoWe [expr {$coreWallTag + $compNoWeTag + $node1}]
set nodeSoEa [expr {$coreWallTag + $compSoEaTag + $node2}]
set nodeNoEa [expr {$coreWallTag + $compNoEaTag + $node2}]

#mass $nodeTag (ndf $massValues)
mass $nodeSoWe $massNode $massNode 0 0 0 0
mass $nodeNoWe $massNode $massNode 0 0 0 0
mass $nodeSoEa $massNode $massNode 0 0 0 0
mass $nodeNoEa $massNode $massNode 0 0 0 0
