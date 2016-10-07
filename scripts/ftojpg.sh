#!/bin/bash
#================================================================================
# ftojpg.sh
#
# Desc: Convert all the images which located at a distinct folder to "jpg" format by "cjpeg" command
# Usage: bash ./ftojpg.sh [input_folder] [output_folder]
# Author: YHSPY
# License: MIT
#================================================================================

trap 'echo [ftojpg.sh] Shell ended...' EXIT

cat << EOF
[ftojpg.sh] Shell start...
EOF

cjpeg /dev/null 2> .cjpeg_error

if [ -f ".cjpeg_error" ] && grep "command not found" .cjpeg_error
then
	echo "cjpeg not installed, install now... Ready"
    sudo apt-get install libjpeg-turbo-progs
fi

rm -f .cjpeg_error

# Deal with image files
if [ -z $1 ] || [ -z $2 ]
then
    echo "[Error] Please set the source folder and output folder..."
else
    # Check output directory
    if [ ! -d $2 ]
    then
        sudo mkdir $2
    fi

    for file in ${1}/*
    do   
        file_name_with_ext=${file##*/}
        file_name_without_ext=${file_name_with_ext%.*}

        prefix=${file%.*}
        postfix=${file#${prefix}}

        # It is better to use "file [file_name]" to detect the ext of a distinct file
        case "$postfix" in 
            .png | .PNG | .ppm | .PPM ) 
                sudo cjpeg -optimize -quality 75 -targa $file > ${2}/${file_name_without_ext}.jpg
            ;;
            .gif | .GIF )
                sudo cjpeg -optimize -quality 75 -smooth 10 -targa $file > ${2}/${file_name_without_ext}.jpg
            ;;
        esac
    done
fi

exit 0

