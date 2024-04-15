# elements
if {$dispflag} {puts "\nelements story$story"}; puts $recInput "\nelements story$story"
set region_elem {}

set nStoryBTM $story

# geometric transformation
set transfTagVerX [expr {$coreWallTag + 1}]
geomTransf $geomType $transfTagVerX 1 0 0
puts $recInput "geomTransf $geomType $transfTagVerX 1 0 0"
set transfTagHorX [expr {$coreWallTag + 2}]
geomTransf $geomType $transfTagHorX 0 0 1
puts $recInput "geomTransf $geomType $transfTagHorX 0 0 1"
set transfTagVerY [expr {$coreWallTag + 3}]
geomTransf $geomType $transfTagVerY 1 0 0
puts $recInput "geomTransf $geomType $transfTagVerY 1 0 0"
set transfTagHorY [expr {$coreWallTag + 4}]
geomTransf $geomType $transfTagHorY 0 0 1
puts $recInput "geomTransf $geomType $transfTagHorY 0 0 1"

# Cshapes
proc listNodesCompX {nIncCShapeX nIncCShapeZ story coreWallTag compTag nIncCShapeZbelow nStoryBTM} {
set listNodes {}
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
	lappend listNodes $nodeTag	
	incr nodeNum
  }
}
#puts "List nodes $listNodes"
return $listNodes
};# proc listNodesCompX

proc listNodesCompY {nIncCShapeY nIncCShapeZ story coreWallTag compTag listNodesLeft listNodesRight nIncCShapeZbelow nStoryBTM} {
set listNodes {}
set nodeNum 1
for {set verAxis 1} {$verAxis <= [expr {$nIncCShapeY + 1}]} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= [expr {$nIncCShapeZ + 1}]} {incr horAxis} {
    if {$verAxis == 1} {
	  set nodeTag [lindex $listNodesLeft [expr {$horAxis - 1}]]	
	} elseif {$verAxis == [expr {$nIncCShapeY + 1}]} {
	  set nodeTag [lindex $listNodesRight [expr {$horAxis - 1}]]	
	} else {
	  if {$horAxis == 1} {
        if {$story == 1 || $nStoryBTM == 1} {
	      set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}]  
	    } else {
	      set nodeTag [expr {($coreWallTag-100000) + $compTag + ($nIncCShapeZbelow+1)*$verAxis}]
	    }	  
      } else {
        set nodeTag [expr {$coreWallTag + $compTag + $nodeNum}]
      }
	}	
	lappend listNodes $nodeTag	
	incr nodeNum
  }
}
#puts "List nodes $listNodes"
return $listNodes
};# proc listNodesCompY

proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput} {
set region_elem {}

puts $recInput "diagonals"
set diaNum 1
for {set horAxis 1} {$horAxis <= $nIncCShapeZ} {incr horAxis} {
  for {set verAxis 1} {$verAxis <= $nIncCShapeH} {incr verAxis} {
    if {$horAxis <= $nIncPierZ} {
	  set matTag $concPier
	  set areaDia $areaDiaPier
    } else {
      set matTag $concPanel		
	  set areaDia $areaDiaPanel
    }
    set eleTag1 [expr {$coreWallTag + $compTag + $diaElemTag + $diaNum}]
	set iNode1 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set jNode1 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis}]]
    set mGNode1 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis}]]
    set nGNode1 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]
	#element Truss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho> <-rayleigh $rflag>
	#element CorotTruss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho>			
	if {[string equal $truss2Type "Truss2"]} {
	  element Truss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag -doRayleigh 1
	  lappend region_elem $eleTag1 
	  puts $recInput "element Truss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag -doRayleigh 1"
	} else {
	  element CorotTruss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag
	  lappend region_elem $eleTag1
	  puts $recInput "element CorotTruss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag"
	}
	incr diaNum	
    set eleTag2 [expr {$coreWallTag + $compTag + $diaElemTag + $diaNum}]
    set iNode2 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis}]]
    set jNode2 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]
    set mGNode2 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set nGNode2 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis}]]
    #element Truss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho> <-rayleigh $rflag>
	#element CorotTruss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho>			
    if {[string equal $truss2Type "Truss2"]} {
	  element Truss2 $eleTag2 $iNode2 $jNode2 $mGNode2 $nGNode2 $areaDia $matTag -doRayleigh 1
	  lappend region_elem $eleTag2
	  puts $recInput "element Truss2 $eleTag2 $iNode2 $jNode2 $mGNode2 $nGNode2 $areaDia $matTag -doRayleigh 1"
	} else {
	  element CorotTruss2 $eleTag2 $iNode2 $jNode2 $mGNode2 $nGNode2 $areaDia $matTag
	  lappend region_elem $eleTag2
	  puts $recInput "element CorotTruss2 $eleTag2 $iNode2 $jNode2 $mGNode2 $nGNode2 $areaDia $matTag"
	}	
	incr diaNum
  }
}

return $region_elem
};# proc diagonals

proc verElementsX {nIncCShapeX nIncCShapeZ nIncPierZ NipBound NipField secList transfTag coreWallTag compTag verElemTag listNodes recInput} {
set region_elem {}

puts $recInput "verElements dirX"
for {set verAxis 1} {$verAxis <= [expr {$nIncCShapeX+1}]} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= $nIncCShapeZ} {incr horAxis} {
    if {$verAxis == 1 || $verAxis == [expr {$nIncCShapeX+1}]} {
	  set Nip $NipBound
	  if {$horAxis <= $nIncPierZ} {
		set secInd [expr $verAxis - 1]
		set secTag [lindex $secList $secInd];# 	
	  } else {
		set secInd [expr $verAxis + 5]
	    set secTag [lindex $secList $secInd];# 
	  }	        	  
    } else {
      set Nip $NipField
	  if {$horAxis <= $nIncPierZ} {
		set secInd [expr $verAxis - 1]
		set secTag [lindex $secList $secInd];# 		
	  } else {
		set secInd [expr $verAxis + 5]
	    set secTag [lindex $secList $secInd];# 
	  }
	}	
    set eleTag [expr {$coreWallTag + $compTag + $verElemTag + ($verAxis-1)*$nIncCShapeZ + $horAxis}]
    set iNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 2}]]
    set jNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 1}]]    		
    #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType> 
    element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	lappend region_elem $eleTag
	puts $recInput "element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto"	     
  }
}

return $region_elem
};# proc verElementsX


proc verElementsY {nIncCShapeY nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag verElemTag listNodes recInput} {
set region_elem {}

puts $recInput "verElements dirY"
for {set verAxis 2} {$verAxis <= $nIncCShapeY} {incr verAxis} {
  for {set horAxis 1} {$horAxis <= $nIncCShapeZ} {incr horAxis} {	        	  
    if {$verAxis == 2} {
      if {$horAxis <= $nIncPierZ} {
		set secTag [lindex $secList 0];# sec_cyPia	
	  } else {
	    set secTag [lindex $secList 3];# sec_cyPaa
	  }
    } elseif {$verAxis <= [expr {$nIncCShapeY-1}]} {
      if {$horAxis <= $nIncPierZ} {
		set secTag [lindex $secList 1];# sec_cyPiv
	  } else {
	    set secTag [lindex $secList 4];# sec_cyPav
	  }	  
	} else {
	  if {$horAxis <= $nIncPierZ} {
		set secTag [lindex $secList 2];# sec_cyPia
	  } else {
	    set secTag [lindex $secList 5];# sec_cyPaa
	  }	  
	}	
    set eleTag [expr {$coreWallTag + $compTag + $verElemTag + ($verAxis-1)*$nIncCShapeZ + $horAxis}]
    set iNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 2}]]
    set jNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 1}]]    		
    #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType> 
    element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	lappend region_elem $eleTag
	puts $recInput "element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto"	     
  }
}

return $region_elem
};# proc verElementsY


proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList secSlab transfTag coreWallTag compTag horElemTag listNodes recInput} {
set region_elem {}

puts $recInput "horElements"
for {set horAxis 2} {$horAxis <= [expr ($nIncCShapeZ+1)]} {incr horAxis} {
  for {set verAxis 1} {$verAxis <= $nIncCShapeH} {incr verAxis} {
    set eleTag [expr {$coreWallTag + $compTag + $horElemTag + ($horAxis-1)*$nIncCShapeH + $verAxis}]
    set iNode [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set jNode [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]  
    #
    if {$horAxis <= $nIncPierZ} {
      set secTag [lindex $secList 0];# secPier	  
    } elseif {$horAxis == [expr {$nIncPierZ+1}]} {
      set secTag [lindex $secList 1];# secPierPanel		  
    #} elseif {$horAxis <= $nIncCShapeZ} {
	#  set secTag [lindex $secList 2];# secPanel
	} elseif {$horAxis == [expr ($nIncCShapeZ+1)]} {
	  set secTag [lindex $secList 3];# secSlab
	  # slab element
	  set eleTag_slab [expr {$eleTag + 500}]
	  #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType>
	  element dispBeamColumn $eleTag_slab $iNode $jNode $Nip $secSlab $transfTag -integration Lobatto
	  lappend region_elem $eleTag_slab
	  puts $recInput "element dispBeamColumn $eleTag_slab $iNode $jNode $Nip $secSlab $transfTag -integration Lobatto"
	} else {
	  set secTag [lindex $secList 2];# secPanel
    }		
    #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType>
    element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	lappend region_elem $eleTag
	puts $recInput "element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto"	
  }
}

return $region_elem
};# proc horElements


puts $recInput "component dirX, southwest"
set compTag $compSoWeTag
set lNodesCompSoWe [listNodesCompX $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeX $nIncCShapeZ $nIncPierZ $bconcd_pierX $bconcd_panelX $areaDiaPierX $areaDiaPanelX $coreWallTag $compTag $diaElemTag $lNodesCompSoWe $truss2Type $recInput]
#proc verElementsX {nIncCShapeX nIncCShapeZ nIncPierZ NipBound NipField secList transfTag coreWallTag compTag verElemTag listNodes recInput}           
append region_elem { } [verElementsX $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipBound $NipField $secListCxVertSWe $transfTagVerX $coreWallTag $compTag $verElemTag $lNodesCompSoWe $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipField $secListCxHorz $sec_CBslab $transfTagHorX $coreWallTag $compTag $horElemTag $lNodesCompSoWe $recInput]

puts $recInput "component dirX, northwest"
set compTag $compNoWeTag
set lNodesCompNoWe [listNodesCompX $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concBase concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeX $nIncCShapeZ $nIncPierZ $bconcd_pierX $bconcd_panelX $areaDiaPierX $areaDiaPanelX $coreWallTag $compTag $diaElemTag $lNodesCompNoWe $truss2Type $recInput]
#proc verElementsX {nIncCShapeX nIncCShapeZ nIncPierZ NipBound NipField secList transfTag coreWallTag compTag verElemTag listNodes recInput}           
append region_elem { } [verElementsX $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipBound $NipField $secListCxVertNWe $transfTagVerX $coreWallTag $compTag $verElemTag $lNodesCompNoWe $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipField $secListCxHorz $sec_CBslab $transfTagHorX $coreWallTag $compTag $horElemTag $lNodesCompNoWe $recInput]

puts $recInput "component dirY, west"
set compTag $compWeTag
set lNodesLeft [lrange $lNodesCompSoWe 0 $nIncCShapeZ]
set lNodesRight [lrange $lNodesCompNoWe 0 $nIncCShapeZ]
set lNodesCompWe [listNodesCompY $nIncCShapeY $nIncCShapeZ $story $coreWallTag $compTag $lNodesLeft $lNodesRight $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeY $nIncCShapeZ $nIncPierZ $bconcd_pierY $bconcd_panelY $areaDiaPierY $areaDiaPanelY $coreWallTag $compTag $diaElemTag $lNodesCompWe $truss2Type $recInput]
#proc verElementsY {nIncCShapeY nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag verElemTag listNodes recInput}
append region_elem { } [verElementsY $nIncCShapeY $nIncCShapeZ $nIncPierZ $NipBound $secListCyVert $transfTagVerY $coreWallTag $compTag $verElemTag $lNodesCompWe $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeY $nIncCShapeZ $nIncPierZ $NipField $secListCyHorz $sec_CBslab $transfTagHorY $coreWallTag $compTag $horElemTag $lNodesCompWe $recInput]

puts $recInput "component dirX, southeast"
set compTag $compSoEaTag
set lNodesCompSoEa [listNodesCompX $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeX $nIncCShapeZ $nIncPierZ $bconcd_pierX $bconcd_panelX $areaDiaPierX $areaDiaPanelX $coreWallTag $compTag $diaElemTag $lNodesCompSoEa $truss2Type $recInput]
#proc verElementsX {nIncCShapeX nIncCShapeZ nIncPierZ NipBound NipField secList transfTag coreWallTag compTag verElemTag listNodes recInput}           
append region_elem { } [verElementsX $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipBound $NipField $secListCxVertSEa $transfTagVerX $coreWallTag $compTag $verElemTag $lNodesCompSoEa $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipField $secListCxHorz $sec_CBslab $transfTagHorX $coreWallTag $compTag $horElemTag $lNodesCompSoEa $recInput]

puts $recInput "component dirX, northeast"
set compTag $compNoEaTag
set lNodesCompNoEa [listNodesCompX $nIncCShapeX $nIncCShapeZ $story $coreWallTag $compTag $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeX $nIncCShapeZ $nIncPierZ $bconcd_pierX $bconcd_panelX $areaDiaPierX $areaDiaPanelX $coreWallTag $compTag $diaElemTag $lNodesCompNoEa $truss2Type $recInput]
#proc verElementsX {nIncCShapeX nIncCShapeZ nIncPierZ NipBound NipField secList transfTag coreWallTag compTag verElemTag listNodes recInput}           
append region_elem { } [verElementsX $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipBound $NipField $secListCxVertNEa $transfTagVerX $coreWallTag $compTag $verElemTag $lNodesCompNoEa $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeX $nIncCShapeZ $nIncPierZ $NipField $secListCxHorz $sec_CBslab $transfTagHorX $coreWallTag $compTag $horElemTag $lNodesCompNoEa $recInput]

puts $recInput "component dirY, east"
set compTag $compEaTag
set lNodesLeft [lrange $lNodesCompSoEa end-$nIncCShapeZ end]
set lNodesRight [lrange $lNodesCompNoEa end-$nIncCShapeZ end]
set lNodesCompEa [listNodesCompY $nIncCShapeY $nIncCShapeZ $story $coreWallTag $compTag $lNodesLeft $lNodesRight $nIncCShapeZbelow $nStoryBTM]
#proc diagonals {nIncCShapeH nIncCShapeZ nIncPierZ concPier concPanel areaDiaPier areaDiaPanel coreWallTag compTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonals $nIncCShapeY $nIncCShapeZ $nIncPierZ $bconcd_pierY $bconcd_panelY $areaDiaPierY $areaDiaPanelY $coreWallTag $compTag $diaElemTag $lNodesCompEa $truss2Type $recInput]
#proc verElementsY {nIncCShapeY nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag verElemTag listNodes recInput}
append region_elem { } [verElementsY $nIncCShapeY $nIncCShapeZ $nIncPierZ $NipBound $secListCyVert $transfTagVerY $coreWallTag $compTag $verElemTag $lNodesCompEa $recInput]
#proc horElements {nIncCShapeH nIncCShapeZ nIncPierZ Nip secList transfTag coreWallTag compTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShapeY $nIncCShapeZ $nIncPierZ $NipField $secListCyHorz $sec_CBslab $transfTagHorY $coreWallTag $compTag $horElemTag $lNodesCompEa $recInput]




# coupling beams
proc elementsCB {coreWallTag cbTag fStiffCB transfTagVerX transfTagHorX AcDiaCB concDiaCB Ec AsDiaCB steelDiaCB Nip sec_CBv sec_CBhf sec_CBhe sec_CBslab truss2Type trussType recInput story anchorageCB entMat} {
set region_elem {}

set n1 [expr {$coreWallTag + $cbTag + 1}]
set n2 [expr {$coreWallTag + $cbTag + 2}]
set n3 [expr {$coreWallTag + $cbTag + 3}]
set n4 [expr {$coreWallTag + $cbTag + 4}]
set n5 [expr {$coreWallTag + $cbTag + 5}]
set n6 [expr {$coreWallTag + $cbTag + 6}]
set n7 [expr {$coreWallTag + $cbTag + 7}]
set n8 [expr {$coreWallTag + $cbTag + 8}]
set n9 [expr {$coreWallTag + $cbTag + 9}]
set n10 [expr {$coreWallTag + $cbTag + 10}]
set n11 [expr {$coreWallTag + $cbTag + 11}]
set n12 [expr {$coreWallTag + $cbTag + 12}]
set n13 [expr {$coreWallTag + $cbTag + 13}]
set n14 [expr {$coreWallTag + $cbTag + 14}]
set n15 [expr {$coreWallTag + $cbTag + 15}]

set Erig [expr {29000.*$fStiffCB}]
set Grig [expr {0.38*29000.*$fStiffCB}]
set Jrig [expr {0.141*10.*pow(10.,3)}]
set Arig [expr {24.*24*$fStiffCB}]
set Asof [expr {24.*24.*$Ec/$Erig*1e-3}]
set Irig [expr {10.*pow(10.,3)/12.*$fStiffCB}]

# #element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
if {$story == 4 || $story == 5 || $story == 6} {

	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 1}] $n1  $n2  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 2}] $n2  $n3  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 5}] $n13 $n14 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 6}] $n14 $n15 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	
} else {

	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 1}] $n1  $n2  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 2}] $n2  $n3  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 5}] $n13 $n14 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 6}] $n14 $n15 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
	
}

element elasticBeamColumn [expr {$coreWallTag + $cbTag + 11}] $n2  $n5  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 14}] $n11 $n14 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX

#if {$anchorageCB == 0} {

	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 7}]  $n1  $n4  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 10}] $n10 $n13 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 15}] $n3  $n6  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 18}] $n12 $n15 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
	
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 11}] $n2  $n5  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 14}] $n11 $n14 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 7}]  $n1  $n4  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 10}] $n10 $n13 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 15}] $n3  $n6  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 18}] $n12 $n15 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
	
#} else {
#	
#	if {$story == 36} {
#	
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 7}]  $n1  $n4  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 10}] $n10 $n13 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 15}] $n3  $n6  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 18}] $n12 $n15 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	
#	element truss [expr {$coreWallTag + $cbTag + 107}] $n1  $n4	 $Arig $entMat
#	element truss [expr {$coreWallTag + $cbTag + 110}] $n10 $n13 $Arig $entMat
#
#	lappend region_elem [expr {$coreWallTag + $cbTag + 107}]
#	lappend region_elem [expr {$coreWallTag + $cbTag + 110}]
#	
#	} else {
#
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 7}]  $n1  $n4  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 10}] $n10 $n13 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 15}] $n3  $n6  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	element elasticBeamColumn [expr {$coreWallTag + $cbTag + 18}] $n12 $n15 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagHorX
#	
#	element truss [expr {$coreWallTag + $cbTag + 107}] $n1  $n4	 $Arig $entMat
#	element truss [expr {$coreWallTag + $cbTag + 110}] $n10 $n13 $Arig $entMat
#	element truss [expr {$coreWallTag + $cbTag + 115}] $n3  $n6  $Arig $entMat
#	element truss [expr {$coreWallTag + $cbTag + 118}] $n12 $n15 $Arig $entMat
#	
#	lappend region_elem [expr {$coreWallTag + $cbTag + 107}]
#	lappend region_elem [expr {$coreWallTag + $cbTag + 110}]
#	lappend region_elem [expr {$coreWallTag + $cbTag + 115}]
#	lappend region_elem [expr {$coreWallTag + $cbTag + 118}]
#	
#	}
#
#} 


lappend region_elem [expr {$coreWallTag + $cbTag + 1}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 2}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 5}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 6}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 7}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 10}]
lappend region_elem [expr {$coreWallTag + $cbTag + 11}]
lappend region_elem [expr {$coreWallTag + $cbTag + 14}]
lappend region_elem [expr {$coreWallTag + $cbTag + 15}]
lappend region_elem [expr {$coreWallTag + $cbTag + 18}]

#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 1}] $n1  $n3  $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX"
#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 6}] $n13 $n15 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX"
#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 7}]  $n1  $n4  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 10}] $n10 $n13 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 15}] $n3  $n6  $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"
#puts $recInput "element elasticBeamColumn [expr {$coreWallTag + $cbTag + 18}] $n12 $n15 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagHorX"

#element Truss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho> <-rayleigh $rflag>
#element CorotTruss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho>
if {[string equal $truss2Type "Truss2"]} {
  
  element Truss2 [expr {$coreWallTag + $cbTag + 19}] $n4 $n8  $n5 $n7  $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 20}] $n5 $n7  $n4 $n8  $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 21}] $n7 $n11 $n8 $n10 $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 22}] $n8 $n10 $n7 $n11 $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 23}] $n5 $n9  $n6 $n8  $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 24}] $n6 $n8  $n5 $n9  $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 25}] $n8 $n12 $n9 $n11 $AcDiaCB $concDiaCB -doRayleigh 1
  element Truss2 [expr {$coreWallTag + $cbTag + 26}] $n9 $n11 $n8 $n12 $AcDiaCB $concDiaCB -doRayleigh 1
  
  lappend region_elem [expr {$coreWallTag + $cbTag + 19}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 20}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 21}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 22}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 23}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 24}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 25}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 26}]

  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 19}] $n4 $n8  $n5 $n7  $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 20}] $n5 $n7  $n4 $n8  $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 21}] $n7 $n11 $n8 $n10 $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 22}] $n8 $n10 $n7 $n11 $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 23}] $n5 $n9  $n6 $n8  $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 24}] $n6 $n8  $n5 $n9  $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 25}] $n8 $n12 $n9 $n11 $AcDiaCB $concDiaCB -doRayleigh 1"
  puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 26}] $n9 $n11 $n8 $n12 $AcDiaCB $concDiaCB -doRayleigh 1"
  
  #element Truss2 [expr {$coreWallTag + $cbTag + 500 + 1}] $n4 $n12 $n6 $n10 $AcDiaCB $concDiaCB -rayleigh 1
  #element Truss2 [expr {$coreWallTag + $cbTag + 500 + 2}] $n6 $n10 $n4 $n12 $AcDiaCB $concDiaCB -rayleigh 1

  #lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 1}]
  #lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 2}]
  
  #puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 500 + 1}] $n4 $n12 $n6 $n10 $AcDiaCB $concDiaCB -rayleigh 1"
  #puts $recInput "element Truss2 [expr {$coreWallTag + $cbTag + 500 + 2}] $n6 $n10 $n4 $n12 $AcDiaCB $concDiaCB -rayleigh 1"
  
} else {

  element CorotTruss2 [expr {$coreWallTag + $cbTag + 19}] $n4 $n8  $n5 $n7  $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 20}] $n5 $n7  $n4 $n8  $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 21}] $n7 $n11 $n8 $n10 $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 22}] $n8 $n10 $n7 $n11 $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 23}] $n5 $n9  $n6 $n8  $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 24}] $n6 $n8  $n5 $n9  $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 25}] $n8 $n12 $n9 $n11 $AcDiaCB $concDiaCB
  element CorotTruss2 [expr {$coreWallTag + $cbTag + 26}] $n9 $n11 $n8 $n12 $AcDiaCB $concDiaCB

  lappend region_elem [expr {$coreWallTag + $cbTag + 19}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 20}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 21}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 22}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 23}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 24}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 25}]
  lappend region_elem [expr {$coreWallTag + $cbTag + 26}]

  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 19}] $n4 $n8  $n5 $n7  $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 20}] $n5 $n7  $n4 $n8  $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 21}] $n7 $n11 $n8 $n10 $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 22}] $n8 $n10 $n7 $n11 $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 23}] $n5 $n9  $n6 $n8  $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 24}] $n6 $n8  $n5 $n9  $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 25}] $n8 $n12 $n9 $n11 $AcDiaCB $concDiaCB"
  puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 26}] $n9 $n11 $n8 $n12 $AcDiaCB $concDiaCB"  

  #element CorotTruss2 [expr {$coreWallTag + $cbTag + 500 + 1}] $n4 $n12 $n6 $n10 $AcDiaCB $concDiaCB
  #element CorotTruss2 [expr {$coreWallTag + $cbTag + 500 + 2}] $n6 $n10 $n4 $n12 $AcDiaCB $concDiaCB

  #lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 1}]
  #lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 2}]
  
  #puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 500 + 1}] $n4 $n12 $n6 $n10 $AcDiaCB $concDiaCB"
  #puts $recInput "element CorotTruss2 [expr {$coreWallTag + $cbTag + 500 + 2}] $n6 $n10 $n4 $n12 $AcDiaCB $concDiaCB"
}

element $trussType [expr {$coreWallTag + $cbTag + 500 + 19}] $n4 $n8  $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 22}] $n8 $n10 $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 24}] $n6 $n8  $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 25}] $n8 $n12 $AsDiaCB $steelDiaCB -doRayleigh 1

lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 19}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 22}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 24}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 25}]

puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 19}] $n4 $n8  $AsDiaCB $steelDiaCB -doRayleigh 1"
puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 22}] $n8 $n10 $AsDiaCB $steelDiaCB -doRayleigh 1"
puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 24}] $n6 $n8  $AsDiaCB $steelDiaCB -doRayleigh 1"
puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 25}] $n8 $n12 $AsDiaCB $steelDiaCB -doRayleigh 1"

#element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType> 
element dispBeamColumn [expr {$coreWallTag + $cbTag + 3}]  $n7 $n8  $Nip $sec_CBv  $transfTagVerX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 4}]  $n8 $n9  $Nip $sec_CBv  $transfTagVerX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 8}]  $n4 $n7  $Nip $sec_CBhe $transfTagHorX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 9}]  $n7 $n10 $Nip $sec_CBhe $transfTagHorX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 12}] $n5 $n8  $Nip $sec_CBhf $transfTagHorX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 13}] $n8 $n11 $Nip $sec_CBhf $transfTagHorX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 16}] $n6 $n9  $Nip $sec_CBhe $transfTagHorX -integration Lobatto
element dispBeamColumn [expr {$coreWallTag + $cbTag + 17}] $n9 $n12 $Nip $sec_CBhe $transfTagHorX -integration Lobatto

#element dispBeamColumn [expr {$coreWallTag + $cbTag + 516}] $n6 $n9  $Nip $sec_CBslab $transfTagHorX -integration Lobatto
#element dispBeamColumn [expr {$coreWallTag + $cbTag + 517}] $n9 $n12 $Nip $sec_CBslab $transfTagHorX -integration Lobatto

lappend region_elem [expr {$coreWallTag + $cbTag + 3}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 4}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 8}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 9}] 
lappend region_elem [expr {$coreWallTag + $cbTag + 12}]
lappend region_elem [expr {$coreWallTag + $cbTag + 13}]
lappend region_elem [expr {$coreWallTag + $cbTag + 16}]
lappend region_elem [expr {$coreWallTag + $cbTag + 17}]

#lappend region_elem [expr {$coreWallTag + $cbTag + 516}]
#lappend region_elem [expr {$coreWallTag + $cbTag + 517}]

puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 3}]  $n7 $n8  $Nip $sec_CBv  $transfTagVerX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 4}]  $n8 $n9  $Nip $sec_CBv  $transfTagVerX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 8}]  $n4 $n7  $Nip $sec_CBhe $transfTagHorX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 9}]  $n7 $n10 $Nip $sec_CBhe $transfTagHorX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 12}] $n5 $n8  $Nip $sec_CBhf $transfTagHorX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 13}] $n8 $n11 $Nip $sec_CBhf $transfTagHorX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 16}] $n6 $n9  $Nip $sec_CBhe $transfTagHorX -integration Lobatto"
puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 17}] $n9 $n12 $Nip $sec_CBhe $transfTagHorX -integration Lobatto"

#puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 516}] $n6 $n9  $Nip $sec_CBslab $transfTagHorX -integration Lobatto"
#puts $recInput "element dispBeamColumn [expr {$coreWallTag + $cbTag + 517}] $n9 $n12 $Nip $sec_CBslab $transfTagHorX -integration Lobatto"


#element $trussType [expr {$coreWallTag + $cbTag + 500 + 3}] $n4 $n12 $AsDiaCB $steelDiaCB -doRayleigh 1
#element $trussType [expr {$coreWallTag + $cbTag + 500 + 4}] $n6 $n10 $AsDiaCB $steelDiaCB -doRayleigh 1

#lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 3}]
#lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 4}]

#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 3}] $n4 $n12 $AsDiaCB $steelDiaCB -doRayleigh 1"
#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 4}] $n6 $n10 $AsDiaCB $steelDiaCB -doRayleigh 1"

return $region_elem
};# proc elementsCB

puts $recInput "coupling beam south"
set cbTag $cbSoTag
#proc elementsCB {coreWallTag cbTag fStiffCB transfTagVerX transfTagHorX AcDiaCB concDiaCB Ec AsDiaCB steelDiaCB Nip sec_CBv sec_CBhf sec_CBhe sec_CBslab truss2Type trussType recInput story}
append region_elem { } [elementsCB $coreWallTag $cbTag $fStiffCB $transfTagVerX $transfTagHorX $areaDiaCB $bconcd_CB $Ec $AsDiaCB $SteelMatTagCB $NipField $sec_CBv $sec_CBhf $sec_CBhe $sec_CBslab $truss2Type $trussType $recInput $story $anchorageCB $sEntMat]

puts $recInput "coupling beam north"
set cbTag $cbNoTag
#proc elementsCB {coreWallTag cbTag fStiffCB transfTagVerX transfTagHorX AcDiaCB concDiaCB Ec AsDiaCB steelDiaCB Nip sec_CBv sec_CBhf sec_CBhe sec_CBslab truss2Type trussType recInput story}
append region_elem { } [elementsCB $coreWallTag $cbTag $fStiffCB $transfTagVerX $transfTagHorX $areaDiaCB $bconcd_CB $Ec $AsDiaCB $SteelMatTagCB $NipField $sec_CBv $sec_CBhf $sec_CBhe $sec_CBslab $truss2Type $trussType $recInput $story $anchorageCB $sEntMat]


# anchorage coupling beams
proc elementsAnchorCB {story coreWallTag cbTag fStiffCB transfTagVerX Ec AsDiaCB steelDiaCB trussType recInput} {
set region_elem {}

set n16 [expr {$coreWallTag + $cbTag + 16}]
set n17 [expr {$coreWallTag + $cbTag + 17}]
set n18 [expr {$coreWallTag + $cbTag + 18}]
set n19 [expr {$coreWallTag + $cbTag + 19}]
set n20 [expr {$coreWallTag + $cbTag + 20}]
set n21 [expr {$coreWallTag + $cbTag + 21}]
set n22 [expr {$coreWallTag + $cbTag + 22}]
set n23 [expr {$coreWallTag + $cbTag + 23}]
set n24 [expr {$coreWallTag + $cbTag + 24}]
set n25 [expr {$coreWallTag + $cbTag + 25}]
set n26 [expr {$coreWallTag + $cbTag + 26}]
set n27 [expr {$coreWallTag + $cbTag + 27}]

set Erig [expr {29000.*$fStiffCB}]
set Grig [expr {0.38*29000.*$fStiffCB}]
set Jrig [expr {0.333*12.*pow(12.,3)}]
set Arig [expr {12.*12.*$fStiffCB}]
set Asof [expr {12.*12.*1e-6}]
set Irig [expr {12.*pow(12.,3)/12.*$fStiffCB}]

if {$story == 1} {

#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 31}] $n16 $n17 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 32}] $n17 $n18 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 33}] $n19 $n20 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 34}] $n20 $n21 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX

lappend region_elem [expr {$coreWallTag + $cbTag + 31}]
lappend region_elem [expr {$coreWallTag + $cbTag + 32}]
lappend region_elem [expr {$coreWallTag + $cbTag + 33}]
lappend region_elem [expr {$coreWallTag + $cbTag + 34}]

} else {
#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag <-mass $massDens> <-cMass>
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 31}] $n16 $n17 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 32}] $n17 $n18 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 33}] $n19 $n20 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX	
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 34}] $n20 $n21 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 35}] $n22 $n23 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 36}] $n23 $n24 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 37}] $n25 $n26 $Arig $Erig $Grig $Jrig $Irig $Irig $transfTagVerX
element elasticBeamColumn [expr {$coreWallTag + $cbTag + 38}] $n26 $n27 $Asof $Erig $Grig $Jrig $Irig $Irig $transfTagVerX

lappend region_elem [expr {$coreWallTag + $cbTag + 31}]
lappend region_elem [expr {$coreWallTag + $cbTag + 32}]
lappend region_elem [expr {$coreWallTag + $cbTag + 33}]
lappend region_elem [expr {$coreWallTag + $cbTag + 34}]
lappend region_elem [expr {$coreWallTag + $cbTag + 35}]
lappend region_elem [expr {$coreWallTag + $cbTag + 36}]
lappend region_elem [expr {$coreWallTag + $cbTag + 37}]
lappend region_elem [expr {$coreWallTag + $cbTag + 38}]

}

set n4  [expr {$coreWallTag + $cbTag + 4}]
set n10 [expr {$coreWallTag + $cbTag + 10}]
set n6 [expr {$coreWallTag + $cbTag -100000 + 6}]
set n12 [expr {$coreWallTag + $cbTag -100000 + 12}]

if {$story == 1} {
#element truss $eleTag $iNode $jNode $A $matTag <-rho $rho> <-cMass $cFlag> <-doRayleigh $rFlag>
element $trussType [expr {$coreWallTag + $cbTag + 500 + 5}] $n17 $n4  $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 6}] $n10 $n20 $AsDiaCB $steelDiaCB -doRayleigh 1

lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 5}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 6}]

#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 5}] $n17 $n4  $AsDiaCB $steelDiaCB -doRayleigh 1"
#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 6}] $n10 $n20 $AsDiaCB $steelDiaCB -doRayleigh 1"

} else {
#element truss $eleTag $iNode $jNode $A $matTag <-rho $rho> <-cMass $cFlag> <-doRayleigh $rFlag>
element $trussType [expr {$coreWallTag + $cbTag + 500 + 5}] $n17 $n4  $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 6}] $n10 $n20 $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 7}] $n23 $n6 $AsDiaCB $steelDiaCB -doRayleigh 1
element $trussType [expr {$coreWallTag + $cbTag + 500 + 8}] $n12 $n26 $AsDiaCB $steelDiaCB -doRayleigh 1

lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 5}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 6}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 7}]
lappend region_elem [expr {$coreWallTag + $cbTag + 500 + 8}]

#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 5}] $n17 $n4  $AsDiaCB $steelDiaCB -doRayleigh 1"
#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 6}] $n10 $n20 $AsDiaCB $steelDiaCB -doRayleigh 1"
#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 7}] $n23 $n6 $AsDiaCB $steelDiaCB -doRayleigh 1"
#puts $recInput "element $trussType [expr {$coreWallTag + $cbTag + 500 + 8}] $n12 $n26 $AsDiaCB $steelDiaCB -doRayleigh 1"

}

return $region_elem
};# elementsAnchorCB


if {$anchorageCB} {
puts $recInput "anchorage coupling beam south"
set cbTag $cbSoTag
#proc elementsAnchorCB {story coreWallTag cbTag fStiffCB transfTagVerX Ec AsDiaCB steelDiaCB trussType recInput}
append region_elem { } [elementsAnchorCB $story $coreWallTag $cbTag $fStiffCB $transfTagVerX $Ec $AsDiaCB $SteelMatTagCB $trussType $recInput]

puts $recInput "anchorage coupling beam north"
set cbTag $cbNoTag
#proc elementsAnchorCB {story coreWallTag cbTag fStiffCB transfTagVerX Ec AsDiaCB steelDiaCB trussType recInput}
append region_elem { } [elementsAnchorCB $story $coreWallTag $cbTag $fStiffCB $transfTagVerX $Ec $AsDiaCB $SteelMatTagCB $trussType $recInput]
}

# region
#region $regTag <-ele ($ele1 $ele2 ...)> <-eleOnly ($ele1 $ele2 ...)> <-eleRange $startEle $endEle> <-eleOnlyRange $startEle $endEle>
#<-node ($node1 $node2 ...)> <-nodeOnly ($node1 $node2 ...)> <-nodeRange $startNode $endNode> <-nodeOnlyRange $startNode $endNode>
#<-node all> <-rayleigh $alphaM $betaK $betaKinit $betaKcomm>
#eval region [expr 2000 + $story] -ele $region_elem
