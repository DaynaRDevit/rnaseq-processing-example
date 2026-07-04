if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")

library(DESeq2)

setwd("C:/Users/sheri/Desktop/R/NGS")

# Read counts (genes x samples)
counts <- read.csv("counts.csv", row.names = 1)

# Read metadata (samples x conditions)
metadata <- read.csv("metadata.csv", row.names = 1)

# Ensure sample names match
all(colnames(counts) == rownames(metadata))
metadata$type <- factor(metadata$type)
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = metadata,
                              design = ~ type)  # replace 'condition' with your variable
dds <- DESeq(dds)
res <- results(dds)
# Summary
summary(res)

# Order by adjusted p-value
resOrdered <- res[order(res$padj), ]
write.csv(as.data.frame(resOrdered), 
          file = "Dseq2_results_all.csv")

# Significant genes
sigGenes <- subset(resOrdered, padj < 0.05 & abs(log2FoldChange) > 2)
write.csv(as.data.frame(sigGenes), 
          file = "Dseq2_significant.csv")

