-- 00_data_quality_checks.sql
-- Goal: understand the data before analyzing it.

-- 1. Total orders
SELECT COUNT(*) AS total_orders FROM olist_orders_dataset;
-- Result: 99,441

-- 2. Order status distribution
-- Finding: ~97% of orders are 'delivered', so revenue is based on delivered orders only.
SELECT order_status,
       COUNT(*) AS jumlah
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY jumlah DESC;

-- 3. Date range of the data
-- Result: 2016-09-04 to 2018-10-17
SELECT MIN(order_purchase_timestamp) AS pesanan_pertama,
       MAX(order_purchase_timestamp) AS pesanan_terakhir
FROM olist_orders_dataset;

-- 4. Orders per month (completeness check)
-- Finding: Sep-Dec 2016 (Nov 2016 is missing) and Sep-Oct 2018 are incomplete.
-- Analysis period is therefore limited to Jan 2017 - Aug 2018.
SELECT strftime('%Y-%m', order_purchase_timestamp) AS bulan,
       COUNT(*) AS jumlah_pesanan
FROM olist_orders_dataset
GROUP BY bulan
ORDER BY bulan;
