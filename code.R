framingham <- read_csv("framingham.csv")
View(framingham)

install.packages("ggplot2")
library(ggplot2)
install.packages("cowplot")
library(cowplot)
install.packages("dplyr")
library(dplyr)
install.packages("gridExtra")
library(gridExtra)

# Teste
# Substituir os NA na coluna 'education' com o valor 1.979 aproximado
framingham$education[is.na(framingham$education)] <- 2
# Deu certo aplicar a média para substituir os NA
# Substituir os NA de todas as colunas por sua respectiva média
# Seria mais eficiente calcular as médias das colunas de forma programática
framingham$cigsPerDay[is.na(framingham$cigsPerDay)] <- mean(framingham$cigsPerDay, na.rm = TRUE)
framingham$BPMeds[is.na(framingham$BPMeds)] <- mean(framingham$BPMeds, na.rm = TRUE)
framingham$totChol[is.na(framingham$totChol)] <- mean(framingham$totChol, na.rm = TRUE)
framingham$BMI[is.na(framingham$BMI)] <- mean(framingham$BMI, na.rm = TRUE)
framingham$heartRate[is.na(framingham$heartRate)] <- mean(framingham$heartRate, na.rm = TRUE)
framingham$glucose[is.na(framingham$glucose)] <- mean(framingham$glucose, na.rm = TRUE)

# education e diaBP
# Cálculo da variância das colunas 'prevalentHyp' e 'diaBP'
var_prevalentHyp <- var(framingham$prevalentHyp)
var_diaBP <- var(framingham$diaBP)

# Cálculo da covariância entre todas as colunas
cov_matrix <- cov(framingham)

# prevalentHyp cov prevalentHyp é 0.214149313
# diaBP cov diaBP é 141.86833820
sqrt_var_prevalentHyp <- sqrt(var_prevalentHyp)
sqrt_var_diaBP <- sqrt(var_diaBP)

mean_prevalentHyp <- mean(framingham$prevalentHyp)
mean_diaBP <- mean(framingham$diaBP)

# Regressão logística para prever 'TenYearCHD' com várias variáveis independentes
glm(TenYearCHD ~ ., family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ male, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ age, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ education, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ currentSmoker, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ cigsPerDay, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ BPMeds, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ prevalentStroke, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ prevalentHyp, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ diabetes, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ totChol, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ sysBP, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ diaBP, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ BMI, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ heartRate, family = binomial(link = "logit"), data = framingham)
glm(TenYearCHD ~ glucose, family = binomial(link = "logit"), data = framingham)


# Histogram to visualize Coronary Heart Disease by Sex
Create a proportional bar plot for Gender vs CHD with counts
gender_plot_with_counts <- ggplot(framingham, aes(x = as.factor(male), fill = as.factor(TenYearCHD))) +
  geom_bar(position = "fill", stat = "count") +
  labs(title = "Coronary Heart Disease by Gender", 
       x = "Gender", 
       y = "Proportion") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) +
  scale_x_discrete(labels = c("0" = "Female", "1" = "Male")) +  # Renaming the x-axis labels
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +  # Center the plot title
  geom_text(stat = 'count', aes(label = ..count..), position = position_fill(vjust = 0.5), color = "white")
print(gender_plot_with_counts)

# Histogram to visualize Coronary Heart Disease by Age
histogramage <- ggplot(framingham, aes(x = age, fill = factor(TenYearCHD))) +
  geom_bar(position = "stack", stat = "count") +
  labs(title = "Coronary Heart Disease by Age", x = "Age", y = "Count") +
  scale_fill_manual(values = c("#1E2C3C", "#49A4E4"))
print(histogramage)

# Plot for Systolic Blood Pressure (sysBP)
sysBP_plot <- ggplot(data = framingham, aes(x = as.factor(TenYearCHD), y = sysBP, fill = as.factor(TenYearCHD))) +
  geom_boxplot(notch = TRUE) +  
  labs(title = "Coronary Heart Disease by Systolic Blood Pressure",  
       x = "10-Year Coronary Heart Disease (CHD)", y = "Systolic Blood Pressure") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) + 
  theme_minimal()

# Plot for Diastolic Blood Pressure (diaBP)
diaBP_plot <- ggplot(data = framingham, aes(x = as.factor(TenYearCHD), y = diaBP, fill = as.factor(TenYearCHD))) +
  geom_boxplot(notch = TRUE) +  
  labs(title = "Coronary Heart Disease by Diastolic Blood Pressure",  
       x = "10-Year Coronary Heart Disease (CHD)", y = "Diastolic Blood Pressure") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) + 
  theme_minimal()

# Combine the two plots into one display
grid.arrange(sysBP_plot, diaBP_plot, ncol = 2)

# Boxplot for Body Mass Index (BMI)
bmi_plot <- ggplot(data = framingham, mapping = aes(x = as.factor(TenYearCHD), y = BMI, fill = as.factor(TenYearCHD))) +
  geom_boxplot() +
  labs(title = "Coronary Heart Disease by Body Mass Index (BMI)", 
       x = "CHD", 
       y = "BMI") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) +
  theme_minimal()

# Histogram for Total Cholesterol (totChol)
chol_histogram <- ggplot(data = framingham, aes(x = totChol, fill = as.factor(TenYearCHD))) +
  geom_histogram(binwidth = 10, position = "dodge") +
  labs(title = "Distribution of Total Cholesterol by CHD Status", 
       x = "Total Cholesterol", 
       y = "Count") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) +
  theme_minimal()

# Combine the two plots
combined_plot <- plot_grid(bmi_plot, chol_histogram, ncol = 1, rel_heights = c(1, 1))
print(combined_plot)

# Histogram of Diabetes
diabetes_plot_with_counts <- ggplot(framingham, aes(x = as.factor(diabetes), fill = as.factor(TenYearCHD))) +
  geom_bar(position = "fill", stat = "count") +
  labs(title = "Coronary Heart Disease by Diabetes", 
       x = "Diabetes Status", 
       y = "Proportion") +
  scale_fill_manual(values = c("0" = "#1E2C3C", "1" = "#49A4E4"), 
                    name = "CHD Status", 
                    labels = c("No CHD", "CHD")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) + # Center the plot title
  geom_text(stat='count', aes(label=..count..), position=position_fill(vjust=0.5), color="white")

print(diabetes_plot_with_counts)
