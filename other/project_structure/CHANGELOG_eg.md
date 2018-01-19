## Logs

Excluded processes should be assumed to be the same as version 0.1.

Current Best Model:

Current Best Score (Metric):

### 0.2

**code**

Input: `{date_iso_format}_{fname}.csv`

**3_modeling.ipynb**

* Dropped these features.

* Dummied two fearues.

* Features used: ["list of features"]

* 5-fold cv | grid search: {regularization: np.arange(0, .1, .01), elastic_net: [0, 1]} | Logistic Regression | 80% data > 0.75 (ROC-AUC)

### 0.1

**code/1_exploration.Rmd**

Input: `{date_iso_format}_{fname}.csv`
Output: `{date_iso_format}_{fname}.csv`

* Stuff

**code/2_pre_processing.Rmd**

Input: `{date_iso_format}_{fname}.csv`
Output: `{date_iso_format}_{fname}.csv`

* Stuff

**code**

Input: `{date_iso_format}_{fname}.csv`

**3_modeling.ipynb**

* Cast these features.

* 5-fold cv | grid search: {regularization: np.arange(0, .1, .01), elastic_net: [0, 1]} | Logistic Regression | 80% data > 0.75 (ROC-AUC)
