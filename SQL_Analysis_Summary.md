# SQL Analysis Summary

## Overview

This document summarizes the SQL analysis performed on the NovaTel Customer Retention & Revenue Intelligence dataset.

The objective of the SQL analysis was to identify customer churn drivers, revenue risks, customer loyalty patterns, product performance, and actionable business opportunities.

---

# SQL Files Included

## 01_Data_Validation.sql

Purpose:

* Validate successful database import
* Verify record counts
* Check data integrity
* Validate customer and revenue metrics

Key Results:

* Total Records: 7,043
* Unique Customers: 7,043
* Duplicate Records: 0
* Database successfully validated

---

## 02_Customer_Churn_Analysis.sql

Purpose:

* Identify major churn drivers
* Analyze customer retention behavior
* Evaluate customer risk segments

Key Findings:

### Customer Status Distribution

| Status  | Customers | Percentage |
| ------- | --------: | ---------: |
| Stayed  |     4,720 |     67.02% |
| Churned |     1,869 |     26.54% |
| Joined  |       454 |      6.45% |

### Top Churn Categories

| Category        | Percentage |
| --------------- | ---------: |
| Competitor      |     45.00% |
| Dissatisfaction |     17.17% |
| Attitude        |     16.80% |
| Price           |     11.29% |
| Other           |      9.74% |

### Highest Risk Contract

| Contract       | Churn Rate |
| -------------- | ---------: |
| Month-to-Month |     45.84% |
| One Year       |     10.71% |
| Two Year       |      2.55% |

### Highest Risk Internet Type

| Internet Type | Churn Rate |
| ------------- | ---------: |
| Fiber Optic   |     40.72% |
| Cable         |     25.66% |
| DSL           |     18.58% |

---

## 03_Revenue_Analysis.sql

Purpose:

* Measure revenue contribution
* Quantify revenue risk
* Evaluate customer value

Key Findings:

### Revenue Contribution

| Status  | Revenue | Contribution |
| ------- | ------: | -----------: |
| Stayed  |  17.63M |       82.51% |
| Churned |   3.68M |       17.24% |
| Joined  |   0.05M |        0.25% |

### Revenue At Risk

3.68 Million

### Highest Revenue Contract

| Contract       | Revenue |
| -------------- | ------: |
| Two Year       |   9.04M |
| One Year       |   6.17M |
| Month-to-Month |   6.16M |

### Largest Revenue Loss Driver

Competitor Churn

Lost Revenue: 1.69 Million

---

## 04_Loyalty_Analysis.sql

Purpose:

* Understand customer loyalty
* Evaluate retention indicators
* Identify high-value customer segments

Key Findings:

### Average Tenure

| Status  | Months |
| ------- | -----: |
| Stayed  |  41.04 |
| Churned |  17.98 |
| Joined  |   1.72 |

### Average Referrals

| Status  | Referrals |
| ------- | --------: |
| Stayed  |      2.61 |
| Churned |      0.52 |
| Joined  |      0.95 |

### Referral Impact on Churn

| Referral Group | Churn Rate |
| -------------- | ---------: |
| 7+ Referrals   |      1.30% |
| 4–6 Referrals  |      6.52% |
| No Referrals   |     32.58% |
| 1–3 Referrals  |     35.83% |

### Most Valuable Segment

49–72 Month Customers

Average Revenue: 6,170.51

---

## 05_Product_Analysis.sql

Purpose:

* Analyze service adoption
* Measure product performance
* Identify retention-driving services

Key Findings:

### Strongest Retention Services

| Service                | Churn Rate |
| ---------------------- | ---------: |
| Online Security        |     14.61% |
| Premium Tech Support   |     15.17% |
| Online Backup          |     21.53% |
| Device Protection Plan |     22.50% |

### Highest Risk Product Segment

Fiber Optic Customers

Churn Rate: 40.72%

### Product Bundle Analysis

| Bundle Score | Average Revenue |
| ------------ | --------------: |
| 4 Services   |        7,115.99 |
| 3 Services   |        5,360.98 |
| 2 Services   |        4,056.17 |
| 1 Service    |        2,498.78 |
| 0 Services   |        1,343.06 |

---

# Executive Insights

## Major Churn Drivers

1. Competitor Pressure (45%)
2. Month-to-Month Contracts
3. Fiber Optic Customers
4. Senior Customers (61–80 Age Group)
5. Poor Customer Support Experience

---

## Highest Value Customers

Customers with:

* Long Tenure
* Multiple Service Adoption
* High Referral Activity
* Long-Term Contracts

---

## Highest Risk Customers

Customers with:

* Month-to-Month Contracts
* Fiber Optic Internet
* No Security Services
* Low Referral Activity
* Short Tenure

---

# Strategic Recommendations

## Recommendation 1

Reduce competitor-driven churn through stronger retention offers and improved product competitiveness.

## Recommendation 2

Encourage migration from Month-to-Month contracts to long-term contracts.

## Recommendation 3

Increase adoption of:

* Online Security
* Premium Tech Support
* Device Protection Plan
* Online Backup

## Recommendation 4

Develop referral-based loyalty programs to improve retention and customer acquisition.

## Recommendation 5

Prioritize retention efforts for Fiber Optic customers and senior customer segments.

---

# Conclusion

The SQL analysis identified competitor-related churn, contract type, service adoption, customer tenure, and referral activity as the most significant factors influencing customer retention and revenue performance. The findings provide a strong foundation for KPI development, Power BI dashboard creation, and strategic business recommendations.
