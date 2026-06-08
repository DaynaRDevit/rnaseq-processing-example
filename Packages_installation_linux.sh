#!bin/bash
sudo apt update
sudo apt install fastqc
sudo apt install fastp
sudo apt install bwa

sudo apt update
sudo apt install subread
sudo apt install featureCounts
sudo apt-get install build-essential autoconf automake libtool pkg-config
# sudo apt install cufflinks
#if Cufflinks doesn't install that way, the easiest way for me was to download it and export the PATH to install it
wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
tar zxvf cufflinks-2.2.1.tar.gz
cd cufflinks-2.2.1.Linux_x86_64/
export PATH=$PATH:~/cufflinks-2.2.1.Linux_x86_64
echo 'export PATH=$PATH:~/cufflinks-2.2.1.Linux_x86_64' >> ~/.bashrc

#This is needed for the use and installation of R packages
sudo apt-get update
sudo apt install \
    libcairo2-dev \
    libfreetype6-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    pkg-config
    sudo apt update
#For the use of DESeq2 in R, this need to be pre-installed in Linux
sudo apt install -y \
build-essential \
r-base-dev \
libcurl4-openssl-dev \
libssl-dev \
libxml2-dev \
zlib1g-dev
