SELECT

dist_cent.name as distribution_center_name,
ord_items.status,
count(inv_items.id) as nums_of_items,
ROUND(AVG(DATE_DIFF(ord_items.shipped_at, ord_items.created_at, hour)),2) as hours_created_to_ship,
ROUND(AVG(DATE_DIFF(ord_items.delivered_at, ord_items.shipped_at, hour)),2) as hours_ship_to_deliver,

ROUND(SUM(ord_items.sale_price), 2) as sale_price_amount, 

MIN(ord_items.created_at) as oldest_created_ord_date,
MAX(ord_items.created_at) as newest_created_ord_date

FROM `bigquery-public-data.thelook_ecommerce.order_items` as ord_items 
JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` as inv_items
ON ord_items.inventory_item_id = inv_items.id
JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` as dist_cent
ON inv_items.product_distribution_center_id = dist_cent.id

GROUP BY 
dist_cent.name,
ord_items.status