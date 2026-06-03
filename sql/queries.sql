-- 1. Top 5 Fund Houses by AUM

SELECT fund_house,
       SUM(aum_crore) AS total_aum
FROM fact_aum
GROUP BY fund_house
ORDER BY total_aum DESC
LIMIT 5;


-- 2. Average NAV Per Month

SELECT strftime('%Y-%m', date) AS month,
       AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY month
ORDER BY month;


-- 3. SIP Inflow Year-over-Year Growth

SELECT month,
       sip_inflow_crore,
       yoy_growth_pct
FROM fact_sip_industry;


-- 4. Transactions By State

SELECT state,
       COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;


-- 5. Funds With Expense Ratio Less Than 1%

SELECT scheme_name,
       expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct < 1;


-- 6. Top 10 Investors By Investment Amount

SELECT investor_id,
       SUM(amount_inr) AS total_investment
FROM fact_transactions
GROUP BY investor_id
ORDER BY total_investment DESC
LIMIT 10;


-- 7. Most Popular Transaction Type

SELECT transaction_type,
       COUNT(*) AS transaction_count
FROM fact_transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;


-- 8. Average Investment Amount By Age Group

SELECT age_group,
       AVG(amount_inr) AS avg_investment
FROM fact_transactions
GROUP BY age_group
ORDER BY avg_investment DESC;


-- 9. Top 5 Funds By Sharpe Ratio

SELECT scheme_name,
       sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 5;


-- 10. Number of Funds By Risk Category

SELECT risk_category,
       COUNT(*) AS total_funds
FROM dim_fund
GROUP BY risk_category
ORDER BY total_funds DESC;