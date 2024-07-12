# Applying logistic regression to predict heart disease
Based on a Kaggle dataset, our team decided to analyze the data using R in Posit Cloud.

[Click here to view the original post](https://www.kaggle.com/datasets/dileep070/heart-disease-prediction-using-logistic-regression)

### Identify and Understand the Dataset:

Examine the dataset's structure, variable types, and potential missing values.
Familiarize yourself with the dataset's domain and context to make informed decisions about imputation and handling.

### Data Preparation and Cleaning
#### Missing Value Imputation:
Based on the visualization of missing values in the numerical columns, we're using mean(framingham$variable, na.rm = TRUE) for each variable. 
This calculates the mean of the corresponding column (cigsPerDay, BPMeds, totChol, BMI, heartRate, glucose) while excluding the missing values (indicated by na.rm = TRUE). 
This ensures that the imputed values are more representative of the actual distribution of the data and less likely to introduce bias into your analyses.

### Choosing Variables for Logistic Regression
#### Variable Selection in Logistic Regression
In logistic regression, variable selection is the process of identifying the most relevant and informative variables to include in the model. 
The goal is to build a parsimonious model that accurately predicts the outcome (dependent variable) while avoiding overfitting and reducing the impact of irrelevant or redundant variables.

#### Choosing prevalentHyp and diaBP
In the context of the provided code, the specific choice of variables prevalentHyp (prevalent hypertension) and diaBP (diastolic blood pressure) for logistic regression modeling could be driven by several factors:

#### 1. Domain Knowledge and Research Question:
If the research question is specifically focused on the relationship between hypertension and cardiovascular disease, then prevalentHyp and diaBP are directly relevant variables.
Hypertension and blood pressure are established risk factors for cardiovascular disease, making them logical candidates for inclusion in the model.
Univariate Analysis Results:

If univariate analysis (e.g., chi-square tests) has shown significant associations between prevalentHyp, diaBP, and the outcome variable (10-year coronary heart disease), then these variables would be strong candidates for inclusion.

#### 2. Model Performance and Variable Importance:
Once the logistic regression models are fitted, evaluate the model performance metrics (e.g., accuracy, AUC) and assess the importance of each variable using techniques like Wald tests or permutation importance.
If prevalentHyp and diaBP consistently contribute significantly to the model's predictive power, then their inclusion would be justified.

#### 3. Clinical Relevance and Interpretability:
Consider the clinical relevance of the variables. PrevalentHyp and diaBP are easily measurable and clinically meaningful factors that can be used to inform risk assessment and treatment decisions.
Including variables that have clear clinical interpretation and potential implications for patient care can enhance the model's value.

#### 4. Caveats:
The choice of variables should be guided by a combination of statistical significance, domain knowledge, and the research question.
Overfitting is a concern in logistic regression, so variable selection techniques should be used in conjunction with regularization methods or cross-validation to prevent overfitting.
Consider the potential for multicollinearity among the selected variables, as it can affect model stability and interpretation.

In summary, the choice of prevalentHyp and diaBP for logistic regression modeling could be justified based on their relevance to the research question, their statistical significance, their clinical relevance, and their contribution to model performance. However, careful consideration of potential issues like overfitting and multicollinearity is crucial to ensure the validity and interpretability of the model.

### Statistical Calculations
#### Variance and Covariance
Variance of prevalentHyp and diaBP columns is calculated using var(), which measures the spread of data points around the mean.
Covariance matrix for all columns in framingham is computed using cov(). The covariance matrix captures the joint variability between pairs of variables.

#### Calculate Square Root of Variances:
While not explicitly shown in the code, the standard deviation is the square root of the variance and reflects the spread of data in the same units as the original variable.

#### Calculate Means:
Means of prevalentHyp and diaBP columns are calculated using mean(), which provides the central tendency of the data.

### Logistic Regression Models
#### Predicting Ten-Year Coronary Heart Disease
A series of logistic regression models are fitted using glm() to assess the relationship between the target variable TenYearCHD (presence/absence of coronary heart disease in 10 years) 
and various independent variables in the framingham dataset. Logistic regression is a statistical method suited for binary dependent variables.
The family = binomial(link = "logit") argument specifies a logistic regression model with a logit link function. 
These models will help identify which factors have the strongest association with the risk of developing coronary heart disease in 10 years.

### Data Visualization
#### Coronary Artery Disease by Sex
A stacked bar chart is created using ggplot2 to visualize the prevalence of coronary heart disease (CHD) for males and females. This helps understand the distribution of CHD across genders.

![Gender](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/heart%20disease%20by%20gender.png)

The provided image shows the prevalence of coronary artery disease (CHD) by males, since the "Yes CHD" segment is slightly taller for males compared to females.

#### Coronary Artery Disease by Age
A similar stacked bar chart is created to show the prevalence of CHD across different age groups. This can reveal trends in CHD prevalence across different age groups. You might observe an increasing prevalence of CHD with advancing age, though the specific trends would depend on the data distribution.

![Age](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/heart%20disease%20by%20age.png)

The graphic reveals a general trend of increasing CHD prevalence with advancing age (blue bars become more prominent).

#### Boxplots for Systolic and Diastolic Blood Pressure
This plot helps us compare the blood pressure distributions between the systolic and diastolic blood pressure (SBP and DBP) for individuals with and without coronary artery disease (CHD).

![SBP/DBP](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/heart%20disease%20by%20systolic%20and%20diastolic%20blood%20pressure.png)

#### Boxplots for BMI and Heart Rate
This plot helps us compare the distributions of body mass index (BMI) and heart rate for individuals with and without CHD.

#### Coronary Artery Disease by Stroke
This helps us understand the relationship between stroke and CHD risk.

#### Coronary Artery Disease by Diastolic Blood Pressure
This helps us understand the relationship between DBP and CHD risk specifically for the subgroup.
