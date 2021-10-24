# Project Outline

## Purpose 
- This project forecasts stock exchange index prices based on real GDP per capita and inflation for a given index's country. The stock exchanges that we are looking at include: the New York Stock Exchange, NASDAQ, Hong Kong Stock Exchange, Shanghai Stock Exchange, Tokyo Stock Exchange, Euronext, Shenzhen Stock Exchange, Toronto Stock Exchange, National Stock Exchange of India, Frankfut Stock Exchange, Korea Exchange, SIX Swiss Exchange, Taiwan Stock Exchange, and Johannesburg Stock Exchange.  
- Reason why they selected their topic
- Description of their source of data
- Questions they hope to answer with the data

## Method of Project Completion
- Description of the communication protocol
  - The group communicates primarily through slack, google sheets, and zoom meetings at least twice week. 
- Tools being used for each section of the project  
  - Data Cleaning and Analysis: We will use pythons built in pandas library to clean and analyze our data.
  - Database Storage: Data will be stored using an Amazon RDS 
  - Machine Learning
  - Dashboard: The data will be visualized and presented using Tableau.
- How will the dashboard be built? 

## Machine Learning Model Outline
- Which model did you choose and why?
- How are you training your model?
- What is the model's accuracy? After constructing and training the model, we will set a goal of 75% accuracy to measure to model against. This threshold was chosen because while we want a model that has a higher accuracy than 50%, we cannot fully encompass all variables that may affect stock index prices, GDP and inflation. Unanticipated scenarios may have an effect on any or all of these targets. Thus, the 75% threshold gives us enough room for those factors.
- This model will bucket periods of strong, medium, and weak GDP and it will also bucket periods of high, medium, and low inflation. The buckets for the respective categories will be used to help categorize economic conditions associated with given stock index prices.
- Model inputs will include the real GDP per capita and inflation for the given stock exchange's country from the 1960s through today.  The output will be the stock exchange closing price.   

## Database Outline
- Database structure outline/ schema
- Sample data that mimics the expected final database structure or schema
- How will the machine learning module be connected to the provisional database?
