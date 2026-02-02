-- Key Metrics Analysis

-- 1. Total Revenue and Transaction Volume by Card Category
SELECT 
    Card_Category,
    COUNT(Client_Num) as Total_Customers,
    SUM(Total_Trans_Amt) as Total_Revenue,
    SUM(Total_Trans_Vol) as Total_Volume,
    ROUND(AVG(Avg_Utilization_Ratio), 3) as Avg_Utilization
FROM credit_card
GROUP BY Card_Category
ORDER BY Total_Revenue DESC;

-- 2. Delinquency Rate by Education Level
-- Joins credit_card and customer tables
SELECT 
    c.Education_Level,
    COUNT(cc.Client_Num) as Total_Customers,
    SUM(cc.Delinquent_Acc) as Total_Delinquent,
    ROUND(CAST(SUM(cc.Delinquent_Acc) AS FLOAT) / COUNT(cc.Client_Num) * 100, 2) as Delinquency_Rate_Percent
FROM customer c
JOIN credit_card cc ON c.Client_Num = cc.Client_Num
GROUP BY c.Education_Level
ORDER BY Delinquency_Rate_Percent DESC;

-- 3. Customer Satisfaction vs Churn Risk (Using Inactivity as proxy)
SELECT 
    Cust_Satisfaction_Score,
    COUNT(Client_Num) as Customer_Count,
    ROUND(AVG(Income), 2) as Avg_Income,
    SUM(CASE WHEN Card_Category = 'Blue' THEN 1 ELSE 0 END) as Blue_Card_Holders
FROM customer
GROUP BY Cust_Satisfaction_Score
ORDER BY Cust_Satisfaction_Score;

-- 4. Revenue Contribution by State (Top 5)
SELECT 
    c.state_cd,
    SUM(cc.Total_Trans_Amt) as Total_Trans_Amount,
    COUNT(c.Client_Num) as Num_Customers
FROM customer c
JOIN credit_card cc ON c.Client_Num = cc.Client_Num
GROUP BY c.state_cd
ORDER BY Total_Trans_Amount DESC
LIMIT 5;

-- 5. Weekly Revenue Trends
SELECT 
    Week_Num,
    SUM(Total_Trans_Amt) as Weekly_Revenue
FROM credit_card
GROUP BY Week_Num
ORDER BY Week_Num;
