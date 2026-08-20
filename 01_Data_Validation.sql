

SELECT
    COUNT(*) AS total_records
FROM customer_churn;


-- Unique Customer Verification

SELECT
    COUNT(DISTINCT "Customer ID") AS unique_customers
FROM customer_churn;

-- Duplicate Customer Check

SELECT
    "Customer ID",
    COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY "Customer ID"
HAVING COUNT(*) > 1;


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

-- Contract Distribution

SELECT
    "Contract",
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY "Contract"
ORDER BY customer_count DESC;

-- Internet Service Distribution

SELECT
    "Internet Service",
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY "Internet Service";

-- Offer Distribution

SELECT
    "Offer",
    COUNT(*) AS customer_count
FROM customer_churn
GROUP BY "Offer"
ORDER BY customer_count DESC;

-- Revenue Summary

SELECT
    ROUND(MIN("Total Revenue"),2) AS min_revenue,
    ROUND(MAX("Total Revenue"),2) AS max_revenue,
    ROUND(AVG("Total Revenue"),2) AS avg_revenue,
    ROUND(SUM("Total Revenue"),2) AS total_revenue
FROM customer_churn;


-- Negative Monthly Charge Validation

SELECT
    COUNT(*) AS negative_charge_records
FROM customer_churn
WHERE "Monthly Charge" < 0;

-- Missing Churn Category Validation

SELECT
    COUNT(*) AS missing_churn_category
FROM customer_churn
WHERE "Churn Category" IS NULL;


/*
============================================================
DATA VALIDATION SUMMARY
============================================================

Total Records                : 7,043
Unique Customers             : 7,043
Duplicate Records            : 0

Customer Status Distribution
--------------------------------
Stayed                       : 4,720 (67.02%)
Churned                      : 1,869 (26.54%)
Joined                       :   454 (6.45%)

Contract Distribution
--------------------------------
Month-to-Month               : 3,610
Two Year                     : 1,883
One Year                     : 1,550

Internet Service Distribution
--------------------------------
Yes                          : 5,517
No                           : 1,526

Offer Distribution
--------------------------------
None                         : 3,877
Offer B                      :   824
Offer E                      :   805
Offer D                      :   602
Offer A                      :   520
Offer C                      :   415

Revenue Validation
--------------------------------
Minimum Revenue              : 21.36
Maximum Revenue              : 11,979.34
Average Revenue              : 3,034.38
Total Revenue                : 21,371,131.69

Data Quality Checks
--------------------------------
Negative Monthly Charges     : 120
Missing Churn Category       : 5,174

Validation Result
--------------------------------
✓ Import Successful
✓ Record Counts Verified
✓ Customer IDs Unique
✓ No Duplicate Records
✓ Revenue Metrics Validated
✓ Database Ready For Analysis

============================================================
*/
