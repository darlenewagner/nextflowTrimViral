# nextflowTrimViral
The typical command for running the pipeline:<br>
```nextflow run blastnCOVIDextract.nf --query queryDirectory --outdir outputDirectory```<br><br>
The command for running the pipeline with custom query, blastDB directory, and blastDB name.<br>
```nextflow run blastnCOVIDextract.nf --query queryDirectory --dbDir blastDatabaseDirectory --dbName blastPrefixName```<br><br>
Alternatively, in nextflow.config, edit the input folder name for the ***query =*** statement on line 2 and edit the output folder name for ***outdir =*** on line 6.<br><br>
***Prerequisites***<br>
- Python 3.9.X or higher<br>
- Nextflow 21.X or higher<br>
- blast 2.10 or higher<br>
- a local blast-formatted nucleotide database<br><br>

### Reference to cite ###
The SARS-CoV-2 genomes in test_genomes/ are described in Wagner et al. Microbiol Spectr. 2022 Mar 2;10(2):e0256421. doi: 10.1128/spectrum.02564-21. 
