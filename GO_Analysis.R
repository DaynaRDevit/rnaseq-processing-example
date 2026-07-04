BiocManager::install("org.Hs.eg.db")
BiocManager::install("clusterProfiler")
# Get significant genes based on the logfoldchange and adjP value cutoffs
sigGenes <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
#get gene list for the significant genes


geneList <- rownames(sigGenes)  #
library(org.Hs.eg.db)
library(clusterProfiler)
#Remove the "LOC" prefix to leave only the numeric IDs.
gene_df <- bitr(
  geneList,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

head(gene_df)
entrez_genes <- unique(gene_df$ENTREZID)
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
                         keyType = "ENTREZID",
                         ont = "MF",  # Molecular Functions
                         pAdjustMethod = "BH",
                         pvalueCutoff = 0.05,
                         qvalueCutoff = 0.2)
go_enrich_CC <- enrichGO(gene = geneList,
                         OrgDb = org.Hs.eg.db,
                         keyType = "ENTREZID",
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
#if failed
go_enrich_BP2 <- pairwise_termsim(go_enrich_BP)

go_enrich_BP2

emapplot(go_enrich_BP2, showCategory = 4)
cnetplot(kegg_all, showCategory = 20)

goplot(kegg_all, showCategory = 20)


go_MF_test <- enrichGO(
  gene = unique(gene_df$ENTREZID),
  OrgDb = org.Hs.eg.db,
  keyType = "ENTREZID",
  ont = "MF",
  pvalueCutoff = 1,
  qvalueCutoff = 1
)

nrow(as.data.frame(go_MF_test))
head(as.data.frame(go_MF_test)[, c("Description", "p.adjust")])
dotplot(go_MF_test, showCategory =20)


##
kegg_all <- enrichKEGG(
  gene = geneList,
  pvalueCutoff = 1
)

nrow(as.data.frame(kegg_all))
head(as.data.frame(kegg_all))
