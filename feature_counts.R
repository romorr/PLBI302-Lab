library(Rsubread)

bamfiles <- list.files("/home/grero296/project/kiwifruit/mapped_out_database/", pattern="bam$", full.names=TRUE)

fc <- featureCounts(
  files = bamfiles,
  annot.ext = "/home/grero296/project/kiwifruit/cleaned.gtf",
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "exon",
  GTF.attrType = "gene_id",
  nthreads = 48,
  countReadPairs = TRUE,
  isPairedEnd = TRUE
)

write.table(fc$counts, "kiwifruit_counts_all2.txt", sep="\t", quote=FALSE)