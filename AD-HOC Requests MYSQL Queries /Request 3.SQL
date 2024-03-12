/*3. Generate a report that displays each campaign along with the total revenue generated before and after the campaign?
 The report includes three key fields: campaign _name, total revenue(before_promotion), total revenue(after_promotion). 
 This report should help in evaluating the financial impact of our promotional campaigns. (Display the values in millions)*/

   SELECT 
        campaign_name,
        ROUND(SUM(revenue_before_promo)/1000000,2) AS total_revenue_before_promo,
        ROUND(SUM(revenue_after_promo)/1000000,2) AS total_revenue_after_promo
    FROM 
        after_promo
    GROUP BY
        campaign_name;
