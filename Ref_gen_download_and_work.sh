#!bin/bash
# Obtaining Ref genome and GTF file
#We are using curl to download the ref genome and GTF file. Curl was previously installed.

sudo apt update
curl -o datasets 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets'
curl -o dataformat 'https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/dataformat'
chmod +x datasets dataformat

#Download ref genome and GTF file in a zip file
./datasets download genome accession GCF_000001405.40 --include genome,gtf
unzip ncbi_dataset.zip 

# Access the files, you should have GCF_000001405.40_GRCh38.p14_genomic.fna and genomic.gtf
cd ncbi_dataset/ncbi_dataset/data/GCF_000001405.40
#Rename the fasta file for an easier name to call
mv GCF_000001405.40_GRCh38.p14_genomic.fna hsa_fasta.fna

# Move the files to the working folder for their use (you can put the working directory instead of the "../"
 mv hsa_fasta.fna ../../../../
 mv genomic.gtf ../../../../




