#Create top level folder
dir.create('my-data-project')
setwd('./my-data-project/')

#Create child folders
dir.create('code')
dir.create('visualizations')
dir.create('reports')
dir.create('data')

#Create trackers
file.create('README.md')
file.create('CHANGELOG.md')

#Create grandchildren folders for data
setwd('./data')
dir.create('raw')
dir.create('refined')

#Create grandchildren folders for visualizations
setwd('../visualizations')
dir.create('exploratory')
dir.create('communication')

#Initialize git repo
git2r::init('.')

# CHANGELOG.md Example

## Logs

##Excluded processes should be assumed to be the same as version 0.1.

##Current Best Model:
##Current Best Score / Metric:

## 0.1

## 1_exploration.Rmd

## 2_pre_processing.Rmd

## 3_modeling.ipynb
## {data used} | {robustness}| {model} | {params} | {best score & metric}

## ML Notebook Layout

## libs, functions, imports, preprocessing, feature engineering, feature selection, model building
