# Pathofact Check-In #2

## Addressing Prior Feedback:

After meeting with our project mentor Sneha independently last week, and then discussing with Frank during class, we have decided to adjust our project goals. 
Given our ongoing difficulties with creating and using a Pathofact environment, we have instead decided to assemble our datasets with metaSPAdes (since our 
datasets are Illumina sequencing files) to recreate the volcano plots we saw in the original Pathofact 1 paper, and compare the results when not using the 
Pathofact 1 pipeline directly. Instead, we will try to use the Pathofact 2 pipeline that is more updated and currently in preprint, in hopes that we will 
have more success with a newer pipeline. 

## New Progress

In the time since Check-In #1, we had been spending much of our time trying to complete our now-defunct goal of operating Pathofact. However, we did make some 
other progress that will still serve us in our new project direction. We were able to use the for loop code that Jailyn generated in the prior check-in to 
quickly and efficiently download our metagenomic data, as some datasets include 70+ samples. We also figured out how to quickly convert between FASTQ and FASTA
format, although metaSPAdes uses FASTQ files as inputs, so the current FASTQ format should be sufficient

Since shifting to a new direction, we have begun to use metaSPAdes to assemble our data. Jailyn used it to test whether it would work, and we have uploaded a 
sample alongside our check-in in hopes of getting confirmation that the assembly was successful!

## Project Organization

Our project organization has changed due to our altered goals. We will continue to divide the datasets as we did previously, with Jailyn working on analyzing
the psoriasis dataset and Clayton working on analyzing the C. difficile dataset. However, this time we will assemble using metaSPAdes and analyze using 
Pathofact 2 in the hopes of recreating the same box and volcano plots from Figure 4 of the original Pathofact paper.


## Current Struggles

-Unlike in Pathofact 1, Pathofact 2 integrates information from multiple different virulence gene detection tools, like AMRFinderPlus for antimicrobial 
resistance genes, GenoMad for viral sequences, and SignalP 6 for genes encoding signal peptides. Given this greater scope in this newer Pathofact version, 
recreating figures that were generated with Pathofact 1 might require some modifications. For instance, the box plots in Figure 4 are looking exclusively 
at predicted bacterial toxins, so employing the full scope of Pathofact 2’s predictive power might result in a graph with additional “hits” corresponding 
to virulence factors that are not toxins.


This is the link to the Spades program we are running, we are specifically running metaSPAdes https://github.com/ablab/spades?tab=readme-ov-file

