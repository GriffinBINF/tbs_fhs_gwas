library(dplyr)
library(biomaRt)
library(BSgenome)

BiocManager::install('SNPlocs.Hsapiens.dbSNP155.GRCh37')
library(SNPlocs.Hsapiens.dbSNP155.GRCh37)

assoc <- read.table(gzfile('/work/larylab/Griffin_Stuff/Haojie_GWAS/results/All.EUR.chr22.MetaScore.assoc.gz'), header = T) %>%
  rename(BP = POS, P = p.value) %>%
  arrange(BP)

snps <- SNPlocs.Hsapiens.dbSNP155.GRCh37

assoc_snps <- snpsBySeqname(snps, '22')

GWAS_SNPs <- makeGRangesFromDataFrame(chr22,
                                      seqnames.field = 'CHR',
                                      start.field = 'BP',
                                      end.field = 'BP',
                                      keep.extra.columns = T)

qHits <- queryHits(findOverlaps(query = GWAS_SNPs, subject = chr22_snps, type = 'within'))
subHits <- subjectHits(findOverlaps(query = GWAS_SNPs, subject = chr22_snps, type = 'within'))

overlaps <- data.frame(GWAS_SNPs[qHits,], chr22_snps[subHits,])
overlaps1 <- overlaps %>%
  mutate(CHR = 22,
         P = as.numeric(P)) %>%
  select(CHR, start, RefSNP_id, P) %>%
  filter(!is.na(RefSNP_id),
         !is.na(P)) %>%
  rename(BP = start, SNP = RefSNP_id)

overlaps1 <- data.frame(overlaps1)

write.csv(overlaps1, '/work/larylab/Griffin_Stuff/Haojie_GWAS/results/rvtest_AllSex/chr22_rsids.csv')