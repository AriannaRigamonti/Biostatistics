########################################################################################
## randomized phase III study of panitumumab with FOLFOX4 for first-line treatment of ##
##                           metastatic colorectal cancer                             ##
########################################################################################

library(readxl)
library(survival)
library(ggplot2)
library(ggpubr)

colon1 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adae_pds2019")
colon2 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adlb_pds2019")
colon3 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adls_pds2019")
colon4 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adpm_pds2019")
colon5 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adrsp_pds2019")
colon6 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "adsl_pds2019")
colon7 <- read_excel("/Users/ariannarigamonti/Documents/Università/Bioinformatics/I anno/II semestre/Biostatistics/Progetto/Dataset/colon.xlsx", sheet = "biomark_pds2019")

# unione dei dataframe interessanti
col1_col6_merged <- merge(colon1, colon6, by.x = "SUBJID")
col1_col6_col7_merged <- merge(col1_col6_merged, colon7, by.x = "SUBJID")
col1_col6_col7_merged <- subset(col1_col6_col7_merged, select = -c(BMMTNM2, BMMTR2, BMMTNM3, BMMTR3, BMMTNM4, BMMTR4, BMMTNM5, BMMTR5, BMMTNM6, BMMTR6, BMMTNM7, BMMTR7, BMMTNM15, BMMTR15, BMMTNM16, BMMTR16))
df_final <- subset(col1_col6_col7_merged, BMMTR1 %in% c("Mutant", "Wild-type"))

# Data frame per i soggetti con il gene BMMTR1 classificato come "Mutant"
mutant <- subset(df_final, BMMTR1 == "Mutant")

# Data frame per i soggetti con il gene BMMTR1 classificato come "Wild-type"
wild_type <- subset(df_final, BMMTR1 == "Wild-type")







