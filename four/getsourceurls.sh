#!/bin/bash
#
#getsourceurls.sh
#Gets source code from url with wget
#Sorts for URLs using awk and outputs to urlsgoogle.txt

#curl https://google.com/index.html > googlesource.txt

awk 'BEGIN{
RS="</a>"
IGNORECASE=1
}
{
  for(i=1;i<=NF;i++){
    if ( $i ~ /href/){
      gsub(/.*href=\042/,"",$i)
      gsub(/\042.*/,"",$i)
      print $(i)
    }
  }
}' googlesource.txt > urlsgoogle.txt


