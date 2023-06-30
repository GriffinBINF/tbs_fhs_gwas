#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH -t 0-10:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}
#### sex specific GWAS of All

#for i in `seq 1 22`;
#do
rvtest --inVcf /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz \
--pheno /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/phenoData_all.txt \
--pheno-name std_tbs \
--covar /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/phenoData_all.txt \
--covar-name AGE,AGE2,SEX,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
--hide-covar \
--meta score \
--kinship /work/larylab/Griffin_Stuff/Haojie_GWAS/data/kinship2/${i}.kinship \
--dosage DS \
--out /work/larylab/Griffin_Stuff/Haojie_GWAS/results/kinship2/All.EUR.${i}