**DEPENDENCIES** you need to install to your system (some of them won't be neccessary):

1. - **NOTIFY module** 

**Ubuntu/Debian-based**: sudo apt-get install notify-osd

**Arch/Arch-based**: sudo pacman -S libnotify


2. - **ZENITY module**

**Ubuntu/Debian-based**: sudo apt-get install zenity

**Arch/Arch-based**: sudo pacman -S zenity


3. - **SANE module** (neccessary for scanning operations)

**Ubuntu/Debian-based**: sudo apt-get install sane sane-utils xsane

**Arch/Arch-based**: sudo pacman -S sane xsane


**BEFORE RUNNING**

type scanimage -L into your terminal

the following devices displayed have to be inserted into the scanner.sh script you'll be using
(the script is commented, you'll find it)

After these steps, you should be fine working. 
