The purpose of this folder is to provide the code for the
plots generated throughout this project and other files in the folder. 

The Combined_Metadata was created to correspond the sample Id from the 
literature that collected the meta genomic data to the online SRA experiments
This is important because we are able to correspond the data sets to each other 
to have a more holistic understanding of the dataset, especially since the SampleID
data set from the authors contain information about the patients age, gender etc.

The SampleID was found in the following papers...
https://pubmed.ncbi.nlm.nih.gov/33597026/ (has a subset of the data we used in the supplementary)

The metagenomic data from this project come from the following papers:
Clostridioides difficile infection, Link:https://www.ncbi.nlm.nih.gov/bioproject/?term=(PRJNA297269)%20AND%20bioproject_sra[filter]%20NOT%20bioproject_gap[filter] BioProject ID : PRJNA297269

psoriasis data set Link: https://www.ncbi.nlm.nih.gov/bioproject/281366 accession ID SRP057859 (BioProject PRJNA281366)

The Plotting.R files contains all the code for the plots.

The all_srr_ids.txt was used to help merge online NCBI experiment names to sample ID.
