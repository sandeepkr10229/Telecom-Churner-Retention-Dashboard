# NovaTel Customer Retention & Revenue Intelligence

## Final Project Report

---

# Executive Summary

This project analyzes customer churn, revenue performance, customer loyalty, and product adoption patterns for NovaTel, a fictional telecommunications company created for portfolio and business analysis purposes.

Using Python, SQL, and Power BI, the project transformed raw customer data into actionable business insights. The analysis identified key churn drivers, quantified revenue risk, evaluated customer behavior patterns, and delivered an interactive Power BI dashboard to support data-driven decision-making.

Key findings revealed a churn rate of 26.54%, revenue at risk of 3.68 Million, and competitor-related churn as the largest source of customer loss. The project also identified strong relationships between customer tenure, referral activity, service adoption, and customer retention.

Dataset Source: Maven Analytics.

---

# Business Understanding

Customer retention is a critical challenge in the telecommunications industry. Customer acquisition costs are significantly higher than retention costs, making churn reduction a key business objective.

The project aimed to answer the following questions:

* Why are customers leaving?
* Which customer segments are most likely to churn?
* How much revenue is currently at risk?
* Which products and services improve retention?
* What factors contribute to long-term customer loyalty?

The goal was to transform customer data into strategic insights that could support retention and revenue optimization initiatives.

---

# Data Preparation & Modeling

## Data Audit

The initial audit focused on evaluating dataset quality and completeness.

Key findings:

* Total Records: 7,043
* Duplicate Records: 0
* Missing values identified in selected service-related fields
* Data consistency validated across customer, revenue, and churn attributes

The dataset was determined to be suitable for further analysis after standard cleaning procedures.

## Data Cleaning

The following preparation steps were performed:

* Handled missing values
* Standardized categorical values
* Removed inconsistencies in service-related fields
* Validated customer status classifications
* Verified revenue-related fields
* Prepared data for analytical modeling

## Data Modeling

The final Power BI model consisted of:

### Core Tables

* Customer Churn
* Zipcode Population

### Analytical Tables

* Product Adoption
* Service Protection Impact

The Product Adoption and Service Protection Impact tables were manually created from SQL analysis outputs in Excel and imported into Power BI to support Product Intelligence visualizations.

The final model combined customer-level analysis, geographic analysis, and product adoption insights into a unified reporting solution.

---

# Exploratory Data Analysis & SQL Business Analysis

Exploratory Data Analysis and SQL analysis were performed to identify trends, customer behavior patterns, and revenue risks.

## Customer Retention Findings

* Overall Churn Rate: 26.54%
* Highest Risk Contract: Month-to-Month (45.84%)
* Highest Risk Internet Type: Fiber Optic (40.72%)
* Highest Risk Age Group: 61–80 Years (36.46%)

## Revenue Findings

* Total Revenue: 21.36 Million
* Revenue At Risk: 3.68 Million
* Highest Revenue Contract: Two-Year Contract (9.04 Million)
* Largest Revenue Loss Driver: Competitor Churn (1.69 Million)

## Loyalty Findings

* Average Tenure (Stayed Customers): 41 Months
* Average Tenure (Churned Customers): 18 Months
* Referral activity strongly correlated with retention
* Customers with 7+ referrals showed only 1.3% churn

## Product Findings

* Online Security and Premium Tech Support showed the strongest retention impact
* Offer A demonstrated the best retention performance
* Offer E demonstrated the highest churn risk
* Higher service adoption resulted in significantly greater customer value and revenue generation

---

# KPI Framework & Dashboard Development

A KPI framework was designed to monitor retention, revenue performance, customer loyalty, and product effectiveness.

## Dashboard Architecture

The Power BI dashboard consists of four analytical pages:

### Executive Overview

Focus Areas:

* Customer Status
* Revenue Performance
* Churn Overview

### Retention Intelligence

Focus Areas:

* Churn Drivers
* Customer Risk Segments
* Referral Analysis

### Product Intelligence

Focus Areas:

* Offer Performance
* Product Adoption
* Service Protection Impact

### Customer Intelligence

Focus Areas:

* Customer Value
* Revenue Distribution
* Geographic Analysis
* Loyalty Segmentation

## DAX Implementation

The dashboard utilizes 23 DAX measures covering:

* Churn Metrics
* Revenue Metrics
* Loyalty Metrics
* Customer Value Metrics
* Product Performance Metrics

The final solution enables dynamic filtering, KPI monitoring, and interactive business analysis.

---

# Key Insights & Recommendations

## Key Insights

* Competitor-related churn accounts for approximately 45% of customer losses.
* Month-to-Month customers represent the highest-risk retention segment.
* Long-term contracts generate stronger retention and higher revenue stability.
* Referral participation is one of the strongest indicators of customer loyalty.
* Customers adopting multiple services generate significantly greater revenue.
* Protection-focused services reduce churn considerably.

## Recommendations

1. Develop retention programs targeting competitor-driven churn.
2. Increase adoption of long-term contracts through incentives and loyalty rewards.
3. Promote Online Security and Premium Tech Support services.
4. Expand referral programs to strengthen customer loyalty.
5. Prioritize retention efforts for Fiber Optic and Month-to-Month customers.
6. Encourage multi-service adoption to increase customer lifetime value.

---

# Conclusion

This project successfully combined Python, SQL, and Power BI to build an end-to-end customer retention and revenue intelligence solution.

The analysis identified key churn drivers, quantified revenue exposure, and uncovered actionable opportunities to improve customer retention and long-term profitability. The resulting dashboard provides a centralized decision-support tool for monitoring retention performance, customer value, and business growth opportunities.

The project demonstrates a complete analytics workflow, from data auditing and preparation to business analysis, KPI design, and dashboard development.
