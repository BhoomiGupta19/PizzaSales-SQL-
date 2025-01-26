-- Determine the Top 3 Most Ordered PizzaTypes Based on Revenue for each Pizza Category
 Select Category, name, revenue, RNK
 from
 (select category, name, revenue,
 rank() over (partition by category order by revenue desc) as RNK
 from 
 (Select pizza_types.category, pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category, pizza_types.name) as a) as b
where RNK <=3;
