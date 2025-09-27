# AHK Recolored

Icon pack and generator for recolored AutoHotkey v2.0 tray icons.

## How to use

### Setting up

Download `ahkrecolor.sh` and `template.xml` to your computer. To use the `ahkrecolor.sh` script, verify you have installed the following technologies:

- [sed](https://www.gnu.org/software/sed/manual/sed.html) to modify the template SVG file
- [Inkscape](https://inkscape.org/) to convert `.svg` to `.png`
- [Python](https://www.python.org/) and the [Python Image Library](https://pypi.org/project/pillow/) to convert `.png` to `.ico`

With these technologies installed, modify the `INKSCAPE` and `PYTHON` variables at the top to point to your `inkscape.com` and `python.exe` programs respectively.

### Running the shell script

Run the shell script with the following flag syntax:

```bash
./ahkrecolor.sh -b <PRIMARY_COLOR> -l <SECONDARY_COLOR> -c <COLOR_NAME> -r <RESOLUTION>
```

The syntax of running the shell command only has one required parameter - the primary/background color, `-b`. The secondary/letter color `-l`, color name `-c`, and resolution `-r` are all optional flags.

```txt
SYNTAX
  ./ahkrecolor.sh -b <PRIMARY_COLOR> -l <SECONDARY_COLOR> -c <COLOR_NAME> -r <RESOLUTION>
  Please note: Omit '#' when inputting hex codes.

FLAGS
  Required:
  -b              Set the hex code for the background, or primary color
                  Omit '#' when inputting hex code

  Optional:
  -l              Set the hex code for the letter, or secondary color
                  Omit '#' when inputting hex code
                  default=ffffff

  -c              Set the color name
                  default=<PRIMARY_COLOR>_<SECONDARY_COLOR>

  -r              Set the resolution of the image in pixels
                  Standard tray icon size for Windows is 24*24
                  default=256
```

### Output

The program will output a folder in its own directory with 12 files: a `.png`, `svg`, and `.ico` for each of the four possible AutoHotkey v2.0 [tray icons](https://www.autohotkey.com/docs/v2/Program.htm#tray-icon). The files will be of the same resolution specified by the `-r` flag, or if no flag is provided, the resolution will be 256x256.

```txt
📁ahk_<colorName>
├── 📄ahk_<colorName>_<resolution>_pause_suspend.ico
├── 📄ahk_<colorName>_<resolution>_pause_suspend.png
├── 📄ahk_<colorName>_<resolution>_pause_suspend.svg
├── 📄ahk_<colorName>_<resolution>_pause.ico
├── 📄ahk_<colorName>_<resolution>_pause.png
├── 📄ahk_<colorName>_<resolution>_pause.svg
├── 📄ahk_<colorName>_<resolution>_suspend.ico
├── 📄ahk_<colorName>_<resolution>_suspend.png
├── 📄ahk_<colorName>_<resolution>_suspend.svg
├── 📄ahk_<colorName>_<resolution>.ico
├── 📄ahk_<colorName>_<resolution>.png
└── 📄ahk_<colorName>_<resolution>.svg
```

### Usage in a `.ahk` script

The tray icon of `.ahk` files can be customized using the v2.0 [TraySetIcon](https://www.autohotkey.com/docs/v2/lib/TraySetIcon.htm) function. I plan to add an example script to this repository.

## Icon pack

Here are a list of some icons I have created with this program. They are included in the repository if you would like to use them. They are 24x24 because that is the recommended icon size for Windows tray icons. Other sizes can be obtained by regenerating the icons using the provided hex codes and specifying a desired resolution.

### Color Icons

| Name      | Primary Color | Secondary Color | Regular Icon                                                 |
|-----------|---------------|-----------------|--------------------------------------------------------------|
| Red       | `#FF0000`     | `#00FFFF`       | ![Red](icons/color/ahk_red/ahk_red_24.png)                   |
| Pink      | `#FF007F`     | `#00FFBF`       | ![Pink](icons/color/ahk_pink/ahk_pink_24.png)                |
| Purple    | `#8000FF`     | `#FFFF00`       | ![Purple](icons/color/ahk_purple/ahk_purple_24.png)          |
| Blue      | `#0040FF`     | `#FFD700`       | ![Blue](icons/color/ahk_blue/ahk_blue_24.png)                |
| Cyan      | `#00FFFF`     | `#FF1493`       | ![Cyan](icons/color/ahk_cyan/ahk_cyan_24.png)                |
| Teal      | `#00FFBF`     | `#8B00FF`       | ![Teal](icons/color/ahk_teal/ahk_teal_24.png)                |
| Green     | `#00FF00`     | `#FF00FF`       | ![Green](icons/color/ahk_green/ahk_green_24.png)             |
| Lime      | `#ADFF2F`     | `#8B0000`       | ![Lime](icons/color/ahk_lime/ahk_lime_24.png)                |
| Yellow    | `#FFFF00`     | `#00008B`       | ![Yellow](icons/color/ahk_yellow/ahk_yellow_24.png)          |
| Orange    | `#FF7F00`     | `#0040FF`       | ![Orange](icons/color/ahk_orange/ahk_orange_24.png)          |
| Brown     | `#8B4513`     | `#00FFEE`       | ![Brown](icons/color/ahk_brown/ahk_brown_24.png)             |
| Grey      | `#808080`     | `#FFFFFF`       | ![Grey](icons/color/ahk_grey/ahk_grey_24.png)                |
| Blue Grey | `#607D8B`     | `#FFEE58`       | ![Blue Grey](icons/color/ahk_blue_grey/ahk_blue_grey_24.png) |
| Black     | `#000000`     | `#FFFFFF`       | ![Black](icons/color/ahk_black/ahk_black_24.png)             |

### Bold Icons

| Name           | Primary Color | Secondary Color | Regular Icon                                                                     |
|----------------|---------------|-----------------|----------------------------------------------------------------------------------|
| Bold Red       | `#FF0000`     | `#00FFFF`       | ![Bold Red](icons/color-bold/ahk_bold_red/ahk_bold_red_24.png)                   |
| Bold Pink      | `#FF007F`     | `#00FFBF`       | ![Bold Pink](icons/color-bold/ahk_bold_pink/ahk_bold_pink_24.png)                |
| Bold Purple    | `#8000FF`     | `#FFFF00`       | ![Bold Purple](icons/color-bold/ahk_bold_purple/ahk_bold_purple_24.png)          |
| Bold Blue      | `#0040FF`     | `#FFD700`       | ![Bold Blue](icons/color-bold/ahk_bold_blue/ahk_bold_blue_24.png)                |
| Bold Cyan      | `#00FFFF`     | `#FF1493`       | ![Bold Cyan](icons/color-bold/ahk_bold_cyan/ahk_bold_cyan_24.png)                |
| Bold Teal      | `#00FFBF`     | `#8B00FF`       | ![Bold Teal](icons/color-bold/ahk_bold_teal/ahk_bold_teal_24.png)                |
| Bold Green     | `#00FF00`     | `#FF00FF`       | ![Bold Green](icons/color-bold/ahk_bold_green/ahk_bold_green_24.png)             |
| Bold Lime      | `#ADFF2F`     | `#8B0000`       | ![Bold Lime](icons/color-bold/ahk_bold_lime/ahk_bold_lime_24.png)                |
| Bold Yellow    | `#FFFF00`     | `#00008B`       | ![Bold Yellow](icons/color-bold/ahk_bold_yellow/ahk_bold_yellow_24.png)          |
| Bold Orange    | `#FF7F00`     | `#0040FF`       | ![Bold Orange](icons/color-bold/ahk_bold_orange/ahk_bold_orange_24.png)          |
| Bold Brown     | `#8B4513`     | `#00FFEE`       | ![Bold Brown](icons/color-bold/ahk_bold_brown/ahk_bold_brown_24.png)             |
| Bold Grey      | `#808080`     | `#FFFFFF`       | ![Bold Grey](icons/color-bold/ahk_bold_grey/ahk_bold_grey_24.png)                |
| Bold Blue Grey | `#607D8B`     | `#FFEE58`       | ![Bold Blue Grey](icons/color-bold/ahk_bold_blue_grey/ahk_bold_blue_grey_24.png) |
| Bold Black     | `#000000`     | `#FFFFFF`       | ![Bold Black](icons/color-bold/ahk_bold_black/ahk_bold_black_24.png)             |

### Fun Icons

| Name                                                                         | Primary Color | Secondary Color | Regular Icon                                                                                |
|------------------------------------------------------------------------------|---------------|-----------------|---------------------------------------------------------------------------------------------|
| [Obra Dinn](https://lospec.com/palette-list/obra-dinn-ibm-8503)              | `#2e3037`     | `#ebe5ce`       | ![Obra Dinn](icons/fun/ahk_obra_dinn/ahk_obra_dinn_24.png)                                  |
| [Bitball](https://lospec.com/palette-list/bitball)                           | `#070918`     | `#eef066`       | ![Bitball](icons/fun/ahk_bitball/ahk_bitball_24.png)                                        |
| [Iron Blues](https://lospec.com/palette-list/iron-blues)                     | `#e4e8d1`     | `#596e79`       | ![Iron Blues](icons/fun/ahk_iron_blues/ahk_iron_blues_24.png)                               |
| [Milk Carton](https://lospec.com/palette-list/generic-milk-carton)           | `#f5f4e9`     | `#5b88e2`       | ![Milk Carton](icons/fun/ahk_milk_carton/ahk_milk_carton_24.png)                            |
| [Gato Roboto Meowtrix](https://lospec.com/palette-list/gato-roboto-meowtrix) | `#080808`     | `#86ea16`       | ![Gato Roboto Meowtrix](icons/fun/ahk_gato_roboto_meowtrix/ahk_gato_roboto_meowtrix_24.png) |
| [Bitbee](https://lospec.com/palette-list/bitbee)                             | `#292b30`     | `#cfab4a`       | ![Bitbee](icons/fun/ahk_bitbee/ahk_bitbee_24.png)                                           |

## Acknowledgements

- Default icon SVG data from the AutoHotkey [GitHub](https://github.com/AutoHotkey/AutoHotkey).
- I want to thank <http://www.folcolor.com/> for the idea for which colors to put into a palette.
- I used ChatGPT to generate the palettes only; all other code is authored by me.
