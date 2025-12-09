The purpose of this folder is to provide information about the code 
used for this project. 

The run_deeparg_all.sh contains all the code used for the project. 

#-------------------------
#--------DownloadFASTq----
#-------------------------
Refers to the code we used to download the illumnia sequencing meta genomic data 
on the NCBI website. The rationale behind choosing this data-set, is that the 
original PathoFact paper used this data set to predicted bacterial toxins in 
meta genomic data from the skin microbiome of patients diagnosed with psoriasis. 
Link: https://www.ncbi.nlm.nih.gov/bioproject/281366 accession ID SRP057859 
(BioProject PRJNA281366). Additionally, we also used this code to download data 
from the gut microbiomes of five patients with Clostridioides difficile 
infection, including controls without infections. 
Link:https://www.ncbi.nlm.nih.gov/bioproject/?term=(PRJNA297269)%20AND%20bioproject_sra[filter]%20NOT%20bioproject_gap[filter] 
BioProject ID : PRJNA297269


#-------------------------
#--------metaSPAdes-------
#-------------------------

https://github.com/ablab/spades

Nurk S, Meleshko D, Korobeynikov A, Pevzner PA. metaSPAdes: a new versatile 
metagenomic assembler. Genome Res. 2017 May;27(5):824-834. 
doi: 10.1101/gr.213959.116. Epub 2017 Mar 15. PMID: 28298430; PMCID: PMC5411777.


We used metaSPAdes to assemble the FASTQ files we downlaoded from the NCBI website. 
The rationale behind using metaSPAdes is that it specializes in mixed microbial
community metagenomic data, which is the type of data we are working with on this project. 
This will allows us to have long enough reads to input into DeepARG.


#-------------------------
#--------DeepARG----------
#-------------------------
https://github.com/gaarangoa/deeparg

Arango-Argoty, G., Garner, E., Pruden, A. et al. DeepARG: a deep learning approach 
for predicting antibiotic resistance genes from metagenomic data. Microbiome 6, 23 
(2018). https://doi.org/10.1186/s40168-018-0401-z

We used DeepARG on our metaSPAdes output to predict antimicrobial resistance genes 
in our data sets. 


