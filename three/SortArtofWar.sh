#!/bin/bash

#curl file from url into a txt file
aow='ArtOfWar.txt'
sourceurl='http://www.gutenberg.org/cache/epub/132/pg132.txt'

if [[ ! -f $aow ]];
then
curl -G $sourceurl > $aow
fi

output='Words.txt'
./wordfreq.sh 'ArtOfWar.txt' > $output

#Top 15 most frequent words
awk '{print $0 }' $output | sort -k 2 -nr $output > top15.txt
echo -e "Top 15 most frequent words:\n----------------------"
head -15 top15.txt | awk '{print $1}'
echo "----------------------"

#Top 15 least frequent words
awk '{print $0 }' $output | sort -k 2 -n $output > bot15.txt
echo -e "Top 15 least frequent words:\n----------------------"
head -15 top15.txt | awk '{print $1}'
echo "----------------------"

#avg word size
avglen=`cat $output | awk 'BEGIN{} {total += $3;count++;} END{print( total/count )}'`
echo "The average word size is $avglen word(s)."

#length of longest word
echo -e "Length of longest word:"
awk '{print $0 }' $output | sort -k 3 -nr $output > sortlen.txt
head -1 sortlen.txt | awk '{printf "Word:%-35sLength:%d",$1,$3}'
echo -e "\n----------------------"

#length of shortest word
echo -e "Length of shortest word:"
awk '{print $0 }' $output | sort -k 3 -nr $output > sortlen.txt
tail -1 sortlen.txt | awk '{printf "Word:%-35sLength:%d",$1,$3}'
echo -e "\n----------------------"

#number of sentences
echo -e "Number of sentences:"
cat $output | tr '.' "\n" | grep -v "^$" | wc -l
echo -e "\n----------------------"