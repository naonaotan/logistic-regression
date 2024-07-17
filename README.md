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
#### Coronary Heart Disease by Sex
A stacked bar chart is created using ggplot2 to visualize the prevalence of coronary heart disease (CHD) for males and females. This helps understand the distribution of CHD across genders.

![Gender](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/CHD%20by%20gender.png)

The provided image shows the prevalence of coronary heart disease (CHD) by males, since the "CHD" segment is slightly taller for males compared to females.

#### Coronary Heart Disease by Age
A similar stacked bar chart is created to show the prevalence of CHD across different age groups. This can reveal trends in CHD prevalence across different age groups. You might observe an increasing prevalence of CHD with advancing age, though the specific trends would depend on the data distribution.

![Age](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/CHD%20by%20age.png)

The graphic reveals a general trend of increasing CHD prevalence with advancing age (blue bars become more prominent).

#### Boxplots for Coronary Heart Disease by Systolic Blood Pressure (Left) and Diastolic Blood Pressure (Right)
This plot helps us compare the blood pressure distributions between the systolic and diastolic blood pressure (SBP and DBP) for individuals with and without coronary heart disease (CHD).

**Axes**:

- **X-axis**: 10-Year Coronary Heart Disease (CHD), with 0 indicating no CHD and 1 indicating CHD.

- **Y-axis (Left Plot)**: Systolic Blood Pressure (sysBP).

- **Y-axis (Right Plot)**: Diastolic Blood Pressure (diaBP).

**Legend**:

- CHD Status: Indicates whether the individual has CHD (in blue) or not (in dark gray).

![SBP/DBP](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/sysBP%20and%20diaBP.png)

**Systolic Blood Pressure**: There is a clear distinction between the median values of individuals with and without CHD, with those having CHD showing higher median systolic blood pressure and more variability.

**Diastolic Blood Pressure**: While the difference in median values is less pronounced than in systolic blood pressure, individuals with CHD still tend to have higher diastolic blood pressure and more variability.

This analysis reinforces the significance of systolic blood pressure (systolic hypertension) as a stronger indicator of coronary heart disease compared to diastolic blood pressure (diastolic hypertension) in this dataset. However, diastolic blood pressure also shows some degree of association with CHD.

#### Boxplots for Body Mass Index and Total Cholesterol
This plot helps us compare the distributions of body mass index (BMI) and Total Cholesterol for individuals with and without CHD.

![BMI/TotChol](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/BMI%20and%20totchol.png)

- There is a slight tendency for individuals with CHD to have a higher BMI, but the overlap suggests BMI alone might not be a strong differentiating factor for CHD risk.
- Individuals with CHD tend to have higher cholesterol levels compared to those without CHD, but there is still considerable overlap.

Both BMI and total cholesterol are important factors in understanding the risk of coronary heart disease.
While there are slight tendencies for higher BMI and higher cholesterol in individuals with CHD, neither factor alone is a definitive predictor.

#### Coronary Heart Disease and Diabetes
Lastly, let's compare the relationship between diabetes and CHD risk.

![Diabetes](https://raw.githubusercontent.com/naonaotan/logistic-regression/main/CHD%20by%20diabetes.png)

- The vast majority of individuals in the dataset do not have diabetes (indicated by the tall bars at 0).
- Among those without diabetes, a significantly larger portion did not develop CHD (dark blue bar) compared to those who did develop CHD (light blue bar).
- For individuals with diabetes (1), approximately 36.7% of diabetics developed CHD.
Despite of the majority of the studied population is non-diabetic, the chart clearly illustrates the higher vulnerability of diabetic individuals to developing coronary heart disease. 

### Defining the Profile of Individuals at Risk for Coronary Heart Disease (CHD)

Based on the analysis of various health and demographic factors, we can outline a comprehensive profile of individuals at an increased risk for developing coronary heart disease (CHD). The factors considered include gender, age, systolic blood pressure (sysBP), diastolic blood pressure (diaBP), body mass index (BMI), total cholesterol (totChol), and diabetes status.

#### Gender:
- **Men** have a higher incidence of CHD compared to women. This trend is consistent across various age groups and other risk factors, highlighting the need for targeted interventions for male populations.

#### Age:
- **Older age** is a significant risk factor for CHD. As age increases, the likelihood of developing CHD rises, emphasizing the importance of preventive care and monitoring in older adults.

#### Systolic Blood Pressure (sysBP):
- Individuals with **higher systolic blood pressure** readings are more prone to developing CHD. Both systolic and diastolic pressures are critical indicators, but systolic pressure shows a stronger association with CHD risk.

#### Diastolic Blood Pressure (diaBP):
- Elevated **diastolic blood pressure** is also associated with an increased risk of CHD, although its impact is slightly less pronounced than that of systolic blood pressure. Maintaining optimal blood pressure levels is crucial for cardiovascular health.

#### Body Mass Index (BMI):
- **Higher BMI** values correlate with a greater risk of CHD. Overweight and obese individuals are more likely to develop cardiovascular diseases, stressing the importance of weight management and healthy lifestyle choices.

#### Total Cholesterol (totChol):
- Elevated **total cholesterol levels** are a significant risk factor for CHD. High cholesterol contributes to the buildup of plaques in the arteries, leading to cardiovascular complications. Regular monitoring and management of cholesterol levels are vital.

#### Diabetes:
- **Diabetes** dramatically increases the risk of CHD. Diabetic individuals are more than twice as likely to develop CHD compared to non-diabetic individuals. Effective diabetes management is essential for reducing cardiovascular risk.

### Combined Risk Profile:
1. **Male Gender**: Males show a higher predisposition to CHD.
2. **Older Age**: Age significantly contributes to CHD risk, with older adults being more vulnerable.
3. **High Blood Pressure**: Both elevated systolic and diastolic blood pressure levels are critical risk factors.
4. **High BMI**: Overweight and obesity are strongly linked to increased CHD risk.
5. **High Total Cholesterol**: Elevated cholesterol levels are a major contributor to CHD.
6. **Diabetes**: Diabetic individuals face a significantly higher risk of CHD.

### Preventive Measures:
- **Regular Health Check-ups**: Frequent monitoring of blood pressure, cholesterol levels, and blood sugar is crucial.
- **Healthy Diet and Exercise**: Adopting a balanced diet and regular physical activity can help manage weight, blood pressure, and cholesterol.
- **Medications**: For individuals at high risk, medications to control blood pressure, cholesterol, and diabetes may be necessary.
- **Lifestyle Changes**: Reducing smoking, limiting alcohol intake, and managing stress can contribute to better cardiovascular health.

### Conclusion:
The profile of individuals at risk for CHD includes being male, older age, hypertension, overweight, elevated total cholesterol, and having diabetes. Understanding these risk factors can aid in early identification and intervention, ultimately reducing the incidence and impact of coronary heart disease. Regular monitoring, healthy lifestyle choices, and appropriate medical interventions are key strategies in managing and mitigating CHD risk.
