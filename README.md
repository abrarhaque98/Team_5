# Project Outline

## Purpose 
- This project forecasts stock exchange index prices based on real GDP per capita and inflation for a given index's country. The stock exchange that we are looking at iis the New York Stock Exchange. We have selected real GDP per capita and inflation as the features to help predict the closing price as these two macroeconomic measures are considered to lend insight into the health of an economy and investor outlooks. 
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
  - Benefits:  
  - Limitations:
- Preliminary Data Preprocessing: The data preprocessing organizes the data by eliminating unecessary columns from the dataset and renaming columns for greater clarity.  This stage also involves formatting the data in the Inflation and Real GDP columns so the data is in percentages and no longer in billions, respectively.  The Real GDP and Working Population columns are used to create the Real GDP per Capita column with data.  At this stage blank rows are also removed.
- Model Inputs and Outputs:  Model inputs will include the real GDP per capita and inflation for the given stock exchange's country from the 1960s through today.  The output will be the stock exchange closing price. 
- Preliminary feature engineering/selection:  The features were selected using the code, ```X = NYSE_df.drop('NYA_Close_Price', axis=1)```, and the target variable was selected with ```y = NYSE_df['NYA_Close_Price']```.  **??including the decision-making process: why we chose or how done in the model??**
- How the Model Works:  This model will learn off of the training data and will take in the inputs to determine our output variable through regression analysis.  In addition, in our analysis we can bucket the input variables based on periods of strong, medium, and weak GDP and periods of high, medium, and low inflation. The buckets for the respective categories will be used to help categorize economic conditions associated with given stock index prices. **??Add info; Also add info about stats??**
- Model Training: After joining our datasets into one dataset, we will split into train and test datasets using the ```train_test_split``` from ```sklearn.model_selection```. We will then instantiate linear and logistic regression models from ```sklearn```, and train the data through them.  Data was split into training and testing sets with the following code - ```X_train, X_test, y_train, y_test = train_test_split(X,y,random_state=1,stratify=y)```.
- Model Accuracy: After constructing and training the model, we will set a goal of 75% accuracy to measure to model against. This threshold was chosen because while we want a model that has a higher accuracy than 50%, we cannot fully encompass all variables that may affect stock index prices, GDP and inflation. Unanticipated scenarios may have an effect on any or all of these targets. Thus, the 75% threshold gives us enough room for those factors.


- Description of how data was split into training and testing sets
- Explanation of model choice, including limitations and benefits
- There needs to be a description of the model as well as any preprocessing that was involved. 
- Additionally, capture an interpretation of how accurate, precise, or sensitive the model is.
- If you had more time, where would you like to investigate for finer tuning? Keep this in mind as the presentation is being put together since it could be a really strong talking point.
- How does it work? [Expand on this]
- Why this specific model? [already addressed]
- What is the model's accuracy? [already addressed]
- If there are statistics involved, what stats are being included in analysis and why?
- If no statistics are involved, what would you include if you had more time?


## Database Outline
An AWS RDS will be used to store the data used throughout the duration of this project. To begin with, there are 4 datasets in total that we plan to work with:

 - NYA (Kaggle)
  
We imported the dataset from Kaggel and filtered using Excel to show the data of NYA exchange from 1960 to 2020.

- Inflation (i)
 
The inflation data was imported from the Federal Reserve Bank of St. Louis website and it is showing the CPI(Consumer Price Index) since 1955.

- Real GDP (FRED|St. Louis)
 
We used the following three datasets to calculate the Real GDP since 1947, the datasets was imported from the Federal Reserve Bank of St. Louis

- Working Population (FRED|St. Louis)
 
We used the Federal Reserve Bank of St. Louis to get the working population since 1965


Below is an ERD diagram of how we plan to connect the different datasets together in the database:    


<img width="612" alt="ERD" src="https://user-images.githubusercontent.com/85901073/138619466-21887232-da9c-4b3b-b43d-82da6733c033.png">



- We will combine the six datasets mentioned above in a final dataset using SQL, so we can apply the machine learning prediction to final dataset after.


 
 Final Dataset:
 
![](https://github.com/abrarhaque98/Team_5/blob/George/Images/Final%20Dataset.png)


- We will upload the final dataset to the Cloud database(AWS), then we will upload it to a Jupyter notebook which has the machine learning model.

- Database stores static data for use during the project
- Database interfaces with the project in some format (e.g., scraping updates the database)
- Includes at least two tables (or collections, if using MongoDB)
- Includes at least one join using the database language (not including any joins in Pandas)
- **Includes at least one connection string (using SQLAlchemy or PyMongo)**
- If you use a SQL database, you must provide your ERD with relationships.
- make sure the database is integrated fully and that it interfaces with the project in some form. For example, does web scraping add or update data? The same thought can be applied to the application programming interface (API) calls as well.
- there should be at least two tables (or collections if Mongo is being used) in the database
- there should be at least one join completed within the database
- there will need to be at least one connection string included. For example, if you're using PyMongo, you'll need to include a connection string in Python that demonstrates the link between your code and the database.
- 
## Dashboard
- Storyboard on a Google Slide(s)
- Description of the tool(s) that will be used to create the final dashboard
- Description of interactive element(s)
- generating at least three images to use in the presentation and with the dashboard. 
- it will also need to include interaction—something more sophisticated than a tooltip.
