#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH -t 0-23:59

Rscript /work/larylab/Griffin_Stuff/tools/SAIGE/extdata/step2_SPAtests.R        \
        --bedFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/plink_bed/chr22.bed \
        --bimFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/plink_bed/chr22.bim       \
        --famFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/plink_bed/chr22.fam       \
        --AlleleOrder=alt-first \
        --SAIGEOutputFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/results/SAIGE_out \
        --chrom=22       \
        --minMAF=0 \
        --minMAC=20 \
        --GMMATmodelFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/results/SAIGE/SexAll.rda\
        --varianceRatioFile=/work/larylab/Griffin_Stuff/Haojie_GWAS/results/SAIGE/SexAll.varianceRatio.txt   \
        --LOCO=FALSE \
        --is_output_moreDetails=TRUE