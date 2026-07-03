-- ChurnLens: Churn rate by contract type and payment method
-- Groups by both dimensions together to reveal combined risk patterns.

SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM customers
GROUP BY Contract, PaymentMethod
ORDER BY Contract, churn_rate_pct DESC;