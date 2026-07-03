-- ChurnLens: Churn trend by tenure (months)
-- Note: dataset has no signup date/calendar month field, so tenure (months as customer)
-- is used as a lifecycle-stage proxy for a time-based churn trend.

SELECT
    tenure,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY tenure
ORDER BY tenure;