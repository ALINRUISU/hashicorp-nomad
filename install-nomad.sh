#!/bin/bash
# 
# Installation of the Hashicorp Nomad Service
# 
# Variables - NOMAD_VER

echo "Initalizing Script for Installing Nomad"

NOMAD_VER=0.8.6

sudo mkdir -p /srv/hashicorp-nomad/src
cd /srv/hashicorp-nomad/src

echo "Fetching latest nomad binary for linux x64"
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
 
echo "Installing nomad..."
unzip nomad.zip
sudo install nomad /usr/bin/nomad

echo "Setting nomad config directory"
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d

echo "Installing Nomad"
nomad -autocomplete-install

echo "Creating structure for hashicorp-cluster..."
DATA_DIR="/srv/hashicorp-nomad/"

if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
  echo "Hashicorp directory created: $DATA_DIR"
fi

echo "Cleaning files..."
sudo rm -rf nomad.zip

echo "snackramas awaits"