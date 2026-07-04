if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")

library(DESeq2)

setwd("your folder pathway")

ASDvsTD <- read.table("ASDvsTD_CountsF.txt", row.names = 1, header = TRUE)
metadata <- read.table("metadata.txt", row.names = 1, header = TRUE)

# Ensure sample names match
all(colnames(ASDvsTD) == rownames(metadata))
metadata$type <- factor(metadata$type)
dds <- DESeqDataSetFromMatrix(countData = ASDvsTD,
                              colData = metadata,
                              design = ~ type)  # replace 'condition' with your variable

dds <- DESeq(dds)
res <- results(dds)

# Summary

# Order by adjusted p-value
resOrdered <- res[order(res$padj), ]
#write.csv(as.data.frame(resOrdered), 
#          file = "Dseq2_results_all.csv")

# Significant genes
sigGenes <- subset(resOrdered, padj < 0.05 & abs(log2FoldChange) > 2)
#write.csv(as.data.frame(sigGenes), 
 #         file = "Dseq2_significant.csv")
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

