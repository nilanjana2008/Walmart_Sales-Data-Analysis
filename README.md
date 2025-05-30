# Walmart_Sales-Data-Analysis

## **🎯 Objective**
This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We have utilized Python for data cleaning and pre-processing, SQL for advanced querying, and structured problem-solving techniques to get answers to key business questions.


## **🛠 Tools and Technologies Used**

1. **Dataset Used:** Kaggle’s Walmart Sales Dataset(https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)
2. **Data Handling:** Python (using Pandas) ,MYSQL for quering .


## **📋 Project Steps**
1. Explore the Data
Goal: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.

2. Data Cleaning 
Remove Duplicates: Identify and remove duplicate entries to avoid skewed results.
Handle Missing Values: Drop rows or columns with missing values if they are insignificant; fill values where essential.
Fix Data Types: Ensure all columns have consistent data types (e.g., dates as datetime, prices as float).

4. Load Data into MySQL 
Set Up Connections: Connect to MySQL using sqlalchemy and load the cleaned data into each database.
Table Creation: Set up tables in both MySQL  using Python SQLAlchemy to automate table creation and data insertion.
Verification: Run initial SQL queries to confirm that the data has been loaded accurately.

5. SQL Analysis: Complex Queries and Business Problem Solving
Business Problem-Solving: Write and execute  SQL queries to answer critical business questions, such as:
Revenue trends across branches and categories.
Identifying best-selling product categories.
Sales performance by time, city, and payment method.
Analyzing peak sales periods and customer buying patterns.
Profit margin analysis by branch and category.
