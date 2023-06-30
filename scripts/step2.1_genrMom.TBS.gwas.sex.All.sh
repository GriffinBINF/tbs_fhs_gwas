#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-48:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}
#### sex specific GWAS of All

#for i in `seq 1 22`;
#do
  rvtest --inVcf /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz \
  --pheno /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/AllPhenoData.txt \
  --pheno-name std_tbs \
  --covar /work/larylab/Griffin_Stuff/Haojie_GWAS/data/pheno/AllPhenoData.txt \
  --covar-name AGE,AGE2,sex,Cohort,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --hide-covar \
  --meta score \
  --kinship /work/larylab/Griffin_Stuff/Haojie_GWAS/data/all.kinship \
  --dosage DS \
  --out /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_AllSex/All.EUR.${i}
#done


  # rvtest --inVcf /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chrX.poly.imputed.vcf.gz \
  # --pheno /home/059904/work/1.3TBS/data/phe/genrMom/cleaned/EUR/cleaned.genrMom.EUR.phe.All.txt \
  # --pheno-name stdTBS \
  # --covar /home/059904/work/1.3TBS/data/phe/genrMom/cleaned/EUR/cleaned.genrMom.EUR.cov.All.txt \
  #   --covar-name Age,Age2,sex,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10 \
  # --hide-covar \
  # --meta score \
  # --xHemiKinship /home/059904/work/1.3TBS/data/genetic/genrMom/kinship_EUR/genrMom.EUR.xHemi.kinship \
  # --dosage DS \
  # --out /home/059904/work/1.3TBS/result/GWAS/genrMom/EUR/All/byChr/genrMom.All.EUR.chrX
  # 
  

