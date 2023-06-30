#!/bin/sh
#SBATCH --mem=50GB
cd /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_Male/
(zgrep -E -h  '^1\s|#|CHROM' Male.EUR.chr1.MetaScore.assoc.gz; \
zgrep -E -h '^2\s'  Male.EUR.chr2.MetaScore.assoc.gz; \
zgrep -E -h '^3\s'  Male.EUR.chr3.MetaScore.assoc.gz; \
zgrep -E -h '^4\s'  Male.EUR.chr4.MetaScore.assoc.gz; \
zgrep -E -h '^5\s'  Male.EUR.chr5.MetaScore.assoc.gz; \
zgrep -E -h '^6\s'  Male.EUR.chr6.MetaScore.assoc.gz; \
zgrep -E -h '^7\s'  Male.EUR.chr7.MetaScore.assoc.gz; \
zgrep -E -h '^8\s'  Male.EUR.chr8.MetaScore.assoc.gz; \
zgrep -E -h '^9\s'  Male.EUR.chr9.MetaScore.assoc.gz; \
zgrep -E -h '^10\s'  Male.EUR.chr10.MetaScore.assoc.gz; \
zgrep -E -h '^11\s'  Male.EUR.chr11.MetaScore.assoc.gz; \
zgrep -E -h '^12\s'  Male.EUR.chr12.MetaScore.assoc.gz; \
zgrep -E -h '^13\s'  Male.EUR.chr13.MetaScore.assoc.gz; \
zgrep -E -h '^14\s'  Male.EUR.chr14.MetaScore.assoc.gz; \
zgrep -E -h '^15\s'  Male.EUR.chr15.MetaScore.assoc.gz; \
zgrep -E -h '^16\s'  Male.EUR.chr16.MetaScore.assoc.gz; \
zgrep -E -h '^17\s'  Male.EUR.chr17.MetaScore.assoc.gz; \
zgrep -E -h '^18\s'  Male.EUR.chr18.MetaScore.assoc.gz; \
zgrep -E -h '^19\s'  Male.EUR.chr19.MetaScore.assoc.gz; \
zgrep -E -h '^20\s'  Male.EUR.chr20.MetaScore.assoc.gz; \
zgrep -E -h '^21\s'  Male.EUR.chr21.MetaScore.assoc.gz; \
zgrep -E -h '^22\s'  Male.EUR.chr22.MetaScore.assoc.gz) | bgzip -c > /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_Male/Male.EUR.TBS.MetaScore.assoc.gz