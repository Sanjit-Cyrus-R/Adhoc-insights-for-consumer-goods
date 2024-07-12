(SELECT p.product_code, p.product,
	   m.manufacturing_cost
FROM fact_manufacturing_cost m 
JOIN dim_product p USING (product_code)
ORDER BY manufacturing_cost LIMIT 1)
UNION
(SELECT p.product_code, p.product,
	   m.manufacturing_cost
FROM fact_manufacturing_cost m 
JOIN dim_product p USING (product_code)
ORDER BY manufacturing_cost DESC LIMIT 1);