# Project Outline

## Purpose 
- This project forecasts stock exchange index prices based on real GDP per capita and inflation for a given index's country. The stock exchange that we are looking at iis the New York Stock Exchange. 
- We chose to analyze stock exchange index data because we are interested in understanding factors that influence fluctuations in the pricing.  This analysis will use historical data to predict an index's closing price based on macroeconimic factors.  It will be important to see how historical trends compare to actual current trends in a post-pandemic environment with rising inflation and economic stress globally.  
- Our data was sourced from Kaggle and World Bank: indexInfo - Kaggle, indexProcessed - Kaggle, Inflation - FRED|St. Louis, Real GDP - FRED|St. Louis, Working Population - FRED|St. Louis.
- From our analysis, we hope to gain a better understanding of how macroeconomic factors influence a stock exchange index's closing prices. 


## Method of Project Completion
- Communication protocols:
  - The group communicates primarily through Slack, Google Sheets, and Zoom meetings at least twice week. 
- Tools being used for each section of the project:  
  - Data Cleaning and Analysis: We will use Python's built-in ```pandas``` library to clean and analyze our data. The datasets will be joined using SQL.
  - Database Storage: Data will be stored using an Amazon RDS in the cloud and connected to Postgres. 
  - Machine Learning: The Machine Learning will be performed with Python using a Supervised Learning Model. 
  - Dashboard: The data will be visualized and presented using Tableau.

## Machine Learning Model
- Model Choice: For this project, we will use a Supervised Learning Model. This is because supervised learning models are excellent tools to perform linear/logistic regression. Our Stock Index Price data, Real GDP per Capita data, and Inflation data are all chronological, and would work well to be analyzed through regression.  
  - Benefits:  The benefits of using the supervised linear regression model is that we can include multiple features to determine their relationship and significance of such relationship to the closing index price.  
  - Limitations: Our data itself is a limitation where we have the potential to conclude falsely that a feature is predictive of the index clsoing price when it is indeed not. Another limitation is that we are assuming the dependent and indepent variables are linear and in reality it is hard to find a perfectly linear relationship.
- Preliminary Data Preprocessing: The data preprocessing organizes the data by eliminating unecessary columns from the dataset and renaming columns for greater clarity.  This stage also involves formatting the data in the Inflation and Real GDP columns so the data is in percentages and no longer in billions, respectively.  The Real GDP and Working Population columns are used to create the Real GDP per Capita column with data.  At this stage blank rows are also removed.

<img width="780" alt="Screen Shot 2021-11-06 at 2 31 48 PM" src="https://user-images.githubusercontent.com/85457256/140620172-046694df-e77c-4c8b-9cea-69af58b70fec.png">

<img width="697" alt="Screen Shot 2021-11-06 at 2 18 04 PM" src="https://user-images.githubusercontent.com/85457256/140619822-e159f38e-0437-4ca8-9b34-b3cc012982d2.png">

- Model Inputs and Outputs:  Model inputs will include the real GDP per capita and inflation for the given stock exchange's country from the 1960s through today.  The output will be the stock exchange closing price. 
- Preliminary feature engineering/selection:  The features were selected using the code, ```X = NYSE_df.drop('NYA_Close_Price', axis=1)```, and the target variable was selected with ```y = NYSE_df['NYA_Close_Price']```.  We have selected real GDP per capita and inflation as the features to help predict the closing price as these two macroeconomic measures are considered to lend insight into the health of an economy and investor outlooks. 
- How the Model Works:  This model will learn off of the training data and will take in the inputs to determine our output variable through regression analysis.  After the model is trained, we run a test dataset of the features and output through the model to determine the accuracy.  Once the training and testing is completed, we populate the coefficients and also conduct a hypothesis test on the coefficients to ensure they are significant.  We then compile the coefficients to create the multiple linear regression equation and run forecasted input data through that equation to determine out predicted index closing prices.  The model output equation is as follows:  **Pred Close Price =  - 13234.04 + (2653.9 x Pred Inflation) + (0.19632 x Pred Real GDP per Capita) + (0.000018474 x Pred Working Pop)**
- Model Training: After joining our datasets into one dataset, we will split into train and test datasets using the ```train_test_split``` from ```sklearn.model_selection```. We will then instantiate linear and logistic regression models from ```sklearn```, and train the data through them.  Data was split into training and testing sets with the following code - ```X_train, X_test, y_train, y_test = train_test_split(X,y,random_state=1,stratify=y)```.
- Model Accuracy: After constructing and training the model, we set a goal of 75% accuracy to measure the model against. This threshold was chosen because while we want a model that has a higher accuracy than 50%, we cannot fully encompass all variables that may affect stock index prices, GDP and inflation. Unanticipated scenarios may have an effect on any or all of these targets. Thus, the 75% threshold gives us enough room for those factors.  However, after training and running the model, we were able to achieve an accuracy score of approximately 95%.
- Statistical Analysis:  We used to coefficent of determination to determine the model's accuracy.  

<img width="538" alt="Screen Shot 2021-11-06 at 2 28 21 PM" src="https://user-images.githubusercontent.com/85457256/140620095-46ed4ec2-9ad6-4d81-9b6f-1dd7be4d9fa2.png">

- Further Tuning:  If we had more time in developing this project, we would like to include more features, such as the unemployment rate and political tension.  This would allow us to determine if there are better features that predict index closing prices or if in combination with our existing features enhance the model's predictive power.  In addition, we would like to form a hypothesis in order to perform a t-test and F-test to ensure that the features are significant and help us predict the index closing price.

## Database Outline
An AWS RDS will be used to store the data used throughout the duration of this project. To begin with, there are six datasets in total that we plan to work with:

    - indexInfo (Kaggle)
    - indexProcessed (Kaggle)
    - Inflation (FRED|St. Louis)
    - Real GDP (FRED|St. Louis)
    - Working Population (FRED|St. Louis)
    
GDP inflator, Nominal GPD, and Population are primarily going to be used for calculating real GDP for the stock indexes in the Kaggle data sets. The two Kaggle data sets will first be merged to get a full view of each of the 13 exchanges’ opening and closing prices from 1960 to 2020. Then the Kaggle data will be merged with the world bank datasets to a table that can provide information on the different factors that affect the stock prices. The merge between the Kaggle data and the World Bank data will be on the "Country Name" column in the World Bank datasets, and the "Region" column in the Kaggle data set. Below is an ERD diagram of how we plan to connect the different datasets together in the database:

<img width="612" alt="ERD" src="https://user-images.githubusercontent.com/85901073/138619466-21887232-da9c-4b3b-b43d-82da6733c033.png">



- We will combine the six datasets mentioned above in a final dataset using SQL, so we can apply the machine learning prediction to final dataset after.


 
 Final Dataset:
 
![](https://github.com/abrarhaque98/Team_5/blob/George/Images/Final%20Dataset.png)


- The initial datasets were uploaded to an AWS S3 bucket. Then using pyspark, the datasets were pulled from the S3 bucket and transferred into separate tables in the Postgres database with code similar to the following:
```
#write population_df to population table in RDS 
population_df.write.jdbc(url=jdbc_url, table='population', mode=mode, properties=config)
```
- The machine learning model required all the tables to be joined together, and the NYA dataset was the starting point of joining all the data. The population, inflation, and realgdp tables were left joined to the nya table to create the final input table named complete_join. The machine learning code is able to pull the fully joined table (complete_join) from the database to use for preprocessing before feeding it to the model.
 
## Dashboard
- Storyboard on a Google Slide(s)
- Description of the tool(s) that will be used to create the final dashboard
- Description of interactive element(s)
- generating at least three images to use in the presentation and with the dashboard. 
- it will also need to include interaction—something more sophisticated than a tooltip.
