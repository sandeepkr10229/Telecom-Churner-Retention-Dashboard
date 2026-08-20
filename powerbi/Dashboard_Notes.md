# Dashboard Notes

## Project Overview

The NovaTel Customer Retention & Revenue Intelligence Dashboard is a four-page Power BI solution designed to analyze customer churn, revenue performance, customer loyalty, and product adoption behavior.

**Important Note:** NovaTel is a fictional telecommunications company created for portfolio and business analysis purposes. The dataset used in this project was sourced from Maven Analytics.

---

# Dashboard Objective

The primary objective of this dashboard is to:

* Identify major customer churn drivers
* Quantify revenue at risk
* Analyze customer retention patterns
* Evaluate customer loyalty indicators
* Measure product and service performance
* Support data-driven retention strategies

---

# Dashboard Architecture

The dashboard consists of four dedicated analytical pages:

## Page 1 — Executive Overview

Purpose:

Provide a high-level summary of customer retention and revenue performance.

### Key KPIs

* Total Customers
* Churned Customers
* Stayed Customers
* Churn Rate %
* Total Revenue
* Revenue At Risk

### Visuals

* Customer Status Distribution
* Revenue by Status
* Revenue by Contract
* Churn Rate by Contract Type
* Revenue Loss by Churn Category

---

## Page 2 — Retention Intelligence

Purpose:

Identify churn drivers and customer risk segments.

### Key KPIs

* Average Tenure
* Average Referrals
* Top Churn Driver
* Highest Risk Contract
* Highest Risk Internet Type
* Riskiest Age Group

### Visuals

* Churn Rate by Customer Age
* Referral Impact on Churn
* Churn Rate by Payment Method
* Churn Rate by Internet Type
* Top Churn Reasons

---

## Page 3 — Product Intelligence

Purpose:

Evaluate product performance and service adoption impact on retention.

### Key KPIs

* Best Offer
* Worst Offer
* Fiber Churn %
* Security Churn %
* Tech Support %
* Top Bundle Revenue

### Visuals

* Offer Performance
* Bundle Revenue Impact
* Support & Churn
* Security & Churn
* Service Protection Impact
* Product Adoption

---

## Page 4 — Customer Intelligence

Purpose:

Analyze customer value, loyalty, referrals, and geographic performance.

### Key KPIs

* Top Revenue City
* Average Revenue Per Customer
* Total Lifetime Revenue
* Highest Value Age Group
* Most Loyal Contract
* Top Referral Segment

### Visuals

* Revenue by City Map
* Customer Value by Tenure
* Average Customer Value by Age Group
* Revenue by Referral Group
* Customer Value by Contract

---

# Data Model

The dashboard uses a hybrid analytical model.

## Core Tables

### Customer Churn

Primary analytical table containing customer demographics, churn information, revenue metrics, service adoption, contract details, and customer behavior attributes.

### Zipcode Population

Lookup table used to enrich geographic analysis and map visualizations.

Relationship:

Customer Churn → Zipcode Population

Relationship Type:

Many-to-One

---

## Independent Analytical Tables

### Service Protection Impact

A manually created analytical table developed from SQL analysis outputs.

Purpose:

Support Product Intelligence visualizations focused on retention-driving services.

### Product Adoption

A manually created analytical table developed from SQL analysis outputs.

Purpose:

Support Product Intelligence visualizations related to service adoption trends.

These tables are intentionally independent and do not participate in the relational model.

---

# DAX Measures

The dashboard utilizes 23 custom DAX measures.

### Customer KPIs

* Churn Rate
* Churned Customers
* Stayed Customers
* Avg Revenue Per Customer
* Avg Customer Value

### Revenue KPIs

* Revenue At Risk
* Total Lifetime Revenue
* Top Revenue City
* Top Revenue Contract

### Retention KPIs

* Top Churn Driver
* Highest Churn Contract
* Highest Churn Internet Type
* Highest Risk Age Group
* Most Loyal Contract

### Loyalty KPIs

* Best Referral Segment
* Top Referral Segment
* Highest Value Age Group

### Product KPIs

* Best Offer
* Worst Offer
* Fiber Churn %
* Security Churn %
* Tech Support %
* Top Bundle Revenue

---

# Filters and Interactivity

The dashboard includes shared filters available across all pages.

### Slicers

* Contract Type
* Internet Type
* Payment Method
* Customer Status
* Offer

### Navigation

Users can navigate between pages through the left-side navigation panel.

* Executive Overview
* Retention Intelligence
* Product Intelligence
* Customer Intelligence

### Reset Functionality

A dedicated Clear All Slicers button is provided for quick dashboard reset.

---

# Business Insights Supported

The dashboard enables analysis of:

* Customer churn behavior
* Revenue risk exposure
* Contract-based retention performance
* Product adoption impact
* Service protection effectiveness
* Customer loyalty patterns
* Referral program effectiveness
* Geographic revenue distribution
* High-value customer segments

---

# Key Findings Highlighted

* Churn Rate: 26.54%
* Revenue At Risk: $3.68M
* Competitor-related churn is the largest churn category
* Month-to-Month customers represent the highest-risk contract segment
* Fiber Optic customers exhibit the highest churn rate
* Long-term contracts generate the highest revenue contribution
* Referral activity strongly correlates with customer retention
* Service adoption increases customer value and revenue generation

---

# Tools Used

* Python
* Pandas
* SQL
* Power BI
* DAX
* Jupyter Notebook

---

# Dataset Source

Source: Maven Analytics

Company Context: Fictional telecom company (NovaTel) created solely for portfolio and business intelligence analysis purposes.
