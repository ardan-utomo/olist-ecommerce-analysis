-- 02_black_friday_check.sql
-- Question: is the November 2017 spike concentrated around Black Friday (24 Nov 2017)?
-- Finding: 24 Nov 2017 had 1,176 orders, about 16% of the month's 7,544 orders.
SELECT date(order_purchase_timestamp) AS tanggal,
       COUNT(*) AS jumlah_pesanan
FROM olist_orders_dataset
WHERE order_purchase_timestamp >= '2017-11-01'
  AND order_purchase_timestamp < '2017-12-01'
GROUP BY tanggal
ORDER BY jumlah_pesanan DESC
LIMIT 10;
