# gravity
if {$dispflag} {puts "\ngravity story$story"}; puts $recInput "\ngravity story$story"

set liveFac 0.20;

if {$story == 3 || $story == 11} {
	set thickness [expr 12.*$in]
} else {
	set thickness [expr 8.*$in]
}

if {$story < 3} {
	set w_DL [expr 10.*$psf]
} else {
	set w_DL [expr 20.*$psf]
}

if {$story == 36} {
	set w_LL [expr 20.*$psf]
} elseif {$story < 3 || $story > 11} {
	set w_LL [expr 40.*$psf]
} elseif {$story < 6 || $story == 11} {
	set w_LL [expr 100.*$psf]
} else {
	set w_LL [expr 50.*$psf]
}

set gama_conc [expr 150.*$pcf]

set w_SL [expr $thickness*$gama_conc]
set w_SDL [expr $w_DL + $w_SL]

set w_tot [expr $w_SDL + $w_LL*$liveFac]

set w_slab4 [expr 4.*$gama_conc]
set w_int [expr {$w_slab4 + 20.*$psf + $liveFac*100.*$psf}]

#component flanges
set wl_cx [expr {$w_tot*144. + $w_int*144.}];

#component webs
set wl_cy [expr {$w_tot*144.}];	#Web

#Corners
set AcornNW [expr {144.*144.}];	#Northwest corner
set AcornNE [expr {144.*144.}]; #Northeast corner
set AcornSE [expr {144.*144.}];	#Southeast corner
set AcornSW [expr {144.*144.}];	#Southwest corner

set PcornNW [expr $w_tot*$AcornNW]
set PcornNE [expr $w_tot*$AcornNE]
set PcornSE [expr $w_tot*$AcornSE]
set PcornSW [expr $w_tot*$AcornSW]

# self
set wself_wall [expr {$tWall*$lCshapeZ*$gama_conc}]
set wself_cb [expr {$tWall*$hBeam*$gama_conc}]

# tributary lengths slab
set LtribSlab_cx_cornx [expr {$incCshapeX/2.}]
set LtribSlab_cx_corny [expr {$incCshapeY/2.}]
set LtribSlab_cx_field $incCshapeX
set LtribSlab_cx_flang [expr {$incCshapeX/2. + ($sCshape-$lCB)/4.}]

set LtribSlab_cy_field $incCshapeY

#set LtribSlab_cb_cent $incHCB
#set LtribSlab_cb_edge [expr {($sCshape-$lCB)/4. + $incHCB/2.}]
set LtribSlab_cb_edge [expr {($sCshape-$lCB)/4. + $incHCB}]

# tributary lengths self
set LtribSelf_cx_corn [expr {$tWall/2. + $incCshapeX/2.}]
set LtribSelf_cx_field $incCshapeX
set LtribSelf_cx_flang [expr {$incCshapeX/2. + ($sCshape-$lCB)/2.}]

set LtribSelf_cy_adj [expr {$incCshapeY - $tWall/2. + $incCshapeY/2.}]
set LtribSelf_cy_field $incCshapeY

#set LtribSelf_cb_cent $incHCB
#set LtribSelf_cb_edge [expr {$incHCB/2.}]
set LtribSelf_cb_edge $incHCB

# loads corners
set P_cx_cornNW [expr {$PcornNW + $LtribSlab_cx_cornx*$wl_cx + $LtribSlab_cx_corny*$wl_cy + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornNE [expr {$PcornNE + $LtribSlab_cx_cornx*$wl_cx + $LtribSlab_cx_corny*$wl_cy + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornSE [expr {$PcornSE + $LtribSlab_cx_cornx*$wl_cx + $LtribSlab_cx_corny*$wl_cy + $LtribSelf_cx_corn*$wself_wall}]
set P_cx_cornSW [expr {$PcornSW + $LtribSlab_cx_cornx*$wl_cx + $LtribSlab_cx_corny*$wl_cy + $LtribSelf_cx_corn*$wself_wall}]

# loads south flanges
set P_cx_field_s [expr {$LtribSlab_cx_field*$wl_cx + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_s [expr {$LtribSlab_cx_flang*$wl_cx + $LtribSelf_cx_flang*$wself_wall}]

# loads north flanges
set P_cx_field_n [expr {$LtribSlab_cx_field*$wl_cx + $LtribSelf_cx_field*$wself_wall}]
set P_cx_flang_n [expr {$LtribSlab_cx_flang*$wl_cx + $LtribSelf_cx_flang*$wself_wall}]

# loads west flanges
set P_cy_adj_w   [expr {$LtribSlab_cy_field*$wl_cy + $LtribSelf_cy_adj*$wself_wall}]
set P_cy_field_w [expr {$LtribSlab_cy_field*$wl_cy + $LtribSelf_cy_field*$wself_wall}]

# loads east flanges
set P_cy_adj_e   [expr {$LtribSlab_cy_field*$wl_cy + $LtribSelf_cy_adj*$wself_wall}]
set P_cy_field_e [expr {$LtribSlab_cy_field*$wl_cy + $LtribSelf_cy_field*$wself_wall}]

# loads CB north
#set P_cb_cent_n [expr {$LtribSlab_cb_cent*$wl_cx + $LtribSelf_cb_cent*$wself_cb}]
set P_cb_edge_n [expr {$LtribSlab_cb_edge*$wl_cx + $LtribSelf_cb_edge*$wself_cb}]

# loads CB south
#set P_cb_cent_s [expr {$LtribSlab_cb_cent*$wl_cx + $LtribSelf_cb_cent*$wself_cb}]
set P_cb_edge_s [expr {$LtribSlab_cb_edge*$wl_cx + $LtribSelf_cb_edge*$wself_cb}]


set patternTag [expr 100*$CWtag + $story]

pattern Plain $patternTag "Linear" { 

	load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornSW 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_s 0 0 0
	}
	
	load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_s 0 0 0
	#
	load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornNW 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_n 0 0 0
	}
	
	load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_n 0 0 0
	#
	load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_w 0 0 0
	
	for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
		load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_w 0 0 0
	}
	
	load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_w 0 0 0
	load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_s 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_s 0 0 0
	}
	
	load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornSE 0 0 0
	#
	load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_n 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
		load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_n 0 0 0
	}
	
	load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornNE 0 0 0
	#
	load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_e 0 0 0
	
	for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
		load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_e 0 0 0
	}
	
	load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_e 0 0 0
	
	load [expr {$coreWallTag + $cbSoTag + 6}]  0 0 -$P_cb_edge_s 0 0 0
	#load [expr {$coreWallTag + $cbSoTag + 9}]  0 0 -$P_cb_cent_s 0 0 0
	load [expr {$coreWallTag + $cbSoTag + 12}] 0 0 -$P_cb_edge_s 0 0 0
	
	load [expr {$coreWallTag + $cbNoTag + 6}]  0 0 -$P_cb_edge_n 0 0 0
	#load [expr {$coreWallTag + $cbNoTag + 9}]  0 0 -$P_cb_cent_n 0 0 0
	load [expr {$coreWallTag + $cbNoTag + 12}] 0 0 -$P_cb_edge_n 0 0 0
  
}

puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornSW 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_s 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compSoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_s 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_cornNW 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_n 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compNoWeTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_flang_n 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_w 0 0 0"
for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_w 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compWeTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_w 0 0 0"


puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_s 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_s 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compSoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornSE 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_flang_n 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShapeX} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field_n 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compNoEaTag + ($nIncCShapeZ+1)*($nIncCShapeX+1)}] 0 0 -$P_cx_cornNE 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*2}] 0 0 -$P_cy_adj_e 0 0 0"
for {set verAxis 3} {$verAxis <= [expr {$nIncCShapeY - 1}]} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cy_field_e 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + $compEaTag + ($nIncCShapeZ+1)*$nIncCShapeY}] 0 0 -$P_cy_adj_e 0 0 0"


puts $recInput "load [expr {$coreWallTag + $cbSoTag + 6}]  0 0 -$P_cb_edge_s 0 0 0"
#puts $recInput "load [expr {$coreWallTag + $cbSoTag + 9}]  0 0 -$P_cb_cent_s 0 0 0"
puts $recInput "load [expr {$coreWallTag + $cbSoTag + 12}] 0 0 -$P_cb_edge_s 0 0 0"
#
puts $recInput "load [expr {$coreWallTag + $cbNoTag + 6}]  0 0 -$P_cb_edge_n 0 0 0"
#puts $recInput "load [expr {$coreWallTag + $cbNoTag + 9}]  0 0 -$P_cb_cent_n 0 0 0"
puts $recInput "load [expr {$coreWallTag + $cbNoTag + 12}] 0 0 -$P_cb_edge_n 0 0 0"
