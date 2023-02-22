#!/bin/bash
#
# fetch and clean basic data
#

# quiet flag for debugging, reduces / turns off stout
be_quiet=true
q_flag=""
if [ "${be_quiet}" != false ] ;  then
    q_flag="-q"
fi

# # def vars
source_repo_url="https://github.com/karl-kraus/legalkraus-archiv/archive/refs/heads/main.zip"
ziparchive="./ziparchive.zip"
import_destination_folder="./raw_tei"
data_folder="./data"
import_data_folder="${import_destination_folder}/legalkraus-archiv-main/data"

# # get data from archive
echo "fetch kraus archive"
wget $q_flag $source_repo_url --output-document=$ziparchive
# # unzip files to directory
echo "unzip retrieved file"
unzip $q_flag $ziparchive -d $import_destination_folder
# # remove datafolder containing old files
echo "removing old files"
rm -rf "${data_folder}"
# # move new files to destination
echo "copy new files to destination"
cp -rf "${import_data_folder}/." "${data_folder}"
# # delete current archive import
echo "removing import-zip and dir "
rm -f $ziparchive
rm -rf $import_destination_folder