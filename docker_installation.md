# Setting up of Docker to use GPU
# Basic instruction by CHEONG Vee San
# Singapore-ETH Centre, ETH Zurich
# Version 0.1 Dec 2022

# Any text after >> indicates commands to be entered into the command line

# 1. Docker installation (latest)
As of Dec 2022, the latest Docker Engine - Community Version: 20.10.21
Follow the instructions in the following link.
https://linuxize.com/post/how-to-install-and-use-docker-on-ubuntu-20-04/

# 2A. Verify that the Nvidia drivers are >=450
>> nvidia-smi

If you get an output like the following, then skip Step 2B.

Wed Dec 14 18:16:03 2022
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 470.161.03   Driver Version: 470.161.03   CUDA Version: 11.4     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  Off  | 00000000:00:10.0 Off |                  N/A |
| 30%   18C    P8     8W / 350W |      5MiB / 24268MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1268      G   /usr/lib/xorg/Xorg                  4MiB |
+-----------------------------------------------------------------------------+

# 2B. Installation of Nvidia drivers. An example for 470 drivers is given below.
# These can be changed to newer versions, such as 512 or 525.
>> apt install libnvidia-common-470 libnvidia-gl-470 nvidia-driver-470 \
libnvidia-extra-470 nvidia-compute-utils-470 nvidia-dkms-470 -y

# 3. NVIDIA Container toolkit installation
Follow the section named 'Setting up NVIDIA Container Toolkit'
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit