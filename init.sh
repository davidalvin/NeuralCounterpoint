#!/bin/bash
echo "Installing requirements..."
pip install -r requirements.txt
echo "Installation complete"
echo "Converting the notebook..."
jupyter nbconvert --to script polybach-train-rnn.ipynb
echo "Running they python script..."
python polybach-train-rnn.py
echo "Completed"