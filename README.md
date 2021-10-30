# Project Outline

## Purpose 
- This project forecasts stock exchange index prices based on real GDP per capita and inflation for a given index's country. The stock exchanges that we are looking at include: the New York Stock Exchange, NASDAQ, Hong Kong Stock Exchange, Shanghai Stock Exchange, Tokyo Stock Exchange, Euronext, Shenzhen Stock Exchange, Toronto Stock Exchange, National Stock Exchange of India, Frankfurt Stock Exchange, Korea Exchange, SIX Swiss Exchange, Taiwan Stock Exchange, and Johannesburg Stock Exchange.  
- We chose to analyze stock exchange index data because we are interested in understanding factors that influence fluctuations in the pricing.  This analysis will use historical data to predict an index's closing price based on macroeconimic factors.  It will be important to see how historical trends compare to actual current trends in a post-pandemic environment with rising inflation and economic stress globally.  
- Our data was sourced from Kaggle and World Bank: indexInfo - Kaggle, indexProcessed - Kaggle, Inflation - World Bank, GDP Inflator - World Bank, Nominal GDP - World Bank, Population - World Bank.
- From our analysis, we hope to gain a better understanding of how macroeconomic factors influence a stock exchange index's closing prices. 

## Method of Project Completion
- Communication protocols:
  - The group communicates primarily through Slack, Google Sheets, and Zoom meetings at least twice week. 
- Tools being used for each section of the project:  
  - Data Cleaning and Analysis: We will use Python's built-in ```pandas``` library to clean and analyze our data. The datasets will be joined using SQL.
  - Database Storage: Data will be stored using an Amazon RDS in the cloud and connected to Postgres. 
  - Machine Learning: The Machine Learning will be performed with Python using a Supervised Learning Model. 
  - Dashboard: The data will be visualized and presented using Tableau.

## Machine Learning Model Outline

- Which model did you choose and why? For this project, we will use a Supervised Learning Model. This is because supervised learning models are excellent tools to perform linear/logistic regression. Our Stock Index Price data, GDP data, and Inflation data are all chronological, and would work well to be analyzed through regression.
- How are you training your model? After joining our datasets into one dataset, we will split into train and test datasets using the ```train_test_split``` from ```sklearn.model_selection```. We will then instantiate linear and logistic regression models from ```sklearn```, and train the data through them.
- What is the model's accuracy? After constructing and training the model, we will set a goal of 75% accuracy to measure to model against. This threshold was chosen because while we want a model that has a higher accuracy than 50%, we cannot fully encompass all variables that may affect stock index prices, GDP and inflation. Unanticipated scenarios may have an effect on any or all of these targets. Thus, the 75% threshold gives us enough room for those factors.
- What are the model inputs and outputs?  Model inputs will include the real GDP per capita and inflation for the given stock exchange's country from the 1960s through today.  The output will be the stock exchange closing price.   
- How will the model work?  This model will learn off of the training data and will take in the inputs to determine our output variable through regression analysis.  In addition, in our analysis we can bucket the input variables based on periods of strong, medium, and weak GDP and periods of high, medium, and low inflation. The buckets for the respective categories will be used to help categorize economic conditions associated with given stock index prices.
- Description of preliminary data preprocessing:
- Description of preliminary feature engineering and preliminary feature selection, including the decision-making process:
- Description of how data was split into training and testing sets:
- Explanation of model choice, including limitations and benefits:
- There needs to be a description of the model as well as any preprocessing that was involved. 
- Additionally, capture an interpretation of how accurate, precise, or sensitive the model is.
- If you had more time, where would you like to investigate for finer tuning? Keep this in mind as the presentation is being put together since it could be a really strong talking point.
- How does it work? [Expand on this]
- Why this specific model? [already addressed]
- What is the model's accuracy? [already addressed]
- If there are statistics involved, what stats are being included in analysis and why?
- If no statistics are involved, what would you include if you had more time?


## Database Outline
An AWS RDS will be used to store the data used throughout the duration of this project. To begin with, there are six datasets in total that we plan to work with:

    - indexInfo (Kaggle)
    - indexProcessed (Kaggle)
    - Inflation (World Bank)
    - GDP inflator (World Bank)
    - Nominal GDP (World Bank)
    - Population (World Bank)
    
GDP inflator, Nominal GPD, and Population are primarily going to be used for calculating real GDP for the stock indexes in the Kaggle data sets. The two Kaggle data sets will first be merged to get a full view of each of the 13 exchanges’ opening and closing prices from 1960 to 2020. Then the Kaggle data will be merged with the world bank datasets to a table that can provide information on the different factors that affect the stock prices. The merge between the Kaggle data and the World Bank data will be on the "Country Name" column in the World Bank datasets, and the "Region" column in the Kaggle data set. Below is an ERD diagram of how we plan to connect the different datasets together in the database:

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

