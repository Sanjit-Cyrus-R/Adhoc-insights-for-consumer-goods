SELECT 
	c.customer_code, c.customer,
    ROUND(AVG(pid.pre_invoice_discount_pct)*100,2) AS avg_preinvoice_dis_pct 
FROM fact_pre_invoice_deductions pid
JOIN dim_customer c using (customer_code)
WHERE pid.fiscal_year = 2021 AND c.market = 'India'
GROUP BY c.customer_code
ORDER BY avg_preinvoice_dis_pct DESC LIMIT 5;