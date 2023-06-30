#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH -t 0-23:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}


 bcftools view -c 1:minor /work/larylab/Griffin_Stuff/Haojie_GWAS/data/phg000835.v5.MERGED_FHS_SHARE_imputed_HRC1.genotype-calls-vcf/${i}.vcf.gz  -O z > /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz 
 
 bcftools tabix -p vcf /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz
