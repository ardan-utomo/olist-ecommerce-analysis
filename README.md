# Olist E-commerce Analysis (SQL)

Exploring ~99,000 real e-commerce orders with SQL to understand data
quality, sales growth, and what drove a major sales spike.

## Summary

- The dataset covers Sep 2016 to Oct 2018, but only **Jan 2017 to Aug 2018**
  is complete enough to analyze.
- Monthly revenue grew about **8x** between Jan 2017 and Jan 2018. Growth came
  mostly from more orders, not bigger orders.
- **24 Nov 2017 (Black Friday)** alone had 1,176 orders, about 16% of that
  month's total.

## Business Questions

1. Is the data complete and reliable enough to analyze?
2. How do orders and revenue change month by month?
3. What explains the spike in November 2017?

## Dataset

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
(Kaggle), released by Olist under
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
9 related tables covering orders, items, customers, products, payments,
reviews, and sellers. The raw data is not included in this repo.

## Tools

- SQLite
- DB Browser for SQLite

## Findings

### 1. Data quality

- Total orders: 99,441 (4 Sep 2016 to 17 Oct 2018).
- About 97% of orders (96,478) are `delivered`. Around 1.2% are `canceled`
  or `unavailable`, so revenue is calculated from delivered orders only.
- Some months are incomplete: Sep to Dec 2016 (Nov 2016 is missing
  entirely) and Sep to Oct 2018 (16 and 4 orders). These months are excluded.
- **Analysis period: Jan 2017 to Aug 2018 (20 complete months).**

### 2. Monthly orders and revenue

| Metric | Value |
|---|---|
| Revenue, Jan 2017 | ~112K BRL |
| Revenue, Jan 2018 | ~925K BRL |
| Peak month | Nov 2017 (~988K BRL, 7,289 delivered orders) |
| Dec 2017 vs Nov 2017 | about -26% |
| May 2018 to Aug 2018 | about -14% |

Revenue per order stayed roughly between 124 and 149 BRL in every month,
so growth was driven mainly by the number of orders, not by customers
spending more per order.

### 3. Black Friday spike

24 Nov 2017 had **1,176 orders**, roughly 4 to 5 times a typical day and
about 16% of that month's orders. Order volume stayed elevated for several
days afterward. The spike coincides with Black Friday, but the dataset has
no promotion data, so the cause is an inference rather than something
the data proves.

## Limitations

- Revenue uses product price only. Freight is excluded.
- Only delivered orders are counted. The ~1,100 orders with status
  `shipped` are not analyzed.
- The cause of the revenue decline from Jun to Aug 2018 is unknown.
- Data comes from a single marketplace and cannot represent the whole
  market.

## Repository Structure

```
sql/
  00_data_quality_checks.sql
  01_monthly_revenue.sql
  02_black_friday_check.sql
README.md
```

## How to Reproduce

1. Download the dataset from Kaggle.
2. Create a new SQLite database and import the CSV files as tables
   (DB Browser for SQLite: File, Import, Table from CSV file).
3. Run the files in `sql/` in order.

## Next Steps

- Top product categories by revenue
- Delivery time and its relationship with review scores
- Charts for the monthly trend (Python)
