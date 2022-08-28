--COUNT THE MOST USED PAYMENT METHODS
SELECT payment_type,
	   COUNT(order_id) AS frequency
FROM order_payments
GROUP BY 1
ORDER BY 2 DESC

--CALCULATE ANNUAL PAYMENT METHODS USAGE
WITH tmp AS(
SELECT DATE_PART('year', o.order_purchase_timestamp) AS year,
	   op.payment_type,
	   COUNT(*) AS frequency
FROM order_payments op 
JOIN orders o ON o.order_id = op.order_id
GROUP BY 1, 2
ORDER BY 1
)
SELECT *,
		 CASE WHEN y_2017 = 0 THEN NULL
		 ELSE ROUND((y_2018 - y_2017)/y_2017,2)
		 END AS year_change
FROM (SELECT payment_type,
	 		 SUM(CASE WHEN year = '2016' THEN frequency ELSE 0 END) AS y_2016,
	 		 SUM(CASE WHEN year = '2017' THEN frequency ELSE 0 END) AS y_2017,
	 		 SUM(CASE WHEN year = '2018' THEN frequency ELSE 0 END) AS y_2018
	 FROM tmp
	 GROUP BY 1
	 )subq
ORDER BY 2 DESC
