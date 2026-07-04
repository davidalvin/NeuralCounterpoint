# bach-mozart-vivaldi-64l-32t-cmaj

Training experiments for a polyphonic music generation model using encoded classical music from Bach, Mozart, Vivaldi, and other composers. The dataset contains 491 songs and is focused on C major.

## Overview

This repository contains a Jupyter Notebook workflow for training a TensorFlow/Keras recurrent neural network on encoded SATB-style music sequences. The model uses past, current, and future musical context to predict accompanying voices.

The main training notebook is:

* `polybach-train-rnn.ipynb`

Supporting files include:

* `GlobalConstants.py` — shared constants, symbols, paths, feature definitions, and voice mappings
* `HelperFunctions.py` — helper utilities for loading MIDI and reading/writing CSV files
* `requirements.txt` — Python package dependencies
* `init.sh` — helper script for installing dependencies, converting the notebook to a script, and running training

## Repository structure

```text
.
├── GlobalConstants.py
├── HelperFunctions.py
├── README.md
├── init.sh
├── mapping/
├── polybach-train-rnn.ipynb
└── requirements.txt
```

## Requirements

Install the Python dependencies with:

```bash
pip install -r requirements.txt
```

The listed requirements are:

```text
music21
wget
pandas
runipy
pydot
```

The notebook also uses TensorFlow/Keras, NumPy, and Matplotlib, so make sure those are available in your environment.

## Usage

Clone the repository:

```bash
git clone https://github.com/davidalvin/bach-mozart-vivaldi-64l-32t-cmaj.git
cd bach-mozart-vivaldi-64l-32t-cmaj
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the notebook:

```bash
jupyter notebook polybach-train-rnn.ipynb
```

Or run the initialization script:

```bash
bash init.sh
```

The script installs requirements, converts the notebook to a Python script, and runs the generated script.

## Training data

The training notebook expects encoded song data, including an `int_songs.csv` file, to be available at the configured path. Update the path variables in the notebook before running, especially:

```python
INT_SONGS_PATH
SAVE_MODEL_PATH
MAPPING_PATH
IN_PROGRESS_MODEL_PATH
START_EPOCH
```

The current notebook contains paths intended for a storage/Kaggle-style environment, so local users will likely need to change them.

## Model

The notebook defines a TensorFlow/Keras model for SATB-style polyphonic prediction. It uses LSTM layers for voice histories and dense layers for prediction. The model predicts bass, alto, and tenor outputs using soprano context and the surrounding musical sequence.

Default training settings include:

```python
TRAIN_SEQUENCE_LENGTH = 64
BATCH_SIZE = 64 * 16
LOSS = "categorical_crossentropy"
```

Model checkpoints are saved as `.h5` files in the configured `SAVE_MODEL_PATH`.

## Running on Kaggle

The notebook was originally structured for a Kaggle-style workflow. When running on Kaggle, upload the helper files and required datasets alongside the notebook:

* `GlobalConstants.py`
* `HelperFunctions.py`
* encoded training data
* mapping files, if required

Then update the notebook paths to match the Kaggle input/output directories.

## Notes

This is an experimental training repository. Some paths and model checkpoint references are environment-specific and may need to be edited before the notebook can run on a new machine.

## Author

Created by [davidalvin](https://github.com/davidalvin).
