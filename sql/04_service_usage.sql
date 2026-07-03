-- ChurnLens: Churn rate by service/feature usage
-- Compares churn for customers WITH vs WITHOUT key add-on services.
-- Uses UNION ALL to stack separate per-service comparisons into one table.

SELECT
    'OnlineSecurity' AS service,
    OnlineSecurity AS has_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
WHERE OnlineSecurity IN ('Yes', 'No')
GROUP BY OnlineSecurity

UNION ALL

SELECT
    'TechSupport' AS service,
    TechSupport AS has_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
WHERE TechSupport IN ('Yes', 'No')
GROUP BY TechSupport

UNION ALL

SELECT
    'OnlineBackup' AS service,
    OnlineBackup AS has_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
WHERE OnlineBackup IN ('Yes', 'No')
GROUP BY OnlineBackup

UNION ALL

SELECT
    'DeviceProtection' AS service,
    DeviceProtection AS has_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
WHERE DeviceProtection IN ('Yes', 'No')
GROUP BY DeviceProtection

ORDER BY service, has_service;