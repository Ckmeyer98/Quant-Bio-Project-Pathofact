mkdir ~/pathofact_project
mkdir fastq
# Go to your home directory
cd ~

# Download and install Entrez Direct, a way to have direct acess to NCBI
#user manual : https://www.ncbi.nlm.nih.gov/books/NBK179288/

sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"

# Add it to your PATH
echo 'export PATH=$PATH:$HOME/edirect' >> ~/.zshrc
source ~/.zshrc
#double check it is installed
esearch -version


# cd your PathoFact project folder
cd ~/pathofact_project

# Get all runs for PRJNA281366
cd ~/pathofact_project
esearch -db sra -query PRJNA281366 | efetch -format runinfo | cut -d',' -f1 | grep SRR > runs.txt #refer to manual on what this mean, linked above


# Check first few rows.. make sure it looks normal? what even is normal...
head runs.txt

#make sure we are in the right directory 
cd ~/pathofact_project

#downloading all files down from the interNET 
mkdir -p fastq  # make sure folder exists
for run in $(cat runs.txt); do #here we are reading the content runs.txt and printing out an output, remember since this is in the shell we need $ to run the commpand
    fasterq-dump $run -O fastq #tool from NCBI SRA toolit downloads raw FASTQ sequence data for a giveen SRA ID, $run goes thru interation ofl oops, -0 fastq tells computer where to put the output
done

ls ~/pathofact_project/fastq | wc -l #checking all experiments are there 

#we are able to clone pipelines from github 
#manual : https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository
# specific to pathofind https://github.com/samnooij/PathoFact?tab=readme-ov-file
git clone https://github.com/samnooij/PathoFact #mirror github not the original one 
cd pathofact
conda env create -f=envs/PathoFact.yaml #creating the environment 
conda activate pathofact #activate the pipeline

#downloading IMP to convert my FastQ files to Fasta 
#curl -L https://zenodo.org/record/160263/files/imp-1.4.tar.gz -o imp-1.4.tar.gz #downlaoding IMP
#docker load -i imp-1.4.tar.gz #load into docker 
#run IMP.. but doesn't work ... it says i need a passcode?
#docker run --rm -it \
#  -v ~/pathofact_project/PRJNA281366/fastq:/data \
#  -v ~/pathofact_project/PRJNA281366/imp_output:/output \
#  r3lab/imp:1.4 \
#  /bin/bash -c "imp -i /data -o /output -t 8"

#alternative approach- megahit to help with assembly of the sequences 
# Activating environment 
conda install -c bioconda megahit -y
megahit --version #check if installed, this should report verision if its installed if not ? 
cd ~/pathofact_project
mkdir -p megahit_output


