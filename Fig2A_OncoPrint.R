library(data.table)
library(dplyr)
library(tidyr)
library(ComplexHeatmap)

### read in input dataframe ###
df <- fread("./Data/TCGA_p53_pathway_alterations.csv")
df_s <- filter(df, !is.na(p53_mut_status_1isMUT) & !is.na(p53_cnv_status_1isLOSS))

### recode alterations for OncoPrint plot ###
df_s <- unite(df_s,p53_mut_cn,p53_mut_status_1isMUT,p53_cnv_status_1isLOSS, sep = "_", remove = F)
df_s <- unite(df_s,ATM_mut_cn,ATM_mut_status_1isMUT,ATM_cnv_status_1isLOSS, sep = "_", remove = F)

df_s$TP53 <- unlist(sapply(df_s$p53_mut_cn, function(x){
  if(x=="0_0") return(" ")
  if(x=="1_0") return("MUT;")
  if(x=="0_1") return("HOMDEL;")
  if(x=="1_1") return("MUT;HOMDEL;")
  else return(NA)
}))

df_s$ATM <- unlist(sapply(df_s$ATM_mut_cn, function(x){
  if(x=="0_0") return(" ")
  if(x=="1_0") return("MUT;")
  if(x=="0_1") return("HOMDEL;")
  if(x=="1_1") return("MUT;HOMDEL;")
  else return(NA)
}))

df_s$MDM4 <- unlist(sapply(df_s$MDM4_cnv_status_1isGAIN, function(x){
  if(x=="0") return(" ")
  if(x=="1") return("AMP;")
  else return(NA)
}))

df_s$MDM2 <- unlist(sapply(df_s$MDM2_cnv_status_1isGAIN, function(x){
  if(x=="0") return(" ")
  if(x=="1") return("AMP;")
  else return(NA)
}))

df_s$PPM1D <- unlist(sapply(df_s$PPM1D_cnv_status_1isGAIN, function(x){
  if(x=="0") return(" ")
  if(x=="1") return("AMP;")
  else return(NA)
}))

df_s$CDKN2A <- unlist(sapply(df_s$CDKN2A_cnv_status_1isLOSS, function(x){
  if(x=="0") return(" ")
  if(x=="1") return("HOMDEL;")
  else return(NA)
}))

df_s$CDKN1A <- unlist(sapply(df_s$CDKN1A_cnv_status_1isLOSS, function(x){
  if(x=="0") return(" ")
  if(x=="1") return("HOMDEL;")
  else return(NA)
}))

### reformat for OncoPrint plot ###
df_mtx <- select(df_s,tcga_participant_barcode,TP53,ATM,MDM4,MDM2,CDKN2A,CDKN1A)
mat <- df_mtx
mat[is.na(mat)] = ""
vec_sample <- as.character(df_mtx$tcga_participant_barcode)
vec_gene <- colnames(df_mtx)[-1]
mat = mat[, -1]
mat = t(as.matrix(mat))
colnames(mat) <- vec_sample

### add graphics to each alteration ###
col = c("HOMDEL" = "#0072BD", "AMP" = "#D95319", "MUT" = "#77AC30")

alter_fun = list(
  background = function(x, y, w, h) {
    grid.rect(x, y, w-unit(2, "pt"), h-unit(2, "pt"), 
              gp = gpar(fill = "#F5F5F5", col = NA))
  },
  # big blue
  HOMDEL = function(x, y, w, h) {
    grid.rect(x, y, w-unit(2, "pt"), h-unit(2, "pt"), 
              gp = gpar(fill = col["HOMDEL"], col = NA))
  },
  # big red
  AMP = function(x, y, w, h) {
    grid.rect(x, y, w-unit(2, "pt"), h-unit(2, "pt"), 
              gp = gpar(fill = col["AMP"], col = NA))
  },
  # small green
  MUT = function(x, y, w, h) {
    grid.rect(x, y, w-unit(2, "pt"), h*0.33, 
              gp = gpar(fill = col["MUT"], col = NA))
  }
)

### make an OncoPrint plot ###
column_title = ""
heatmap_legend_param = list(title = "Alternations", at = c("HOMDEL", "AMP", "MUT"), 
                            labels = c("Deletion", "Amplification", "Mutation"))
oncoPrint(mat,
          alter_fun = alter_fun, col = col, 
          column_title = column_title, heatmap_legend_param = heatmap_legend_param)