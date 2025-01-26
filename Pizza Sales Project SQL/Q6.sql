-- Joint the Relevant Tables to find the Category-wise Distribution of Pizzas
SELECT 
    Category, COUNT(name) AS count
FROM
    pizza_types
GROUP BY category
ORDER BY category DESC;

