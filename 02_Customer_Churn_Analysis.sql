/*
============================================================
PROJECT : NovaTel Customer Retention & Revenue Intelligence
FILE    : 02_Customer_Churn_Analysis.sql
PURPOSE : Identify key churn drivers, customer segments,
          and retention risk factors.

DATABASE: novatel_db
TABLE   : customer_churn

AUTHOR  : Shivam Mahawar
============================================================
*/

-- Customer Status Distribution

SELECT
    "Customer Status",
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customer_churn),
        2
    ) AS percentage
FROM customer_churn
GROUP BY "Customer Status"
ORDER BY customer_count DESC;

-- Churn Category Analysis

SELECT
    "Churn Category",
    COUNT(*) AS churned_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM customer_churn
            WHERE "Customer Status" = 'Churned'
        ),
        2
    ) AS percentage
FROM customer_churn
WHERE "Customer Status" = 'Churned'
GROUP BY "Churn Category"
ORDER BY churned_customers DESC;


-- Top Churn Reasons

SELECT
    "Churn Reason",
    COUNT(*) AS churned_customers
FROM customer_churn
WHERE "Customer Status" = 'Churned'
GROUP BY "Churn Reason"
ORDER BY churned_customers DESC
LIMIT 10;

-- Churn Rate by Contract

SELECT
    "Contract",

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN "Customer Status" = 'Churned'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN "Customer Status" = 'Churned'
                THEN 1
                ELSE 0
            END
        ) * 100.0
        /
        COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY "Contract"
ORDER BY churn_rate DESC;

/*
============================================================
KEY FINDINGS
============================================================

1. Customer Status Distribution

Stayed   : 67.02%
Churned  : 26.54%
Joined   : 6.45%

Insight:
More than one in four customers have churned,
indicating a significant retention challenge.

------------------------------------------------------------

2. Churn Category Analysis

Competitor       : 45.00%
Dissatisfaction  : 17.17%
Attitude         : 16.80%
Price            : 11.29%
Other            : 9.74%

Insight:
Competitor-related reasons account for nearly half
of all customer churn.

------------------------------------------------------------

3. Top Churn Reasons

1. Competitor had better devices
2. Competitor made better offer
3. Attitude of support person

Insight:
Competitive offerings and customer support
experience are major churn drivers.

------------------------------------------------------------

4. Contract Churn Analysis

Month-to-Month : 45.84%
One Year       : 10.71%
Two Year       : 2.55%

Insight:
Long-term contracts significantly improve retention.
Month-to-Month customers represent the highest-risk
customer segment.

============================================================
*/


-- Churn Rate by Internet Type

SELECT
    "Internet Type",

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

WHERE "Internet Type" IS NOT NULL

GROUP BY "Internet Type"

ORDER BY churn_rate DESC;

-- Churn Rate by Payment Method

SELECT
    "Payment Method",

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

GROUP BY "Payment Method"

ORDER BY churn_rate DESC;

-- Churn Rate by Age Group

SELECT
    CASE
        WHEN "Age" BETWEEN 19 AND 30 THEN '19-30'
        WHEN "Age" BETWEEN 31 AND 45 THEN '31-45'
        WHEN "Age" BETWEEN 46 AND 60 THEN '46-60'
        ELSE '61-80'
    END AS age_group,

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

GROUP BY age_group

ORDER BY churn_rate DESC;

/*
============================================================
KEY FINDINGS
============================================================

5. Internet Type Churn Analysis

Fiber Optic : 40.72%
Cable       : 25.66%
DSL         : 18.58%

Insight:
Fiber Optic customers exhibit the highest churn rate,
more than double the churn rate of DSL customers.

------------------------------------------------------------

6. Payment Method Churn Analysis

Mailed Check     : 36.88%
Bank Withdrawal  : 34.00%
Credit Card      : 14.48%

Insight:
Credit Card customers demonstrate significantly
higher retention than customers using other
payment methods.

------------------------------------------------------------

7. Age Group Churn Analysis

61-80 : 36.46%
46-60 : 24.31%
31-45 : 23.52%
19-30 : 22.37%

Insight:
Senior customers experience the highest churn
rate and represent an important retention segment.

============================================================
*/



-- Churn Rate by Offer

SELECT
    "Offer",

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

WHERE "Offer" <> 'None'

GROUP BY "Offer"

ORDER BY churn_rate DESC;


-- Referral Analysis by Customer Status

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

-- Tenure Analysis by Customer Status

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


/*
============================================================
KEY FINDINGS
============================================================

8. Offer Churn Analysis

Offer E : 52.92%
Offer D : 26.74%
Offer C : 22.89%
Offer B : 12.26%
Offer A : 6.73%

Insight:
Offer effectiveness has a major impact on customer
retention. Offer A performs exceptionally well,
while Offer E exhibits extremely high churn.

------------------------------------------------------------

9. Referral Analysis

Churned : 0.52 referrals
Joined  : 0.95 referrals
Stayed  : 2.61 referrals

Insight:
Customers with higher referral activity demonstrate
significantly stronger loyalty and retention.

------------------------------------------------------------

10. Tenure Analysis

Churned : 17.98 months
Stayed  : 41.04 months
Joined  : 1.72 months

Insight:
Customer tenure is strongly associated with retention.
Long-tenure customers are substantially less likely
to churn.

============================================================

FINAL CHURN ANALYSIS SUMMARY

Top Churn Driver:
- Competitor (45.00%)

Highest Risk Contract:
- Month-to-Month (45.84%)

Highest Risk Internet Type:
- Fiber Optic (40.72%)

Highest Risk Age Group:
- 61-80 (36.46%)

Highest Risk Payment Method:
- Mailed Check (36.88%)

Best Performing Offer:
- Offer A (6.73%)

Worst Performing Offer:
- Offer E (52.92%)

Strongest Loyalty Indicators:
- High Tenure
- High Referrals

============================================================
*/