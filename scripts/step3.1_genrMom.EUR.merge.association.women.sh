#!/bin/sh
#SBATCH --mem=50GB
cd /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_Female
(zgrep -E -h  '^1\s|#|CHROM' Female.EUR.chr1.MetaScore.assoc.gz; \
zgrep -E -h '^2\s'  Female.EUR.chr2.MetaScore.assoc.gz; \
zgrep -E -h '^3\s'  Female.EUR.chr3.MetaScore.assoc.gz; \
zgrep -E -h '^4\s'  Female.EUR.chr4.MetaScore.assoc.gz; \
zgrep -E -h '^5\s'  Female.EUR.chr5.MetaScore.assoc.gz; \
zgrep -E -h '^6\s'  Female.EUR.chr6.MetaScore.assoc.gz; \
zgrep -E -h '^7\s'  Female.EUR.chr7.MetaScore.assoc.gz; \
zgrep -E -h '^8\s'  Female.EUR.chr8.MetaScore.assoc.gz; \
zgrep -E -h '^9\s'  Female.EUR.chr9.MetaScore.assoc.gz; \
zgrep -E -h '^10\s'  Female.EUR.chr10.MetaScore.assoc.gz; \
zgrep -E -h '^11\s'  Female.EUR.chr11.MetaScore.assoc.gz; \
zgrep -E -h '^12\s'  Female.EUR.chr12.MetaScore.assoc.gz; \
zgrep -E -h '^13\s'  Female.EUR.chr13.MetaScore.assoc.gz; \
zgrep -E -h '^14\s'  Female.EUR.chr14.MetaScore.assoc.gz; \
zgrep -E -h '^15\s'  Female.EUR.chr15.MetaScore.assoc.gz; \
zgrep -E -h '^16\s'  Female.EUR.chr16.MetaScore.assoc.gz; \
zgrep -E -h '^17\s'  Female.EUR.chr17.MetaScore.assoc.gz; \
zgrep -E -h '^18\s'  Female.EUR.chr18.MetaScore.assoc.gz; \
zgrep -E -h '^19\s'  Female.EUR.chr19.MetaScore.assoc.gz; \
zgrep -E -h '^20\s'  Female.EUR.chr20.MetaScore.assoc.gz; \
zgrep -E -h '^21\s'  Female.EUR.chr21.MetaScore.assoc.gz; \
zgrep -E -h '^22\s'  Female.EUR.chr22.MetaScore.assoc.gz) |bgzip -c > /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_Female/Female.EUR.TBS.MetaScore.assoc.gz

#\
#zgrep -E -h '^X\s'   Female.EUR.chrX.MetaScore.assoc.gz )