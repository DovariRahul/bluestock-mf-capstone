# Data Dictionary

## Project

Bluestock Fintech – Mutual Fund Analytics Platform

---

# 01_fund_master.csv

| Column             | Type | Description                                             |
| ------------------ | ---- | ------------------------------------------------------- |
| amfi_code          | TEXT | Unique AMFI mutual fund scheme code                     |
| fund_house         | TEXT | Asset Management Company (AMC) name                     |
| scheme_name        | TEXT | Official scheme name                                    |
| category           | TEXT | Fund category (Equity, Debt, Hybrid)                    |
| sub_category       | TEXT | Fund sub-category (Large Cap, Mid Cap, Small Cap, etc.) |
| plan               | TEXT | Direct or Regular plan                                  |
| launch_date        | DATE | Fund launch date                                        |
| benchmark          | TEXT | Benchmark index used for comparison                     |
| expense_ratio_pct  | REAL | Annual expense ratio percentage                         |
| exit_load_pct      | REAL | Exit load percentage                                    |
| fund_manager       | TEXT | Name of fund manager                                    |
| risk_category      | TEXT | Risk level (Low, Moderate, High, Very High)             |
| sebi_category_code | TEXT | SEBI classification code                                |

Source: AMFI India

---

# 02_nav_history.csv

| Column    | Type | Description             |
| --------- | ---- | ----------------------- |
| amfi_code | TEXT | AMFI scheme code        |
| date      | DATE | NAV date                |
| nav       | REAL | Net Asset Value of fund |

Source: mfapi.in

---

# 03_aum_by_fund_house.csv

| Column       | Type    | Description                       |
| ------------ | ------- | --------------------------------- |
| fund_house   | TEXT    | AMC name                          |
| quarter_date | DATE    | Quarter reporting date            |
| aum_crore    | REAL    | Assets Under Management (₹ Crore) |
| num_schemes  | INTEGER | Number of schemes managed         |

Source: AMFI Quarterly Reports

---

# 04_monthly_sip_inflows.csv

| Column                    | Type | Description                      |
| ------------------------- | ---- | -------------------------------- |
| month                     | TEXT | Reporting month (YYYY-MM)        |
| sip_inflow_crore          | REAL | Monthly SIP inflow amount        |
| active_sip_accounts_crore | REAL | Active SIP accounts              |
| new_sip_accounts_lakh     | REAL | New SIP registrations            |
| sip_aum_lakh_crore        | REAL | SIP AUM value                    |
| yoy_growth_pct            | REAL | Year-over-year growth percentage |

Source: AMFI Monthly Notes

---

# 05_category_inflows.csv

| Column           | Type | Description       |
| ---------------- | ---- | ----------------- |
| category         | TEXT | Fund category     |
| month            | TEXT | Reporting month   |
| net_inflow_crore | REAL | Net inflow amount |

Source: AMFI Category Reports

---

# 06_industry_folio_count.csv

| Column            | Type | Description            |
| ----------------- | ---- | ---------------------- |
| month             | TEXT | Reporting month        |
| folio_count_crore | REAL | Total investor folios  |
| category          | TEXT | Equity, Debt or Hybrid |

Source: AMFI Industry Reports

---

# 07_scheme_performance.csv

| Column             | Type    | Description                   |
| ------------------ | ------- | ----------------------------- |
| amfi_code          | TEXT    | Scheme identifier             |
| return_1yr_pct     | REAL    | One-year return percentage    |
| return_3yr_pct     | REAL    | Three-year CAGR               |
| return_5yr_pct     | REAL    | Five-year CAGR                |
| benchmark_3yr_pct  | REAL    | Benchmark return              |
| alpha              | REAL    | Excess return over benchmark  |
| beta               | REAL    | Market sensitivity            |
| sharpe_ratio       | REAL    | Risk-adjusted return metric   |
| sortino_ratio      | REAL    | Downside risk-adjusted return |
| std_dev_ann_pct    | REAL    | Annualized volatility         |
| max_drawdown_pct   | REAL    | Maximum historical decline    |
| morningstar_rating | INTEGER | Fund rating (1–5)             |

Source: Derived from NAV History

---

# 08_investor_transactions.csv

| Column             | Type    | Description                       |
| ------------------ | ------- | --------------------------------- |
| investor_id        | TEXT    | Unique investor identifier        |
| transaction_date   | DATE    | Transaction date                  |
| amfi_code          | TEXT    | Fund scheme code                  |
| transaction_type   | TEXT    | SIP, Lumpsum, Redemption          |
| amount_inr         | INTEGER | Transaction amount in INR         |
| state              | TEXT    | Investor state                    |
| city               | TEXT    | Investor city                     |
| city_tier          | TEXT    | T30 or B30 classification         |
| age_group          | TEXT    | Investor age group                |
| gender             | TEXT    | Male or Female                    |
| annual_income_lakh | REAL    | Annual income in lakh rupees      |
| payment_mode       | TEXT    | UPI, Net Banking, Mandate, Cheque |
| kyc_status         | TEXT    | Verified or Pending               |

Source: Simulated Investor Dataset

---

# 09_portfolio_holdings.csv

| Column       | Type | Description                     |
| ------------ | ---- | ------------------------------- |
| amfi_code    | TEXT | Scheme code                     |
| stock_symbol | TEXT | Stock ticker                    |
| stock_name   | TEXT | Company name                    |
| sector       | TEXT | Industry sector                 |
| weight_pct   | REAL | Portfolio allocation percentage |
| market_value | REAL | Market value of holding         |

Source: Fund Portfolio Disclosures

---

# 10_benchmark_indices.csv

| Column      | Type | Description          |
| ----------- | ---- | -------------------- |
| date        | DATE | Trading date         |
| index_name  | TEXT | Benchmark index name |
| close_value | REAL | Daily closing value  |

Source: NSE / BSE Public Data

---

# Database Tables

## dim_fund

Stores mutual fund master information.

Primary Key:

* amfi_code

---

## fact_nav

Stores daily NAV records.

Foreign Key:

* amfi_code → dim_fund.amfi_code

---

## fact_transactions

Stores investor transaction records.

Foreign Key:

* amfi_code → dim_fund.amfi_code

---

## fact_performance

Stores calculated performance metrics.

Foreign Key:

* amfi_code → dim_fund.amfi_code

---

## fact_aum

Stores quarterly AUM information for fund houses.

---

## Data Sources

* AMFI India
* mfapi.in
* NSE India
* BSE India
* Bluestock Capstone Dataset

