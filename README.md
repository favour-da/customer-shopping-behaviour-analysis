# Customer-Shopping-Behaviour-Analysis
# Retail Customer Shopping Behavior Analysis

**Client Engagement:** TRYBEFUSE &nbsp;|&nbsp; **Analytics Partner:** Veritics

An end-to-end analytics project analyzing 3,900 retail customer transactions to uncover revenue drivers, margin opportunities, and retention gaps — built with Power Query, MySQL, Power BI, and a stakeholder-facing presentation deck.

---

## Project Overview

This project takes a raw retail transaction dataset through a full analytics pipeline: cleaning, database modeling, dashboarding, and business storytelling. The goal was to answer a set of concrete business questions about revenue, discounting behavior, customer segments, and subscription retention, then package the findings for a non-technical stakeholder audience.

**Dataset:** `customer_shopping_behavior.csv` — 3,900 rows × 18 columns, covering customer demographics, purchase details, review ratings, subscription status, and shopping preferences across 50 US states.

---

## Tools & Skills Demonstrated

| Tool | Purpose |
|---|---|
| **Power Query (Power BI)** | Data cleaning, column standardization, median imputation, feature engineering |
| **MySQL** | Relational schema design, data loading, business-question SQL queries |
| **Power BI** | Interactive one-page executive dashboard with slicers and DAX measures |
| **PowerPoint** | Stakeholder-facing presentation deck of findings and recommendations |

---

## Data Cleaning (Power Query)

- Standardized all 18 column headers to lowercase snake_case
- Imputed 37 missing `review_rating` values using the **median rating for that specific item** (not a global average), preserving item-level rating patterns
- Engineered `age_group` (Young Adult / Adult / Middle Aged / Senior, equal-width bands) and `customer_value_tier` (based on `previous_purchases`) for segmentation
- Identified and documented that `discount_applied` and `promo_code_used` are 100% correlated — used as a single representative field rather than duplicated

## Database (MySQL)

- Single flat table (`shopping_behavior_cleaned`), matching the dataset's natural customer-purchase grain — no normalization overhead needed
- Loaded via the Table Data Import Wizard (worked around a persistent `LOCAL INFILE` client restriction — Error 2068 — that blocked the standard `LOAD DATA LOCAL INFILE` path on this environment)
- Answered 10 core business questions directly in SQL — revenue by gender, discount behavior, top-rated products, shipping comparisons, subscription patterns, customer segmentation, category rankings, and age-group revenue contribution

## Dashboard (Power BI)

A single distilled executive summary page featuring:
- 5 KPI cards: Total Revenue, Total Orders, Avg Order Value, Avg Review Rating, Subscription Rate
- Revenue by age group and customer value tier
- Category performance split by discount usage
- Item-level retention and rating distribution
- Interactive slicers for category, age group, and gender

## Presentation Deck

An 11-slide stakeholder presentation translating the analysis into an executive narrative — opening with who Veritics is and the Trybefuse engagement brief, then walking from a broad, stable revenue base, through the Accessories margin opportunity, to the headline finding on subscription reach. Built to be walked through in under 5 minutes.

---

## Key Findings

1. **Revenue is broad-based, not concentrated** — no single age group or customer tier dominates; the customer base is evenly diversified.
2. **Clothing drives volume, Accessories drives margin** — Clothing leads on revenue ($104K), but Accessories has the better profit margin (0.50 vs. 0.45), despite $30K less revenue.
3. **Satisfaction is solid, not exceptional** — average rating of 3.75/5, with most reviews clustered at 3–4 stars and very few at the extremes.
4. **The subscription gender gap is the standout finding** — 0% of subscribed customers are female, despite female customers having a slightly higher average order value ($60.25 vs. $59.54 for male customers). 1,248 higher-value customers currently have zero subscription reach.
5. **Loyalty is age-neutral** — repeat purchase behavior is flat across all age groups (381–440 repeat customers per group), meaning retention programs don't need age-specific targeting to be effective.
6. **Retention does not predict subscription** — correlation between previous purchases and subscription status is negligible (0.03 overall). Subscription status is almost entirely explained by gender, not customer loyalty — confirming this is a reach problem, not a loyalty problem.

## Recommendations

1. **Close the subscription gender gap** — launch a targeted subscription campaign for female customers, an untapped, higher-spending segment representing 32% of the customer base.
2. **Shift promotional weight toward Accessories** — reallocate a portion of Clothing's marketing spend to capture Accessories' margin advantage.
3. **Convert 3-star reviewers into advocates** — the largest single rating band (1,585 customers) is a clear target for post-purchase follow-up.
4. **Build age-neutral loyalty programs** — since repeat-purchase rates don't vary meaningfully by age, retention efforts can be designed without age segmentation.

---

## Repository Structure

```
├── Customer_folder/
│   └── Power bi dashboard/
    └──Powerbi_screenshot
    └──customer_behaviour.pbix
    └──SQL_Analysis/
    └──Screenshot_sql
    └── CREATE_SCHEMA.sql
    └── CREATE_TABLE.sql
    └──BUSINESS_QUESTIONS.sql
    └── Customer_Shopping_Behaviour_Analysis.pptx
    └── Customer_Shopping_Behavior_Business_Analysis_Report.docx
    └──shopping_behaviour_cleaned.xlsx
    └── README.md
```

---

## Data Quality Notes

- 0 duplicate rows; `customer_id` is a clean unique key
- 37 nulls in `review_rating` (0.9%), resolved via item-level median imputation
- `discount_applied` and `promo_code_used` are perfectly correlated — documented rather than treated as independent signals
- Gender split is imbalanced (68% Male / 32% Female) — factored into interpretation of gender-based comparisons, especially the subscription finding

---

**Analysis by Veritics for TRYBEFUSE**
