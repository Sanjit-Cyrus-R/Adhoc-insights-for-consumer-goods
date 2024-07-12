SELECT 
    (CASE
		WHEN month(date) IN (9,10,11) then "Q1"
		WHEN month(date) IN (12,1,2) THEN "Q2"
		WHEN month(date) IN (3,4,5) THEN "Q3"
		else "Q4" 
	END) AS fiscal_quarter,
    ROUND(SUM(sold_quantity)/1000000,2) as total_sold_quantity_mln
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY fiscal_quarter
ORDER BY total_sold_quantity_mln DESC;
