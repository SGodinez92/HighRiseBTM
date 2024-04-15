# mass
if {$dispflag} {puts "\nmass RW story$story"}; puts $recInput "\nmass RW story$story"

# Lumped masses
# The mass assigned to each corner is the mass corresponding to the selfweight of the rectangular wall, the rest of the mass will be assigned to the StringPanelLin.

#[expr {(wall self weight + coupling beam weight)*2 + superimposed dead load}]

set gama_conc [expr 150.*$pcf]

set vWall [expr $tWall*$hStory*$lCshape];	# Volume of wall
set wWall [expr $vWall*$gama_conc];			# Weight of wall

puts $recInput "vWall $vWall"
puts $recInput "wWall $wWall"

set massStory [expr $wWall/$g]

set massNode [expr {$massStory/2.}]

puts $recInput "massNode $massNode"

set node1 [expr {$nIncCShapeZ + 1}]
set node2 [expr {$node1*($nIncCShape + 1)}]

set nodeWe [expr {$coreWallTag + $node1}]
set nodeEa [expr {$coreWallTag + $node2}]

#mass $nodeTag (ndf $massValues)
mass $nodeEa $massNode $massNode 0 0 0 0
mass $nodeWe $massNode $massNode 0 0 0 0
