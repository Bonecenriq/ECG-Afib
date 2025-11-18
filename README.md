# Docker for AFib prediction 
Version 0.3.0, Nov 18 2025

## Overview 
This repository provides a complete pipeline for predicting **Atrial Fibrillation (AFib)** from raw ECG signals using a Dockerized environment.

To run the prediction, the user only needs to:

1.  Place ECG files into the `ECG/` folder\

2.  (Optional) Add real AF labels into `AF-label.csv`\

3.  Run the shell script:

    ``` bash
    bash run_prediction.sh <GPU or CPU>
    ```

The system will output predicted AFib probability scores, and when
labels are provided, it will also generate a summary evaluation report.

## Build the Docker image
To begin with, make sure that `Docker` is installed on the machine (Please see `docker_installation.md` file). Then, run the following bash command in the root directory:

>>> docker load < femur-seg.tar

Here, the name of docker is `ecg-af:latest`


## Project Structure

After extracting the bundle, your directory should look as follows:

    ECG-processing
    │
    ├── ECG
    │     ├── example_0001.csv
    │     ├── example_0002.csv
    │     └── ...
    │
    ├── AF-label.csv
    ├── config.yaml
    └── run_prediction.sh

### ECG Folder

-   Place all your input ECG files in this folder.\
-   Files should contain **≥10 seconds** of 12-lead ECG waveform.\
-   For 12-lead ECG, all leads should be included as columns in the file (e.g., CSV with 12 channels).\
-   Each ECG file must contain at least 10 seconds of signal sampled at ≥ 500 Hz\
-   Filenames may be arbitrary (e.g., `123.csv`, `testA.csv`).

### AF-label.csv (Optional)

If ground-truth AFib labels exist, fill them as:

  filename           DX
  ------------------ -----------
  example_0001   AF
  example_0002   Normal

When enabled, the system will match filenames automatically and compute
label-based summary results.


## Configuration (`config.yaml`)

Customize computation and evaluation parameters using the `config.yaml`
file:

``` yaml

# dropout of final FC layer
dropout: 0.5

# use GPU or CPU
use_gpu: True

# GPU ID
gpu_id: 1

# batch size for inference
batch_size: 15

# label control
use_label: False      # True = use AF-label.csv and generate summary
label: 'AF-label.csv'
```

### Key Option Behavior

-   `use_label: False`\
    → Only predicted AFib scores will be generated.

-   `use_label: True`\
    → System loads AF-label.csv and outputs prediction + summary evaluation file.


## Run Prediction

Move into the `ECG-processing/` directory and run:

``` bash
bash run_prediction.sh <GPU or CPU>
```

### Example (GPU)

``` bash
bash run_prediction.sh GPU
```

### Example (CPU)

``` bash
bash run_prediction.sh CPU
```

**Note:** CPU mode is operational but much slower. GPU is highly recommended.

## Notes

-   **Do not modify the folder structure.** Simply drop ECG files into the `ECG/` directory.
-   Output prediction files will be saved automatically.
-   When labels are provided (`use_label=True`), a summary evaluation Text file will also be generated.
