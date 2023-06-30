#!/bin/sh
#SBATCH --mem=80G

mapfile -t FILENAMES < samplenames
i=${FILENAMES[$SLURM_ARRAY_TASK_ID]}
echo ${i}

base=$(basename $i -s .vcf.b.gz)

echo ${base}

# for i in `seq 1 21`
# do
zcat ${i} | bcftools sort -Oz -o /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed/${base}.vcf.b.gz -T /scratch/tibbitts.g/larylab 
# done

# for i in `seq 1 21`
# do
#zcat /work/larylab/dbgap/data3/phg000835.v5.FHS_SHARE_imputed_HRC1.genotype-calls-vcf.c2/chr${i}_c2.vcf.gz | bcftools sort /work/larylab/dbgap/data3/phg000835.v5.FHS_SHARE_imputed_HRC1.genotype-calls-vcf.c2/chr${i}_c2.vcf.gz -Oz -o /work/larylab/Griffin_Stuff/Haojie_GWAS/data/compressed_c2/chr${i}.vcf.b.gz -T /work/larylab/Griffin_Stuff/Haojie_GWAS/data/tmp

# done
