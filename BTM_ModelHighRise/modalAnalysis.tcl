
# ##############################################################################################################################
# ###################################################### MODAL ANALYSIS ########################################################
# ##############################################################################################################################

wipeAnalysis

#set Nodes [getNodeTags]

set omega {};
set F {};
set T {};
set lambda_modal [eigen $modes];

if {$GravityAnalysisDone == "No" || $GravityAnalysisDone == "no"} {
	set MassFile "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory/mass.txt";
	modalProperties -file $MassFile
} elseif {$GravityAnalysisDone == "Yes"} {
	set MassFile "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory/mass.txt";
	modalProperties -file $MassFile
} elseif {$timeHistoryAnalysisDone} {
	set MassFile "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostTimeDirectory/mass.txt";
	modalProperties -file $MassFile
}

foreach lam $lambda_modal {
	lappend omega [expr sqrt($lam)];
	lappend F [expr sqrt($lam)/(2.*$pi)];
	lappend T [expr (2.0*$pi)/sqrt($lam)];
}

# ##########################################################################################################
# ####################################### SAVE TIME PERIODS ################################################
# ##########################################################################################################

if {$GravityAnalysisDone == "No" || $GravityAnalysisDone == "no"} {
	set PeriodFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory/periods.txt" "w"];
	puts $PeriodFile "$T";
} elseif {$GravityAnalysisDone == "Yes"} {
	set PeriodFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory/periods.txt" "w"];
	puts $PeriodFile "$T";
}

# ###########################################################################################################

#for {set iMode 1} {$iMode <= $modes} {incr iMode} {
#
#	if {$GravityAnalysisDone == "No" || $GravityAnalysisDone == "no"} {
#		set modeFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory/modeShape_$iMode.txt" "w"];
#	} else {
#		set modeFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory/modeShape_$iMode.txt" "w"];	
#	}
#    
#	for {set i 1} {$i <= [llength $Nodes]} {incr i} {
#		puts $modeFile "[lindex $Nodes [expr $i - 1]] [nodeEigenvector [lindex $Nodes [expr $i - 1]] $iMode]";
#	}
#	close $modeFile;
#}

puts "----------------------"
puts "Modal Analysis Results"
puts "----------------------"
for {set i 1} {$i <= $modes} {incr i 1} {
	puts "T$i = [lindex $T [expr $i-1]]";
}
