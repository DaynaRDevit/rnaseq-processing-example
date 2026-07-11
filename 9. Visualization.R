library(ggplot2)
library(pheatmap)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(DESeq2)
# MA plot- save

png(file="yourpath/MAplot.png")
MAplot <- plotMA(res, ylim = c(-5, 5))
dev.off()

# PCA plot
png(file="~/Documents/TDvsASD/DifExpress/PCAplot.png")
vsd <- vst(dds, blind = FALSE)
plotPCA(vsd, intgroup = "type")
dev.off()



# Variance stabilizing transformation
vsd <- vst(dds, blind = FALSE)

# Select top 20 significant genes
topgenes <- head(order(res$padj), 20)

# Heatmap
library(pheatmap)
pheatmap(assay(vsd)[topgenes, ],
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         annotation_col = metadata,
         show_rownames = TRUE,
         fontsize_row = 8,
         main = "Top 20 Differentially Expressed Genes")
plotPCA(vsd, intgroup = "type")
plotMA(res, ylim = c(-5, 5))
plotDispEsts(dds)
sampleDists <- dist(t(assay(vsd)))
pheatmap(as.matrix(sampleDists), clustering_distance_rows = sampleDists,
         clustering_distance_cols = sampleDists,
         main = "Sample-to-Sample Distances")


# Convert DESeqResults to data frame
res_df <- as.data.frame(res)

# Add gene names
res_df$gene <- rownames(res_df)

# Remove NA values
res_df <- res_df[!is.na(res_df$padj), ]

# Define significance categories
res_df <- res_df %>%
  mutate(
    significant = case_when(
      log2FoldChange > 1 & padj < 0.05 ~ "Upregulated",
      log2FoldChange < -1 & padj < 0.05 ~ "Downregulated",
      TRUE ~ "Not significant"
    ),
    
    # Label only extreme/peripheral genes
    label = ifelse(
      abs(log2FoldChange) > 3 &
        -log10(padj) > 10,
      gene,
      NA
    )
  )

# Volcano plot
ggplot(res_df,
       aes(x = log2FoldChange,
           y = -log10(padj),
           color = significant)) +
  
  geom_point(alpha = 0.7) +
  
  geom_text_repel(
    data = subset(res_df, !is.na(label)),
    aes(label = label),
    size = 3,
    max.overlaps = Inf
  ) +
  
  scale_color_manual(values = c(
    "Upregulated" = "red",
    "Downregulated" = "blue",
    "Not significant" = "grey70"
  )) +
  
  theme_minimal() +
  
  labs(
    title = "Volcano Plot",
    x = "Log2 Fold Change",
    y = "-Log10 Adjusted p-value"
  )
