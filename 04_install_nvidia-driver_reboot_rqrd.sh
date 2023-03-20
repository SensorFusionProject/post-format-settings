#!/bin/bash
# https://developer.nvidia.com/cuda-downloads
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
arch=x86_64
driver_version_prefix_dot=12.1
driver_version_prefix_hyphen=12-1
driver_version=${driver_version_prefix_dot}.0
driver_version_postfix=530.30.02-1
distro_driver=$distribution-$driver_version_prefix_hyphen-local
distro_version_arch=${distro_driver}_$driver_version-${driver_version_postfix}_amd64


echo "lspci | grep -i nvidia"
lspci | grep -i nvidia
echo "uname -m && cat /etc/*release"
uname -m && cat /etc/*release

sudo apt-key del F796ECB0
sudo apt-key del 7fa2af80
sudo apt-key del 3bf863cc

echo "sudo apt-get --purge remove cuda nvida-gds cuda-drivers"
sudo apt-get --purge remove cuda nvida-gds cuda-drivers

#################################
## Network Repo Installation
echo "Network Repo Installation"
#################################
# https://docs.nvidia.com/datacenter/tesla/tesla-installation-notes/index.html
echo "sudo apt-get install linux-headers-$(uname -r)"
sudo apt-get install linux-headers-$(uname -r)

echo "wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/$arch/cuda-keyring_1.0-1_all.deb"
wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/$arch/cuda-keyring_1.0-1_all.deb

echo "sudo dpkg -i cuda-keyring_1.0-1_all.deb"
sudo dpkg -i cuda-keyring_1.0-1_all.deb

sudo apt-get update -y
sudo apt-get -y install cuda
