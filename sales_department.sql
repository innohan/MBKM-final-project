-- Using the sales database
USE sales;

-- Make the tabel with the column that want to be use
SELECT
		oi.id,
		oi.order_id,
		oi.user_id,
		o.gender,
		oi.product_id,
		p.category,
		p.name,
		p.brand,
		p.department,
		oi.status AS shipping_status,
		dc.name AS shipping_company,
		oi.created_at AS order_date,
		DATEDIFF(oi.delivered_at, oi.shipped_at) AS shipping_time,
		o.num_of_item,
		ROUND(oi.sale_price, 2) AS price,
		ROUND(oi.sale_price * o.num_of_item, 2) AS revenue
	FROM order_items oi
	LEFT JOIN orders o
		USING (order_id)
	LEFT JOIN products p
		ON p.id = oi.product_id
	LEFT JOIN distribution_centers dc
		ON dc.id = p.distribution_center_id
	ORDER BY id;
    
SELECT
		oi.id,
		oi.order_id,
		oi.user_id,
		p.category,
		p.name,
		p.brand,
		oi.status AS shipping_status,
		dc.name AS shipping_company,
		oi.created_at AS order_date,
        DATEDIFF(oi.delivered_at, oi.shipped_at) AS shipping_time,
		o.num_of_item,
		ROUND(oi.sale_price, 2) AS price,
		ROUND(oi.sale_price * o.num_of_item, 2) AS revenue
FROM order_items oi
	LEFT JOIN orders o
		USING (order_id)
	LEFT JOIN products p
		ON p.id = oi.product_id
	LEFT JOIN distribution_centers dc
		ON dc.id = p.distribution_center_id
	WHERE oi.status = 'complete' OR oi.status = 'processing' OR  oi.status = 'Shipped'
ORDER BY id;

SELECT
		oi.id,
		oi.order_id,
		oi.user_id,
		p.category,
		p.name,
		p.brand,
		oi.status AS shipping_status,
		dc.name AS shipping_company,
		oi.created_at AS order_date,
        DATEDIFF(oi.delivered_at, oi.shipped_at) AS shipping_time,
		o.num_of_item,
		ROUND(oi.sale_price, 2) AS price,
		ROUND(oi.sale_price * o.num_of_item, 2) AS revenue
FROM order_items oi
	LEFT JOIN orders o
		USING (order_id)
	LEFT JOIN products p
		ON p.id = oi.product_id
	LEFT JOIN distribution_centers dc
		ON dc.id = p.distribution_center_id
	WHERE oi.status = 'complete'
ORDER BY id;