if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

pkgs = c("phyloseq", "vegan", "DESeq2")

BiocManager::install(pkgs, update=TRUE, ask=FALSE)
