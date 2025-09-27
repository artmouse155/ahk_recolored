# AHK Recolor Script

# SYNTAX
#   ./ahkrecolor.sh -b <PRIMARY_COLOR> -l <SECONDARY_COLOR> -c <COLOR_NAME> -r <RESOLUTION>
#   Please note: Omit '#' when inputting hex codes.

# FLAGS
#   Required:
#   -b              Set the hex code for the background, or primary color
#                   Omit '#' when inputting hex code

#   Optional:
#   -l              Set the hex code for the letter, or secondary color
#                   Omit '#' when inputting hex code
#                   default=ffffff

#   -c              Set the color name
#                   default=<PRIMARY_COLOR>_<SECONDARY_COLOR>

#   -r              Set the resolution of the image in pixels
#                   Standard tray icon size is 24*24
#                   default=256


INKSCAPE="C:\Program Files\Inkscape\bin\inkscape.com"
PYTHON=python


TEMPLATE="template.xml"

resolution=256

while getopts b:l:c:r: flag
do
    case "${flag}" in
        b) backgroundColor=${OPTARG};;
        l) letterColor=${OPTARG};;
        c) colorName=${OPTARG};;
        r) resolution=${OPTARG};;
    esac
done

if [ -z "$backgroundColor" ]; then
    printf "\nMissing background color.\n"
    printf "  syntax: ./ahkrecolor.sh -b <backgroundColor>\n\n"
    exit 1
fi

if [ -z "$letterColor" ]; then
    letterColor="#ffffff"
fi

if [ -z "$colorName" ]; then
    colorName="${backgroundColor}_$letterColor"
fi

prefix="ahk_$colorName"

mkdir $prefix

# 1. Create .svg files

# Create template
sed -e "s/BG_FILL/#$backgroundColor/" -e "s/LETTER_FILL/#$letterColor/" -e "s/RESOLUTION/$resolution/" $TEMPLATE > "$prefix/${prefix}_$resolution.xml"

cd $prefix

displayLetterMiddle="inline"
displayLetter="inline"
displayBgPause="inline"
displayBgHollow="inline"
displayBg="inline"

# Regular
reg="${prefix}_${resolution}"

sed -e "s/DISPLAY_LETTER_MIDDLE/$displayLetterMiddle/" -e "s/DISPLAY_LETTER/$displayLetter/" -e "s/DISPLAY_BG_PAUSE/$displayBgPause/" -e "s/DISPLAY_BG_HOLLOW/$displayBgHollow/" -e "s/DISPLAY_BG/$displayBg/" "${prefix}_$resolution.xml" > "$reg.svg"
printf "created $reg.svg\n"

# Paused
pause="${prefix}_${resolution}_pause"

displayLetterMiddle="none"

sed -e "s/DISPLAY_LETTER_MIDDLE/$displayLetterMiddle/" -e "s/DISPLAY_LETTER/$displayLetter/" -e "s/DISPLAY_BG_PAUSE/$displayBgPause/" -e "s/DISPLAY_BG_HOLLOW/$displayBgHollow/" -e "s/DISPLAY_BG/$displayBg/" "${prefix}_$resolution.xml" > "$pause.svg"
printf "created $pause.svg\n"

# Paused and Suspended
pauseSuspend="${prefix}_${resolution}_pause_suspend"

displayLetter="none"
displayBg="none"

sed -e "s/DISPLAY_LETTER_MIDDLE/$displayLetterMiddle/" -e "s/DISPLAY_LETTER/$displayLetter/" -e "s/DISPLAY_BG_PAUSE/$displayBgPause/" -e "s/DISPLAY_BG_HOLLOW/$displayBgHollow/" -e "s/DISPLAY_BG/$displayBg/" "${prefix}_$resolution.xml" > "$pauseSuspend.svg"
printf "created $pauseSuspend.svg\n"

# Suspended
suspend="${prefix}_${resolution}_suspend"

displayBgHollow="none"

sed -e "s/DISPLAY_LETTER_MIDDLE/$displayLetterMiddle/" -e "s/DISPLAY_LETTER/$displayLetter/" -e "s/DISPLAY_BG_PAUSE/$displayBgPause/" -e "s/DISPLAY_BG_HOLLOW/$displayBgHollow/" -e "s/DISPLAY_BG/$displayBg/" "${prefix}_$resolution.xml" > "$suspend.svg"
printf "created $suspend.svg\n"

rm "${prefix}_$resolution.xml"


# 2. Create .png files

"$INKSCAPE" "$reg.svg" --export-type=png
printf "created $reg.png\n"
"$INKSCAPE" "$pause.svg" --export-type=png
printf "created $pause.png\n"
"$INKSCAPE" "$pauseSuspend.svg" --export-type=png
printf "created $pauseSuspend.png\n"
"$INKSCAPE" "$suspend.svg" --export-type=png
printf "created $suspend.png\n"


# 3. Create .ico files
"$PYTHON" -c "from PIL import Image; logo = Image.open(\"$reg.png\"); logo.save(\"$reg.ico\", format=\"ico\")"
printf "created $reg.ico\n"
"$PYTHON" -c "from PIL import Image; logo = Image.open(\"$pause.png\"); logo.save(\"$pause.ico\", format=\"ico\")"
printf "created $pause.ico\n"
"$PYTHON" -c "from PIL import Image; logo = Image.open(\"$pauseSuspend.png\"); logo.save(\"$pauseSuspend.ico\", format=\"ico\")"
printf "created $pauseSuspend.ico\n"
"$PYTHON" -c "from PIL import Image; logo = Image.open(\"$suspend.png\"); logo.save(\"$suspend.ico\", format=\"ico\")"
printf "created $suspend.ico\n"

printf "done\n"