#!/bin/bash

read -p "Enter the folder path: " folderPath
items=$(ls -1 "$folderPath")

if [ -z "$items" ]; then
	echo "No files found in the specified folder."
	exit 1
fi

read -p "Enter the new file name: " newFileName

for item in $items; do
	itemPath="$folderPath/$item"
	if [ -f "$itemPath" ]; then
		fileExtension="${item##*.}"
		newFilePath="$folderPath/$newFileName.$fileExtension"
		mv "$itemPath" "$newFilePath"
		echo "Renamed: $item => $newFileName.$fileExtension"
	fi
done
