#!/bin/bash
cd /software/
gitlink=https://github.com/dharlabwustl/ATELECTASIS.git
git clone ${gitlink}
program_dir_name=$(basename ${gitlink} )
program_dir_name=${program_dir_name%.git}
mv ${program_dir_name}/* /software/
chmod +x /software/*.sh

/software/script_to_call_main_program.sh  #${INPUTFILENAME} ${OUTPUTDIRNAME} #$SESSION_ID $XNAT_USER $XNAT_PASS ${TYPE_OF_PROGRAM}
