#!/bin/sh

rm bed_list.txt;
for i in $(seq 2 22)
do
echo "chr$i.bed chr$i.bim chr$i.fam" >> bed_list.txt
done

plink --bfile chr1 --merge-list bed_list.txt --make-bed --out all

total=0
for i in $(seq 1 22)
do
    total=$(($total + $(wc -l < chr$i.bim)))
done