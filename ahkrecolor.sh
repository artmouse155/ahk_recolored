# INPUT: backgroundColor, letterColor, colorName, resolution
# OUTPUT: Zip file AHK_<colorName>

inkscape="C:\Program Files\Inkscape\bin\inkscape.com"
template="template.xml"

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


# MYVAR=ho02123ware38384you443d34o3434ingtod38384day
# MYVAR=$(echo "$MYVAR" | sed -e 's/[a-zA-Z]/X/g' -e 's/[0-9]/N/g')
# echo "$MYVAR"

# 1. Create .svg files

# Create template
sed -e "s/BG_FILL/#$backgroundColor/" -e "s/LETTER_FILL/#$letterColor/" -e "s/RESOLUTION/$resolution/" $template > "$prefix/${prefix}_$resolution.xml"

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

"$inkscape" "$reg.svg" --export-type=png
printf "created $reg.png\n"
"$inkscape" "$pause.svg" --export-type=png
printf "created $pause.png\n"
"$inkscape" "$pauseSuspend.svg" --export-type=png
printf "created $pauseSuspend.png\n"
"$inkscape" "$suspend.svg" --export-type=png
printf "created $suspend.png\n"


# 3. Create .ico files
python -c "from PIL import Image; logo = Image.open(\"$reg.png\"); logo.save(\"$reg.ico\", format=\"ico\")"
printf "created $reg.ico\n"
python -c "from PIL import Image; logo = Image.open(\"$pause.png\"); logo.save(\"$pause.ico\", format=\"ico\")"
printf "created $pause.ico\n"
python -c "from PIL import Image; logo = Image.open(\"$pauseSuspend.png\"); logo.save(\"$pauseSuspend.ico\", format=\"ico\")"
printf "created $pauseSuspend.ico\n"
python -c "from PIL import Image; logo = Image.open(\"$suspend.png\"); logo.save(\"$suspend.ico\", format=\"ico\")"
printf "created $suspend.ico\n"

printf "done\n"