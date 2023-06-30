#!/bin/sh
#SBATCH -o ./reports/output.male.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-40:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}
#### sex specific GWAS of Males

#for i in `seq 1 22`;
#do
  rvtest --inVcf /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz \
  --pheno /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/MalePhenoData.txt \
  --pheno-name std_tbs \
  --covar /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/MalePhenoData.txt \
  --covar-name AGE,AGE2,Cohort,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --hide-covar \
  --meta score \
  --kinship /work/larylab/Griffin_Stuff/Haojie_GWAS/data/all.kinship\
  --dosage DS \
  --out /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_Male/Male.EUR.${i}


  
  

