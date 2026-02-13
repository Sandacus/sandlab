#!/usr/bin/env bash

###############################################################################
# Help                                                                        #
###############################################################################
Help()
{
    # Display help
    echo
    echo "HELP"
    echo
    echo "NAME"
    echo "  new-note"
    echo
    echo "SYNOPSIS"
    echo "  new-note [-tdh]"
    echo
    echo "DESCRIPTION"
    echo "  new-note.sh script used for generating a note file for the zola site"
    echo "  sandlab-site. The title, desciption and date metadata have default"
    echo "  values:"
    echo "      title => New Note"
    echo "      description => A new note about something noteworthy"
    echo "      date => today's date"
    echo
    echo "  options: -t, -d"
    echo "  -t    enter new title"
    echo "  -d    enter new description"
    echo
}


###############################################################################
# CREATE A NEW NOTE IN SANDLAB-SITE                                           #
###############################################################################

# Set variables
Title="New Note"
Description="A new note about something noteworthy"
Date="$(date '+%F')"
Draft="true"

while getopts ":ht:d:" option; do
    case $option in
        h) Help; exit;;
        t) Title=$OPTARG;;
        d) Description=$OPTARG;;
        \?) echo "Error: Invalid option"; Help; exit;;
   esac
done

# Navigate to file location
SCRIPT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
TARGET_DIR="$SCRIPT_DIR/../sandlab-site/content/notes"
cd "$TARGET_DIR"

# Create file
FILE="$TARGET_DIR/blog.md"
if [[ -e "$FILE" ]]; then
  echo "Error: File already exists: $FILE" >&2
  exit 1
fi
touch note.md

# Create file and add meta data
echo "+++" > note.md
echo "title = "\""${Title}"\""" >> note.md
echo "description = "\""${Description}"\""" >> note.md
echo "date = ${Date}" >> note.md
echo "draft = ${Draft}" >> note.md
echo "+++" >> note.md
