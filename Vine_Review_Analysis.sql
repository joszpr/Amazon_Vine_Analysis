-- Create table to import amazon reviews data
CREATE TABLE mother_table (
	marketplace TEXT,
	customer_id INTEGER,
	review_id TEXT PRIMARY KEY NOT NULL,
	product_id TEXT,
	product_parent INTEGER,
	product_title TEXT,
	product_category TEXT,
	star_rating INTEGER,
	helpful_votes INTEGER,
	total_votes INTEGER,
	vine TEXT,
	verified_purchase TEXT,
	review_headline TEXT,
	review_body TEXT,
	review_date DATE
	);

SELECT * FROM mother_table;

-- Create Tables with data from mother_table
-- Populate Data into review_id_table
SELECT review_id, customer_id, product_id, product_parent, review_date 
INTO review_id_table
FROM mother_table;
	-- Review Table
	SELECT * FROM review_id_table;

-- Populate Data into products_table
SELECT product_id, product_title
INTO products_table
FROM mother_table;
	-- Review Table
	SELECT * FROM products_table;

-- Populate Data into customers_table
SELECT customer_id, COUNT(customer_id) AS customer_count
INTO customers_table
FROM mother_table
GROUP BY customer_id;
	-- Review Table
	SELECT * FROM customers_table;

-- Populate Data into vine_table
SELECT review_id, star_rating, helpful_votes, total_votes, vine, verified_purchase
INTO vine_table
FROM mother_table;
	-- Review Table
	SELECT * FROM vine_table;

-- Create a Table where helpful_votes divided by total_votes are => 50%
SELECT *
INTO division_table
FROM mother_table
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
	-- Review Table
	SELECT * FROM division_table;

-- Create a Table where Vine = 'Y'
SELECT *
INTO paid_table
FROM division_table
WHERE division_table.vine = 'Y';
	-- Review Table
	SELECT * FROM paid_table;
-- 1775 paid reviews

-- Create a Table where Vine = 'N'
SELECT *
INTO unpaid_table
FROM division_table
WHERE division_table.vine = 'N';
	-- Review Table
	SELECT * FROM unpaid_table;
-- 77,360 unpaid reviews

-- Determine total number of helpful reviews
SELECT COUNT(review_id)
FROM division_table;
-- 79,135 reviews

-- Determine total number of 5-stars reviews
SELECT COUNT(review_id)
FROM division_table AS d
WHERE d.star_rating = 5;
-- 36,720 of helpful 5 starts review

-- Determine percentage of paid 5-stars reviews
SELECT COUNT(review_id)
FROM division_table AS d
WHERE d.star_rating = 5 AND d.vine = 'Y';
-- 783 of paid helpful 5 starts review

-- Determine percentage of unpaid 5-stars reviews
SELECT COUNT(review_id)
FROM division_table AS d
WHERE d.star_rating = 5 AND d.vine = 'N';
-- 35,937 of unpaid helpful 5 starts review
