
# TRANSFORMATIONS FOR FLEXIBLE ELEMENTS ---------------------------------------------
# vertical elements
set transfTagVertEast 1001; 				# associate a tag to the transformation
geomTransf $gT $transfTagVertEast -1 0 0; 	# geometric transformation of beam stiffness and resisting force from the basic system to the global-coordinate system
set transfTagVertWest 1002; 				# associate a tag to the transformation
geomTransf $gT $transfTagVertWest 1 0 0; 	# geometric transformation of beam stiffness and resisting force from the basic system to the global-coordinate system
#set transfTagVertRecY 1003;
#geomTransf $gT $transfTagVertRecY 0 1 0;
set transfTagVertRecX 1004;
geomTransf $gT $transfTagVertRecX 1 0 0;


set transfTagVert 1000
geomTransf $gT $transfTagVert 1 0 0;

# TRANSFORMATIONS FOR RIGID ELEMENTS ---------------------------------------------
set transfTagVertRig 1005; 					# associate a tag to the transformation
geomTransf $gT $transfTagVertRig 1 0 0; 	# geometric transformation of beam stiffness and resisting force from the basic system to the global-coordinate system
set transfTagHorizRig 1006; 				# associate a tag to the transformation
geomTransf $gT $transfTagHorizRig 0 0 1; 	# geometric transformation of beam stiffness and resisting force from the basic system to the global-coordinate system