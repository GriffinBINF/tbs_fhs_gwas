#!/bin/sh
#SBATCH --mem=80G
#SBATCH --partition=long
#SBATCH -t 0-40:00
cd /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_AllSex/

(zgrep -E -h  '^1\s|#|CHROM' All.EUR.chr1.MetaScore.assoc.gz; \
zgrep -E -h '^2\s'  All.EUR.chr2.MetaScore.assoc.gz; \
zgrep -E -h '^3\s'  All.EUR.chr3.MetaScore.assoc.gz; \
zgrep -E -h '^4\s'  All.EUR.chr4.MetaScore.assoc.gz; \
zgrep -E -h '^5\s'  All.EUR.chr5.MetaScore.assoc.gz; \
zgrep -E -h '^6\s'  All.EUR.chr6.MetaScore.assoc.gz; \
zgrep -E -h '^7\s'  All.EUR.chr7.MetaScore.assoc.gz; \
zgrep -E -h '^8\s'  All.EUR.chr8.MetaScore.assoc.gz; \
zgrep -E -h '^9\s'  All.EUR.chr9.MetaScore.assoc.gz; \
zgrep -E -h '^10\s'  All.EUR.chr10.MetaScore.assoc.gz; \
zgrep -E -h '^11\s'  All.EUR.chr11.MetaScore.assoc.gz; \
zgrep -E -h '^12\s'  All.EUR.chr12.MetaScore.assoc.gz; \
zgrep -E -h '^13\s'  All.EUR.chr13.MetaScore.assoc.gz; \
zgrep -E -h '^14\s'  All.EUR.chr14.MetaScore.assoc.gz; \
zgrep -E -h '^15\s'  All.EUR.chr15.MetaScore.assoc.gz; \
zgrep -E -h '^16\s'  All.EUR.chr16.MetaScore.assoc.gz; \
zgrep -E -h '^17\s'  All.EUR.chr17.MetaScore.assoc.gz; \
zgrep -E -h '^18\s'  All.EUR.chr18.MetaScore.assoc.gz; \
zgrep -E -h '^19\s'  All.EUR.chr19.MetaScore.assoc.gz; \
zgrep -E -h '^20\s'  All.EUR.chr20.MetaScore.assoc.gz; \
zgrep -E -h '^21\s'  All.EUR.chr21.MetaScore.assoc.gz; \
zgrep -E -h '^22\s'  All.EUR.chr22.MetaScore.assoc.gz) | bgzip -c > /work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_AllSex/All.EUR.TBS.MetaScore.assoc.gz

#\
#zgrep -E -h '^X\s'   All.chrX.MetaScore.assoc.gz )