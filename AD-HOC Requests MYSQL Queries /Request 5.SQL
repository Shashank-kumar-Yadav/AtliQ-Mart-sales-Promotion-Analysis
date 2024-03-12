/*5. Create a report featu ring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns. 
     The report will provide essential information including product name, category, and ir%.
     This analysis helps identify the most successful products in terms of incremental revenue across our campaigns, assisting in product optimization.*/

 SELECT 
        product_name,category,
        ROUND(SUM(IR_revenue) / NULLIF(SUM(revenue_before_promo), 0) * 100, 2) AS IR_Pct
    FROM after_promo
    GROUP BY product_name,category
    order by ir_pct desc
    limit 5  
