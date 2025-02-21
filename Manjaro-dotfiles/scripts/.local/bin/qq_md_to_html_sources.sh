#!/bin/bash

# # Check for correct number of arguments
# if [ "$#" -ne 2 ]; then
#     echo "Usage: $0 <source-directory> <destination-directory>"
#     exit 1
# fi

SOURCE_DIR=/home/ghost/Dropbox/Thoughts_meditatios_v3/Sources-text

HTML_TEMPLATE=/home/ghost/Dropbox/Thoughts_meditatios_v3/html/0_template.html
CSS_FILE=/home/ghost/Dropbox/Thoughts_meditatios_v3/html/0_style.css

DEST_DIR=/home/ghost/Dropbox/Thoughts_meditatios_v3/html/Sources-text

APACHE_SERVER_DIR=/srv/http/Thoughts_meditatios_v3

function convert_sources_md_to_html() {
	
	FILES=$(find $SOURCE_DIR -type f -name "*.md")

	for file in $FILES; do
		if [[ -f "$file" ]]; then

			CURRENT_DIR=${file%/*}
            
            echo file: $file
            echo CURRENT_DIR: $CURRENT_DIR

			# Generate the html from the md files
			pandoc --standalone --template=$HTML_TEMPLATE $file -f gfm -o ${file%.*}.html
            #touch ${file%.*}.html

			# Repalace all .md links with .html
			sed -i 's/\.md\(#*\)/\.html\1/g' ${file%.*}.html

			# Update progress
			printf "."
		fi 
	done
}

function move_the_html_files_into_html_dir() {
    # Find all .html files and move them
    find "$SOURCE_DIR" -name '*.html' | while read -r file; do
        # Get the relative path of the file
        relative_path="${file#$SOURCE_DIR/}"
        
        # Create the destination path
        dest_path_w_file="$DEST_DIR/$relative_path"
        
        # Create the destination directory if it doesn't exist
        mkdir -p "$(dirname "$dest_path_w_file")"
        
        # Move the file to the new location
        mv "$file" "$dest_path_w_file"

        # Copy css file into the directory
        cp "$CSS_FILE" ${dest_path_w_file%/*}
    done

    echo "All .html files have been moved."
}

# Publish Locally
function copy_to_publish_directory() {
	echo "Copying $DEST_DIR to $APACHE_SERVER_DIR"

	sudo mkdir -p $APACHE_SERVER_DIR
	sudo cp -r "$DEST_DIR" "$APACHE_SERVER_DIR"
}


convert_sources_md_to_html

move_the_html_files_into_html_dir

copy_to_publish_directory

echo Done.


# TODO:
# 1. point the css file to the ... OR copy the css file into every directory
# 2. copy all html into respective folder