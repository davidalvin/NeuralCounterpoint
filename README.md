# NeuralCounterpoint

> **Generative AI for polyphonic classical music composition using deep learning and symbolic MIDI representations.**

## Overview

NeuralCounterpoint is an experimental deep learning project for generating four-part classical harmony from symbolic music data.

The project trains a TensorFlow/Keras recurrent neural network on encoded SATB-style musical sequences. The model learns relationships between soprano, alto, tenor, and bass voices by analyzing symbolic representations of classical compositions from Bach, Mozart, Vivaldi, and other composers.

Unlike audio generation systems, NeuralCounterpoint works with symbolic music data rather than raw waveforms. This allows the model to focus on musical structure, voice leading, harmony, rhythm, and counterpoint.

The dataset used in this experiment contains **~500 classical compositions**.

---

## What This Repository Contains

This repository contains the core training experiment for the NeuralCounterpoint project.

The main training workflow is implemented in:

```text
polybach-train-rnn.ipynb
```

Supporting files include:

```text
GlobalConstants.py        # Shared constants, symbols, feature definitions, and voice mappings
HelperFunctions.py        # Utility functions for MIDI processing and CSV I/O
mapping/                  # Encoded symbol mappings
requirements.txt          # Python dependencies
init.sh                   # Setup and notebook execution helper script
```

---

## Repository Structure

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

---

## Model Architecture

NeuralCounterpoint uses a multi-input recurrent neural network designed for symbolic polyphonic music generation.

The model uses:

* LSTM layers for sequence modeling
* Multi-input musical context
* Dense layers for feature fusion
* Multi-output prediction heads
* Categorical cross-entropy loss
* Adam optimization
* Checkpoint-based training continuation

The model predicts accompanying voices using surrounding musical context. In the related harmonizer application, the generation process is sequential:

1. Bass is predicted first.
2. Alto is predicted using the melody and generated bass.
3. Tenor is predicted using the melody, bass, and alto.

This allows the system to generate SATB-style harmonizations from an input melody.

---

## Training Data

The notebook expects encoded symbolic music data, including:

```text
int_songs.csv
```

The training data is represented as integer sequences derived from MIDI files. These sequences are used to train the model on harmonic and melodic relationships across multiple voices.

Before running training locally, update the notebook paths for:

```python
INT_SONGS_PATH
SAVE_MODEL_PATH
MAPPING_PATH
IN_PROGRESS_MODEL_PATH
START_EPOCH
```

Some paths in the notebook were originally configured for a Kaggle or mounted-storage environment, so local users may need to modify them.

---

## Default Training Configuration

```python
TRAIN_SEQUENCE_LENGTH = 64
BATCH_SIZE = 64 * 16
LOSS = "categorical_crossentropy"
```

Model checkpoints are saved as `.h5` files in the configured `SAVE_MODEL_PATH`.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/davidalvin/NeuralCounterpoint.git
cd NeuralCounterpoint
```

Install dependencies:

```bash
pip install -r requirements.txt
```

The project also uses:

* TensorFlow / Keras
* NumPy
* Pandas
* Matplotlib
* music21
* pydot
* wget
* runipy

---

## Running the Training Notebook

Launch the notebook:

```bash
jupyter notebook polybach-train-rnn.ipynb
```

or run the helper script:

```bash
bash init.sh
```

The script installs dependencies, converts the notebook to a Python script, and runs the generated script.

---

## Running on Kaggle

This project was originally structured for a Kaggle-style workflow.

When running on Kaggle:

1. Upload the notebook.
2. Upload `GlobalConstants.py`.
3. Upload `HelperFunctions.py`.
4. Upload the encoded training dataset.
5. Upload the required mapping files.
6. Update the notebook paths to match the Kaggle input/output directories.

---

## Related Projects

NeuralCounterpoint is part of a larger end-to-end AI music generation system.

| Repository                                                                             | Description                                                                                                           |
| -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| [NeuralCounterpoint](https://github.com/davidalvin/NeuralCounterpoint)                 | Core training experiment for generating SATB-style classical harmony from symbolic music data.                        |
| [NeuralCounterpoint-Trainer](https://github.com/davidalvin/NeuralCounterpoint-Trainer) | Generalized TensorFlow/Keras training framework for experimenting with polyphonic music generation models.            |
| [NeuralCounterpoint-Website](https://github.com/davidalvin/NeuralCounterpoint-Website) | Flask web application that lets users upload a MIDI melody and generate four-part SATB harmony using a trained model. |

Together, these repositories demonstrate an end-to-end machine learning workflow:

```text
Symbolic MIDI preprocessing
        ↓
Deep learning model training
        ↓
Checkpointed TensorFlow/Keras model
        ↓
Flask web application deployment
        ↓
Interactive MIDI harmonization
```

---

## Website Application

The related `NeuralCounterpoint-Website` project provides an interactive interface for using trained NeuralCounterpoint models.

The web app supports:

* MIDI melody upload
* MIDI validation
* Sequential SATB harmony generation
* Pretrained TensorFlow/Keras model inference
* MIDI parsing and writing with `music21`
* Downloadable harmonized MIDI output

This connects the research/training work in this repository to a usable application for AI-assisted composition.

---

## Applications

This project demonstrates techniques relevant to:

* Generative AI
* AI-assisted music composition
* Symbolic music generation
* Sequence modeling
* Computational musicology
* Deep learning research
* Recurrent neural networks
* Creative AI applications
* End-to-end machine learning systems


---

## Notes

This repository represents an experimental research project. Some paths, checkpoints, and environment settings may need to be updated before running the notebook on a new machine.

---

## Author

**David Alvin**

Machine Learning • Deep Learning • Generative AI • Music AI
