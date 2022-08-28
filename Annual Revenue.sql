--NO 1
CREATE TABLE annual_revenue AS 
SELECT date_part('year', o.order_purchase_timestamp) AS year,
	   ROUND(SUM(oi.price+oi.freight_value),0) annual_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

--NO 2
CREATE TABLE annual_cancel AS 
SELECT date_part('year', order_purchase_timestamp) AS year,
	   COUNT(*) AS annual_cancel
FROM orders 
WHERE order_status = 'canceled'
GROUP BY year
ORDER BY year;

--NO 3
CREATE TABLE top_cat_rev AS 
SELECT year, 
	   product_category_name AS top_cat_rev, 
	   revenue AS cat_rev
FROM (
	SELECT 
		date_part('year', o.order_purchase_timestamp) AS year,
		p.product_category_name,
		ROUND(SUM(i.price + i.freight_value),0) AS revenue,
		RANK() OVER(PARTITION BY 
					DATE_PART('year', o.order_purchase_timestamp) 
					ORDER BY SUM(i.price + i.freight_value) DESC) AS rank
	FROM order_items i
	JOIN orders o ON o.order_id = i.order_id
	join product p ON p.product_id = i.product_id
	WHERE o.order_status = 'delivered'
	GROUP BY 1,2
	) product_rank
WHERE rank = 1;

--NO 4
CREATE TABLE top_cat_cancelled AS
SELECT year, 
	   product_category_name AS top_cat_cancel, 
	   total_cancel 
FROM (SELECT date_part('year', o.order_purchase_timestamp) AS year,
		     p.product_category_name,
			 COUNT(*) AS total_cancel,
			 RANK() OVER(PARTITION BY 
						 DATE_PART('year', o.order_purchase_timestamp) 
						 ORDER BY COUNT(*) DESC) AS rank
	  FROM order_items i
	  JOIN orders o ON o.order_id = i.order_id
	  JOIN product p ON p.product_id = i.product_id
      WHERE o.order_status = 'canceled'
	  GROUP BY 1,2
	  ) product_rank
WHERE rank = 1;

--NO 5
SELECT ar.year,
	   ar.annual_revenue,
	   ac.annual_cancel,
	   tcr.top_cat_rev, 
	   tcr.cat_rev,
	   tcc.top_cat_cancel, 
	   tcc.total_cancel
FROM annual_cancel ac,
	 annual_revenue ar,
	 top_cat_cancelled tcc,
	 top_cat_rev tcr
WHERE ac.year = ar.year AND
	ar.year = tcr.year AND
	tcr.year = tcc.year
