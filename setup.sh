#!/bin/bash

echo "--- Starting MBSPred Environment Setup ---"

echo "\n**** 1. Checking for Python 3.13 ****\n"

if ! command -v python3.13 &> /dev/null
then
    echo "Python 3.13 not found. Attempting to install..."
    sudo apt update
    sudo apt install -y python3.13 python3.13-venv python3.13-dev
else
    echo "Python 3.13 is already installed."
fi

echo "\n**** 2. Upgrading pip ****\n"
pip install --upgrade pip

echo "\n**** 3. Math and Plot libraries ****\n"
pip install numpy==2.3.1 \
            matplotlib==3.10.3 \

echo "\n**** 4. Installing PyTorch with CUDA 12.8 Support ****\n"
pip install torch==2.7.1+cu128 \
            torchvision==0.22.1+cu128 \
            torchaudio==2.7.1+cu128 \
            --extra-index-url https://download.pytorch.org/whl/cu128


echo "\n**** 5. Installing Machine Learning libraries ****\n"

pip install pandas==2.2.2 \
            scipy==1.16.0 \
            scikit-learn==1.7.0 \
            seaborn==0.13.2 \
            transformers==4.54.1 \
            datasets==4.0.0 \
            accelerate==1.9.0 \
            tokenizers==0.21.4 \
            huggingface-hub==0.34.3 \
            safetensors==0.5.3

echo "\n**** 6. Installing Bioinformatics & Utility Tools ****\n"

pip install biopython==1.85 \
            tqdm==4.67.1 \
            regex==2025.7.34 \
            fsspec==2024.6.1

echo "--- Environment Setup Completed ---"