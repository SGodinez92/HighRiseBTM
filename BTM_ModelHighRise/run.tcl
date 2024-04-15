# ##############################################################################################

# Don't forget to
wipe;

set tStart [clock seconds]

# DEFINE MODEL ----------------------------------------------------------------------
#set modelScale "BTM_PT_ElasticSPM_r33";			# Folder name
set modelScale "test";			# Folder name

set RSN "171";						# RSN of ground motion

set EQlevel "MCEr";					# Do not change

if {$EQlevel != "MCEr"} {
	
	puts "Error"
	end

}


set PT "Yes";				# "Yes" or "No", keep as yes
set SPMelastic "Yes";		# "Yes" or "No", keep as yes
set matFoundation "No";		# Do not change

set masterNodeFlag 0;	# 1 to add a single node at the base, 0 if no master node at the base is required. Do not change

set BTMflag 1

source model.tcl;

set x0 0.0
set y0 0.0

if {$BTMflag == 1} {
	
	puts "Creating BTM model"
	source BTMroutines.tcl
	
} else {

	puts "Error, chose BTMflag 1 or BTMflag 0"
	exit
	
}

 #ANALYSIS --------------------------------------------------------------------------
if {$BTMflag} {
	#BTM
	
	source BTMloadControlStaticAnalysis.tcl
	
	source modalAnalysis.tcl
	
	source BTMtimeHistoryAnalysis.tcl

} 

puts "A N A L Y S I S   C O M P L E T E" 
set tFinish [clock seconds]
set analysisDuration [expr {$tFinish - $tStart}]
puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]

# Don't forget to
wipe;