
 ############################# Stringer-Panel #######################################
 
#set Ec5	[expr 33000.*pow(0.140 + 5./1000,1.5)*sqrt(5.)*$ksi];	# Young's Modulus of Concrete 5 ksi
#set Ec6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set nuc 0.2
set stiffFacPan 0.5
set stiffFacStr 0.5

set compSoWeTag 10000;
set compNoWeTag 20000;
set compSoEaTag 40000;
set compNoEaTag 50000;

set nIncCShapeX 5;
set nIncCShapeRec 6;

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i == 11 || $i == 3} {
		set Ec $Ec6
		set thickness [expr 12.*$in]
	} else {
		set Ec $Ec5
		set thickness [expr 8.*$in]
	}

	set stringA_12 [expr $thickness*12.*$ft]
	set stringA_15 [expr $thickness*15.*$ft]
	
	set w_DL [expr 20.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]

	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	if {$i <= 3 || $i > 12} {
		set nIncZ 4;	# UPDATE FROM BTMcoreWall.tcl
	} elseif {$i <= 6} {
		set nIncZ 7;	# UPDATE FROM BTMcoreWall.tcl
	} else {
		set nIncZ 5;
	}
	
	if {$i == 4 || $i == 5 || $i == 6} {
		set nIncRecZ 4;		# UPDATE FROM BTMrecWall.tcl
	} else {
		set nIncRecZ 3;		# UPDATE FROM BTMrecWall.tcl
	}
	
	set coreWallTag [expr {10000000 + 100000*$i}];
	set recWallTag1 [expr {30000000 + 100000*$i}];
	set recWallTag2 [expr {40000000 + 100000*$i}];
	set recWallTag3 [expr {50000000 + 100000*$i}];
	
	set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncZ + 1]
	set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncZ + 1]
	set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	
	set nodeTagRecXW1 [expr $recWallTag1 + $nIncRecZ + 1]
	set nodeTagRecYS1 [expr $recWallTag2 + $nIncRecZ + 1]
	set nodeTagRecYS2 [expr $recWallTag3 + $nIncRecZ + 1]
	
	set nodeTagRecXE1 [expr $recWallTag1 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	set nodeTagRecYN1 [expr $recWallTag2 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	set nodeTagRecYN2 [expr $recWallTag3 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	
	if {$i <= 3} {
		
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTagRecXW1] [expr $nodeTag +  22]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTagRecXE1] [expr $nodeTagRecXW1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $nodeTagRecXE1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  26] [expr $nodeTag +  25]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  27] [expr $nodeTag +  26]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  28] [expr $nodeTag +  27]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  29] [expr $nodeTag +  28]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  30] [expr $nodeTag +  29]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  31] [expr $nodeTag +  30]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  32] [expr $nodeTag +  31]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  33] [expr $nodeTag +  32]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $nodeTagRecXW1] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $nodeTagRecXW1] [expr $nodeTagRecXE1] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $nodeTagRecXE1] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $nodeTagRecYS1] [expr $nodeTag +  65]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $nodeTagRecYS1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]	  [expr $nodeTag +  68]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $nodeTagRecYS2] [expr $nodeTag +  71]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $nodeTagRecYS2]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  65] [expr $nodeTagRecYS1] [expr $nodeTagRecYN1] [expr $nodeTag +  74]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $nodeTagRecYS1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $nodeTagRecYN1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  67] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  71] [expr $nodeTagRecYS2] [expr $nodeTagRecYN2] [expr $nodeTag +  80]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  71] [expr $nodeTagRecYS2] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $nodeTagRecYN2]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  75] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  78] [expr $nodeTagNWe] 	  [expr $nodeTagNEa] 	[expr $nodeTag +  89] [expr $nodeTag +  88]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  79] [expr $nodeTagNEa] 	  [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  80] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  81] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  80] [expr $nodeTagRecYN2] [expr $nodeTag +  93] [expr $nodeTag +  92]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  83] [expr $nodeTagRecYN2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	} elseif {$i <= 11} {
	
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTagRecXW1] [expr $nodeTag +  22]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTagRecXE1] [expr $nodeTagRecXW1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $nodeTagRecXE1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $nodeTagRecXW1] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTagRecXW1] [expr $nodeTagRecXE1] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTagRecXE1] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $nodeTagRecYS1] [expr $nodeTag +  65]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $nodeTagRecYS1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]	  [expr $nodeTag +  68]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $nodeTagRecYS2] [expr $nodeTag +  71]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $nodeTagRecYS2]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  65] [expr $nodeTagRecYS1] [expr $nodeTagRecYN1] [expr $nodeTag +  74]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $nodeTagRecYS1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $nodeTagRecYN1]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  71] [expr $nodeTagRecYS2] [expr $nodeTagRecYN2] [expr $nodeTag +  80]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $nodeTagRecYS2] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $nodeTagRecYN2]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $nodeTagRecYN1] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $nodeTagNWe] 	  [expr $nodeTagNEa] 	[expr $nodeTag +  89] [expr $nodeTag +  88]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $nodeTagNEa] 	  [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  80] [expr $nodeTagRecYN2] [expr $nodeTag +  93] [expr $nodeTag +  92]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  67] [expr $nodeTagRecYN2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	} else {
		
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]    [expr $nodeTag +  68]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTagNWe]    [expr $nodeTagNEa]    [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringA_12 $stringA_15 $stringA_12 $stringA_15 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTagNEa]    [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringA_12 $stringA_12 $stringA_12 $stringA_12 $Ec $nuc $thickness $stiffFacStr $stiffFacPan -rho $rho
	
	}
}

if {1} {
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	if {$i <= 3 || $i > 12} {
		set nIncZ 4;	# UPDATE FROM BTMcoreWall.tcl
	} elseif {$i <= 6} {
		set nIncZ 7;	# UPDATE FROM BTMcoreWall.tcl
	} else {
		set nIncZ 5;
	}
	
	if {$i == 4 || $i == 5 || $i == 6} {
		set nIncRecZ 4;		# UPDATE FROM BTMrecWall.tcl
	} else {
		set nIncRecZ 3;		# UPDATE FROM BTMrecWall.tcl
	}
		
	set coreWallTag [expr {10000000 + 100000*$i}];
	set recWallTag1 [expr {30000000 + 100000*$i}];
	set recWallTag2 [expr {40000000 + 100000*$i}];
	set recWallTag3 [expr {50000000 + 100000*$i}];
	
	set nodeTagSWe [expr $coreWallTag + $compSoWeTag + $nIncZ + 1]
	set nodeTagNWe [expr $coreWallTag + $compNoWeTag + $nIncZ + 1]
	set nodeTagSEa [expr $coreWallTag + $compSoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	set nodeTagNEa [expr $coreWallTag + $compNoEaTag + ($nIncZ + 1)*($nIncCShapeX + 1)]
	
	set nodeTagRecXW1 [expr $recWallTag1 + $nIncRecZ + 1]
	set nodeTagRecYS1 [expr $recWallTag2 + $nIncRecZ + 1]
	set nodeTagRecYS2 [expr $recWallTag3 + $nIncRecZ + 1]
	
	set nodeTagRecXE1 [expr $recWallTag1 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	set nodeTagRecYN1 [expr $recWallTag2 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	set nodeTagRecYN2 [expr $recWallTag3 + ($nIncRecZ + 1)*($nIncCShapeRec + 1)]
	
	if {$i <= 3} {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTagRecXW1] [expr $nodeTag +  22]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTagRecXE1] [expr $nodeTagRecXW1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $nodeTagRecXE1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  26] [expr $nodeTag +  25]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  27] [expr $nodeTag +  26]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  28] [expr $nodeTag +  27]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  29] [expr $nodeTag +  28]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  30] [expr $nodeTag +  29]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  31] [expr $nodeTag +  30]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  32] [expr $nodeTag +  31]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  33] [expr $nodeTag +  32]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $nodeTagRecXW1] [expr $nodeTag +  34] [expr $nodeTag +  33]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $nodeTagRecXW1] [expr $nodeTagRecXE1] [expr $nodeTag +  35] [expr $nodeTag +  34]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $nodeTagRecXE1] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $nodeTagRecYS1] [expr $nodeTag +  65]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $nodeTagRecYS1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]	  [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $nodeTagRecYS2] [expr $nodeTag +  71]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $nodeTagRecYS2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  65] [expr $nodeTagRecYS1] [expr $nodeTagRecYN1] [expr $nodeTag +  74]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $nodeTagRecYS1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $nodeTagRecYN1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  67] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  71] [expr $nodeTagRecYS2] [expr $nodeTagRecYN2] [expr $nodeTag +  80]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  71] [expr $nodeTagRecYS2] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $nodeTagRecYN2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  84] [expr $nodeTag +  83]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  75] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  78] [expr $nodeTagNWe] 	  [expr $nodeTagNEa] 	[expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  79] [expr $nodeTagNEa] 	  [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  80] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  81] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  80] [expr $nodeTagRecYN2] [expr $nodeTag +  93] [expr $nodeTag +  92]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  83] [expr $nodeTagRecYN2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]"
	
	} elseif {$i <= 11} {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTagRecXW1] [expr $nodeTag +  22]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTagRecXE1] [expr $nodeTagRecXW1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $nodeTagRecXE1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $nodeTagRecXW1] [expr $nodeTag +  34] [expr $nodeTag +  33]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTagRecXW1] [expr $nodeTagRecXE1] [expr $nodeTag +  35] [expr $nodeTag +  34]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTagRecXE1] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $nodeTagRecYS1] [expr $nodeTag +  65]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $nodeTagRecYS1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]	  [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $nodeTagRecYS2] [expr $nodeTag +  71]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $nodeTagRecYS2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  65] [expr $nodeTagRecYS1] [expr $nodeTagRecYN1] [expr $nodeTag +  74]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $nodeTagRecYS1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $nodeTagRecYN1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  71] [expr $nodeTagRecYS2] [expr $nodeTagRecYN2] [expr $nodeTag +  80]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $nodeTagRecYS2] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $nodeTagRecYN2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  74] [expr $nodeTagRecYN1] [expr $nodeTag +  84] [expr $nodeTag +  83]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $nodeTagRecYN1] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $nodeTagNWe] 	  [expr $nodeTagNEa] 	[expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $nodeTagNEa] 	  [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  80] [expr $nodeTagRecYN2] [expr $nodeTag +  93] [expr $nodeTag +  92]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  67] [expr $nodeTagRecYN2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]"
	
	
	} else {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTagSWe]    [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $nodeTagSEa]    [expr $nodeTagSWe]	"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $nodeTagSEa]	"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		#puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  68] [expr $nodeTagSWe]    [expr $nodeTagNWe]    [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTagSEa]    [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $nodeTagNEa]	"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  77] [expr $nodeTagNWe]    [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTagNWe]    [expr $nodeTagNEa]    [expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTagNEa]    [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
	
	}
}
}