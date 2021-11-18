# Project Outline

## Purpose 
- This project forecasts stock exchange index prices based on real GDP per capita and inflation for a given index's country. The stock exchange that we are looking at is the New York Stock Exchange. 
- We chose to analyze stock exchange index data because we are interested in understanding factors that influence fluctuations in the pricing.  This analysis will use historical data to predict an index's closing price based on macroeconimic factors.  It will be important to see how historical trends compare to actual current trends in a post-pandemic environment with rising inflation and economic stress globally.  
- Our historical and predicted data was sourced from Kaggle, OECD|Data, and FRED|St. Louis: indexInfo - Kaggle, indexProcessed - Kaggle, Inflation - OECD|Data, Real GDP - FRED|St. Louis, Working Population - FRED|St. Louis.
- From our analysis, we hope to gain a better understanding of how macroeconomic factors influence a stock exchange index's closing prices. 


## Method of Project Completion 
- Tools being used for each section of the project:  
  - Data Cleaning and Analysis: Python's built-in ```pandas``` library to clean and analyze our data. The datasets will be joined using SQL.
  - Database Storage: Data will be stored using an Amazon RDS in the cloud and connected to Postgres. 
  - Machine Learning: The Machine Learning will be performed with Python using a Supervised Learning Model. 
  - Dashboard: The data will be visualized and presented using Tableau.

## Data Exploration Process

We imported the various data files into a Jupyter Notebook as DataFrames, and performed exploration using ```.describe()```, ```.dtypes```, and ```.isna().sum()```. These were some of our findings.

### indexInfo File

<img src= "https://user-images.githubusercontent.com/84286467/141596793-314ec0f5-0a8d-45e2-997a-2e9e73e52491.png" alt="indexFile" width="400"/>

Since we want to analyze New York Stock Exchange data, we will filter the indexProcessed file by NYA.

### indexProcessed File

After importing the indexProcessed file as a DataFrame, the NYA DataFrame was created by filtering NYA.

```NYA = indexProcessed[indexProcessed.Index == "NYA"]```

```NYA.describe()```

<img src= "https://user-images.githubusercontent.com/84286467/141597295-de229534-454c-465a-9803-1b7242479180.png" alt= "NYA" height="200"/>

### Inflation File (CPI)

<img src= "https://user-images.githubusercontent.com/84286467/141597607-6bacf2e7-5bbd-43a0-812d-76a5e0911122.png" alt="CPI"/> <img src= "https://user-images.githubusercontent.com/84286467/141597697-dfe63297-f16e-4bbe-ba82-034c730276cd.png"/> <img src= "https://user-images.githubusercontent.com/84286467/141597742-ca19c7b0-abd9-4bf3-aeec-64aac89c0883.png"/>

### GDP File

<img src= "https://user-images.githubusercontent.com/84286467/141598758-ba76b04b-fef5-40cb-aa44-d3d4c265fb8f.png" alt="GDP" height="250"/> <img src= "https://user-images.githubusercontent.com/84286467/141598831-59282c7f-03c9-45ae-aabb-fbed8678d59e.png" height="250"/>

### Working Population File
<img src= "https://user-images.githubusercontent.com/84286467/141599030-f10e6dc0-85ac-45a2-a154-7c847ebe5d71.png" alt="Pop" height="250"/> <img src= "https://user-images.githubusercontent.com/84286467/141599102-e46b8105-91ad-4d34-8c9d-7e234aa1136c.png" height="250"/>

This file has data back to 1977. To maintain consistency with the indexProcessed data, we were able to find working population data back to 1965.

### Main Takeaways for Data Exploration
- We must filter the indexProcessed file by NYA for New York Stock Exchange Data.
- The indexProcessed file has daily data. The Inflation file has Monthly Data. The GDP file has quarterly data. The Working Population file has monthly data.
- Using the indexProcessed file's daily data as the foundation, the data from the other files must be joined according to the month or quarter to maintain consistency. This will be accomplished by the Database group.
- Only the Inflation file has null values in the Flag Codes column. This column will be dropped during preprocessing by the Machine Learning group.
- Units of the CPI, GDP, and Working population data must be taken into account and corrected. This will be accomplished during preprocessing by the Machine Learning group.

## Machine Learning Model
- Model Choice: For this project, we will use a Supervised Learning Model. This is because supervised learning models are excellent tools to perform linear/logistic regression. Our Stock Index Price data, Real GDP per Capita data, and Inflation data are all chronological, and would work well to be analyzed through regression.  
  - Benefits:  The benefits of using the supervised linear regression model is that we can include multiple features to determine their relationship and significance of such relationship to the closing index price.  
  - Limitations: Our data itself is a limitation where we have the potential to conclude falsely that a feature is predictive of the index clsoing price when it is indeed not. Another limitation is that we are assuming the dependent and indepent variables are linear and in reality it is hard to find a perfectly linear relationship.
- Technology Used: We ran our machine learning model notebook through Google Colab utilizing PySpark. This allowed us to have the database interact directly with the model.
- Preliminary Data Preprocessing: The data preprocessing organizes the data by eliminating unecessary columns from the dataset and renaming columns for greater clarity.  This stage also involves formatting the data in the Inflation and Real GDP columns so the data is in percentages and no longer in billions, respectively.  The Real GDP and Working Population columns are used to create the Real GDP per Capita column with data.  At this stage blank rows are also removed.

<img width="780" alt="Screen Shot 2021-11-06 at 2 31 48 PM" src="https://user-images.githubusercontent.com/85457256/140620172-046694df-e77c-4c8b-9cea-69af58b70fec.png">

<img width="697" alt="Screen Shot 2021-11-06 at 2 18 04 PM" src="https://user-images.githubusercontent.com/85457256/140619822-e159f38e-0437-4ca8-9b34-b3cc012982d2.png">

- Model Inputs and Outputs:  Model inputs will include the real GDP per capita and inflation for the given stock exchange's country from the 1960s through today.  The output will be the stock exchange closing price. 
- Preliminary feature engineering/selection:  The features were selected using the code, ```X = NYSE_df.drop('NYA_Close_Price', axis=1)```, and the target variable was selected with ```y = NYSE_df['NYA_Close_Price']```.  We have selected real GDP per capita, inflation, and working population as the features to help predict the closing price as these macroeconomic measures are considered to lend insight into the health of an economy and investor outlooks. 
- How the Model Works:  This model will learn off of the training data and will take in the inputs to determine our output variable through regression analysis.  After the model is trained, we run a test dataset of the features and output through the model to determine the accuracy.  Once the training and testing is completed, we populate the coefficients to create the multiple linear regression equation and run forecasted input data through that equation to determine out predicted index closing prices.  The model output equation is as follows:  

**Pred Close Price =  - 13234.04 + (2653.9 x Pred Inflation) + (0.19632 x Pred Real GDP per Capita) + (0.000018474 x Pred Working Pop)**.

- Model Training: After joining our datasets into one dataset, we will split into train and test datasets using the ```train_test_split``` from ```sklearn.model_selection```. We will then instantiate a linear regression model from ```sklearn```, and train the data through them.  Data was split into training and testing sets with the following code - ```X_train, X_test, y_train, y_test = train_test_split(X,y,random_state=1,stratify=y)```.
- Model Accuracy: After constructing and training the model, we set a goal of 75% accuracy to measure the model against. This threshold was chosen because while we want a model that has a higher accuracy than 50%, we cannot fully encompass all variables that may affect stock index prices, GDP and inflation. Unanticipated scenarios may have an effect on any or all of these targets. Thus, the 75% threshold gives us enough room for those factors.  However, after training and running the model, we were able to achieve an accuracy score of approximately 95%.  Given our model's success, no further training was required. 

- Statistical Analysis:  We looked at the R-Squared score or the coefficient of determination to assess the effectiveness of the model. The R-Squared score is a statistical measure that represents the proportion of the variance for a dependent variable that's explained by an independent variable or variables in a regression model. In other words, it shows how close the actual values are to the values predicted by our model. In this case, we have an R-Squared score of 94.57%, implying the model closely predicts the actual results. This exceeds our previously set goal of 75%. 


<img width="538" alt="Screen Shot 2021-11-06 at 2 28 21 PM" src="https://user-images.githubusercontent.com/85457256/140620095-46ed4ec2-9ad6-4d81-9b6f-1dd7be4d9fa2.png">

We also used the root mean square error measure to analyze our regression model. Root Mean Square Error is the standard deviation of the residuals (prediction errors), and is a measure of spread from the regression equation. Our model has a RMSE of 929.

![image](https://user-images.githubusercontent.com/84286467/140665090-0654f857-3e39-476c-82b9-933f31942d45.png)

- Further Tuning:  If we had more time in developing this project, we would like to include more features, such as the unemployment rate, interest rates, corporate tax rates, spending legislation, foreign trade deficits, and political tension.  This would allow us to determine if there are better features that predict index closing prices or if in combination with our existing features enhance the model's predictive power.  In addition, we would like to form a hypothesis in order to perform a t-test and F-test to ensure that the features are significant and help us predict the index closing price.

### Predicted Closing Prices

To determine the predicted closing prices for the future, we had to determine predicted values for Real GDP, Inflation, and Working Population.

For Real GDP, OECD|Data has longterm predictions for GDP. [Real GDP long-term forecast](https://data.oecd.org/gdp/real-gdp-long-term-forecast.htm)

For Inflation and Working Population, FRED|St. Louis provides percent changes by month that can be downloaded to csv and averaged.

[Inflation (CPI)](https://fred.stlouisfed.org/series/USACPIALLMINMEI)   [Working Population](https://fred.stlouisfed.org/series/LFWA64TTUSM647S)

![image](https://user-images.githubusercontent.com/84286467/141659662-74f99833-92fa-486e-a277-ec97f2d1e36b.png)

## Database Outline
An AWS RDS will be used to store the data used throughout the duration of this project. To begin with, there are Four datasets in total that we plan to work with:

-> NYA (Kaggle)

We imported the dataset from Kaggel and filtered using Excel to show the data of NYA exchange from 1960 to 2020.

-> Inflation (FRED|St. Louis)

The inflation data was imported from the Federal Reserve Bank of St. Louis website and it is showing the CPI(Consumer Price Index) since 1955.

-> Real GDP (FRED|St. Louis)

We used the following three datasets to calculate the Real GDP since 1947, the datasets was imported from the Federal Reserve Bank of St. Louis

-> Working Population (FRED|St. Louis)

We used the Federal Reserve Bank of St. Louis to get the working population since 1965

- Below is an ERD diagram of how we plan to connect the different datasets together in the database:

    
<img width="612" alt="ERD" src="https://github.com/abrarhaque98/Team_5/blob/George/Images/ERD.png">


We have created the ERD above using the RealGDP, Inflation, NYA, and Population. And the four mentioned datasets are linked and designed as follows:

o	RealGDP

We used the field quarter as a primary key, and it is linked with the field quarter as a foreign key in NYA table.

o	Inflation

We used the field time as a primary key, and it is  linked with the field month as a foreign key in NYA table.

o	Population

We used the field month as a primary key, and it is linked with the field month as a foreign key in NYA table.

o	NYA

We used the field date as a primary key, and the table is linked to all the other tables using the field month and quarter as foreign keys.

- The machine learning model required all the tables to be joined together, and the NYA dataset was the starting point of joining all the data. The population, inflation, and realgdp tables were left joined to the nya table to create the final input table named complete_join. The machine learning code is able to pull the fully joined table (complete_join) from the database to use for preprocessing before feeding it to the model.

- A sample of the final Dataset in the image below:
 
 
 
![](https://github.com/abrarhaque98/Team_5/blob/George/Images/Final%20Dataset.png)


- The initial datasets were uploaded to an AWS S3 bucket. Then using pyspark, the datasets were pulled from the S3 bucket and transferred into separate tables in the Postgres database with code similar to the following:
```
#write population_df to population table in RDS 
population_df.write.jdbc(url=jdbc_url, table='population', mode=mode, properties=config)
```

 
## Dashboard
- To create our final Visualization we will be using Tableau. Within Tableau we will be visualizing it with a story containing several dashboards and individual images.
- Initial graphs presented will be NYSE index price, GDP, inflation, and working population.
- Interactive Elements relative to the intial graphs will contain a drop down filter to filter the graphs presented on the story pages for the historical and machine learning output graphs. The filter will allow the user to filter by specific years and will apply across to all the graphs on that page. This will allow the graphs to be dynamic and allow the user to easily identify changes in selected years.
- Additional visualization relative to the initial graphs will contain, color and size arrangements displaying change in inflation or gdp for the year will also be displayed, graph presenting accuracy between model y outputs and actual outputs, etc

## Presentation Link
[NYSE Predicted Closing Price Presentation](https://docs.google.com/presentation/d/1Lbrf3DhYxbQHC7fQ_tmBFH4RTjc5ArEOt2baLXxXLsE/edit#slide=id.gfd5f077b96_0_12)

## Dashboard
[NYSE Predicted Closing Price Dashboard](https://public.tableau.com/app/profile/abrar.haque/viz/FinalDash_16371099520500/HIstProjUSD)



