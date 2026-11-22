-- 01_monthly_revenue.sql
-- Question: how do orders and revenue change month by month?
-- Decisions:
--   * Only 'delivered' orders count toward revenue
--   * Revenue = product price only (freight excluded)
--   * Period: Jan 2017 - Aug 2018 (complete months only)
--   * COUNT(DISTINCT order_id) because one order can have several items
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS bulan,
       COUNT(DISTINCT o.order_id) AS jumlah_pesanan,
       ROUND(SUM(i.price), 2) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
  AND o.order_purchase_timestamp >= '2017-01-01'
  AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY bulan
ORDER BY bulan;
