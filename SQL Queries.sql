-- 1. WHICH SALES TEAM IS THE BEST PERFORMING TEAM?
SELECT t.regional_office,
	t.manager,
	COUNT(*) AS total_deals,
	SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
	(SUM(CASE WHEN p.deal_stage = 'Won' THEN 1 ELSE 0 END)*1.0 / COUNT(*)) * 100 as win_rate,
	ROUND(SUM(p.close_value),0) AS total_close_value
FROM sales_teams AS t
JOIN sales_pipeline AS p
ON t.sales_agent = p.sales_agent
GROUP BY t.regional_office, t.manager
ORDER BY total_close_value DESC;


-- 2. WHICH SALES AGENTS HAVE CLOSED THE MOST DEALS AND WHO ARE THOSE LAGGING BEHIND?
SELECT sales_agent,
	COUNT(*) AS total_deals,
	SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) as won_deals,
	AVG(close_value) AS avg_deal_value,
	(SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100 as win_rate
FROM sales_pipeline
GROUP BY sales_agent
ORDER BY win_rate DESC;


-- 3. HOW DOES THE NUMBER OF DEALS AND REVENUE TREND ACROSS MONTHS?
SELECT 	DATETRUNC(MONTH,close_date) AS month,
	CASE 
		WHEN DATETRUNC(QUARTER,close_date) >= '2017-10-01' THEN 4
		WHEN DATETRUNC(QUARTER,close_date) >= '2017-07-01' THEN 3
		WHEN DATETRUNC(QUARTER,close_date) >= '2017-04-01' THEN 2
		ELSE 1
	END AS quarter,
	COUNT(*) AS total_deals,
	SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) as won_deals,
	SUM(close_value) AS revenue,
	(SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100 as win_rate
FROM sales_pipeline
WHERE DATETRUNC(MONTH,close_date) IS NOT NULL
GROUP BY DATETRUNC(MONTH,close_date), DATETRUNC(QUARTER,close_date)
ORDER BY month;


-- 4. WHICH PRODUCTS HAVE THE HIGHEST WIN RATE AND HIGHEST REVENUE CONTRIBUTION?
SELECT p.product_name,
	COUNT(*) AS total_deals,
	SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) as won_deals,
	SUM(sp.close_value) AS close_value,
	(SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100 as win_rate
FROM products as p
JOIN sales_pipeline AS sp
ON p.product_name = sp.product_name
GROUP BY p.product_name
ORDER BY close_value DESC, win_rate DESC;


-- 5. IS THERE A CORRELATION BETWEEN COMPANY SIZE AND WIN RATE?
SELECT 
    CASE 
        WHEN a.employees < 50 THEN 'Small'
        WHEN a.employees BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'Large'
    END AS company_size,
	COUNT(*) AS total_deals,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
	ROUND((SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END)*1.0 / COUNT(*)) * 100, 1) as win_rate
FROM sales_pipeline AS sp
JOIN accounts AS a ON sp.account = a.account
GROUP BY
	CASE 
        WHEN a.employees < 50 THEN 'Small'
        WHEN a.employees BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'Large'
	END
ORDER BY win_rate DESC;


-- 6. HOW LONG DOES IT TYPICALLY TAKE FOR A DEAL TO MOVE FROM "ENGAGING" TO "WON" OR "LOST"?
SELECT sales_agent,
    ROUND(AVG(DATEDIFF(DAY, engage_date, close_date)), 1) AS avg_days_to_close
FROM 
    sales_pipeline
WHERE 
    deal_stage IN ('Won', 'Lost')
    AND engage_date IS NOT NULL
    AND close_date IS NOT NULL
GROUP BY sales_agent
ORDER BY avg_days_to_close;


-- 7. ARE NEWER ACCOUNTS MORE LIKELY OR LESS LIKELY TO CLOSE DEALS?
SELECT 
    CASE 
        WHEN a.year_established >= 2015 THEN 'New'
        WHEN a.year_established BETWEEN 2000 AND 2014 THEN 'Mid-age'
        ELSE 'Old'
    END AS account_age_group,
	COUNT(*) AS total_deals,
    SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
    ROUND(SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 100, 1) AS win_rate
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
GROUP BY CASE 
        WHEN a.year_established >= 2015 THEN 'New'
        WHEN a.year_established BETWEEN 2000 AND 2014 THEN 'Mid-age'
        ELSE 'Old'
    END
ORDER BY win_rate DESC;
