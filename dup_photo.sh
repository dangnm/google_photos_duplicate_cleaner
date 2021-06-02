#!/bin/bash

albums_folder=test/albums
collective_folder=test/collective

for album_folder in "$albums_folder"/*/ ; do
  echo "====== checking folder $album_folder ======"
  for album_file in "$album_folder"/*.*
  do
    album_file_name=`basename "${album_file}"`
    echo "*** Album File $album_file_name ***"
    for collective_file in "$collective_folder"/*.*
    do
      collective_file_name=`basename "${collective_file}"`
      echo "*** Collective File $collective_file_name ***"
      if [[ "$album_file_name" == "$collective_file_name" ]]; then
        echo "- file $collective_file_name match with $album_file_name."
        rm "$collective_file"
        echo "- Collective File $collective_file removed."
      fi
    done
  done
done
