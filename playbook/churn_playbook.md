# ChurnLens — Churn Playbook

This playbook translates the findings from the ChurnLens analysis (SQL, EDA, correlation, and logistic regression) into a prioritized set of retention actions, ranked by revenue impact.

| # | Trigger | Segment | Action | Owner | Revenue at Risk (Annual) |
|---|---------|---------|--------|-------|---------------------------|
| 1 | Customer lacks both OnlineSecurity and TechSupport add-ons | 1,303 active customers with neither service | Targeted upsell campaign offering a free 3-month trial of OnlineSecurity + TechSupport bundle | Customer Success / Marketing | **$1,131,004** |
| 2 | Customer is on a Month-to-month contract paying via Electronic check | 856 active customers in this combination (53.7% historical churn rate) | Proactive outreach offering a discounted 1-year contract upgrade + incentive to switch to automatic payment | Retention Team | **$736,979** |
| 3 | Customer tenure ≤ 12 months | 1,149 active customers in their first year | Structured onboarding program: check-in calls at 30/60/90 days, early loyalty perk at 6-month mark | Customer Success | **$644,106** |
| 4 | Customer is on a Month-to-month contract (any payment method) | Broader month-to-month base (42.7% historical churn rate vs. 2.8% for two-year contracts) | Contract conversion incentive: 10% discount for switching to a 1- or 2-year plan | Retention Team / Sales | *(see note below)* |
| 5 | Customer has Fiber optic internet service | Customers with independently elevated churn risk even after controlling for other factors | Service quality review + targeted satisfaction survey to identify root cause (pricing vs. service issues) | Product / Network Operations | *(requires further investigation)* |

## Notes on prioritization

- **Rows are ranked by quantified annual revenue at risk**, where a specific dollar figure could be calculated from the dataset.
- Rows 4 and 5 are included because they reflect genuinely strong statistical signals (confirmed independently via SQL, correlation, and logistic regression), but their financial impact wasn't isolated to a single dollar figure in this analysis — they represent broader, longer-term structural risks rather than an immediately quantifiable segment.
- All revenue figures are annualized projections based on current `MonthlyCharges` for customers who have **not yet churned** but match each risk profile — they represent revenue that could be lost if current patterns continue, not revenue already lost.

## Methodology

Segments were identified using SQL queries (`sql/02` through `sql/05`), validated with Python EDA and correlation analysis, and ranked for statistical independence using a logistic regression model (`python/01_eda.ipynb`). Revenue-at-risk figures were calculated by filtering active (non-churned) customers matching each risk profile and summing their current `MonthlyCharges`, projected annually.