#!/bin/sh
#SBATCH -o ./reports/output.%a.out # STDOUT
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-40:00
export PATH=$PATH:/work/larylab/Griffin_Stuff/tools/rvtests/executable
mapfile -t FILENAMES < basenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

vcf2kinship --inVcf /work/larylab/Griffin_Stuff/Haojie_GWAS/data/in_progress/${i}.poly.imputed.vcf.gz --xHemi --ped /work/larylab/Griffin_Stuff/Haojie_GWAS/data/kinship/pedigree_recode.ped --bn --minMAF 0.05 --out /work/larylab/Griffin_Stuff/Haojie_GWAS/data/kinship3/${i}

