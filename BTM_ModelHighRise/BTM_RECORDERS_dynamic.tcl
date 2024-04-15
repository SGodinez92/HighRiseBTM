
# ###################################################################################################################################################################################################
# ################################################################################ DYNAMIC ANALYSIS RECORDERS #######################################################################################
# ###################################################################################################################################################################################################

# #####SPM Recorders
setMaxOpenFiles 2048

set dTrecord 0.02
#set dTrecordSPM 0.02
if {1} {
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set spmTag [expr 100000 + 1000*$i]
	
	if {$i <= 3} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		set spmFileTau "stringPanel_tau_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 83] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 83] shearFlow
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileTau -eleRange [expr $spmTag + 1] [expr $spmTag + 83] shearStress
	
	} elseif {$i <= 11} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		set spmFileTau "stringPanel_tau_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 67] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 67] shearFlow
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileTau -eleRange [expr $spmTag + 1] [expr $spmTag + 67] shearStress
	
	} else {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		set spmFileTau "stringPanel_tau_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 20] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -dT $dTrecord -eleRange [expr $spmTag + 1] [expr $spmTag + 20] shearFlow
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileTau -eleRange [expr $spmTag + 1] [expr $spmTag + 20] shearStress
	}
	
}

if {$SPMelastic == "No"} {
	for {set i 1} {$i <= $nStory} {incr i 1} {
		
		set spmTag [expr 100000 + 1000*$i]
		
		if {$i <= 3} {
		
			set spmFileGamma "stringPanel_gamma_$i.txt"
			set spmFileforceStrain "stringPanel_forceStrain_$i.txt"
			set spmFileStiff "stringPanel_stiffness_$i.txt"
			
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileforceStrain -eleRange [expr $spmTag + 1] [expr $spmTag + 83] forceStrains
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGamma -eleRange [expr $spmTag + 1] [expr $spmTag + 83] shearStrains
			#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileStiff -eleRange [expr $spmTag + 1] [expr $spmTag + 83] stiffness
		
		} elseif {$i <= 11} {
		
			set spmFileGamma "stringPanel_gamma_$i.txt"
			set spmFileforceStrain "stringPanel_forceStrain_$i.txt"
			set spmFileStiff "stringPanel_stiffness_$i.txt"
			
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileforceStrain -eleRange [expr $spmTag + 1] [expr $spmTag + 67] forceStrains
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGamma -eleRange [expr $spmTag + 1] [expr $spmTag + 67] shearStrains
			#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileStiff -eleRange [expr $spmTag + 1] [expr $spmTag + 67] stiffness
		
		} else {
		
			set spmFileGamma "stringPanel_gamma_$i.txt"
			set spmFileforceStrain "stringPanel_forceStrain_$i.txt"
			set spmFileStiff "stringPanel_stiffness_$i.txt"
			
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileforceStrain -eleRange [expr $spmTag + 1] [expr $spmTag + 20] forceStrains
			recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGamma -eleRange [expr $spmTag + 1] [expr $spmTag + 20] shearStrains
			#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileStiff -eleRange [expr $spmTag + 1] [expr $spmTag + 20] stiffness
		}
		
	}
}
}

recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_1_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 1801 1813 1882 1894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_2_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 2801 2813 2882 2894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_3_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 3801 3813 3882 3894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_4_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 4825 4813 4882 4894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_5_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 5825 5813 5882 5894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_6_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 6825 6813 6882 6894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_7_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 7825 7813 7882 7894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_8_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 8825 8813 8882 8894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_9_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 9825 9813 9882 9894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_10_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 10825 10813 10882 10894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_11_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 11825 11813 11882 11894 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_12_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 12843 12846 12886 12892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_13_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 13843 13846 13886 13892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_14_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 14843 14846 14886 14892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_15_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 15843 15846 15886 15892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_16_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 16843 16846 16886 16892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_17_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 17843 17846 17886 17892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_18_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 18843 18846 18886 18892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_19_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 19843 19846 19886 19892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_20_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 20843 20846 20886 20892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_21_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 21843 21846 21886 21892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_22_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 22843 22846 22886 22892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_23_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 23843 23846 23886 23892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_24_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 24843 24846 24886 24892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_25_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 25843 25846 25886 25892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_26_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 26843 26846 26886 26892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_27_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 27843 27846 27886 27892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_28_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 28843 28846 28886 28892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_29_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 29843 29846 29886 29892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_30_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 30843 30846 30886 30892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_31_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 31843 31846 31886 31892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_32_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 32843 32846 32886 32892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_33_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 33843 33846 33886 33892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_34_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 34843 34846 34886 34892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_35_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 35843 35846 35886 35892 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_36_x.txt -time -timeSeries $tsTag_L -dT $dtAnalysis -node 36843 36846 36886 36892 -dof 1 accel

#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accelAll_1_x.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 1 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/velAll_1_x.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 1 vel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/dispAll_1_x.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 1 disp

#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accelAll_36_x.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 1 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/velAll_36_x.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 1 vel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/dispAll_36_x.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 1 disp

recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_1_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 1801 1813 1882 1894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_2_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 2801 2813 2882 2894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_3_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 3801 3813 3882 3894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_4_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 4825 4813 4882 4894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_5_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 5825 5813 5882 5894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_6_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 6825 6813 6882 6894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_7_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 7825 7813 7882 7894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_8_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 8825 8813 8882 8894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_9_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 9825 9813 9882 9894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_10_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 10825 10813 10882 10894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_11_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 11825 11813 11882 11894 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_12_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 12843 12846 12886 12892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_13_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 13843 13846 13886 13892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_14_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 14843 14846 14886 14892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_15_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 15843 15846 15886 15892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_16_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 16843 16846 16886 16892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_17_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 17843 17846 17886 17892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_18_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 18843 18846 18886 18892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_19_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 19843 19846 19886 19892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_20_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 20843 20846 20886 20892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_21_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 21843 21846 21886 21892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_22_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 22843 22846 22886 22892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_23_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 23843 23846 23886 23892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_24_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 24843 24846 24886 24892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_25_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 25843 25846 25886 25892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_26_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 26843 26846 26886 26892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_27_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 27843 27846 27886 27892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_28_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 28843 28846 28886 28892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_29_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 29843 29846 29886 29892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_30_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 30843 30846 30886 30892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_31_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 31843 31846 31886 31892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_32_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 32843 32846 32886 32892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_33_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 33843 33846 33886 33892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_34_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 34843 34846 34886 34892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_35_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 35843 35846 35886 35892 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_36_y.txt -time -timeSeries $tsTag_T -dT $dtAnalysis -node 36843 36846 36886 36892 -dof 2 accel

#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accelAll_36_y.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 2 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/velAll_36_y.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 2 vel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/dispAll_36_y.txt -time -dT $dtAnalysis -node 36843 36844 36845 36846 36855 36856 36857 36858 36859 36860 36867 36868 36869 36870 36871 36876 36877 36878 36879 36880 36886 36887 36888 36889 36890 36891 36892 -dof 2 disp

#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accelAll_1_y.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 2 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/velAll_1_y.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 2 vel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/dispAll_1_y.txt -time -dT $dtAnalysis -nodeRange 1801 1894 -dof 2 disp


#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_0_z.txt -time -nodeRange 801 894 -dof 3 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_0_rotX.txt -timeSeries $tsTag_RotX -time -nodeRange 801 894 -dof 4 accel
#recorder Node -file $modelScale/$EQlevel/$RSN/$AccelDir/accel_0_rotY.txt -timeSeries $tsTag_RotY -time -nodeRange 801 894 -dof 5 accel

# #####Node recorders
set dispFold "Displacements"
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold

#recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/base_dispX.txt -time -nodeRange 801 894 -dof 1 disp
#recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/base_dispY.txt -time -nodeRange 801 894 -dof 2 disp
#recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/base_dispZ.txt -time -nodeRange 801 894 -dof 3 disp
#recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/base_rotX.txt -time -nodeRange 801 894 -dof 4 disp
#recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/base_rotY.txt -time -nodeRange 801 894 -dof 5 disp

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/NW_disp.txt -dT $dtAnalysis -node 886 1886 2886 3886 4886 5886 6886 7886 8886 9886 10886 11886 12886 13886 14886 15886 16886 17886 18886 19886 20886 21886 22886 23886 24886 25886 26886 27886 28886 29886 30886 31886 32886 33886 34886 35886 36886 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/NE_disp.txt -dT $dtAnalysis -node 892 1892 2892 3892 4892 5892 6892 7892 8892 9892 10892 11892 12892 13892 14892 15892 16892 17892 18892 19892 20892 21892 22892 23892 24892 25892 26892 27892 28892 29892 30892 31892 32892 33892 34892 35892 36892 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/SW_disp.txt -dT $dtAnalysis -node 843 1843 2843 3843 4843 5843 6843 7843 8843 9843 10843 11843 12843 13843 14843 15843 16843 17843 18843 19843 20843 21843 22843 23843 24843 25843 26843 27843 28843 29843 30843 31843 32843 33843 34843 35843 36843 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/SE_disp.txt -dT $dtAnalysis -node 846 1846 2846 3846 4846 5846 6846 7846 8846 9846 10846 11846 12846 13846 14846 15846 16846 17846 18846 19846 20846 21846 22846 23846 24846 25846 26846 27846 28846 29846 30846 31846 32846 33846 34846 35846 36846 -dof 1 2 disp

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/TopDispWe.txt -dT $dtAnalysis -node 13610005 13620005 -time -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/TopDispEa.txt -dT $dtAnalysis -node 13650030 13640030 -time -dof 1 2 disp

# Regions for rotations at collectors
set regTag_SW 100
set regTag_NW 101
set regTag_SE 102
set regTag_NE 103

set regTag_SW_xCol 104
set regTag_SW_yCol 105
set regTag_NW_xCol 106
set regTag_NW_yCol 107
set regTag_SE_xCol 108
set regTag_SE_yCol 109
set regTag_NE_xCol 110
set regTag_NE_yCol 111

set reg_SW {}
set reg_NW {}
set reg_SE {}
set reg_NE {}

set reg_SW_xCol {}
set reg_SW_yCol {}
set reg_NW_xCol {}
set reg_NW_yCol {}
set reg_SE_xCol {}
set reg_SE_yCol {}
set reg_NE_xCol {}
set reg_NE_yCol {}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i <= 3 || $i > 12} {
		set incZ 4
	} elseif {$i <= 6} {
		set incZ 7
	} else {
		set incZ 5
	}
	
	set nIncCShapeX 5
	
	set nodeSW [expr 10000000 + 100000*$i + 10000 + $incZ + 1]
	set nodeNW [expr 10000000 + 100000*$i + 20000 + $incZ + 1]
	set nodeSE [expr 10000000 + 100000*$i + 40000 + ($incZ + 1)*($nIncCShapeX + 1)]
	set nodeNE [expr 10000000 + 100000*$i + 50000 + ($incZ + 1)*($nIncCShapeX + 1)]
	
	set nodeSW_Y [expr 1000*$i + 800 + 68]
	set nodeSW_X [expr 1000*$i + 800 + 57]
	set nodeNW_Y [expr 1000*$i + 800 + 77]
	set nodeNW_X [expr 1000*$i + 800 + 88]
	set nodeSE_Y [expr 1000*$i + 800 + 69]
	set nodeSE_X [expr 1000*$i + 800 + 58]
	set nodeNE_Y [expr 1000*$i + 800 + 78]
	set nodeNE_X [expr 1000*$i + 800 + 89]
	
	lappend reg_SW $nodeSW
	lappend reg_NW $nodeNW
	lappend reg_SE $nodeSE
	lappend reg_NE $nodeNE
	
	lappend reg_SW_xCol $nodeSW_Y
	lappend reg_SW_yCol $nodeSW_X
	lappend reg_NW_xCol $nodeNW_Y
	lappend reg_NW_yCol $nodeNW_X
	lappend reg_SE_xCol $nodeSE_Y
	lappend reg_SE_yCol $nodeSE_X
	lappend reg_NE_xCol $nodeNE_Y
	lappend reg_NE_yCol $nodeNE_X
	
}

eval region $regTag_SW -node $reg_SW
eval region $regTag_NW -node $reg_NW
eval region $regTag_SE -node $reg_SE
eval region $regTag_NE -node $reg_NE

eval region $regTag_SW_xCol -node $reg_SW_xCol
eval region $regTag_SW_yCol -node $reg_SW_yCol
eval region $regTag_NW_xCol -node $reg_NW_xCol
eval region $regTag_NW_yCol -node $reg_NW_yCol
eval region $regTag_SE_xCol -node $reg_SE_xCol
eval region $regTag_SE_yCol -node $reg_SE_yCol
eval region $regTag_NE_xCol -node $reg_NE_xCol
eval region $regTag_NE_yCol -node $reg_NE_yCol

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_x.txt -dT $dTrecord -region $regTag_SW -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_y.txt -dT $dTrecord -region $regTag_SW -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_x.txt -dT $dTrecord -region $regTag_NW -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_y.txt -dT $dTrecord -region $regTag_NW -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_x.txt -dT $dTrecord -region $regTag_SE -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_y.txt -dT $dTrecord -region $regTag_SE -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_x.txt -dT $dTrecord -region $regTag_NE -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_y.txt -dT $dTrecord -region $regTag_NE -dof 5 disp

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_xCol.txt -dT $dTrecord -region $regTag_SW_xCol -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSW_yCol.txt -dT $dTrecord -region $regTag_SW_yCol -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_xCol.txt -dT $dTrecord -region $regTag_NW_xCol -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNW_yCol.txt -dT $dTrecord -region $regTag_NW_yCol -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_xCol.txt -dT $dTrecord -region $regTag_SE_xCol -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotSE_yCol.txt -dT $dTrecord -region $regTag_SE_yCol -dof 5 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_xCol.txt -dT $dTrecord -region $regTag_NE_xCol -dof 4 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$dispFold/RotNE_yCol.txt -dT $dTrecord -region $regTag_NE_yCol -dof 5 disp

# #####Structural Wall recorders
# Core Walls

set CW1 "CW1"
set RecWallX "RecWallX"
set RecWallY1 "RecWallY1"
set RecWallY2 "RecWallY2"

set regCW1_SW_ver {}
set regCW1_NW_ver {}
set regCW1_WE_ver {}
set regCW1_SE_ver {}
set regCW1_NE_ver {}
set regCW1_EA_ver {}
set regCW1_SW_dia {}
set regCW1_NW_dia {}
set regCW1_WE_dia {}
set regCW1_SE_dia {}
set regCW1_NE_dia {}
set regCW1_EA_dia {}
set regCW1_SW_hor {}
set regCW1_NW_hor {}
set regCW1_WE_hor {}
set regCW1_SE_hor {}
set regCW1_NE_hor {}
set regCW1_EA_hor {}

set regCW1_SW_horSlab {}
set regCW1_NW_horSlab {}
set regCW1_WE_horSlab {}
set regCW1_SE_horSlab {}
set regCW1_NE_horSlab {}
set regCW1_EA_horSlab {}

set regCW1_NW_verRigCB {}
set regCW1_SW_verRigCB {}
set regCW1_NE_verRigCB {}
set regCW1_SE_verRigCB {}

set regCW1_NW_horRigCB {}
set regCW1_SW_horRigCB {}
set regCW1_NE_horRigCB {}
set regCW1_SE_horRigCB {}

set regCW1_NW_verRigWall {}
set regCW1_SW_verRigWall {}
set regCW1_NE_verRigWall {}
set regCW1_SE_verRigWall {}

set regRecX_ver {}
set regRecX_hor {}
set regRecX_dia {}
set regRecX_slab {}

set regRecY1_ver {}
set regRecY1_hor {}
set regRecY1_dia {}
set regRecY1_slab {}

set regRecY2_ver {}
set regRecY2_hor {}
set regRecY_dia {}
set regRecY2_slab {}

set regTagCW1_SW_ver 1
set regTagCW1_NW_ver 2
set regTagCW1_WE_ver 3
set regTagCW1_SE_ver 4
set regTagCW1_NE_ver 5
set regTagCW1_EA_ver 6
set regTagCW1_SW_dia 7
set regTagCW1_NW_dia 8
set regTagCW1_WE_dia 9
set regTagCW1_SE_dia 10
set regTagCW1_NE_dia 11
set regTagCW1_EA_dia 12
set regTagCW1_SW_hor 13
set regTagCW1_NW_hor 14
set regTagCW1_WE_hor 15
set regTagCW1_SE_hor 16
set regTagCW1_NE_hor 17
set regTagCW1_EA_hor 18

set regTagCW1_SW_horSlab 19
set regTagCW1_NW_horSlab 20
set regTagCW1_WE_horSlab 21
set regTagCW1_SE_horSlab 22
set regTagCW1_NE_horSlab 23
set regTagCW1_EA_horSlab 24

set regTagCW1_NW_verRigCB 25
set regTagCW1_SW_verRigCB 26
set regTagCW1_NE_verRigCB 27
set regTagCW1_SE_verRigCB 28

set regTagCW1_NW_horRigCB 29
set regTagCW1_SW_horRigCB 30
set regTagCW1_NE_horRigCB 31
set regTagCW1_SE_horRigCB 32

set regTagCW1_NW_verRigWall 33
set regTagCW1_SW_verRigWall 34
set regTagCW1_NE_verRigWall 35
set regTagCW1_SE_verRigWall 36

set regTagRecX_ver 37
set regTagRecX_hor 38
set regTagRecX_dia 39

set regTagRecY1_ver 40
set regTagRecY1_hor 41
set regTagRecY1_dia 42

set regTagRecY2_ver 43
set regTagRecY2_hor 44
set regTagRecY2_dia 45

set regTagRecX_slab 538
set regTagRecY1_slab 541
set regTagRecY2_slab 544

set nIncCShapeX 5
set nIncCShapeY 14
set nIncWallShapeX 6

# ##### SEE NOTE FOR HORIZONTAL ELEMENTS
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i <= 3 || $i > 12} {
		set incZ 4
	} elseif {$i <= 6} {
		set incZ 7
	} else {
		set incZ 5
	}
	
	set eleTagRigSoWe1 [expr 10000000 + 100000*$i + 70000 + 1]
	set eleTagRigSoWe2 [expr 10000000 + 100000*$i + 70000 + 2]
	set eleTagRigNoWe1 [expr 10000000 + 100000*$i + 80000 + 1]
	set eleTagRigNoWe2 [expr 10000000 + 100000*$i + 80000 + 2]
	set eleTagRigSoEa1 [expr 10000000 + 100000*$i + 70000 + 5]
	set eleTagRigSoEa2 [expr 10000000 + 100000*$i + 70000 + 6]
	set eleTagRigNoEa1 [expr 10000000 + 100000*$i + 80000 + 5]
	set eleTagRigNoEa2 [expr 10000000 + 100000*$i + 80000 + 6]
	
	set eleTagRigHor1SoWe [expr 10000000 + 100000*$i + 70000 + 7]
	set eleTagRigHor2SoWe [expr 10000000 + 100000*$i + 70000 + 11]
	set eleTagRigHor3SoWe [expr 10000000 + 100000*$i + 70000 + 15]
	set eleTagRigHor1NoWe [expr 10000000 + 100000*$i + 80000 + 7]
	set eleTagRigHor2NoWe [expr 10000000 + 100000*$i + 80000 + 11]
	set eleTagRigHor3NoWe [expr 10000000 + 100000*$i + 80000 + 15]
	
	set eleTagRigHor1SoEa [expr 10000000 + 100000*$i + 70000 + 10]
	set eleTagRigHor2SoEa [expr 10000000 + 100000*$i + 70000 + 14]
	set eleTagRigHor3SoEa [expr 10000000 + 100000*$i + 70000 + 18]
	set eleTagRigHor1NoEa [expr 10000000 + 100000*$i + 80000 + 10]
	set eleTagRigHor2NoEa [expr 10000000 + 100000*$i + 80000 + 14]
	set eleTagRigHor3NoEa [expr 10000000 + 100000*$i + 80000 + 18]
	
	if {$anchorageCBflag} {
		if {$i == 1} {
			
			set eleTagRigVer1SoWe [expr 10000000 + 100000*$i + 70000 + 31]
			set eleTagRigVer2SoWe [expr 10000000 + 100000*$i + 70000 + 32]
			set eleTagRigVer1SoEa [expr 10000000 + 100000*$i + 70000 + 33]
			set eleTagRigVer2SoEa [expr 10000000 + 100000*$i + 70000 + 34]
			
			set eleTagRigVer1NoWe [expr 10000000 + 100000*$i + 80000 + 31]
			set eleTagRigVer2NoWe [expr 10000000 + 100000*$i + 80000 + 32]
			set eleTagRigVer1NoEa [expr 10000000 + 100000*$i + 80000 + 33]
			set eleTagRigVer2NoEa [expr 10000000 + 100000*$i + 80000 + 34]
		
			lappend regCW1_SE_verRigWall $eleTagRigVer1SoEa $eleTagRigVer2SoEa
			lappend regCW1_SW_verRigWall $eleTagRigVer1SoWe $eleTagRigVer2SoWe
			lappend regCW1_NE_verRigWall $eleTagRigVer1NoEa $eleTagRigVer2NoEa
			lappend regCW1_NW_verRigWall $eleTagRigVer1NoWe $eleTagRigVer2NoWe
		
		} else {
		
			set eleTagRigVer1SoWe [expr 10000000 + 100000*$i + 70000 + 31]
			set eleTagRigVer2SoWe [expr 10000000 + 100000*$i + 70000 + 32]
			set eleTagRigVer3SoWe [expr 10000000 + 100000*$i + 70000 + 35]
			set eleTagRigVer4SoWe [expr 10000000 + 100000*$i + 70000 + 36]
			
			set eleTagRigVer1SoEa [expr 10000000 + 100000*$i + 70000 + 33]
			set eleTagRigVer2SoEa [expr 10000000 + 100000*$i + 70000 + 34]
			set eleTagRigVer3SoEa [expr 10000000 + 100000*$i + 70000 + 37]
			set eleTagRigVer4SoEa [expr 10000000 + 100000*$i + 70000 + 38]
			
			set eleTagRigVer1NoWe [expr 10000000 + 100000*$i + 80000 + 31]
			set eleTagRigVer2NoWe [expr 10000000 + 100000*$i + 80000 + 32]
			set eleTagRigVer3NoWe [expr 10000000 + 100000*$i + 80000 + 35]
			set eleTagRigVer4NoWe [expr 10000000 + 100000*$i + 80000 + 36]
			
			set eleTagRigVer1NoEa [expr 10000000 + 100000*$i + 80000 + 33]
			set eleTagRigVer2NoEa [expr 10000000 + 100000*$i + 80000 + 34]
			set eleTagRigVer3NoEa [expr 10000000 + 100000*$i + 80000 + 37]
			set eleTagRigVer4NoEa [expr 10000000 + 100000*$i + 80000 + 38]
		
			lappend regCW1_SE_verRigWall $eleTagRigVer1SoEa $eleTagRigVer2SoEa $eleTagRigVer3SoEa $eleTagRigVer4SoEa
			lappend regCW1_SW_verRigWall $eleTagRigVer1SoWe $eleTagRigVer2SoWe $eleTagRigVer3SoWe $eleTagRigVer4SoWe
			lappend regCW1_NE_verRigWall $eleTagRigVer1NoEa $eleTagRigVer2NoEa $eleTagRigVer3NoEa $eleTagRigVer4NoEa
			lappend regCW1_NW_verRigWall $eleTagRigVer1NoWe $eleTagRigVer2NoWe $eleTagRigVer3NoWe $eleTagRigVer4NoWe
		
		}
	}
	
	lappend regCW1_SW_verRigCB $eleTagRigSoWe1 $eleTagRigSoWe2
	lappend regCW1_NW_verRigCB $eleTagRigNoWe1 $eleTagRigNoWe2
	lappend regCW1_SE_verRigCB $eleTagRigSoEa1 $eleTagRigSoEa2
	lappend regCW1_NE_verRigCB $eleTagRigNoEa1 $eleTagRigNoEa2
	
	lappend regCW1_NW_horRigCB $eleTagRigHor1NoWe $eleTagRigHor2NoWe $eleTagRigHor3NoWe
	lappend regCW1_SW_horRigCB $eleTagRigHor1SoWe $eleTagRigHor2SoWe $eleTagRigHor3SoWe
	lappend regCW1_NE_horRigCB $eleTagRigHor1NoEa $eleTagRigHor2NoEa $eleTagRigHor3NoEa
	lappend regCW1_SE_horRigCB $eleTagRigHor1SoEa $eleTagRigHor2SoEa $eleTagRigHor3SoEa
	
	#for {set verAxis 1} {$verAxis <= $nIncCShapeX} {incr verAxis} {
	#
	#	set eleTagSW [expr {10000000 + 100000*$i + 10000 + 3000 + $verAxis}]
	#	set eleTagNW [expr {10000000 + 100000*$i + 20000 + 3000 + $verAxis}]
	#	set eleTagSE [expr {10000000 + 100000*$i + 40000 + 3000 + $verAxis}]
	#	set eleTagNE [expr {10000000 + 100000*$i + 50000 + 3000 + $verAxis}]
	#	
	#	lappend regCW1_SW_horSlab $eleTagSW
	#	lappend regCW1_NW_horSlab $eleTagNW
	#	lappend regCW1_SE_horSlab $eleTagSE
	#	lappend regCW1_NE_horSlab $eleTagNE
	#	
	#}

	#for {set verAxis 1} {$verAxis <= $nIncCShapeY} {incr verAxis} {
    #
	#	set eleTagWE [expr {10000000 + 100000*$i + 30000 + 3000 + $verAxis}]
	#	set eleTagEA [expr {10000000 + 100000*$i + 60000 + 3000 + $verAxis}]
	#	
	#	lappend regCW1_WE_horSlab $eleTagWE
	#	lappend regCW1_EA_horSlab $eleTagEA
	#
	#}	
    
	for {set j 1} {$j <= [expr $incZ*($nIncCShapeX + 1)]} {incr j 1} {
		set eleTagSW_ver [expr 10000000 + 100000*$i + 12000 + $j]
		set eleTagNW_ver [expr 10000000 + 100000*$i + 22000 + $j]
		set eleTagSE_ver [expr 10000000 + 100000*$i + 42000 + $j]
		set eleTagNE_ver [expr 10000000 + 100000*$i + 52000 + $j]
		
		lappend regCW1_SW_ver $eleTagSW_ver
		lappend regCW1_NW_ver $eleTagNW_ver
		lappend regCW1_SE_ver $eleTagSE_ver
		lappend regCW1_NE_ver $eleTagNE_ver		
	}
	
	for {set j $incZ} {$j < [expr $incZ*$nIncCShapeY]} {incr j 1} {
		set eleTagWE_ver [expr 10000000 + 100000*$i + 32000 + $j + 1]
		set eleTagEA_ver [expr 10000000 + 100000*$i + 62000 + $j + 1]
		
		lappend regCW1_WE_ver $eleTagWE_ver
		lappend regCW1_EA_ver $eleTagEA_ver
	}
	
	#### UPDATE TO INCLUDE HORIZONTAL ELEMENT AT SLAB LEVEL, SHOULD UPDATE MATLAB CODE AS WELL
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeX]} {incr j 1} {
	
		set eleTagSW_hor [expr 10000000 + 100000*$i + 13000 + $j + $nIncCShapeX]
		set eleTagNW_hor [expr 10000000 + 100000*$i + 23000 + $j + $nIncCShapeX]
		set eleTagSE_hor [expr 10000000 + 100000*$i + 43000 + $j + $nIncCShapeX]
		set eleTagNE_hor [expr 10000000 + 100000*$i + 53000 + $j + $nIncCShapeX]
		
		lappend regCW1_SW_hor $eleTagSW_hor
		lappend regCW1_NW_hor $eleTagNW_hor
		lappend regCW1_SE_hor $eleTagSE_hor
		lappend regCW1_NE_hor $eleTagNE_hor	
		
		if {$j > [expr ($incZ-1)*$nIncCShapeX]} {
		
			set eleTagSW_slab [expr $eleTagSW_hor + 500]
			set eleTagNW_slab [expr $eleTagNW_hor + 500]
			set eleTagSE_slab [expr $eleTagSE_hor + 500]
			set eleTagNE_slab [expr $eleTagNE_hor + 500]
		
			lappend regCW1_SW_horSlab $eleTagSW_slab
			lappend regCW1_NW_horSlab $eleTagNW_slab
			lappend regCW1_SE_horSlab $eleTagSE_slab
			lappend regCW1_NE_horSlab $eleTagNE_slab
			
		}
		
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeY]} {incr j 1} {
	
		set eleTagWE_hor [expr 10000000 + 100000*$i + 33000 + $j + $nIncCShapeY]
		set eleTagEA_hor [expr 10000000 + 100000*$i + 63000 + $j + $nIncCShapeY]
		
		lappend regCW1_WE_hor $eleTagWE_hor
		lappend regCW1_EA_hor $eleTagEA_hor
		
		if {$j > [expr ($incZ-1)*$nIncCShapeY]} {
		
			set eleTagWE_slab [expr $eleTagWE_hor + 500]
			set eleTagEA_slab [expr $eleTagEA_hor + 500]
		
			lappend regCW1_WE_horSlab $eleTagWE_slab
			lappend regCW1_EA_horSlab $eleTagEA_slab
			
		}
		
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeX*2.]} {incr j 1} {
	
		set eleTagSW_dia [expr 10000000 + 100000*$i + 11000 + $j]
		set eleTagNW_dia [expr 10000000 + 100000*$i + 21000 + $j]
		set eleTagSE_dia [expr 10000000 + 100000*$i + 41000 + $j]
		set eleTagNE_dia [expr 10000000 + 100000*$i + 51000 + $j]
		
		lappend regCW1_SW_dia $eleTagSW_dia
		lappend regCW1_NW_dia $eleTagNW_dia
		lappend regCW1_SE_dia $eleTagSE_dia
		lappend regCW1_NE_dia $eleTagNE_dia
	}
	
	for {set j 1} {$j <= [expr $incZ*$nIncCShapeY*2.]} {incr j 1} {
	
		set eleTagWE_dia [expr 10000000 + 100000*$i + 31000 + $j]
		set eleTagEA_dia [expr 10000000 + 100000*$i + 61000 + $j]
		
		lappend regCW1_WE_dia $eleTagWE_dia
		lappend regCW1_EA_dia $eleTagEA_dia
		
	}
}

for {set i 1} {$i <= 11} {incr i 1} {

	if {$i == 4 || $i == 5 || $i == 6} {
		set incZ 4
	} else {
		set incZ 3
	}

	for {set j 1} {$j <= [expr $incZ*($nIncWallShapeX + 1)]} {incr j 1} {
		set eleTagRX_ver [expr 30000000 + 100000*$i + 2000 + $j]
		set eleTagRY1_ver [expr 40000000 + 100000*$i + 2000 + $j]
		set eleTagRY2_ver [expr 50000000 + 100000*$i + 2000 + $j]
		
		lappend regRecX_ver $eleTagRX_ver
		lappend regRecY1_ver $eleTagRY1_ver
		lappend regRecY2_ver $eleTagRY2_ver
	}
	#### UPDATE TO INCLUDE HORIZONTAL ELEMENT AT SLAB LEVEL, SHOULD UPDATE MATLAB CODE AS WELL
	for {set j 1} {$j <= [expr $incZ*$nIncWallShapeX]} {incr j 1} {
	
		set eleTagRX_hor [expr 30000000 + 100000*$i + 3000 + $j + $nIncWallShapeX]
		set eleTagRY1_hor [expr 40000000 + 100000*$i + 3000 + $j + $nIncWallShapeX]
		set eleTagRY2_hor [expr 50000000 + 100000*$i + 3000 + $j + $nIncWallShapeX]
		
		lappend regRecX_hor $eleTagRX_hor
		lappend regRecY1_hor $eleTagRY1_hor
		lappend regRecY2_hor $eleTagRY2_hor
		
		if {$j > [expr ($incZ-1)*($nIncWallShapeX)]} {
		
			set eleTagRX_slab [expr $eleTagRX_hor + 500]
			set eleTagRY1_slab [expr $eleTagRY1_hor + 500]
			set eleTagRY2_slab [expr $eleTagRY2_hor + 500]
			
			lappend regRecX_slab $eleTagRX_slab
			lappend regRecY1_slab $eleTagRY1_slab
			lappend regRecY2_slab $eleTagRY2_slab
		
		}
		
	}

	for {set j 1} {$j <= [expr $incZ*$nIncWallShapeX*2]} {incr j 1} {
		set eleTagRX_dia [expr 30000000 + 100000*$i + 1000 + $j]
		set eleTagRY1_dia [expr 40000000 + 100000*$i + 1000 + $j]
		set eleTagRY2_dia [expr 50000000 + 100000*$i + 1000 + $j]
		
		lappend regRecX_dia $eleTagRX_dia
		lappend regRecY1_dia $eleTagRY1_dia
		lappend regRecY2_dia $eleTagRY2_dia
	}
}

eval region $regTagCW1_SW_ver -ele $regCW1_SW_ver
eval region $regTagCW1_NW_ver -ele $regCW1_NW_ver
eval region $regTagCW1_WE_ver -ele $regCW1_WE_ver
eval region $regTagCW1_SE_ver -ele $regCW1_SE_ver
eval region $regTagCW1_NE_ver -ele $regCW1_NE_ver
eval region $regTagCW1_EA_ver -ele $regCW1_EA_ver
eval region $regTagCW1_SW_dia -ele $regCW1_SW_dia
eval region $regTagCW1_NW_dia -ele $regCW1_NW_dia
eval region $regTagCW1_WE_dia -ele $regCW1_WE_dia
eval region $regTagCW1_SE_dia -ele $regCW1_SE_dia
eval region $regTagCW1_NE_dia -ele $regCW1_NE_dia
eval region $regTagCW1_EA_dia -ele $regCW1_EA_dia
eval region $regTagCW1_SW_hor -ele $regCW1_SW_hor
eval region $regTagCW1_NW_hor -ele $regCW1_NW_hor
eval region $regTagCW1_WE_hor -ele $regCW1_WE_hor
eval region $regTagCW1_SE_hor -ele $regCW1_SE_hor
eval region $regTagCW1_NE_hor -ele $regCW1_NE_hor
eval region $regTagCW1_EA_hor -ele $regCW1_EA_hor

eval region $regTagCW1_SW_horSlab -ele $regCW1_SW_horSlab
eval region $regTagCW1_NW_horSlab -ele $regCW1_NW_horSlab
eval region $regTagCW1_WE_horSlab -ele $regCW1_WE_horSlab
eval region $regTagCW1_SE_horSlab -ele $regCW1_SE_horSlab
eval region $regTagCW1_NE_horSlab -ele $regCW1_NE_horSlab
eval region $regTagCW1_EA_horSlab -ele $regCW1_EA_horSlab

eval region $regTagCW1_SW_verRigCB -ele $regCW1_SW_verRigCB
eval region $regTagCW1_NW_verRigCB -ele $regCW1_NW_verRigCB
eval region $regTagCW1_SE_verRigCB -ele $regCW1_SE_verRigCB
eval region $regTagCW1_NE_verRigCB -ele $regCW1_NE_verRigCB

eval region $regTagCW1_NW_horRigCB -ele $regCW1_NW_horRigCB
eval region $regTagCW1_SW_horRigCB -ele $regCW1_SW_horRigCB
eval region $regTagCW1_NE_horRigCB -ele $regCW1_NE_horRigCB
eval region $regTagCW1_SE_horRigCB -ele $regCW1_SE_horRigCB

eval region $regTagCW1_SW_verRigWall -ele $regCW1_SW_verRigWall
eval region $regTagCW1_NW_verRigWall -ele $regCW1_NW_verRigWall
eval region $regTagCW1_SE_verRigWall -ele $regCW1_SE_verRigWall
eval region $regTagCW1_NE_verRigWall -ele $regCW1_NE_verRigWall

eval region $regTagRecX_ver -ele $regRecX_ver
eval region $regTagRecX_hor -ele $regRecX_hor
eval region $regTagRecX_dia -ele $regRecX_dia
eval region $regTagRecY1_ver -ele $regRecY1_ver
eval region $regTagRecY1_hor -ele $regRecY1_hor
eval region $regTagRecY1_dia -ele $regRecY1_dia
eval region $regTagRecY2_ver -ele $regRecY2_ver 
eval region $regTagRecY2_hor -ele $regRecY2_hor 
eval region $regTagRecY2_dia -ele $regRecY2_dia 

eval region $regTagRecX_slab -ele $regRecX_slab
eval region $regTagRecY1_slab -ele $regRecY1_slab
eval region $regTagRecY2_slab -ele $regRecY2_slab

file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2

#CoreWall 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verForce.txt -dT $dTrecord -region $regTagCW1_SW_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verForce.txt -dT $dTrecord -region $regTagCW1_NW_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_verForce.txt -dT $dTrecord -region $regTagCW1_WE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verForce.txt -dT $dTrecord -region $regTagCW1_SE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verForce.txt -dT $dTrecord -region $regTagCW1_NE_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_verForce.txt -dT $dTrecord -region $regTagCW1_EA_ver globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_diaForce.txt -dT $dTrecord -region $regTagCW1_SW_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_diaForce.txt -dT $dTrecord -region $regTagCW1_NW_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_diaForce.txt -dT $dTrecord -region $regTagCW1_WE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_diaForce.txt -dT $dTrecord -region $regTagCW1_SE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_diaForce.txt -dT $dTrecord -region $regTagCW1_NE_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_diaForce.txt -dT $dTrecord -region $regTagCW1_EA_dia axialForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horForce.txt -dT $dTrecord -region $regTagCW1_SW_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horForce.txt -dT $dTrecord -region $regTagCW1_NW_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_horForce.txt -dT $dTrecord -region $regTagCW1_WE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horForce.txt -dT $dTrecord -region $regTagCW1_SE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horForce.txt -dT $dTrecord -region $regTagCW1_NE_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_horForce.txt -dT $dTrecord -region $regTagCW1_EA_hor globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verRigForce.txt -dT $dTrecord -region $regTagCW1_SW_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verRigForce.txt -dT $dTrecord -region $regTagCW1_NW_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verRigForce.txt -dT $dTrecord -region $regTagCW1_SE_verRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verRigForce.txt -dT $dTrecord -region $regTagCW1_NE_verRigCB globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horRigForce.txt -dT $dTrecord -region $regTagCW1_SW_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horRigForce.txt -dT $dTrecord -region $regTagCW1_NW_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horRigForce.txt -dT $dTrecord -region $regTagCW1_SE_horRigCB globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horRigForce.txt -dT $dTrecord -region $regTagCW1_NE_horRigCB globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verRigForceAnchorage.txt -dT $dTrecord -region $regTagCW1_SW_verRigWall globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verRigForceAnchorage.txt -dT $dTrecord -region $regTagCW1_NW_verRigWall globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verRigForceAnchorage.txt -dT $dTrecord -region $regTagCW1_SE_verRigWall globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verRigForceAnchorage.txt -dT $dTrecord -region $regTagCW1_NE_verRigWall globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_slabForce.txt -dT $dTrecord -region $regTagCW1_SW_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_slabForce.txt -dT $dTrecord -region $regTagCW1_NW_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_slabForce.txt -dT $dTrecord -region $regTagCW1_WE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_slabForce.txt -dT $dTrecord -region $regTagCW1_SE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_slabForce.txt -dT $dTrecord -region $regTagCW1_NE_horSlab globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_slabForce.txt -dT $dTrecord -region $regTagCW1_EA_horSlab globalForce


recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_verDef.txt -dT $dTrecord -region $regTagCW1_SW_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_verDef.txt -dT $dTrecord -region $regTagCW1_NW_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_verDef.txt -dT $dTrecord -region $regTagCW1_WE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_verDef.txt -dT $dTrecord -region $regTagCW1_SE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_verDef.txt -dT $dTrecord -region $regTagCW1_NE_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_verDef.txt -dT $dTrecord -region $regTagCW1_EA_ver section 1 deformation 1

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_diaDef.txt -dT $dTrecord -region $regTagCW1_SW_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_diaDef.txt -dT $dTrecord -region $regTagCW1_NW_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_diaDef.txt -dT $dTrecord -region $regTagCW1_WE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_diaDef.txt -dT $dTrecord -region $regTagCW1_SE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_diaDef.txt -dT $dTrecord -region $regTagCW1_NE_dia deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_diaDef.txt -dT $dTrecord -region $regTagCW1_EA_dia deformations

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SW_horDef.txt -dT $dTrecord -region $regTagCW1_SW_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NW_horDef.txt -dT $dTrecord -region $regTagCW1_NW_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/WE_horDef.txt -dT $dTrecord -region $regTagCW1_WE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/SE_horDef.txt -dT $dTrecord -region $regTagCW1_SE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/NE_horDef.txt -dT $dTrecord -region $regTagCW1_NE_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$CW1/EA_horDef.txt -dT $dTrecord -region $regTagCW1_EA_hor section 1 deformation 1

#RecWallX
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/verForce.txt -dT $dTrecord -region $regTagRecX_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/horForce.txt -dT $dTrecord -region $regTagRecX_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/diaForce.txt -dT $dTrecord -region $regTagRecX_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/slabForce.txt -dT $dTrecord -region $regTagRecX_slab globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/verDef.txt -dT $dTrecord -region $regTagRecX_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/horDef.txt -dT $dTrecord -region $regTagRecX_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallX/diaDef.txt -dT $dTrecord -region $regTagRecX_dia deformations

#RecWallY1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/verForce.txt -dT $dTrecord -region $regTagRecY1_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/horForce.txt -dT $dTrecord -region $regTagRecY1_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/diaForce.txt -dT $dTrecord -region $regTagRecY1_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/slabForce.txt -dT $dTrecord -region $regTagRecY1_slab globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/verDef.txt -dT $dTrecord -region $regTagRecY1_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/horDef.txt -dT $dTrecord -region $regTagRecY1_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY1/diaDef.txt -dT $dTrecord -region $regTagRecY1_dia deformations

#RecWallY2
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/verForce.txt -dT $dTrecord -region $regTagRecY2_ver globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/horForce.txt -dT $dTrecord -region $regTagRecY2_hor globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/diaForce.txt -dT $dTrecord -region $regTagRecY2_dia axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/slabForce.txt -dT $dTrecord -region $regTagRecY2_slab globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/verDef.txt -dT $dTrecord -region $regTagRecY2_ver section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/horDef.txt -dT $dTrecord -region $regTagRecY2_hor section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$RecWallY2/diaDef.txt -dT $dTrecord -region $regTagRecY2_dia deformations

# #####Coupling Beam recorders

set cbFold "CouplingBeams"
set defFold "Deformations"
set forceFold "Forces"

file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold
#file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/$defFold
#file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/$forceFold

set regionCB1_concShor {}
set regionCB1_concNhor {}

set regionCB1_concSver {}
set regionCB1_concNver {}

set regionCB1_concSdia {}
set regionCB1_concNdia {}

set regionCB1_steelS {}
set regionCB1_steelN {}

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	for {set j 8} {$j <= 17} {incr j 1} {
	
	if {$j == 10 || $j == 11 || $j == 14 || $j == 15} {
	} else {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concShor $eleTag1S
		lappend regionCB1_concNhor $eleTag1N
		
	}
	}
	
	for {set j 3} {$j <= 4} {incr j 1} {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concSver $eleTag1S
		lappend regionCB1_concNver $eleTag1N
		
	}
	
	for {set j 19} {$j <= 26} {incr j 1} {
	
		set eleTag1S [expr 10000000 + 100000*$i + 70000 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80000 + $j]
		
		lappend regionCB1_concSdia $eleTag1S
		lappend regionCB1_concNdia $eleTag1N
		
	}
	

	for {set j 19} {$j <= 25} {incr j 1} {
	
	if {$j == 20 || $j == 21 || $j == 23} {
	} else {
		
		set eleTag1S [expr 10000000 + 100000*$i + 70500 + $j]
		set eleTag1N [expr 10000000 + 100000*$i + 80500 + $j]
	
		lappend regionCB1_steelS $eleTag1S
		lappend regionCB1_steelN $eleTag1N
	}
	}
}

eval region 46 -ele $regionCB1_concShor
eval region 47 -ele $regionCB1_concNhor

eval region 48 -ele $regionCB1_concSdia
eval region 49 -ele $regionCB1_concNdia

eval region 50 -ele $regionCB1_steelS
eval region 51 -ele $regionCB1_steelN

eval region 52 -ele $regionCB1_concSver
eval region 53 -ele $regionCB1_concNver

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Shor.txt -dT $dTrecord -region 46 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Nhor.txt -dT $dTrecord -region 47 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Sdia.txt -dT $dTrecord -region 48 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Ndia.txt -dT $dTrecord -region 49 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelS.txt -dT $dTrecord -region 50 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_steelN.txt -dT $dTrecord -region 51 axialForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Sver.txt -dT $dTrecord -region 52 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1_Nver.txt -dT $dTrecord -region 53 globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Shor.txt -dT $dTrecord -region 46 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Nhor.txt -dT $dTrecord -region 47 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Sdia.txt -dT $dTrecord -region 48 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Ndia.txt -dT $dTrecord -region 49 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelS.txt -dT $dTrecord -region 50 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_steelN.txt -dT $dTrecord -region 51 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Sver.txt -dT $dTrecord -region 52 section 1 deformation 1
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/$cbFold/CB1disp_Nver.txt -dT $dTrecord -region 53 section 1 deformation 1

# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsWeX.txt -node 10110001 10110006 10110011 10110016 10110021 10110026 10120001 10120006 10120011 10120016 10120021 10120026 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 -dof 1 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsWeY.txt -node 10110001 10110006 10110011 10110016 10110021 10110026 10120001 10120006 10120011 10120016 10120021 10120026 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 -dof 2 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsWeZ.txt -node 10110001 10110006 10110011 10110016 10110021 10110026 10120001 10120006 10120011 10120016 10120021 10120026 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 -dof 3 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsWeMx.txt -node 10110001 10110006 10110011 10110016 10110021 10110026 10120001 10120006 10120011 10120016 10120021 10120026 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 -dof 4 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsWeMy.txt -node 10110001 10110006 10110011 10110016 10110021 10110026 10120001 10120006 10120011 10120016 10120021 10120026 10130006 10130011 10130016 10130021 10130026 10130031 10130036 10130041 10130046 10130051 10130056 10130061 10130066 -dof 5 reaction
# 
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsEaX.txt -node 10140001 10140006 10140011 10140016 10140021 10140026 10150001 10150006 10150011 10150016 10150021 10150026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 -dof 1 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsEaY.txt -node 10140001 10140006 10140011 10140016 10140021 10140026 10150001 10150006 10150011 10150016 10150021 10150026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 -dof 2 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsEaZ.txt -node 10140001 10140006 10140011 10140016 10140021 10140026 10150001 10150006 10150011 10150016 10150021 10150026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 -dof 3 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsEaMx.txt -node 10140001 10140006 10140011 10140016 10140021 10140026 10150001 10150006 10150011 10150016 10150021 10150026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 -dof 4 reaction
# #recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/ReactionsEaMy.txt -node 10140001 10140006 10140011 10140016 10140021 10140026 10150001 10150006 10150011 10150016 10150021 10150026 10160006 10160011 10160016 10160021 10160026 10160031 10160036 10160041 10160046 10160051 10160056 10160061 10160066 -dof 5 reaction
# 