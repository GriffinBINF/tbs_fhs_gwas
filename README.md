# tbs_fhs_gwas
GWAS of trabecular bone score (TBS) in the Framingham Osteoporosis Study

# Acknowledgements
The code in this repository was adapted from code written by Dr. Lu Haojie of Erasumus University Medical Center in Rotterdam, The Netherlands.
As such this repo serves more as a representation of my ability adapt workflows to a new cluster, and more efficiently parallelize said workflow.

**Description and Notes**
Code for a GWAS I ran while working at Dr. Chrisine Lary's lab at Northeastern University in 2023. The study is concerned with genetic variant associations with trabecular bone score which is a different measure of bone health than the typical DXA BMD scan. We were asked by our colleague Dr. Lu Haojie to investigate this assocation using our data from the Framingham Osteoporosis Study.

I adapted code from Lu Haojie to run on our data and to be parallelizable using slurm.

For unknown reasons we are missing the sex chromosomes from our dataset.

**Parallelization Overview**
In order to parallelize your workflow, put as many of your calls as possible into shell scripts and use #SBATCH commands at the top of your script to set parameters such as time limits, partition, and memory limits.

When you call your script, call using sbatch \<script.sh\> --array= and specify the element from your map file to call the script on. This will schedule simultaneous jobs for each call. In practice with these scripts, you would call --array=0:21 so that the scripts run independently on each chromosome.

**Contents**
*Step 0: Preprocessing*
The FHS genotype files were split amongst two consent groups and so required extensive preprocessing to merge them

build_phenoData.Rmd builds the phenotype and pedigree files for FHS 
step0\_compress.sh takes a list of the files to compress from a mapfile and runs bcftools sort to compress them all
step0\_index.sh indexes the compressed vcf files
step0\_merge\_consent\_groups.sh merges the consent groups

*Step 1: Build Kinship Matrices*
Mostly Haojie's code but parallelized and condensed into one script per step

step1.1_genrMom.get.ployVcf_sub1.sh filters for poly imputed SNPs
step1.2.genrMom.kinship.EUR.sub1.sh runs vcftokinship python script to build the kinship matrix for each chromosome
step1.3.genrMom.mergeKinship.EUR.sh merges all of the chromosome kinship matrices into one 

*Step 2: Run the GWAS*
Runs sex separated and non-sex separated GWAS for variant associations with average trabecular bone score
Each script outputs one assoc file per chromosome

step2.1_genrMom.TBS.gwas.sex.All.sh
step2.1_genrMom.TBS.gwas.sex.men.sh
step2.1_genrMom.TBS.gwas.sex.women.sh 

*Step 3: Merge Assoc Files*
Merge the assoc files from each chromosome into one assoc for each GWAS

step3.1_genrMom.EUR.merge.association.All.sh
step3.1_genrMom.EUR.merge.association.men.sh
step3.1_genrMom.EUR.merge.association.women.sh

