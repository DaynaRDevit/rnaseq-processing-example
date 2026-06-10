#!bin/bash
#Having the ref genome indexed, we can perform the alignment. 
#We are using both files (paired seq data) _1 and _2 to align to the ref genome

#Alignment
bwa mem Homo_sapiens.fna SRR36999760_1.fastq.gz SRR36999760_2.fastq.gz > aligned760.bam
bwa mem Homo_sapiens.fna SRR36999767_1.fastq.gz SRR36999767_2.fastq.gz > aligned767.bam
bwa mem Homo_sapiens.fna SRR36999779_1.fastq.gz SRR36999779_2.fastq.gz > aligned779.bam
bwa mem Homo_sapiens.fna SRR36999782_1.fastq.gz SRR36999782_2.fastq.gz > aligned782.bam

#Sort the aligned bam files
samtools sort aligned760.bam -o sortedaligned760.bam
samtools sort aligned767.bam -o sortedaligned767.bam
samtools sort aligned779.bam -o sortedaligned779.bam
samtools sort aligned782.bam -o sortedaligned782.bam

#Index the sorted aligned file
samtools index sortedaligned760.bam
samtools index sortedaligned767.bam
samtools index sortedaligned779.bam
samtools index sortedaligned782.bam
