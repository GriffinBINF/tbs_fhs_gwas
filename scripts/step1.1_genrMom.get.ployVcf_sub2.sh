#!/bin/sh
#SBATCH --mem=40G
for i in `seq 11 22`;
do
  bcftools view -c 1:minor /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chr${i}.vcf.gz  -O z > /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chr${i}.poly.imputed.vcf.gz
  tabix -p vcf /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chr${i}.poly.imputed.vcf.gz
done

bcftools view -c 1:minor /home/059904/work/1.3TBS/data/genetic/genrMom/poly/chrX.no.auto.dose.vcf.gz -O z > /home/059904/work/1.3TBS/data/genetic/genrMoms/poly/genrMoms.chrX.imputed.poly.vcf.gz
tabix -p vcf /home/059904/work/1.3TBS/data/genetic/genrMoms/poly/genrMoms.chrX.imputed.poly.vcf.gz
