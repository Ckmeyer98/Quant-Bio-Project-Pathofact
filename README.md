Pathofact 1.0 vs Pathofact 2.0: Comparing Pipelines to Optimize Bacterial Virulence Prediction
Clayton Meyer & Jailyn Loor 

Presentation Link: https://docs.google.com/presentation/d/10-aNHkujS-QRwo8hTpKeMVV3EGnqtBk1/edit?usp=sharing&ouid=110743452944034568859&rtpof=true&sd=true 

Rapid, accurate identification of emerging bacterial pathogens is critical to the development of a life-saving clinical response. Advances in both prediction modeling and the availability of sequencing data present powerful tools for detecting microbial pathogenicity.
 Here, we attempt to replicate the box plot and volcano plots displaying predicted bacterial virulence factors (Fig. 4) with the novel Pathofact (Nies et al. 2021) pipeline. In subsequent work, the same authors developed PathoFact 2.0 (Sunyer et al., 2024), a refined pipeline for virulence prediction. We plan to recreate Figure 4 with both pipelines and compare. We also hope to expand the scope of the author’s prior work by using this pipeline to identify candidate virulence genes in other bacterial pathogens.

                                             Goals
1.	Recreate Figure 4 box + volcano plots using Pathofact 1.0 pipeline
2.	Recreate Figure 4 box + volcano plots using Pathofact 2.0 pipeline and compare with  Pathofact 1.0 pipeline
3.	Use both pipelines to predict pathogenicity of different E. coli strains that are known pathogens to compare accuracy

![Figure 4. Using metagenomic datasets to visualize bacterial toxins using PathoFact]( https://media.springernature.com/lw685/springer-static/image/art%3A10.1186%2Fs40168-020-00993-9/MediaObjects/40168_2020_993_Fig4_HTML.png?as=webp)

                                              Data
Data for Goal 1 & 2: Recreate Figure 4 box + volcano plots using Pathofact pipeline
Figure 4 of “PathoFact: a pipeline for the prediction of virulence factors and antimicrobial resistance genes in metagenomic data” uses publicly available metagenomic datasets from the 
NCBI and European Bioinformatics Institute-Sequence Read (EBI) Archives. The datasets include: 

PathoFact identified predicated bacterial toxins in metagenomic data from the gut microbiomes of five patients with Clostridioides difficile infection, including controls without infections. 
Link:https://www.ncbi.nlm.nih.gov/bioproject/?term=(PRJNA297269)%20AND%20bioproject_sra[filter]%20NOT%20bioproject_gap[filter]
BioProject ID : PRJNA297269

PathoFact identified predicted bacterial toxins in metagenomic data from the skin microbiome of patients diagnosed with psoriasis. 
Link: https://www.ncbi.nlm.nih.gov/bioproject/281366
accession ID SRP057859 (BioProject PRJNA281366)

PathoFact identified predicted bacterial toxins in metagenomic dataset from a study on the gut microbiome changes during Parkinson’s diseases progression. 
Link: https://www.ebi.ac.uk/ena/browser/view/ERP019674
Accession ID: ERP019674

Data for Goal 3: Using PathoFact 2.0 to predict bacterial toxin and virulence genes in pathogenic Escherichia coli strain isolated from patient stool samples. 
Link: https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA486009
Accession ID: PRJNA486009
                                         Software Requirements
Pathofact 1.0:
Miniconda3 https://repo.anaconda.com/miniconda/Miniconda3-py37_4.9.2-Linux-x86_64.sh
Pathofact https://git-r3lab.uni.lu/laura.denies/PathoFact.git
SignalP (version 6.0) https://services.healthtech.dtu.dk/cgi-bin/sw_request?software=signalp&version=6.0&packageversion=6.0h&platform=fast
Pathofact 2.0:
Snakemake https://snakemake.readthedocs.io/en/stable/getting_started/installation.html
DeepARG https://github.com/gaarangoa/deeparg.git
AMRFinderPlus 4.0 https://github.com/ncbi/amr/wiki
Genomad (version 1.9) https://zenodo.org/records/14886553
RGI main https://card.mcmaster.ca/analyze/rgi
SignalP (version 6.0) https://services.healthtech.dtu.dk/cgi-bin/sw_request?software=signalp&version=6.0&packageversion=6.0h&platform=fast
AntiSMASH (version 7.0, bacterial version) https://antismash.secondarymetabolites.org/#!/start


 
Citations:
de Nies, L., Lopes, S. Busi, S. B., Galata, V., Heintz-Buschart, A., Laczny, C., May, P. & P.
Wilmes (2021) PathoFact: a pipeline for the prediction of virulence factors and 		antimicrobial resistance genes in metagenomic data Microbiome 9(49) DOI: 		https://doi.org/10.1186/s40168-020-00993-9

Sunyer, J. O., Delgado, L. F., Hickl, O., Laczny, C. C., May, P. & P. Wilmes (2024) PathoFact
2.0: An Integrative Pipeline for Predicting Antimicrobial Resistance Genes, Virulence 	Factors, Toxins and Biosynthetic Gene Clusters in Metagenomes bioRX DOI: 		https://doi.org/10.1101/2024.12.09.627531 (preprint)




