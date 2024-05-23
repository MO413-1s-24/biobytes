pearson <- read.csv("results/pearson.csv")

up <- read.csv("results/significantly_upregulated_genes.csv") %>% select(gene, SYMBOL)

data <- pearson %>% 
  left_join(up, by = c("gene1" = "gene")) %>% 
  rename("SYMBOL1" = "SYMBOL") %>% 
  left_join(up, by = c("gene2" = "gene")) %>% 
  rename("SYMBOL2" = "SYMBOL") 

write.csv("results/pearson_with_symbol.csv", row.names = FALSE)
