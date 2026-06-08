#!bin/bash
#Download of public datasets used for this workflow
#Control samples
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/060/SRR36999760/SRR36999760_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/060/SRR36999760/SRR36999760_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/067/SRR36999767/SRR36999767_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/067/SRR36999767/SRR36999767_2.fastq.gz


#ASD samples
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/079/SRR36999779/SRR36999779_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/079/SRR36999779/SRR36999779_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/082/SRR36999782/SRR36999782_1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR369/082/SRR36999782/SRR36999782_2.fastq.gz

#TD 1=SRR36999767
#TD 2=SRR36999760
#ASD 1=SRR36999782 
#ASD 2=SRR36999779
