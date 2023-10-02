#Activity 1: Data Exploration

str(Carseats)
Carseats

#calculate descriptive statistics using describr()
describe(Carseats)
describe(Carseats,Sales,CompPrice,Income)#Select Columns by name
describe(Carseats,Sales:Income)#Select all columns between sales and incomes(Include)
describe(Carseats,-(Sales:Income))#Select all column except sales until income


#test normality
normality(Carseats)
normality(Carseats,Sales,CompPrice,Income)#Select Columns by name
normality(Carseats,Sales:Income)#Select all columns between sales and incomes(Include)
normality(Carseats,-(Sales:Income))#Select all column except sales until income


#Plot Normality

plot_normality(Carseats,Sales,CompPrice)#Select Columns by name

#calculate correlate
correlate(Carseats)
correlate(Carseats,Sales,CompPrice,Income)#Select Columns by name
correlate(Carseats,Sales:Income)#Select all columns between sales and incomes(Include)
correlate(Carseats,-(Sales:Income))#Select all column except sales until income


#plot correlate
Carseats%>%
  correlate() %>%
  plot()


correlate(Carseats,Sales,Price)%>%
  plot()

#EDA based on target variable
categ <- target_by(Carseats,US)

#EDA when target variable is categorical, predictor is numerical
car_num <- relate(categ,Sales)
car_num
summary(car_num)
plot(car_num)




#EDA when target variable is categorical, predictor is categorical
cat_cat <- relate(categ,ShelveLoc)
cat_cat
summary(cat_cat)
plot(cat_cat)




#EDA when target variable is numerical, predictor is numerical
num<-target_by(Carseats,Sales)
num_num <- relate(num,Price)
num_num
summary(num_num)
plot(num_num)



#EDA when target variable is numerical, predictor is categorical
num_cat <- relate(num,ShelveLoc)
num_cat
summary(num_cat)
plot(num_cat)

