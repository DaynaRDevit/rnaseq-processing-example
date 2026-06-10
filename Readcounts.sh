#!bin/bash

#Readcount generation
#You should already have subread and featureCounts softwares
sudo apt update

featureCounts -a genomic.gtf -o counts760.txt sortedaligned760.bam  --maxMOp 50 -p --countReadPairs -T 10
featureCounts -a genomic.gtf -o counts767.txt sortedaligned767.bam  --maxMOp 50 -p --countReadPairs -T 10
featureCounts -a genomic.gtf -o counts779.txt sortedaligned779.bam --maxMOp 50 -p --countReadPairs -T 10
featureCounts -a genomic.gtf -o counts782.txt sortedaligned782.bam --maxMOp 50 -p --countReadPairs -T 10

#Cufflinks or Stringtie use.
#I first tried Cufflinks, but it takes long time, even if you specify to use 10 threats to work with it works with one at a time
#to  obtain the same output as cufflinks (transcripts.gtf, genes.fpkm_tracking, and isoforms.fpkm_tracking) usingg stringtie (faster)

#cufflinks -g genomic.gtf -p 10 -o ./quantification760 sortedaligned760.bam 

mkdir stringtie_760_out
stringtie sortedaligned760.bam \
  -G genomic.gtf \
  -p 16 \
  -e \
  -B \
  -A stringtie_760_out/gene_abundances.tsv \
  -o stringtie_760_out/transcripts.gtf

mkdir stringtie_767_out
stringtie sortedaligned767.bam \
  -G genomic.gtf \
  -p 16 \
  -e \
  -B \
  -A stringtie_767_out/gene_abundances.tsv \
  -o stringtie_767_out/transcripts.gtf

mkdir stringtie_779_out
stringtie sortedaligned779.bam \
  -G genomic.gtf \
  -p 16 \
  -e \
  -B \
  -A stringtie_779_out/gene_abundances.tsv \
  -o stringtie_779_out/transcripts.gtf

mkdir stringtie_782_out
stringtie sortedaligned782.bam \
  -G genomic.gtf \
  -p 16 \
  -e \
  -B \
  -A stringtie_782_out/gene_abundances.tsv \
  -o stringtie_782_out/transcripts.gtf






