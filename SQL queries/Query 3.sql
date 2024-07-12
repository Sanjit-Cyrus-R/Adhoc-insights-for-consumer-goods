SELECT 
	p.segment, COUNT(DISTINCT(s.product_code)) AS product_count
    FROM fact_sales_monthly s 
JOIN dim_product p
USING (product_code)
GROUP BY segment
ORDER BY product_count DESC;