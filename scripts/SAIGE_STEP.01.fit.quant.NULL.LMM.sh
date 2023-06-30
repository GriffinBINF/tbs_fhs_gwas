#!/bin/sh
#SBATCH -o ./reports/output.SAIGE.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-70:00

mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

Rscript /work/larylab/Griffin_Stuff/tools/SAIGE/extdata/step1_fitNULLGLMM.R     \
        --plinkFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/plink_bed/${i}  \
        --useSparseGRMtoFitNULL=FALSE    \
        --phenoFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/data/SAIGE/phenoSAIGE_All.txt \
        --phenoCol=std_tbs \
        --covarColList=SEX,Cohort,AGE,AGE2,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
        --qCovarColList=SEX,Cohort  \
        --sampleIDColinphenoFile=IID \
        --invNormalize=TRUE     \
        --traitType=quantitative        \
        --outputPrefix=/work/larylab/Griffin_Stuff/Haojie_GWAS/results/SAIGE/SexAll \
        --nThreads=24	\
        --IsOverwriteVarianceRatioFile=TRUE