CREATE TABLE dim_fund (
    amfi_code TEXT PRIMARY KEY,
    fund_house TEXT,
    scheme_name TEXT,
    category TEXT
);

CREATE TABLE fact_nav (
    amfi_code TEXT,
    date DATE,
    nav REAL
);