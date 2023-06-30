#!/bin/sh

N=5
for i in `seq 1 22`
do
((i=i%N)); ((i++==0)) && wait
zcat input vcf.gz | bcftools sort /work/larylab/dbgap/data3/phg000835.v5.FHS_SHARE_imputed_HRC1.genotype-calls-vcf.c1/chr${i}_c1.vcf.gz -Oz -o /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed/chr${i}.vcf.b.gz &

done