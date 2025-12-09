#Load libraries
library(readr)
library(dplyr)
library(ggplot2)
#set wd
deeparg_dir <- "/Users/cmdb/qb25-answers/pathofact_project/deeparg_results" #deepARG pipeline results, replace with your file name 
meta_dir    <- "/Users/cmdb/qb25-answers/pathofact_project/fastq" #metagenomics data, replace with your file name 
setwd(deeparg_dir)

#Place DeepARG output into one file for plotting purposes, I asked Chat to help me create a for and if loops, since we have not done many of these in R. 
files <- list.files(pattern = "*.mapping.ARG")
all_data <- data.frame()

for (f in files) {
  temp <- read.delim(f, header = TRUE)
  
  if (nrow(temp) > 0) {
    sample_name <- sub("_meta_assembly_deeparg_out.mapping.ARG", "", f)
    temp$Sample <- sample_name
    
    temp <- temp %>% 
      select(Sample,
             ARG_class = predicted_ARG.class,
             counts,
             alignment.length)
    
    all_data <- bind_rows(all_data, temp)
  } else {
    message("Skipping empty file: ", f)
  }
}


# Authors from the PathoFact paper peformed Rnum_Gi to calculate relative abundance
#https://www.nature.com/articles/ncomms3151
summary_data <- all_data %>%
  mutate(Rnum_Gi = counts / alignment.length) %>% 
  group_by(Sample, ARG_class) %>%
  summarise(Rnum_Gi_sum = sum(Rnum_Gi), .groups = "drop") %>%
  group_by(Sample) %>%
  mutate(rel_abundance = (Rnum_Gi_sum / sum(Rnum_Gi_sum)) * 100) %>%
  ungroup()

#load metagenomics data 
combined_meta <- read.csv(
  file.path(meta_dir, "combined_metadata.csv"),
  stringsAsFactors = FALSE
)

# make column names all normal to prevent issues with plotting
colnames(combined_meta)[colnames(combined_meta) == "SRR_ID"] <- "Sample"

# Merge metadata
summary_meta <- summary_data %>%
  left_join(combined_meta, by = "Sample")

# disease status data cleaning 
summary_meta$Disease_Status <- ifelse(summary_meta$Disease_Status == "absent",
                                      "Control", "Psoriasis")
summary_meta$Disease_Status <- factor(summary_meta$Disease_Status,
                                      levels = c("Control", "Psoriasis"))


#plot of all ARG, but only showing DISEASE = PRESENT (Psoriasis) samples
ggplot(summary_meta %>% filter(Disease_Status == "Psoriasis"),
       aes(x = ARG_class, y = rel_abundance)) +
  geom_boxplot(fill = "pink", color = "black") +
  theme_bw() +
  xlab("ARG Class") +
  ylab("Relative Abundance (%)") +
  ggtitle("Relative Abundance of ARG Classes (Psoriasis Only)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave(
  filename = file.path(deeparg_dir, "AllARG_DiseaseOnly_plot.png"),
  plot = last_plot(),
  width = 16,
  height = 10,
  dpi = 300
)

#plot specific ARG class 
arg_of_interest <- "multidrug" #swap this with any Antibiotic class in the data set 
ggplot(summary_meta %>% filter(ARG_class == arg_of_interest),
       aes(x = Disease_Status, y = rel_abundance, fill = Disease_Status)) +
  geom_boxplot() +
  xlab("Disease Status") +
  ylab("Relative Abundance (%)") +
  ggtitle(paste("Relative Abundance of", arg_of_interest, "ARG Class")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("Control" = "lightblue", "Psoriasis" = "salmon"))
ggsave(
  filename = file.path(deeparg_dir, "OneARG_plot.png"),
  plot = last_plot(),
  width = 16,
  height = 10,
  dpi = 300
)

# all ARG class, faceted plots 
ggplot(summary_meta, aes(x = Disease_Status, y = rel_abundance, fill = Disease_Status)) +
  geom_boxplot() +
  theme_bw() +
  xlab("Disease Status") +
  ylab("Relative Abundance (%)") +
  ggtitle("Relative Abundance of ARG Classes by Disease Status") +
  scale_fill_manual(values = c("Control" = "lightblue", "Psoriasis" = "salmon")) +
  facet_wrap(~ARG_class, scales = "free_y") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#save plot above
ggsave(
  filename = file.path(deeparg_dir, "ARG_faceted_plot.png"),
  plot = last_plot(),
  width = 16,
  height = 10,
  dpi = 300
)

