#!/bin/bash

scanpdf () {
    # scan function running scanimage 
    # add YOUR device into the text after --device into the double quotes
    # for refference of what device to add, type 'scanimage -L' into your terminal
    # if there are multiple versions and one of them doesn't work, try the others
    scanimage --device "airscan:e0:Canon MF230" --format=pdf --output-file $destination
    
    # displaying a notification about succeeded scanning
    notify-send -a Scanner -t 5000 -u critical "Complete! The PDF scan is saved at $destination" 

    # opening the created image using xdg-open for PDF format
    # exchange the command for any other application you want to use
    # but don't forget to use the "$destination" variable
    xdg-open "$destination"
}

scanpng () {
    # the same for .png format scanning
    
    scanimage --device "airscan:e0:Canon MF230" --format=png --output-file $destination 
    
    notify-send -a Scanner -t 5000 -u critical "Complete! The PNG scan is saved at $destination" 

    # opening the created image using gwenview
    xdg-open "$destination"
}

# the main running function
main () {

    # creating a variable, assigning it with the created file path, saving it (--save)
    destination=$(zenity --file-selection --file-filter=".PDF, .png | *.pdf *.png" --save --title="Choose an output directory")

    # case part for each condition the user can make
    case $? in

            # if the file path is created successfully,
            # the script checks which format you chose, then runs the appropriate function
            0) 
            if [[ $destination = *".png"* ]]; then
                scanpng $destination
            elif [[ $destination = *".pdf"* ]]; then
                scanpdf $destination
            else
                notify-send -a Scanner -t 5000 -u critical "Bad output file format! Choose pdf or png."
                main
            fi;;
            
            # the window was closed/the script killed
            1)
            exit;;
    
    esac
}
# starting with the main function
main
