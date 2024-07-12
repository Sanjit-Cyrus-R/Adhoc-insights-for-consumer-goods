WITH cte1 AS(SELECT  
				p.division, p.product_code,
				p.product, p.variant,
				SUM(s.sold_quantity) as total_sold_quantity
			FROM fact_sales_monthly s
			JOIN dim_product p
			USING (product_code)
            WHERE fiscal_year = 2021
			GROUP BY p.division, p.product_code),
	cte2 AS (SELECT 
				*, 
				RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rnk
			FROM cte1)
SELECT * FROM cte2 
WHERE rnk<=3