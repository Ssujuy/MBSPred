# MBSPred: Predicting smORF coding potential using a Multi-Branch Deep Learning Architecture

## Introduction

This project utilizes the trained `MBSPred` model to predict smORFs coding potential from 2 different datasets. `MBSPred` employs 5 features extractions branches, to find local motifs and long-range dependencies on DNA sequences, including:

1. Multiple Kerne Convolutions.
2. Multiple Gapped Kernel Convolutions.
3. Multiple Strided Kernel Convolutions.
4. DNABERT-6 fine-tuned for smORF detection.
5. Computational Features (Hexamer Score, Fickett Score, Codon Bias, Nucleotide Bias).

For further information regarding MBSPred's architecture, analysis and results visit: 

# Prediction

## Environment Setup

Execute the bash script in MBSPRed's root directory to setup the environment.

```
./setup.sh
```

## Run

1. Prediction run of MBSPred model on test datasets with 100-nucleotide left flank coding and non-coding smORFs(Path: `data/100flank`) 

```
./MBSPred-test.bin --codingFASTA="data/extracted/coding_smorfs_2pep_test.fa" --nonCodingFASTA="data/extracted/non_coding_smorfs_2pep_test.fa"
```

2. Prediction run of MBSPred model on test datasets with extracted coding and non-coding smORFs (Path: `data/extracted`) 

```
./MBSPred-test.bin --codingFASTA="data/100flank/positive_simSorfs_Flank-100.fa" --nonCodingFASTA="data/100flank/negative_simSorfs_Flank-100.fa"
```

# Results

Prediction results from the 2 different datasets, correct preditions and accuracy are presented using the arguments from MBSPRed-test executable (--`codingFASTA`, `--nonCodingFASTA`)

1. Results with 100-nucleotide left flank data.

```
Loaded DNABERT-6 fine-tuned model from: /home/kostas/MBSPred/dnabert6_smorfs_ft
Trained CNN smORF Classifier successfully loaded from: /home/kostas/MBSPred/MBSPred/MBSPred.pt
Loaded 10000 Coding sequences.
Loaded 10000 Non-Coding sequences.
Starting Prediction...
Predicting: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 20000/20000 [05:17<00:00, 62.94it/s]
Saving predictions to predict.csv
------------------------------
Total Sequences: 20000
------------------------------
Overall Accuracy: 95.95%
------------------------------
Correct predictions 19191
------------------------------
Predicted Coding: 9629 (True Coding Accuracy: 94.10%)
Predicted Non-Coding: 10371 (True Non-Coding Accuracy: 97.81%)
------------------------------
```

2. Results with extracted data.

```
Loaded DNABERT-6 fine-tuned model from: /home/kostas/MBSPred/dnabert6_smorfs_ft
Trained CNN smORF Classifier successfully loaded from: /home/kostas/MBSPred/MBSPred/MBSPred.pt
Loaded 1766 Coding sequences.
Loaded 1766 Non-Coding sequences.
Starting Prediction...
Predicting: 100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 3532/3532 [01:00<00:00, 58.60it/s]
Saving predictions to predict.csv
------------------------------
Total Sequences: 3532
------------------------------
Overall Accuracy: 81.60%
------------------------------
Correct predictions 2882
------------------------------
Predicted Coding: 1678 (True Coding Accuracy: 79.11%)
Predicted Non-Coding: 1854 (True Non-Coding Accuracy: 84.09%)
------------------------------
```