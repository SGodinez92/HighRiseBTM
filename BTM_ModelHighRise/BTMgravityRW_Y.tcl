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

#component
set wl_c [expr {$w_tot*288.}];

#Corners
set Acorn  [expr {144.*288.}];	#Corner

set Pcorn  [expr $w_tot*$Acorn]

# self
set wself_wall [expr {$tWall*$lCshapeZ*$gama_conc}]

# tributary lengths slab
set LtribSlab_cx_corn [expr {$incCshape/2.}]
set LtribSlab_cx_field $incCshape

# tributary lengths self
set LtribSelf_cx_corn [expr {$incCshape/2.}]
set LtribSelf_cx_field $incCshape

# loads corners
set P_cx_corn [expr {$Pcorn + $LtribSlab_cx_corn*$wl_c + $LtribSelf_cx_corn*$wself_wall}]


# loads field
set P_cx_field [expr {$LtribSlab_cx_field*$wl_c + $LtribSelf_cx_field*$wself_wall}]

set patternTag [expr 100*$CWtag + $story]

pattern Plain $patternTag "Linear" { 

	load [expr {$coreWallTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_corn 0 0 0
	
	for {set verAxis 2} {$verAxis <= $nIncCShape} {incr verAxis} {
		load [expr {$coreWallTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field 0 0 0
	}
	
	load [expr {$coreWallTag + ($nIncCShapeZ+1)*($nIncCShape+1)}] 0 0 -$P_cx_corn 0 0 0
}

puts $recInput "load [expr {$coreWallTag + ($nIncCShapeZ+1)}] 0 0 -$P_cx_corn 0 0 0"
for {set verAxis 2} {$verAxis <= $nIncCShape} {incr verAxis} {
  puts $recInput "load [expr {$coreWallTag + ($nIncCShapeZ+1)*$verAxis}] 0 0 -$P_cx_field 0 0 0"
}
puts $recInput "load [expr {$coreWallTag + ($nIncCShapeZ+1)*($nIncCShape+1)}] 0 0 -$P_cx_corn 0 0 0"
#