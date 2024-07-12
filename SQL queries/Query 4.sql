WITH seg_prod_count_2020 AS (
			SELECT 
				p.segment, COUNT(DISTINCT(s.product_code)) AS product_count_2020
				FROM fact_sales_monthly s 
			JOIN dim_product p
			USING (product_code)
            WHERE fiscal_year = 2020
			GROUP BY segment),
    seg_prod_count_2021 AS (
			SELECT 
				p.segment, COUNT(DISTINCT(s.product_code)) AS product_count_2021
				FROM fact_sales_monthly s 
			JOIN dim_product p
			USING (product_code)
            WHERE fiscal_year = 2021
			GROUP BY segment)
SELECT 
	seg_prod_count_2020.segment, 
	seg_prod_count_2020.product_count_2020, 
    seg_prod_count_2021.product_count_2021,
	(product_count_2021 - product_count_2020) AS difference
FROM seg_prod_count_2020
JOIN seg_prod_count_2021 USING(segment)
ORDER BY difference DESC;