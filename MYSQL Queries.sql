select * from walmart;
-- Count total records
SELECT COUNT(*) FROM walmart;
-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM walmart;

-- Find the minimum quantity sold
SELECT MIN(quantity),max(quantity) FROM walmart;

-- Top performing categories
SELECT category, SUM(Amount) AS category_sales
FROM walmart
GROUP BY category
ORDER BY category_sales DESC;

--  Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
with cte as (
select 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rnk
    FROM walmart
    GROUP BY branch, category)
    SELECT branch, category, avg_rating
FROM cte
WHERE rnk = 1;

--  Identify the busiest day for each branch based on the number of transactions
WITH CTE AS(
SELECT 
branch,
DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
COUNT(*) AS no_transactions,
RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
FROM walmart
GROUP BY branch, day_name)
SELECT branch, day_name, no_transactions
FROM CTE
WHERE rnk = 1;

-- Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

--  Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;

-- 	 Rank Categories by Profit per Branch
SELECT 
  Branch,
  category,
  SUM(unit_price * quantity * profit_margin) AS total_profit,
  RANK() OVER (PARTITION BY Branch ORDER BY SUM(unit_price * quantity * profit_margin) DESC) AS profit_rank
FROM walmart
GROUP BY Branch, category;

--  Determine the most common payment method for each branch
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
    FROM walmart
    GROUP BY branch, payment_method
)

-- Dense Rank of Cities by Average Rating
SELECT branch, payment_method AS preferred_payment_method
FROM cte
WHERE rnk = 1;

-- % Contribution of Each Invoice to Daily Sales
SELECT 
  invoice_id,
  date,
  Amount,
  ROUND(Amount * 100.0 / SUM(Amount) OVER (PARTITION BY date), 2) AS pct_of_daily_sales
FROM walmart;

--  Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
    CASE 
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(AMOUNT) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(AMOUNT) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;

