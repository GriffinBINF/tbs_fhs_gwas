#!/bin/sh
#SBATCH --mem=40G
for i in `seq 11 22`;
do
  vcf2kinship --inVcf /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chr${i}.poly.imputed.vcf.gz --xHemi --ped /home/059904/work/1.3TBS/data/genetic/genrMom/GenrMoms.chrX.EUR.ped --bn --thread 24 --xLabel X --minMAF 0.05 --out /home/059904/work/1.3TBS/data/genetic/genrMom/kinship_EUR/byChr/chr${i}
done

vcf2kinship --inVcf /home/059904/work/1.3TBS/data/genetic/genrMom/poly/genrMoms.chrX.poly.imputed.vcf.gz --xHemi --ped  /home/059904/work/1.3TBS/data/genetic/genrMom/GenrMoms.chrX.EUR.ped --bn --thread 24 --xLabel X --minMAF 0.05 --out /home/059904/work/1.3TBS/data/genetic/genrMom/kinship_EUR/byChr/chrX
