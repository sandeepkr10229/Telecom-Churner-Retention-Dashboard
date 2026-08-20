/*
============================================================
PROJECT : NovaTel Customer Retention & Revenue Intelligence
FILE    : 04_Loyalty_Analysis.sql
PURPOSE : Analyze customer loyalty, retention behavior,
          tenure patterns, referral impact, and customer value.

DATABASE: novatel_db
TABLE   : customer_churn

AUTHOR  : Shivam Mahawar
============================================================
*/

-- Average Tenure by Customer Status

SELECT
    "Customer Status",

    COUNT(*) AS customers,

    ROUND(
        AVG("Tenure in Months"),
        2
    ) AS avg_tenure,

    PERCENTILE_CONT(0.5)
    WITHIN GROUP (
        ORDER BY "Tenure in Months"
    ) AS median_tenure,

    MIN("Tenure in Months") AS min_tenure,

    MAX("Tenure in Months") AS max_tenure

FROM customer_churn

GROUP BY "Customer Status";

-- Referral Analysis

SELECT
    "Customer Status",

    COUNT(*) AS customers,

    ROUND(
        AVG("Number of Referrals"),
        2
    ) AS avg_referrals,

    MAX("Number of Referrals") AS max_referrals

FROM customer_churn

GROUP BY "Customer Status";

-- Customer Value Analysis

SELECT
    "Customer Status",

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_customer_value,

    ROUND(
        AVG("Tenure in Months"),
        2
    ) AS avg_tenure,

    ROUND(
        AVG("Number of Referrals"),
        2
    ) AS avg_referrals

FROM customer_churn

GROUP BY "Customer Status";

-- Revenue by Referral Activity

SELECT
    CASE
        WHEN "Number of Referrals" = 0 THEN 'No Referrals'
        WHEN "Number of Referrals" BETWEEN 1 AND 3 THEN '1-3 Referrals'
        WHEN "Number of Referrals" BETWEEN 4 AND 6 THEN '4-6 Referrals'
        ELSE '7+ Referrals'
    END AS referral_group,

    COUNT(*) AS customers,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

GROUP BY referral_group

ORDER BY avg_revenue DESC;

-- Tenure Segment Analysis

SELECT
    CASE
        WHEN "Tenure in Months" <= 12 THEN '0-12 Months'
        WHEN "Tenure in Months" <= 24 THEN '13-24 Months'
        WHEN "Tenure in Months" <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS tenure_group,

    COUNT(*) AS customers,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

GROUP BY tenure_group

ORDER BY avg_revenue DESC;


-- Churn Rate by Referral Group

SELECT
    CASE
        WHEN "Number of Referrals" = 0 THEN 'No Referrals'
        WHEN "Number of Referrals" BETWEEN 1 AND 3 THEN '1-3 Referrals'
        WHEN "Number of Referrals" BETWEEN 4 AND 6 THEN '4-6 Referrals'
        ELSE '7+ Referrals'
    END AS referral_group,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Customer Status"='Churned'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN "Customer Status"='Churned'
                THEN 1
                ELSE 0
            END
        ) * 100.0
        /
        COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn

GROUP BY referral_group

ORDER BY churn_rate DESC;


/*
============================================================
KEY FINDINGS
============================================================

1. Tenure Analysis

Average Tenure

Stayed  : 41.04 Months
Churned : 17.98 Months
Joined  : 1.72 Months

Insight:
Long-tenure customers are significantly more loyal.
Customer retention increases substantially as tenure grows.

------------------------------------------------------------

2. Referral Analysis

Average Referrals

Stayed  : 2.61
Joined  : 0.95
Churned : 0.52

Insight:
Referral activity is strongly associated with customer
loyalty and retention.

------------------------------------------------------------

3. Customer Value Analysis

Average Customer Value

Stayed  : 3,735.68
Churned : 1,971.35
Joined  :   119.56

Insight:
Retained customers generate nearly twice the revenue
of churned customers.

------------------------------------------------------------

4. Referral Impact on Revenue

4-6 Referrals : 4,278.76
7+ Referrals  : 4,266.11
1-3 Referrals : 3,750.29
No Referrals  : 2,206.24

Insight:
Customers who actively refer others generate
substantially higher revenue.

------------------------------------------------------------

5. Tenure Segment Analysis

49-72 Months : 6,170.51
25-48 Months : 3,205.66
13-24 Months : 1,560.12
0-12 Months  :   387.91

Insight:
Customer value increases dramatically with tenure.
Long-term customers represent NovaTel's most valuable
customer segment.

------------------------------------------------------------

6. Referral Impact on Churn

1-3 Referrals : 35.83%
No Referrals  : 32.58%
4-6 Referrals : 6.52%
7+ Referrals  : 1.30%

Insight:
High-referral customers exhibit extremely low churn.
Customers with 7+ referrals have a churn rate of only 1.30%.

============================================================

FINAL LOYALTY ANALYSIS SUMMARY

Strongest Loyalty Indicators

✓ High Tenure
✓ High Referral Activity

Most Valuable Segment

✓ Customers with 49-72 Months Tenure

Lowest Risk Segment

✓ Customers with 7+ Referrals

Highest Value Customers

✓ Long-Tenure Referral Customers

Strategic Recommendation

Focus retention programs on:
- Increasing customer referrals
- Improving early-stage customer retention
- Migrating customers into long-term relationships

============================================================
*/