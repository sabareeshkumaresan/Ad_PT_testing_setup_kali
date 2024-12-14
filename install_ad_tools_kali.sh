#!/bin/bash

echo "Starting the installation of AD Penetration Testing tools..."

# Update and upgrade the system
echo "Updating the system..."
sudo apt update && sudo apt upgrade -y

# Install BloodHound and Neo4j
echo "Installing BloodHound and Neo4j..."
sudo apt install -y neo4j bloodhound
sudo systemctl enable neo4j
sudo systemctl start neo4j

# Install Impacket
echo "Installing Impacket..."
sudo apt install -y python3-pip
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
cd /opt/impacket
pip3 install .
cd ~

# Install CrackMapExec
echo "Installing CrackMapExec..."
pip3 install pipx
pipx install crackmapexec

# Install Responder
echo "Installing Responder..."
sudo apt install -y responder

# Install Nmap
echo "Installing Nmap..."
sudo apt install -y nmap

# Install Kerbrute
echo "Installing Kerbrute..."
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/local/bin/kerbrute
chmod +x /usr/local/bin/kerbrute

# Install SecLists
echo "Installing SecLists..."
sudo apt install -y seclists

# Install John the Ripper
echo "Installing John the Ripper..."
sudo apt install -y john

# Install Hashcat
echo "Installing Hashcat..."
sudo apt install -y hashcat

# Install ldap-utils for ldapsearch
echo "Installing ldap-utils..."
sudo apt install -y ldap-utils

# Download PowerView and PowerSploit
echo "Downloading PowerView..."
mkdir -p ~/tools
git clone https://github.com/PowerShellMafia/PowerSploit.git ~/tools/PowerSploit

# Download SharpHound for BloodHound
echo "Downloading SharpHound..."
mkdir -p ~/tools/BloodHound
wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.2.0/SharpHound.exe -O ~/tools/BloodHound/SharpHound.exe

# Set up directories for tools
echo "Organizing tools..."
mkdir -p ~/ad-tools
cp ~/tools/PowerSploit/Recon/PowerView.ps1 ~/ad-tools
cp ~/tools/BloodHound/SharpHound.exe ~/ad-tools

# Finalize
echo "All tools installed successfully!"
echo "Organized tools in ~/ad-tools and ~/tools directories."
