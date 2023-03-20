#################################
## Setting up NVIDIA Container Toolkit
echo "Setting up NVIDIA Container Toolkit"
#################################
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "sudo apt-get update -y && sudo apt-get install -y nvidia-container-toolkit"
sudo apt-get update -y \
    && sudo apt-get install -y nvidia-container-toolkit

echo "sudo nvidia-ctk runtime configure --runtime=docker"
sudo nvidia-ctk runtime configure --runtime=docker

echo "sudo systemctl restart docker"
sudo systemctl restart docker

echo "sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi"
sudo docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
