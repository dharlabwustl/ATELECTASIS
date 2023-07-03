#!/bin/bash
function write_text(){

	local this_node=${1}
	local reference_node=${2}
	local direction=${3}
	local yshift=${5}
	local xshift=${4}
	local scale=${6}
	local texttowrite=${7}
	local texfilename=${8}
	echo "\node (${this_node}) [textbox,draw=none,fill=none,   ${direction} of=${reference_node},yshift=${yshift},xshift=${xshift},scale=${scale}] {${texttowrite}};" >>  ${texfilename}
}
function writetizheader(){
	local texfilename=${1}

		echo '\begin{tikzpicture}		[	node distance=2.5mm,
		title/.style={font=\fontsize{6}{6}\color{black!50}\ttfamily},
		typetag/.style={rectangle, draw=black!50, font=\scriptsize\ttfamily, anchor=west},
		scale=3,arr/.style = {-stealth}	]' > ${texfilename}
		echo ' '  >> ${texfilename}

		# echo	'\tikzstyle{textbox} = [rectangle, line width=3pt,
		# minimum width=3cm, 
		# minimum height=1cm, 
		# text width=4cm, 
		# font=\linespread{0.8}\selectfont\bfseries]' >> ${texfilename}
		# echo ' '  >> ${texfilename}
}

function connect_nodes_withoutarrowhead1()
{

	local node1=${1}
	local node2=${2}
	style=${3}
	width=${4}
	outline_color=${5}
	# scale=${6}
	texfilename=${6}
	yshift=${7}
	# echo "        
     # \draw[arr,line width=${width}mm,draw=${outline_color}] (${node1}.north) -- ([yshift=20mm] ${node1}.north) -- (${node2}.west) ;" >> ${texfilename}
	# echo "\draw[ line width=${width}mm,draw=${outline_color}] (${node1}) -- (100:100); " >>  ${texfilename}

	# direction=
	# reference_node=
	echo "\draw[->, ${style}, line width=${width}mm,draw=${outline_color}] (${node1}.north) -- ([yshift=${yshift}mm]${node1}.north) -- (${node2}.west); " >>  ${texfilename}
}
function connect_nodes_withoutarrowhead2()
{

	local node1=${1}
	local node2=${2}
	style=${3}
	width=${4}
	outline_color=${5}
	# scale=${6}
	texfilename=${6}
	yshift=${7}
	xshift=${8}
	# echo "        
     # \draw[arr,line width=${width}mm,draw=${outline_color}] (${node1}.north) -- ([yshift=20mm] ${node1}.north) -- (${node2}.west) ;" >> ${texfilename}
	# echo "\draw[ line width=${width}mm,draw=${outline_color}] (${node1}) -- (100:100); " >>  ${texfilename}

	# direction=
	# reference_node=
	echo "\draw[->, ${style}, line width=${width}mm,draw=${outline_color}] (${node1}.east) -- ([xshift=${xshift}mm]${node1}.east) -- ([xshift=-${xshift}mm]${node2}.west); " >>  ${texfilename}
}
function connect_nodes_withoutarrowhead3()
{

	local node1=${1}
	local node2=${2}
	style=${3}
	width=${4}
	outline_color=${5}
	# scale=${6}
	texfilename=${6}
	yshift=${7}
	xshift=${8}
	# echo "        
     # \draw[arr,line width=${width}mm,draw=${outline_color}] (${node1}.north) -- ([yshift=20mm] ${node1}.north) -- (${node2}.west) ;" >> ${texfilename}
	# echo "\draw[ line width=${width}mm,draw=${outline_color}] (${node1}) -- (100:100); " >>  ${texfilename}

	# direction=
	# reference_node=
	echo "\draw[->, ${style}, line width=${width}mm,draw=${outline_color}] (${node1}.south) -- ([yshift=${yshift}mm]${node1}.south) -- ([xshift=-${xshift}mm]${node2}.east); " >>  ${texfilename}
}
function connect_nodes_withoutarrowhead4()
{

	local node1=${1}
	local node2=${2}
	style=${3}
	width=${4}
	outline_color=${5}
	# scale=${6}
	texfilename=${6}
	yshift=${7}
	xshift=${8}
	# echo "        
     # \draw[arr,line width=${width}mm,draw=${outline_color}] (${node1}.north) -- ([yshift=20mm] ${node1}.north) -- (${node2}.west) ;" >> ${texfilename}
	# echo "\draw[ line width=${width}mm,draw=${outline_color}] (${node1}) -- (100:100); " >>  ${texfilename}

	# direction=
	# reference_node=
	echo "\draw[->, ${style}, line width=${width}mm,draw=${outline_color}] (${node1}.south) -- ([yshift=${yshift}mm]${node1}.south) -- ([xshift=-${xshift}mm]${node2}.west); " >>  ${texfilename}
}
function connect_nodes()
{

	local node1=${1}
	local node2=${2}
	style=${3}
	width=${4}
	outline_color=${5}
	# scale=${6}
	texfilename=${6}
	# direction=
	# reference_node=
			# echo '[arr/.style = {-stealth,
   #      rounded corners=7,},
   #  N/.style = {draw,
   #      font=\scriptsize,
   #      align=left,
   #      inner sep=3pt
   #  }
   #  ]' >>  ${texfilename}
	echo "\draw[->, ${style}, line width=${width}mm,draw=${outline_color}] (${node1}) -- (${node2}); " >>  ${texfilename}
}
function writefirstnode()
{
local this_node=${1}
local this_node_image=${2}
texfilename=${3}
width=${4}
outline_color=${5}
scale=${6}
echo "\node (${this_node}) [line width=${width}mm,draw=${outline_color},scale=${scale}] {\includegraphics[width=\textwidth,angle=90]{ ${this_node_image} }};" >>  ${texfilename} 
}
function writesubsequentnodes()
{
	local this_node=${1}
	local reference_node=${2}
	local this_node_image=${3}
	direction=${4}
	texfilename=${5}
	width=${6}
	outline_color=${7}
	scale=${8}
	xshift=${9}
	yshift=${10}
echo "\node (${this_node}) [line width=${width}mm,draw=${outline_color},scale=${scale},${direction} =of ${reference_node},xshift=${xshift},yshift=${yshift}] {\includegraphics[width=\textwidth,angle=90]{ ${this_node_image} }};" >>  ${texfilename} 

}
function writetizfooter(){
	texfilename=${1}
echo 	'\end{tikzpicture}' >> ${texfilename}
}

texfilename="flowchart_lungatelectasis_project1.tex"
node1=lunggrayscale
node2=lungmask
node3=lungvessels
node4=lungminusvessels
node5=atelectasis
node6=atelectasis_superimposed
node1_image='ACIB380_20150903000729_C_A_P_CM_25_B20s221.jpg'
node2_image='ACIB380_20150903000729_C_A_P_CM_25_B20s_lung_gray_seg_LTRCLobes_R231_bw221.jpg'
node3_image='ACIB380_20150903000729_C_A_P_CM_25_B20s_2_5_15_vessels_modfd221.jpg'
node4_image='ACIB380_20150903000729_C_A_P_CM_25_B20s_lung_gray_seg_LTRCLobes_R231_bwwithout_vessels221.jpg'
node5_image='ACIB380_20150903000729_C_A_P_CM_25_B20s_lung_mask_seg_gt_neg500LTRCLobes_R231221.jpg'
node6_image='ACIB380_20150903000729_C_A_P_CM_25_B20s_lung_mask_seg_gt_neg500LTRCLobes_R231superimposedsuperimp221.jpg'
internodal_distance_in_x=350
internodal_distance_in_y=150
internodal_distance_in_minusy=-200

writetizheader ${texfilename}
writefirstnode ${node1} ${node1_image} ${texfilename} 1 blue 0.4
writesubsequentnodes ${node2} ${node1} ${node2_image} right ${texfilename} 1 blue 0.4 ${internodal_distance_in_x} 0
writesubsequentnodes ${node3} ${node2} ${node3_image} above ${texfilename} 1 blue 0.4 0 ${internodal_distance_in_y}
writesubsequentnodes ${node4} ${node2} ${node4_image} right ${texfilename} 1 blue 0.4 ${internodal_distance_in_x} 0
writesubsequentnodes ${node5} ${node4} ${node5_image} right ${texfilename} 1 blue 0.4 ${internodal_distance_in_x} 0
writesubsequentnodes ${node6} ${node2} ${node6_image} below ${texfilename} 1 blue 0.4 250 -200
connect_nodes ${node1} ${node2} '-stealth' 2 red  ${texfilename}
connect_nodes ${node2} ${node4} '-stealth' 2 red  ${texfilename}
# connect_nodes ${node3} ${node4} '-stealth' 2 red  ${texfilename}
connect_nodes ${node4} ${node5} '-stealth' 2 red  ${texfilename}
connect_nodes_withoutarrowhead1 ${node1} ${node3} '-stealth' 2 red  ${texfilename} 16
connect_nodes_withoutarrowhead2 ${node3} ${node4} '-stealth' 2 red  ${texfilename} 16 8.6
echo "\draw[->, -stealth, line width=2mm,draw=red] (atelectasis.south) -- ([yshift=-8mm]atelectasis.south) -- ([yshift=10.5mm,xshift=7.3mm]atelectasis_superimposed.west) -- ([yshift=0mm,xshift=-1mm]atelectasis_superimposed.north); " >> ${texfilename}
echo "\draw[->, -stealth, line width=2mm,draw=red] (lunggrayscale.south) -- ([yshift=-8mm]lunggrayscale.south) -- ([yshift=10.5mm,xshift=7.3mm]atelectasis_superimposed.west) -- ([yshift=0mm,xshift=-1mm]atelectasis_superimposed.north); " >> ${texfilename}

# connect_nodes_withoutarrowhead3 ${node1} ${node6} '-stealth' 2 red  ${texfilename} -8 0
# connect_nodes_withoutarrowhead4 ${node5} ${node6} '-stealth' 2 red  ${texfilename} -8 0
# connect_nodes ${node1} ${node6} '-stealth' 2 red  ${texfilename}
# connect_nodes ${node5} ${node6} '-stealth' 2 red  ${texfilename}

write_text 	textstep1  ${node2} left -122 -17 1.5 'LUNG \\ SEGMENTATION' ${texfilename}
write_text 	textstep2  ${node3} left -130 -25 1.5 'VESSELS	\\ and BRONCHI \\ SEGMENTATION' ${texfilename}
write_text 	textstep3  ${node4} left -120 -25 1.5 'VESSELS \\ and BRONCHI \\ SUBTRACTION' ${texfilename}
write_text 	textstep4  ${node5} left -120 -25 1.5 'GRAYSCALE \\ THRESHOLD \\ FILTERING' ${texfilename}
write_text 	textstep5  ${node6} above -122 -17 1.5 'ATELECTASIS \\ MASK with \\ GRAYSCALE \\ IMAGE' ${texfilename}
writetizfooter ${texfilename}
