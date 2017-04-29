http://hunch.net/?p=224
https://twitter.com/hashtag/machinelearningflashcards?src=hash

##KNN

Calculate distance between each observation and all the others. Determine the k nearest observations to the observation. Classify the observation as the most frequent class of the k nearest observations. Small k's are not robust to outliers, highlight local variations and induce unstable decision boundaries. Large k's are robust to outliers, highlight global variations and induce stable decision boundaries. Good value to choose is k = sqrt(n). Can use maximum prior probability to decide ties. Use Euclidean distance for numerical data and Hamming distance for categorical data. Latter treats dimensions equally and is symmetric. Low k is low bias, high variance and high k is high bias low variance. 1NN can't adapt to outliers and has no notion of class frequencies. Can use weighted KNN. Easy in sklearn.

Pros: Only assumption is proximity. Non-parametric.

Cons: Have to decide k and distance metric. Can be sensitive to outliers or irrelevant attributes. Computationally expensive.

curse of dimensionality, overfitting, correlated features, cost to update, sensitivity of distance metrics

##SVM

The LinearSVC class regularizes the bias term, so you should center the training set first by subtracting its mean. This is automatic if you scale the data using the StandardScaler. Moreover, make sure you set the loss hyperparameter to "hinge", as it is not the default value. Finally, for better performance you should set the dual hyperparameter to False, unless there are more features than training instances (we will discuss duality later in the chapter).

With so many kernels to choose from, how can you decide which one to use? As a rule of thumb, you should always try the linear kernel first (remember that LinearSVC is much faster than SVC(kernel="linear")), especially if the training set is very large or if it has plenty of features. If the training set is not too large, you should try the Gaussian RBF kernel as well; it works well in most cases. Then if you have spare time and computing power, you can also experiment with a few other kernels using cross-validation and grid search, especially if there are kernels specialized for your training set’s data structure.

Here mostly talking about a maximal margin classifier. A separating hyperline of data of two classes. Maximizes distance to the nearest point in either class, i.e, the margin. Points which delineate the boundary are called support vectors. Correct classification first and then maximizing the margin. SVM only really works well with linear hyperplanes. The c hyperparameter deals with the tradeoff between a smooth decision boundary and correct classification. The larger the c the more points classified correctly as it increases the penalty for wrong classification. A smaller c gives more room for intial error which helps improve accuracy for not easily separable data. Work well in complicated domains with clear line of separation. Not so well in for large datasets because of training and not when there is a lot of noise. Can solve nonlinear decision boundaries by using polynomial terms. Kernel trick that draws boundaries by looking into higher dimensions. 

Extracting the coefficients from the hyperplane equation (not including the intercept) yields what is called a normal vector. This vector points in a direction orthogonal to the surface of the hyperplane and essentially defines its orientation.
Big data set and lot of features SVM might be slow and prone to overfitting. SVM slower than naïve bayes. A kernelis a function that quantifies the similarity of two observations. The beauty of the "kernel trick" is that, even if there is an infinite-dimensional basis, we need only look at the n^2 inner products between training data points. SVM not scale invariant. Check if library normalizes by default. RBF kernel is a good default. Try exponential sequences for parameters.
Extension of above info about relaxing margin. Doesn't perfectly separate classes but is more robust to outliers. Helps better classify obervations. Take a penalty by potentially misclassifying soe observations. Have better predictive power. Called a soft margin. The C parameter is the budget for the slack variables which tell where observations are relative to the margin and hyperplane. Only observations that either fall on the margin or violate the margin affect the solution to the optimization problem. More robust than SVM. 

When the support vector classifier is combined with a non-linear kernel, the resulting classifier is called a support vector machine.
Note: Important to make sure the normal vector is of unit length. For the radial kernel, suppose we have a test observation. If it is far from a training observation, the Euclidean distance will be large, but the value of the radial kernel will be small. using kernels is much more computationally efficientbecause we only need to compute the kernel for distinct pairs of observations in our dataset. Furthermore, we need not actually work in the enlarged feature space. Intuitively, the gamma parameter defines how far the influence of a single training example reaches, with low values meaning ‘far’ and high values meaning ‘close’. The gamma parameters can be seen as the inverse of the radius of influence of samples selected by the model as support vectors. 

Multiclass

1v1: Construct a support vector machine for each pair of categories. For each classifier, record the prediction for each observation. Have the classifiers vote on the prediction for each observation.

1vAll: Construct a support vector machine for each individual category against all other categories combined. Assign the observation to the classifier with the largest function value.

##Time Series

Seasonal Decomposition; Use additive model when the magnitude of the seasonal fluctuations surrounding the general trend doesn't vary over time. Use the multiplicative model when the magnitude of the seasonal fluctuations surrounding the general trend appear to change in a proportional manner over time. Go from additive to multiplicative with a log transformation.

White noise: Describes the assumption that each element in the time series is a random draw from N(0, constant variance). Also called a stationary series. Time series with trends or seasonality are not stationary.

ARIMA(p,d,q) (Auto-Regressive Integrated Moving Average) Models: Atheoretical model.

AR(p): auto-regressive component for lags on the stationary series. The AR models sayd that the value of a variable at a specific time is related to the value of the variable at previous times.

I(d): Integrated component for a series that needs to be differenced.

MA(q): Moving average component for lag of the forecast errors. In a moving average model of order q, each value in a time series is predicted from the linear combination of the previous q errors. The value of a variable at a specific time is related to the residuals of prediction at previous times.

Note: In an auto-regressive model of order p, each valeu in a time series is predicted from a linear combination of the previous p values.

Procedure: Make stationary if necessary by differencing. Determine possible values of p and q. Assess model fit and try other values of p and q to overfit. Make forecasts with the final model.

Augmented Dicky-Fuller Test: This tests whether or not a time series is stationary. h0: series is not stationary, ha: the series is stationary.

Determine p and q: Look at autocorrelation (AC) and partial correlation (PAC) functions. AC measures the way observations relate to each other. PAC measure the way observations relate to each other after accounting for all other intervening observations. Plot of the autocorrelation function (ACF) displays correlation of the series with itself at different lags. A plot of the PAC displays the amount of autocorrelation not explained by lower order correlations. Spikes in the PACF will choose for AR(p). Spikes in the ACF will choose MA(q). 

Assess Model Fit: 

Appropriate model should resemble white noise. Check scatterplot of residuals vs fit to check constant variance and qqplot to check normality. Autocorrelations should be zero to check for violation of independent errors.

Box-Ljung Test: Check if all autocorrelations are zero, i.e the series is of white noise. H0: autocorrelations are all 0. ha: At least one is nonzero. 

Overfit model with extra AR/MA terms and compare using AIC/BIC.

Interpretation: AR coefficient closer to 1 means series returns to mean slowly, vice versa for closer to 0.
MA(1) coefficient indicates how much the shock of the previous time period is retained in the current time period. MA(2) refers to the previous two time periods.

library(fpp) #Forecasting principles and practice library.
library(forecast) #Loading the forecast library for time series analysis.
library(tseries)

##Association Rule Mining

Used in Genetics, Fraud, and Market Basket Analysis, etc. A typical rule might be: if someone buys peanut butter and jelly, then that person is likely to buy bread as well. Incredibly big feature space (2^k-1). The Apriori algorithm employs a simple a prioribeliefas a guideline for reducing the association rule space. The notions boil down to: all subsets of a frequent purchase must also be frequent and all supersets of a infrequent purchase must also be infrequent. An interesting association rule is usually a function of looking at three different parameters that surround a particular rule:
Support: the fraction of which each item appears within the dataset as a whole. Support(item) = count(item)/N. Higher support is better. 

Confidence: the likelihood that a constructed rule is correct given the items on the left hand side of the transaction. A higher level of confidence implies a higher likelihood that Y appears alongside transactions in which X appears.

Lift: the ratio by which the confidence of a rule exceeds the expected outcome. When lift > 1, the presence of X seems to have increasedthe probability of Y occurring in the transaction. When lift < 1, the presence of X seems to have decreasedthe probability of Y occurring in the transaction. When lift = 1, X and Y are independent.

Set thresholds for support and confidence and then the algorithm goes from all 1-combinations to 2-combinations and up. Those subset below the threshold don't make it to the higher iterations. 

Pros: Ideally suited for working with very large amounts of transactional data. The results are rules that are generally easy to understand and have a high amount of interpretability. The process is useful for data mining and uncovering unexpected knowledge within a dataset.

Cons: The outcome is usually not interesting when applied to smaller datasets. It is difficult to separate actual insights from common sense notions. The analyst might be compelled to draw spurious conclusions--remember that correlation doesn’t imply causation!






