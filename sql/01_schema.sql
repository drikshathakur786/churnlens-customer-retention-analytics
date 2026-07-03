-- ChurnLens: Customer table schema
-- This documents the structure of the 'customers' table in churnlens.db
-- Table is created via Python (pandas.to_sql) using data/processed/telco_churn_cleaned.csv

CREATE TABLE IF NOT EXISTS customers (
    customerID TEXT PRIMARY KEY,
    gender TEXT,
    SeniorCitizen INTEGER,
    Partner TEXT,
    Dependents TEXT,
    tenure INTEGER,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges REAL,
    TotalCharges REAL,
    Churn TEXT,
    TenureBucket TEXT
);