
#              ================================

puts "B E G I N   A N A L Y S I S"
puts "model: generating..."  

# GEOMETRY/MATERIAL/SECTIONS --------------------------------------------------------------------------
set ModelFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelData.txt" "w"];

source "INPUT_mat.tcl"
puts "MATERIALS OK"

source "INPUT_nodes_col.tcl"
puts "NODES COLS OK"

source "INPUT_sec.tcl"
puts "SECTIONS OK"

if {$PT == "Yes"} {

source "INPUT_sec_spm_PT.tcl"
puts "SECTIONS STRINGERS WITH PT OK"

} elseif {$PT == "No"} {

source "INPUT_sec_spm_NoPT.tcl"
puts "SECTIONS STRINGERS NO PT OK"

} else {

puts "PT must be Yes or No"
end

}

# GEOMETRIC TRANSFORMATIONS --------------------------------------------------------------------------
source "TRANSF.tcl"
puts "TRANSFORMATIONS OK"

# ELEMENTS --------------------------------------------------------------------------
source "INPUT_elem_cols_elas.tcl"
puts "ELEMENTS COLS OK"

source "BTMmain.tcl"
puts "BTM OK"

source "INPUT_elem_retwalls.tcl"
puts "ELEMENTS RETAINING WALLS OK"


if {$PT == "Yes"} {

	if {$SPMelastic == "Yes"} {
		
		source "INPUT_BTMspm_elastic.tcl"
		puts "ELASTIC STRINGER-PANEL WITH PT OK"
		
	}

} elseif {$PT == "No"} {

	if {$SPMelastic == "Yes"} {
		
		source "INPUT_BTMspm_elastic.tcl"
		puts "ELASTIC STRINGER-PANEL WITH NO PT OK"
		
	}

} else {

puts "PT must be Yes or No"
end

}

close $ModelFile

if {$analysisType == "dynamic"} {
    source "INPUT_BTMmass.tcl"
    puts "MASS OK"
}