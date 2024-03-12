/*4. Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign.
     Additionally, provide rankings for the categories based on their ISU%.
     The report will include three key fields: category, isu%, and rank order. 
     This information will assist in assessing the category-wise success and impact of the Diwali campaign on incremental sales.*/

    WITH RankedISU AS (
    SELECT 
        category,
        ROUND(SUM(isu) / NULLIF(SUM(`quantity_sold(before_promo)`), 0) * 100, 2) AS ISU_Pct
    FROM after_promo
    WHERE campaign_name = 'diwali'
    GROUP BY category
)

SELECT 
    category,
    ISU_Pct,
    RANK() OVER (ORDER BY ISU_Pct DESC) AS rank_
FROM RankedISU;
