SELECT 
	MONTH(s.date) AS month, YEAR(s.date) AS year,
    ROUND(sum(sold_quantity * gross_price)/1000000,2) AS total_gross_price_mln
FROM fact_sales_monthly s
JOIN fact_gross_price gp
USING (product_code, fiscal_year)
JOIN dim_customer c
USING (customer_code)
WHERE customer = "Atliq Exclusive"
GROUP BY month
ORDER BY year 