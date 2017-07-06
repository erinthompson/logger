# Below gawk extracts all .csv filenames and prints them into
# a new column called "file_name"
#
# if you're on the first row put "file_name" otherwise print the
# literal filename. BUT This eliminated the row #'s, which isn't a
# big deal, but this in turn messes up the headers making the data
# inaccessible in R.
#
for i in *.txt;
do
    dos2unix $i;
    mac2unix $i;
    sed -i 's/\t/,/g' $i;
    awk '{$0=(NR==1? "file_name,":FILENAME",")  $0}{print$0}' $i >>output.csv;
done;

# README FIRST:
# Delete the last several empty rows from the output.csv file in
# order to make this script work...for some reason.
# You have to also run the can_und.sh script to generate the output.csv file
# before you can run this one- this should change.

# Script explanation:
# NR==1{ print $0,"can_und,trap_no" } - print the header line
# match($1,/^trap([0-9]+)([a-z])/,a) - matches the number
# following trap word and the next following suffix letter
# match function will fill array a with values of each captured group
# in regex pattern, so a[1] is filled with 1st captured group ([0-9]+)
# and a[2] - with the second ([a-z])

#awk -F, 'NR==1{ print "canopy_understory,trap_no",$0 }
#         NR>1{ match($1,/^trap([0-9]+)([a-z])/,a); print a[2],a[1],$0 }' OFS="," output.csv >process.csv


# Notes:
# This script shifts columns to the right- So everything is one off.
# This needs to be fixed. I'm going to change the data in excel
# to move forward, but this is something that needs to be circled back
# so the script works and you aren't confused in the future. 5/24/2017
# You could use bash to change the headers, but as of 5/24/2017, I'm going
# to do it in excel. -et

# To avoid the awk not backfilling, you need to add the canopy_undersotry
# and trap_no data to the front (column 1) instead of the end of the dataset.

# Script explanation:
# NR==1{ print $0,"can_und,trap_no" } - print the header line
# match($1,/^trap([0-9]+)([a-z])/,a) - matches the number
# following trap word and the next following suffix letter
# match function will fill array a with values of each captured group
# in regex pattern, so a[1] is filled with 1st captured group ([0-9]+)
# and a[2] - with the second ([a-z])

awk -F, 'NR==1{ print "canopy_understory,trap_no",$0 }
         NR>1{ match($1,/^trap([0-9]+)([a-z])/,a); print a[2],a[1],$0 }' OFS="," output.csv >all_process.csv
rm output.csv

# Notes:
# This script shifts columns to the right- So everything is one off.
# This needs to be fixed. I'm going to change the data in excel
# to move forward, but this is something that needs to be circled back
# so the script works and you aren't confused in the future. 5/24/2017
# You could use bash to change the headers, but as of 5/24/2017, I'm going
# to do it in excel. -et
