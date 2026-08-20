/*
============================================================
PROJECT : NovaTel Customer Retention & Revenue Intelligence
FILE    : 05_Product_Analysis.sql
PURPOSE : Analyze service adoption, product usage,
          and product-related churn drivers.

DATABASE: novatel_db
TABLE   : customer_churn

AUTHOR  : Shivam Mahawar
============================================================
*/


-- Internet Type Churn Analysis

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

-- Unlimited Data Churn Analysis

SELECT
    "Unlimited Data",

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

WHERE "Unlimited Data" IS NOT NULL

GROUP BY "Unlimited Data"

ORDER BY churn_rate DESC;

-- Online Security Impact

SELECT
    "Online Security",

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

WHERE "Online Security" IS NOT NULL

GROUP BY "Online Security"

ORDER BY churn_rate DESC;

-- Online Backup Impact

SELECT
    "Online Backup",

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

WHERE "Online Backup" IS NOT NULL

GROUP BY "Online Backup"

ORDER BY churn_rate DESC;

-- Device Protection Impact

SELECT
    "Device Protection Plan",

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

WHERE "Device Protection Plan" IS NOT NULL

GROUP BY "Device Protection Plan"

ORDER BY churn_rate DESC;

-- Premium Tech Support Impact

SELECT
    "Premium Tech Support",

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

WHERE "Premium Tech Support" IS NOT NULL

GROUP BY "Premium Tech Support"

ORDER BY churn_rate DESC;


/*
============================================================
KEY FINDINGS
============================================================

1. Internet Type Analysis

Fiber Optic : 40.72%
Cable       : 25.66%
DSL         : 18.58%

Insight:
Fiber Optic customers exhibit the highest churn rate
and represent the highest-risk product segment.

------------------------------------------------------------

2. Unlimited Data Analysis

No  : 32.90%
Yes : 31.65%

Insight:
Unlimited Data has minimal impact on churn and is
not a major retention driver.

------------------------------------------------------------

3. Online Security Analysis

No  : 41.77%
Yes : 14.61%

Insight:
Online Security is one of the strongest retention
drivers in the dataset.

------------------------------------------------------------

4. Online Backup Analysis

No  : 39.93%
Yes : 21.53%

Insight:
Customers using Online Backup are significantly
less likely to churn.

------------------------------------------------------------

5. Device Protection Analysis

No  : 39.13%
Yes : 22.50%

Insight:
Device Protection users demonstrate substantially
higher retention rates.

------------------------------------------------------------

6. Premium Tech Support Analysis

No  : 41.64%
Yes : 15.17%

Insight:
Premium Tech Support is one of the strongest
retention-associated services.

============================================================
*/

-- Streaming TV Impact

SELECT
    "Streaming TV",

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

WHERE "Streaming TV" IS NOT NULL

GROUP BY "Streaming TV"

ORDER BY churn_rate DESC;


-- Streaming Movies Impact

SELECT
    "Streaming Movies",

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

WHERE "Streaming Movies" IS NOT NULL

GROUP BY "Streaming Movies"

ORDER BY churn_rate DESC;

-- Streaming Music Impact

SELECT
    "Streaming Music",

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

WHERE "Streaming Music" IS NOT NULL

GROUP BY "Streaming Music"

ORDER BY churn_rate DESC;

-- Product Adoption Score

SELECT
    (
        CASE WHEN "Online Security"='Yes' THEN 1 ELSE 0 END +
        CASE WHEN "Online Backup"='Yes' THEN 1 ELSE 0 END +
        CASE WHEN "Device Protection Plan"='Yes' THEN 1 ELSE 0 END +
        CASE WHEN "Premium Tech Support"='Yes' THEN 1 ELSE 0 END
    ) AS product_bundle_score,

    COUNT(*) AS customers,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

GROUP BY product_bundle_score

ORDER BY product_bundle_score DESC;


/*
============================================================
KEY FINDINGS
============================================================

7. Streaming TV Analysis

No  : 33.52%
Yes : 30.07%

Insight:
Streaming TV subscribers demonstrate slightly
better retention than non-subscribers.

------------------------------------------------------------

8. Streaming Movies Analysis

No  : 33.68%
Yes : 29.94%

Insight:
Streaming Movies customers exhibit moderately
lower churn rates.

------------------------------------------------------------

9. Streaming Music Analysis

No  : 33.94%
Yes : 29.26%

Insight:
Streaming Music adoption is associated with
improved customer retention.

------------------------------------------------------------

10. Product Bundle Analysis

Product Bundle Score

4 Services : 7,115.99
3 Services : 5,360.98
2 Services : 4,056.17
1 Service  : 2,498.78
0 Services : 1,343.06

Insight:
Customer value increases dramatically as product
adoption increases.

Customers using all four services generate over
5 times more revenue than customers using none.

============================================================

FINAL PRODUCT ANALYSIS SUMMARY

Highest Risk Product Segment

✓ Fiber Optic Customers
✓ Customers Without Security Services

Strongest Retention Services

✓ Online Security
✓ Premium Tech Support
✓ Online Backup
✓ Device Protection Plan

Weak Retention Services

✓ Streaming TV
✓ Streaming Movies
✓ Streaming Music
✓ Unlimited Data

Most Valuable Customers

✓ Customers Using Multiple Services

Key Business Opportunity

Increase adoption of:

- Online Security
- Premium Tech Support
- Device Protection Plan
- Online Backup

These services show the strongest association
with customer retention and customer value.

============================================================
*/