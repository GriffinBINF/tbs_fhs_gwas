#!/bin/sh
#SBATCH -o ./reports/output.merge.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH -t 0-23:59

cd /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress
bcftools concat chr{1..22}.poly.imputed.vcf.gz -Oz -o  ALL.poly.imputed.vcf.gz
