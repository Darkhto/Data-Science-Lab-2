#Activity 1: Data Exploration



str(Churn_Train)
Churn_Train

#calculate descriptive statistics using describr()
describe(Churn_Train)
summary(Churn_Train)

#Check missing value in data set
summary(is.na(Churn_Train))
sum(is.na(Churn_Train))

#Replace missing value
Churn_Train <- Churn_Train %>%
  mutate(`Total Charges`=replace(`Total Charges`,is.na(`Total Charges`),median(`Total Charges`,na.rm=TRUE)))
is.na(Churn_Train$`Total Charges`)

#Check data set for any missing value
summary(is.na(Churn_Train))
sum(is.na(Churn_Train))


#calculate descriptive statistics using describr()
describe(Churn_Train)
describe(Churn_Train,'Senior Citizen', 'Tenure')#Select Columns by name
describe(Churn_Train,'Senior Citizen': 'Monthly Charges')#Select all columns between Senior Citizen and Monthly Charges(Include)
describe(Churn_Train,-('Senior Citizen': 'Tenure'))#Select all column except Senior Citizen until Tenure


#test normality
normality(Churn_Train)
normality(Churn_Train,'Senior Citizen', 'Tenure')#Select Columns by name
normality(Churn_Train,'Senior Citizen': 'Monthly Charges')#Select all columns between Senior Citizen and Monthly Charges(Include)
normality(Churn_Train,-('Senior Citizen': 'Tenure'))#Select all column except Senior Citizen until Tenure



#Plot Normality

plot_normality(Churn_Train,'Monthly Charges','Tenure')#Select Columns by name
plot_normality(Churn_Train,'Senior Citizen','Tenure')#Select Columns by name

#calculate correlate
correlate(Churn_Train)
correlate(Churn_Train,'Tenure', 'Monthly Charges', 'Total Charges')#Select Columns by name
correlate(Churn_Train,'Senior Citizen': 'Monthly Charges')#Select all columns between Senior Citizen and Monthly Charges(Include)
correlate(Churn_Train,-('Senior Citizen': 'Tenure'))#Select all column except Senior Citizen until Tenure


#plot correlate
Churn_Train%>%
  correlate() %>%
  plot()


correlate(Churn_Train,'Tenure','Monthly Charges')%>%
  plot()


#EDA based on target variable
categ <- target_by(Churn_Train,'Contract')

#EDA when target variable is categorical, predictor is numerical
cat_num <- relate(categ,'Monthly Charges')
cat_num
summary(cat_num)
plot(cat_num)




#EDA when target variable is categorical, predictor is categorical
cat_cat <- relate(categ,'Partner')
cat_cat
summary(cat_cat)
plot(cat_cat)



#EDA when target variable is numerical, predictor is numerical
num<-target_by(Churn_Train,'Monthly Charges')

num_num <- relate(num,'Total Charges')
num_num
summary(num_num)
plot(num_num)



Churn_Train$'Payment Method' <- as.factor(Churn_Train$'Payment Method')

#EDA when target variable is numerical, predictor is categorical
num_cat <- relate(num,'Payment Method')
num_cat
summary(num_cat)
plot(num_cat)

#Automated  Report

Churn_Train %>%
  eda_Paged_report(target="Total Charges",subtitle="Churn_Train",
                 output_dir="C:/Users/aiman/Desktop/DATA SCIENCE LAB",output_file="EDA.pdf",theme="blue",
                 output_format = "pdf" )


Churn_Train %>%
  eda_web_report(target="Total Charges",subtitle="Churn_Train",
                 output_dir="C:/Users/aiman/Desktop/DATA SCIENCE LAB",output_file="EDA.html",theme="blue" )

