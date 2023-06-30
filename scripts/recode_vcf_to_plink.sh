#!/bin/sh
#SBATCH -o ./reports/output.recode.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-40:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

cd /work/larylab/Griffin_Stuff/Haojie_GWAS/data/phg000835.v5.MERGED_FHS_SHARE_imputed_HRC1.genotype-calls-vcf

plink2 --vcf ${i}.vcf.gz --make-bed --out plink_bed/${i}