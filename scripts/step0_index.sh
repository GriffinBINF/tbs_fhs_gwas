#!/bin/sh
#SBATCH --mem=40G


mapfile -t FILENAMES < compressionNames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

# base=$(basename $i _c)
# 
# echo ${base}
# for i in `seq 22 22`
# do
bcftools index -t /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed/${i}
# done

# for i in `seq 22 22`
# do
#bcftools index -t /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed_c2/chr${i}.vcf.b.gz

# done