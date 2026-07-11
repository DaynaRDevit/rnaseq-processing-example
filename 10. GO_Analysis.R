BiocManager::install("org.Hs.eg.db")
BiocManager::install("clusterProfiler")
# Get significant genes based on the logfoldchange and adjP value cutoffs
sigGenes <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
# Get gene list for the significant genes

geneList <- rownames(sigGenes)  #
library(org.Hs.eg.db)
library(clusterProfiler)
#Remove the "LOC" prefix to leave only the numeric IDs.
#perform gene ontology analysis
###
library(clusterProfiler)
library(org.Hs.eg.db)

#If you have hundreds or thousands of mapped genes, the warning can usually be ignored.
go_enrich_BP <- enrichGO(
  gene = geneList,
  OrgDb = org.Hs.eg.db,
  keyType = "SYMBOL",
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.1,
  qvalueCutoff = 0.1
)


go_enrich_MF <- enrichGO(gene = geneList,
                         OrgDb = org.Hs.eg.db,
                         keyType = "SYMBOL",
                         ont = "MF",  # Molecular Functions
                         pAdjustMethod = "BH",
                         pvalueCutoff = 0.05,
                         qvalueCutoff = 0.2)
go_enrich_CC <- enrichGO(gene = geneList,
                         OrgDb = org.Hs.eg.db,
                         keyType = "SYMBOL",
                         ont = "CC",  # Cellular Component
                         pAdjustMethod = "BH",
                         pvalueCutoff = 0.1,
                         qvalueCutoff = 0.1)
#perform Pathway enrichment analysis
kegg_enrich <- enrichKEGG(gene = geneList,
                          organism = 'hsa',
                          pvalueCutoff = 0.1)
###Visualize your results using plots
library(enrichplot)
dotplot(go_enrich_BP, showCategory =20, color = "pvalue")
barplot(kegg_all, showCategory = 20)
go_enrich_BP <- pairwise_termsim(go_enrich_BP)
emapplot(go_enrich_BP, showCategory = 20)
