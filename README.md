# Walmart_Sales-Data-Analysis

## **🎯 Objective**
This project is an end-to-end data analysis solution aimed at extracting critical business insights from Walmart sales data. Python was used for thorough data cleaning to ensure data quality and consistency. SQL was then leveraged for advanced querying and analysis to answer key business questions related to sales performance, product trends, and regional insights. 

## **🛠 Tools and Technologies Used**

1. **Dataset Used:** Kaggle’s Walmart Sales Dataset(https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)
2. **Data Handling:** Python (using Pandas,Numpy for data cleaning and sqlalchemy, mysql-connector-python to connect to database and load the cleaned data into each database) ,MYSQL for quering .


## **📋 Project Steps**
### 1. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
  
### 2. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 3. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL using `sqlalchemy` and load the cleaned data into  database.
   - **Table Creation**: Set up tables in both MySQL  using Python SQLAlchemy to automate table creation and data insertion.

### 4. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
