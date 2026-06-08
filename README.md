# rnaseq-processing-example
RNA-seq data processing pipeline I worked on using public datasets. I hope this is helpful for people starting in the NGS bioinformatics world.

## Project Overview
This repository demonstrates a typical bulk RNA-seq workflow from raw FASTQ files to differential expression analysis.
This work was performed using:
1. Google Cloud Console
1. Linux Bash Shell
2. R

## Workflow

1. Quality control with FastQC
   # This step was used to do a first inspection of the datasets downloaded from public databases
2. Quality control using Fastp
   # Fastp performs its own quality control
   # Report check: Fastp retrieves a post-QC report.
5. Download of the reference genome
6. Index of reference genome
7. Alignment of reference genome
8. Sorting the reference genome
5. Gene quantification with featureCounts / stringtie
6. Differential expression analysis using DESeq2
7. Visualisation and interpretation of results

## Software Versions

| Software | Version |
|-----------|---------|
| FastQC v0.12.1
| fastp 0.23.4
| bwa 0.7.17-r1188
| featureCounts v2.0.6
| cufflinks v2.2.1
| stringtie v2.2.1
| R | 4.4.1 |
| DESeq2 | 1.46.0 |

## Directory Structure

```text
scripts/
results/
figures/
```

## Input Data

The workflow was tested using publicly available RNA-seq data from [source].

## How to Run

```bash
bash scripts/01_fastqc.sh
bash scripts/02_trimming.sh
bash scripts/03_alignment.sh
```

## Output

The pipeline produces:

- Quality control reports
- BAM alignment files
- Gene count matrix
- Differential expression results
- PCA and volcano plots

## Citation

If you use this workflow, please cite the corresponding software tools.
