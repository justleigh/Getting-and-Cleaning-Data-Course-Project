---
title: "README.Rmd"
author: "Leigh Pearson"
date: "2023-10-09"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## README for the Getting and Cleaning Data Course Project

Project Purpose:
This project is designed to practice getting and lceaning data in R. I had to to collect and clean the Human Activity Recognition Using Smartphones Data Set, making it clean and tidy for analysis. The main objectives are to merge the training and test datasets, extract measurements on the mean and standard deviation, use descriptive activity names, label the dataset with descriptive variable names, and create a second dataset with the average of each variable for each activity and subject.

Files and Scripts:
data_cleaning.R: This script manages the initial data loading, merging of training and test datasets, variable renaming, and data transformation tasks. It outputs a clean and tidy dataset ready for analysis.

analysis.R: This script handles the advanced data analysis, generating descriptive statistics, plots, and other insights from the clean dataset.

CodeBook.md: A markdown file that provides a detailed explanation of the dataset, transformations performed, and definitions of each variable in the dataset.

README.md: Overview of the project, the purpose, and instructions on how to run the scripts for analysis.

How to Run the Analysis:
1. Download the raw data from the UCI repository and unzip it in the ./data/ directory.
2. Set your working directory in R to where the scripts are located.
3. Run the data_cleaning.R script to preprocess the data. This will generate a clean dataset named tidy_data.txt.
4. Execute the analysis.R script to delve deeper into the data, generate insights, and visualize the results.
5. Refer to CodeBook.md for a deeper understanding of the transformations and the final dataset structure.

