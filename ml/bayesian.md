##Naïve Bayes

Document/spam classification is one use. Assumptions are that all the features are equally likely and are all important. Would be computational expensive without these assumptions with having to track all the joint probabilities. Gaussian for continuous variables, Bernoulli for binary input, and Multinomial for binary and more input. Use MLE to estimate parameters for Gaussian. Bernoulli/Multinomial used for spam classification.The Laplace Estimator (usually chosen to be 1) is a corrective measure that adds a small amount of error to each of the counts in the frequency table of words. The addition of error ensures that each resulting probability of each event will necessarily be nonzero, even if the event did not appear in the training data.

Note: In addition, we can use function "partial_fit" to fit on a batch of samples incrementally while we are using. MultinomialNB and Bernoulli NB also support sample weighting. 

Pros: It is relatively simple to understand. Training the classifier does not require many observations, and the method also works well with large amounts of data. It is easy to obtain the estimated probabilityfor a classification prediction.

Cons: The method relies upon the faulty assumptions that the features in the dataset are independentand equally important. While easily attainable, the estimated probabilities are often less reliable than the predicted class labels themselves.
Formula: posterior = likelihood*prior/(marginal likelihood) or p(spam|word) = p(word|spam)*p(spam)/p(word)

##LDA

Before we take a look into the inner workings of LDA in the following subsections, let's summarize the key steps of the LDA approach:
Standardize the -dimensional dataset ( is the number of features).

For each class, compute the -dimensional mean vector.

Construct the between-class scatter matrix  and the within-class scatter matrix .

Compute the eigenvectors and corresponding eigenvalues of the matrix .

Choose the  eigenvectors that correspond to the  largest eigenvalues to construct a -dimensional transformation matrix ; the eigenvectors are the columns of this matrix.

Project the samples onto the new feature subspace using the transformation matrix.

LDA similar to Naive Bayes but doesn't assume variables are independent, assumes that p(x|y) is a multivariate normal distribution, and assumes gaussian distributions for each class share the same covariance matrix. If they don't share the same covariance matrix, then we use Quadratic Discriminant Analysis which assumes each class has its own. 