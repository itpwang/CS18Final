#!/bin/bash
#
#txtparser.sh
#sorts inputted text file by word, its number of occurences, and length

inputfile=$1
if [[ ! -f $1 ]];
then
    echo "Subject file does not exist.";
fi


# awk 'BEGIN{
#     printf(%-20s %-10s %s\n", "Word", "Frequency", "Length";
# }{}'

grep -Eo "\b[[:alpha:]]+\b" $inputfile | awk '
{ freq[$0]++ } 
END{
    for(word in freq)
    {
        printf("%-20s%-10d%d\n", word, freq[word], length(word));
    }
}'