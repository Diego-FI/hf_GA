# Green-Ampt Wetting Front Suction ($h_f$) Calculator

This repository provides the R script and step-by-step examples to calculate the Green-Ampt wetting front suction parameter ($h_f$) based on the Van Genuchten-Mualem (VGM) hydraulic properties and initial soil pressure head, as proposed in our methodology.

## Prerequisites
No external R packages are required. The function relies exclusively on base R.

## Dataset Requirements
To process your own dataset, ensure your `.csv` file contains at least the following columns with exact or corresponding names in your code:
* `Alpha`: Empirical parameter [1/cm]
* `N`: Empirical parameter [-]
* `Ks`: Saturated hydraulic conductivity [cm/h]
* `Theta_r`: Residual volumetric water content [cm3/cm3]
* `Theta_s`: Saturated volumetric water content [cm3/cm3]
* `H0`: Initial pressure head (suction) in the soil [cm]

## How to Use: Step-by-Step Example

The most common use case for practitioners is to calculate $h_f$ for an entire database of soils. This example demonstrates how to load a dataset, apply the polynomial equation to all rows simultaneously, and save the updated file.

### 1. Load the function
Download the R script and source it in your R environment to load the `GAhf` function:

### 2. Load the dataset
Place your soil database (e.g., data.csv) in your working directory and run the following code. This will read the file, compute $h_f$ for every soil profile, and overwrite the file with the new results included.

### 3. calculate $h_f$ through the polynomial and save the .csv file 
You can easily perform the calculation and save the .csv file.
