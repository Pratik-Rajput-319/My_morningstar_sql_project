-- =====================================================
--  DATA VALIDATION
-- =====================================================

-- Q1: Check for missing return values
-- Explanation: Identify incomplete performance data

SELECT fund_id
FROM `Morningstar.Returns`
WHERE return_1yr IS NULL
   OR return_3yr IS NULL
   OR return_5yr IS NULL;

-- Q2: Check for duplicate NAV records
-- Explanation: Ensure no duplicate entries per fund per date

SELECT fund_id, date, COUNT(*) AS duplicate_count
FROM `my-project-to-learn-sql.Morningstar.nav_data`
GROUP BY fund_id, date
HAVING COUNT(*) > 1;

/* Check for invalid Expense Ratio */
-- This checks whether the expense ratio is within the range or not

SELECT *
FROM `my-project-to-learn-sql.Morningstar.Expense_ratio`
WHERE expense_ratio < 0 or expense_ratio > 5;

/* Check for Portfolio Weight Validation */
-- This checks whether the weightage is accurate (i.e below 100)

SELECT fund_id, sum(weight_percentage) AS total_percent
FROM `my-project-to-learn-sql.Morningstar.Portfolio_holdings`
GROUP BY fund_id
HAVING total_percent > 100;

-- =====================================================
--  PERFORMANCE ANALYSIS
-- =====================================================

-- Q3: Top 10 performing funds (3-year return)

SELECT fund_name, return_3yr
FROM `Morningstar.funds_dataset`f 
JOIN `Morningstar.Returns`r ON f.fund_id = r.fund_id
ORDER BY return_3yr DESC
LIMIT 10;

/* Check for the Worst 10 Performing Funds */

SELECT fund_name, return_1yr
FROM `Morningstar.funds_dataset`f 
JOIN `Morningstar.Returns`r ON f.fund_id = r.fund_id
ORDER BY return_1yr 
LIMIT 10;

-- =====================================================
--   CATEGORY ANALYSIS
-- =====================================================

-- Q4: Average return and expense ratio by category

SELECT c.category_name, ROUND(AVG(return_3yr),2) AS avg_return, ROUND(AVG(expense_ratio),2) AS avg_expense
FROM `Morningstar.categories`c
JOIN `my-project-to-learn-sql.Morningstar.funds_dataset` f on f.category_id = c.category_id
JOIN `my-project-to-learn-sql.Morningstar.Returns` r on r.fund_id = f.fund_id
JOIN `my-project-to-learn-sql.Morningstar.Expense_ratio`e on f.fund_id = e.fund_id
GROUP BY category_name;

-- =====================================================
--   ESG ANALYSIS
-- =====================================================

-- Explanation:
-- This query categorizes funds into ESG buckets (High, Medium, Low)
-- and calculates the average 3-year return for each category.

SELECT
    CASE
        WHEN esg_score > 70 THEN 'HIGH ESG'
        WHEN esg_score BETWEEN 40 AND 70 THEN 'MEDIUM ESG'
        ELSE 'LOW ESG'
    END AS esg_category,
    ROUND(AVG(r.return_3yr),2) AS avg_return,
FROM `Morningstar.Esg_scores` e
JOIN `Morningstar.Returns` r ON r.fund_id = e.fund_id
GROUP BY esg_category;
