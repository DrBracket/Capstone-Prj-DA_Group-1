/*
Estrarre il numero di prodotti presenti in stock per ogni magazzino, suddividendo i prodotti per categoria e genere e il numero di prodotti venduti
*/

SELECT 
dist_center.id as distribution_center_id,
dist_center.name as distribution_center_name, 
inv_items.product_category,
inv_items.product_name,
inv_items.product_department,
count(inv_items.id) as nums_of_items_in_stock,
count(inv_items.sold_at) as nums_of_sold_items



FROM `bigquery-public-data.thelook_ecommerce.inventory_items` as inv_items
JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` as dist_center
ON inv_items.product_distribution_center_id = dist_center.id

GROUP BY 
dist_center.name, 
dist_center.id, 
inv_items.product_category,
inv_items.product_department

Order by product_category asc
