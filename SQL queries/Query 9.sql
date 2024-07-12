WITH gp_channel as (SELECT 
				c.channel,
				ROUND(SUM(s.sold_quantity * gp.gross_price)/1000000,2) AS gross_sales_mln
			FROM fact_sales_monthly s
			JOIN dim_customer c
			USING (customer_code)
			JOIN fact_gross_price gp
			USING (product_code, fiscal_year)
			GROUP BY c.channel),
pct AS (select 
*,
gross_sales_mln * 100/SUM(gross_sales_mln) OVER() AS pct
FROM gp_channel)
SELECT 
	gp_channel.channel, gp_channel.gross_sales_mln, 
	ROUND(pct,2) as percentage
FROM gp_channel JOIN pct USING(channel)
ORDER BY percentage DESC

