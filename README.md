# \# 5G Adaptive Beamforming: Extremum Seeking Control

# 

# !\[MATLAB](https://img.shields.io/badge/MATLAB-R2023a+-blue.svg)

# !\[Simulink](https://img.shields.io/badge/Simulink-Communications\_Toolbox-orange.svg)

# !\[Stateflow](https://img.shields.io/badge/Stateflow-Control\_Logic-brightgreen.svg)

# 

# \## Overview

# This repository contains a closed-loop Simulink/Stateflow model simulating the initial acquisition and tracking phases of a 5G NR (New Radio) adaptive beamforming system. 

# 

# Unlike traditional Phase-Locked Loops (PLLs) that require an explicit phase error vector, this system operates entirely "blind" in the spatial domain. It utilizes \*\*Extremum Seeking Control (ESC)\*\* via a Gradient Ascent algorithm to locate a stationary user and optimize the Signal-to-Noise Ratio (SNR) across a highly noisy AWGN channel.

# 

# \## System Architecture

# 

# The simulation merges physical layer telecommunications with non-linear control theory.

# 

# !\[Simulink Architecture](docs/simulink\_architecture.png)

# \*Full closed-loop architecture: Spatial channel simulation, AWGN impairment, moving average DSP filters, and Stateflow baseband controller.\*

# 

# 1\. \*\*The Plant (Spatial Channel):\*\* A Gaussian radiation pattern ($P = e^{-k(\\phi - \\Theta)^2}$) representing a massive MIMO antenna beam.

# 2\. \*\*The Data Link:\*\* A 16-QAM modulated signal transmitted through an Additive White Gaussian Noise (AWGN) environment.

# 3\. \*\*The Controller (Stateflow):\*\* A finite state machine evaluating the numerical derivative of the received power ($dP/dt$) to dynamically sweep the antenna array ($\\Theta$) and lock onto the target.

# 

# !\[Stateflow Logic](docs/stateflow\_logic.png)

# \*The ESC state machine transitioning from an open-loop spatial search to closed-loop peak-power dithering.\*

# 

# \## Installation \& Usage

# 

# 1\. Clone the repository:

# &#x20;  ```bash

# &#x20;  git clone \[https://github.com/yourusername/5G-Adaptive-Beamforming.git](https://github.com/yourusername/5G-Adaptive-Beamforming.git)

# &#x20;  Here is the updated, highly technical, and concise `README.md` file. It strips out the setup bloat and seamlessly weaves your images and animations directly into the engineering explanations. 

# 

# Copy and paste this into your repository:

# ```markdown

