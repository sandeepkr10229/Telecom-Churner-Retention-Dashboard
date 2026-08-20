/*
============================================================
PROJECT : NovaTel Customer Retention & Revenue Intelligence
FILE    : 03_Revenue_Analysis.sql
PURPOSE : Analyze revenue performance, revenue risk,
          customer value, and revenue contribution.

DATABASE: novatel_db
TABLE   : customer_churn

AUTHOR  : Shivam Mahawar
============================================================
*/

-- Revenue Contribution by Customer Status

SELECT
    "Customer Status",

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue,

    ROUND(
        SUM("Total Revenue") * 100.0
        /
        (
            SELECT SUM("Total Revenue")
            FROM customer_churn
        ),
        2
    ) AS revenue_percentage

FROM customer_churn

GROUP BY "Customer Status"

ORDER BY total_revenue DESC;

-- Revenue At Risk

SELECT
    ROUND(
        SUM("Total Revenue"),
        2
    ) AS revenue_at_risk

FROM customer_churn

WHERE "Customer Status" = 'Churned';

-- Average Revenue Per Customer

SELECT
    "Customer Status",

    COUNT(*) AS customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue_per_customer

FROM customer_churn

GROUP BY "Customer Status"

ORDER BY avg_revenue_per_customer DESC;

-- Revenue by Contract Type

SELECT
    "Contract",

    COUNT(*) AS customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

GROUP BY "Contract"

ORDER BY total_revenue DESC;


/*
============================================================
KEY FINDINGS
============================================================

1. Revenue Contribution by Customer Status

Stayed  : 17,632,392.12 (82.51%)
Churned :  3,684,459.82 (17.24%)
Joined  :     54,279.75 (0.25%)

Insight:
Retained customers generate the vast majority
of company revenue. Revenue preservation depends
heavily on customer retention.

------------------------------------------------------------

2. Revenue At Risk

Revenue At Risk : 3,684,459.82

Insight:
Customer churn has placed approximately
3.68 million in revenue at risk.

------------------------------------------------------------

3. Average Revenue Per Customer

Stayed  : 3,735.68
Churned : 1,971.35
Joined  :   119.56

Insight:
Retained customers generate nearly twice the
revenue of churned customers, highlighting the
importance of long-term customer relationships.

------------------------------------------------------------

4. Revenue by Contract Type

Two Year         : 9,036,849.16
One Year         : 6,171,794.31
Month-to-Month   : 6,162,488.22

Average Revenue Per Customer

Two Year         : 4,799.18
One Year         : 3,981.80
Month-to-Month   : 1,707.06

Insight:
Long-term contracts generate substantially higher
customer value and revenue than Month-to-Month plans.

============================================================
*/



-- Revenue by Internet Type

SELECT
    "Internet Type",

    COUNT(*) AS customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

WHERE "Internet Type" IS NOT NULL

GROUP BY "Internet Type"

ORDER BY total_revenue DESC;


-- Revenue by Offer

SELECT
    "Offer",

    COUNT(*) AS customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue,

    ROUND(
        AVG("Total Revenue"),
        2
    ) AS avg_revenue

FROM customer_churn

WHERE "Offer" <> 'None'

GROUP BY "Offer"

ORDER BY total_revenue DESC;

-- Top Revenue Generating Cities

SELECT
    "City",

    COUNT(*) AS customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS total_revenue

FROM customer_churn

GROUP BY "City"

ORDER BY total_revenue DESC

LIMIT 10;

-- Revenue Lost by Churn Category

SELECT
    "Churn Category",

    COUNT(*) AS churned_customers,

    ROUND(
        SUM("Total Revenue"),
        2
    ) AS lost_revenue

FROM customer_churn

WHERE "Customer Status"='Churned'

GROUP BY "Churn Category"

ORDER BY lost_revenue DESC;

/*
============================================================
KEY FINDINGS
============================================================

5. Revenue by Internet Type

Fiber Optic : 12,408,074.43
DSL         :  4,549,289.55
Cable       :  2,228,474.23

Average Revenue Per Customer

Fiber Optic : 4,088.33
DSL         : 2,753.81
Cable       : 2,684.91

Insight:
Fiber Optic customers generate the highest revenue
but also experience the highest churn rate, making
this segment strategically important.

------------------------------------------------------------

6. Revenue by Offer

Offer B : 4,187,916.77
Offer A : 3,655,220.17
Offer C : 1,145,086.87
Offer D :   792,067.24
Offer E :   243,452.10

Average Revenue Per Customer

Offer A : 7,029.27
Offer B : 5,082.42
Offer C : 2,759.25
Offer D : 1,315.73
Offer E :   302.42

Insight:
Offer A and Offer B attract significantly higher-value
customers. Offer E generates minimal revenue and exhibits
the highest churn rate.

------------------------------------------------------------

7. Top Revenue Generating Cities

Los Angeles   : 852,725.23
San Diego     : 738,416.01
Sacramento    : 353,371.84
San Jose      : 326,478.36
San Francisco : 306,995.99

Insight:
Major metropolitan areas contribute the largest share
of company revenue and should be prioritized for
retention efforts.

------------------------------------------------------------

8. Revenue Lost by Churn Category

Competitor       : 1,694,413.15
Dissatisfaction  :   617,979.26
Attitude         :   579,554.13
Price            :   438,124.14
Other            :   354,389.14

Insight:
Competitor-related churn is responsible for nearly
1.7 million in lost revenue, making it the most
financially damaging churn category.

============================================================

FINAL REVENUE ANALYSIS SUMMARY

Total Revenue            : 21,371,131.69
Revenue At Risk          : 3,684,459.82

Highest Revenue Segment:
- Fiber Optic Customers

Highest Revenue Contract:
- Two Year Contract

Highest Value Offer:
- Offer A

Highest Revenue City:
- Los Angeles

Largest Revenue Loss Driver:
- Competitor Churn

============================================================
*/