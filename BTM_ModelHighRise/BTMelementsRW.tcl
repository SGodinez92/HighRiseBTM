# elements
if {$dispflag} {puts "\nelements story$story"}; puts $recInput "\nelements story$story"
set region_elem {}

#set nStoryBTM [expr $story-$nStoryFiber]
set nStoryBTM $story

# geometric transformation
set transfTagVer [expr {$coreWallTag + 1}]
geomTransf $geomType $transfTagVer 1 0 0
puts $recInput "geomTransf $geomType $transfTagVer 1 0 0"
set transfTagHor [expr {$coreWallTag + 2}]
geomTransf $geomType $transfTagHor 0 0 1
puts $recInput "geomTransf $geomType $transfTagHor 0 0 1"

# Rectangular Walls
proc listNodesComp {nIncCShape nIncCShapeZ story coreWallTag nIncCShapeZbelow} {
set listNodes {}
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
	lappend listNodes $nodeTag	
	incr nodeNum
  }
}
#puts "List nodes $listNodes"
return $listNodes
};# proc listNodesComp


proc diagonalsRec {nIncCShapeH nIncCShapeZ nIncPierZ concPier areaDiaPier coreWallTag diaElemTag listNodes truss2Type recInput} {
set region_elem {}

puts $recInput "diagonals"
set diaNum 1
for {set horAxis 1} {$horAxis <= $nIncCShapeZ} {incr horAxis} {
  for {set verAxis 1} {$verAxis <= $nIncCShapeH} {incr verAxis} {
	set matTag $concPier
	set areaDia $areaDiaPier
    set eleTag1 [expr {$coreWallTag + $diaElemTag + $diaNum}]
	set iNode1 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set jNode1 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis}]]
    set mGNode1 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis}]]
    set nGNode1 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]
	#element Truss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho> <-rayleigh $rflag>
	#element CorotTruss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho>			
	if {[string equal $truss2Type "Truss2"]} {
	  element Truss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag -doRayleigh 1
	  #element truss $eleTag1 $iNode1 $jNode1 $areaDia $matTag -doRayleigh 1
	  lappend region_elem $eleTag1 
	  puts $recInput "element Truss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag -doRayleigh 1"
	} else {
	  element CorotTruss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag
	  lappend region_elem $eleTag1
	  puts $recInput "element CorotTruss2 $eleTag1 $iNode1 $jNode1 $mGNode1 $nGNode1 $areaDia $matTag"
	}
	incr diaNum	
    set eleTag2 [expr {$coreWallTag + $diaElemTag + $diaNum}]
    set iNode2 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis}]]
    set jNode2 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]
    set mGNode2 [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set nGNode2 [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis}]]
    #element Truss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho> <-rayleigh $rflag>
	#element CorotTruss2 $eleTag $iNode $jNode $mGNode $nGNode $A $matTag <-rho $rho>			
    if {[string equal $truss2Type "Truss2"]} {
	  element Truss2 $eleTag2 $iNode2 $jNode2 $mGNode2 $nGNode2 $areaDia $matTag -doRayleigh 1
	  #element truss $eleTag2 $iNode2 $jNode2 $areaDia $matTag -doRayleigh 1
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

proc verElements {nIncCShape nIncCShapeZ NipBound NipField secList transfTag coreWallTag verElemTag listNodes recInput story} {
set region_elem {}

puts $recInput "verElements"
for {set verAxis 1} {$verAxis <= [expr {$nIncCShape+1}]} {incr verAxis} {
	set ind [expr $verAxis - 1]
	if {$story > 6} {
		if {$verAxis == 3 || $verAxis == 4 || $verAxis == 5} {
			set secTag [lindex $secList 2]
		} elseif {$verAxis > 5} {
			set ind [expr $verAxis - 3]
			set secTag [lindex $secList $ind] 		
		} else {
			set secTag [lindex $secList $ind];
		}
	} else {
		set secTag [lindex $secList $ind];
	}
	for {set horAxis 1} {$horAxis <= $nIncCShapeZ} {incr horAxis} {
		if {$verAxis == 3 || $verAxis == 4 || $verAxis == 5} {
			set Nip $NipField
		} else {
			set Nip $NipBound
		}
    set eleTag [expr {$coreWallTag + $verElemTag + ($verAxis-1)*$nIncCShapeZ + $horAxis}]
    set iNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 2}]]
    set jNode [lindex $listNodes [expr {($verAxis-1)*$nIncCShapeZ + $horAxis + $verAxis - 1}]]    		
    #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType> 
    element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	#element forceBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	lappend region_elem $eleTag
	puts $recInput "element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto"	     
	}
}

return $region_elem
};# proc verElementsX


proc horElements {nIncCShapeH nIncCShapeZ Nip secList secSlab transfTag coreWallTag horElemTag listNodes recInput} {
set region_elem {}

puts $recInput "horElements"
for {set horAxis 2} {$horAxis <= [expr ($nIncCShapeZ+1)]} {incr horAxis} {
  for {set verAxis 1} {$verAxis <= $nIncCShapeH} {incr verAxis} {
    set eleTag [expr {$coreWallTag + $horElemTag + ($horAxis-1)*$nIncCShapeH + $verAxis}]
    set iNode [lindex $listNodes [expr {($verAxis-1)*($nIncCShapeZ+1) + $horAxis - 1}]]
    set jNode [lindex $listNodes [expr {$verAxis*($nIncCShapeZ+1) + $horAxis - 1}]]  
	if {$horAxis == [expr ($nIncCShapeZ+1)]} {
		set secTag [lindex $secList 1];	#secSlab
		# slab element
		set eleTag_slab [expr {$eleTag + 500}]
		#element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType>
		element dispBeamColumn $eleTag_slab $iNode $jNode $Nip $secSlab $transfTag -integration Lobatto
		lappend region_elem $eleTag_slab
		puts $recInput "element dispBeamColumn $eleTag_slab $iNode $jNode $Nip $secSlab $transfTag -integration Lobatto"
	} else {
		set secTag [lindex $secList 0];	#field
	}
    #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts $secTag $transfTag <-mass $massDens> <-cMass> <-integration $intType>
    element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
    #element forceBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto
	lappend region_elem $eleTag
	puts $recInput "element dispBeamColumn $eleTag $iNode $jNode $Nip $secTag $transfTag -integration Lobatto"	
  }
}

return $region_elem
};# proc horElements


#proc listNodesComp {nIncCShape nIncCShapeZ story coreWallTag nIncCShapeZbelow}
set lNodesComp [listNodesComp $nIncCShape $nIncCShapeZ $story $coreWallTag $nIncCShapeZbelow]
#proc diagonalsRec {nIncCShapeH nIncCShapeZ nIncPierZ concPier areaDiaPier coreWallTag diaElemTag listNodes truss2Type recInput}
append region_elem { } [diagonalsRec $nIncCShape $nIncCShapeZ $nIncPierZ $bconcd_pierX $areaDiaPier $coreWallTag $diaElemTag $lNodesComp $truss2Type $recInput]
#proc verElements {nIncCShape nIncCShapeZ NipBound NipField secList transfTag coreWallTag verElemTag listNodes recInput} {
append region_elem { } [verElements $nIncCShape $nIncCShapeZ $NipBound $NipField $secListCx $transfTagVer $coreWallTag $verElemTag $lNodesComp $recInput $story]
#proc horElements {nIncCShapeH nIncCShapeZ Nip secList transfTag coreWallTag horElemTag listNodes recInput}
append region_elem { } [horElements $nIncCShape $nIncCShapeZ $NipField $secListCxHorz $sec_slab $transfTagHor $coreWallTag $horElemTag $lNodesComp $recInput]


# region
#region $regTag <-ele ($ele1 $ele2 ...)> <-eleOnly ($ele1 $ele2 ...)> <-eleRange $startEle $endEle> <-eleOnlyRange $startEle $endEle>
#<-node ($node1 $node2 ...)> <-nodeOnly ($node1 $node2 ...)> <-nodeRange $startNode $endNode> <-nodeOnlyRange $startNode $endNode>
#<-node all> <-rayleigh $alphaM $betaK $betaKinit $betaKcomm>
#eval region [expr 2000 + $story] -ele $region_elem
