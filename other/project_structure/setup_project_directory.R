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
