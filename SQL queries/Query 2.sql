WITH fy2020 as(	SELECT count(DISTINCT product_code) AS unique_products_2020
				FROM fact_sales_monthly
				WHERE fiscal_year = 2020),
	 fy2021 as(	SELECT count(DISTINCT product_code) AS unique_products_2021
				FROM fact_sales_monthly
				WHERE fiscal_year = 2021)
SELECT fy2020.unique_products_2020, fy2021.unique_products_2021,
	   ROUND((fy2021.unique_products_2021 - fy2020.unique_products_2020)/fy2020.unique_products_2020 *100,2) as percentage_chg 
       FROM fy2020,fy2021

		
