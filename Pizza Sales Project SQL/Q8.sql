-- Determine the top 3 Most Ordered Pizza Types based on Revenue.
Select pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue 
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
join pizza_types
on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name order by revenue desc limit 3;