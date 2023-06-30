#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH -t 0-8:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

# for i in `seq 22 22`
# do
bcftools merge /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed/${i}_c1.vcf.b.gz /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed/${i}_c2.vcf.b.gz -O z > /work/larylab/Griffin_Stuff/Haojie_GWAS/data/phg000835.v5.MERGED_FHS_SHARE_imputed_HRC1.genotype-calls-vcf/${i}.vcf.gz
# done