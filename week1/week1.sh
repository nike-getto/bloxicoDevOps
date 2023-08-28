#!/bin/bash

# Menjanje direktorijuma u temp
cd ./temp

# Prikaz sadrzaja direktorijuma
echo "Here are all of the contents from the temp directory:" && ls -1

# Velicina direktorijuma
echo "Here's the size of this directory:" && du -sh

# Pravljenje novog direktorijuma zvanog 'week_1'
echo "Creating new directory called 'week_1'" && mkdir week_1

# Pravljenje fajla 'new_file' u direktorijumu 'week_1'
echo "Creating file called 'new_file' in directory 'week_1'" && cd week_1 && touch new_file

# Upis teksta u fajl
echo "Writing text to 'new_file'" && echo "I'm on week 1!" > new_file

# Kraj skripte
echo "Script completed successfuly!"
