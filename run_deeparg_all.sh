#!/bin/bash


#-------------------------
#--------DownloadFASTq----
#-------------------------
mkdir ~/pathofact_project
mkdir fastq
cd ~
# Download and install Entrez Direct, a way to have direct acess to NCBI, user manual : https://www.ncbi.nlm.nih.gov/books/NBK179288/
sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
# Add to  PATH
echo 'export PATH=$PATH:$HOME/edirect' >> ~/.zshrc
source ~/.zshrc
#double check it is installed
esearch -version
# cd your PathoFact project folder
cd ~/pathofact_project
# Get all runs for PRJNA281366
cd ~/pathofact_project
esearch -db sra -query PRJNA281366 | efetch -format runinfo | cut -d',' -f1 | grep SRR > runs.txt #refer to manual on what this mean, linked above, we are searching the website for the Project (metagenomic sequence of interest), this can be changed for your specific dataset 
# Check first few rows.. make sure it looks normal? what even is normal...
head runs.txt
#make sure we are in the right directory 
cd ~/pathofact_project
#downloading all files down from the interNET 
mkdir -p fastq  # make sure folder exists
for run in $(cat runs.txt); do #here we are reading the content runs.txt and printing out an output, remember since this is in the shell we need $ to run the commpand
    fasterq-dump $run -O fastq #tool from NCBI SRA toolit downloads raw FASTQ sequence data for a giveen SRA ID, $run goes thru interation ofl oops, -0 fastq tells computer where to put the output
done


#-------------------------
#--------metaSPAdes-------
#-------------------------
#download metaSPAdes following their online manual 

#test metaSPAdes on one file first, once it works move onto the loop 
spades.py --meta \ -1 SRR2005635_1.fastq \ -2 SRR2005635_2.fastq \ -o SRR2005635_meta_assembly

#created a for-loop to have metaSPAdes work on all my FASTQ files 

for sample in $(ls *_1.fastq | sed 's/_1.fastq//'); do echo "Running metaSPAdes on $sample ..." spades.py --meta -1 ${sample}_1.fastq -2 ${sample}_2.fastq -o ${sample}_meta_assembly done



#-------------------------
#--------DeepARG----------
#-------------------------

#Install DeepARG following online instructions manual (https://github.com/gaarangoa/deeparg)

#change the following to the appropraite folder names on your computer 
#specify assembly data from metaSPADES
ASSEMBLY_DIR="/Users/cmdb/qb25-answers/pathofact_project/assemblies"
#specify DeepARG output 
OUTPUT_DIR="/Users/cmdb/qb25-answers/pathofact_project/deeparg_results"
#specify DeepARG Database to align....
DB_DIR="/Users/cmdb/qb25-answers/pathofact_project/databases/deeparg_db"

# Make sure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Loop over all contig files in _meta_assembly subfolders
#copy same paramters of DeepARG listed in the PathoFact Project 
for contig_file in "$ASSEMBLY_DIR"/*_meta_assembly/contigs.fasta; do
    # Extract the sample name from the folder path
    sample_name=$(basename $(dirname "$contig_file"))

    echo "Processing $sample_name ..."
    
    deeparg predict \
        --model LS \ 
        --type nucl \
        --input "$contig_file" \
        --output "$OUTPUT_DIR/${sample_name}_deeparg_out" \
        -d "$DB_DIR"
done

