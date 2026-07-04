library(ggplot2)
library(ggrepel)
library(dplyr)

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