-- Analyse the Cumulative Revenue Generated over Time 
select order_date,
sum(revenue) over (order by order_date) as cum_revenue 
from 
(Select orders.order_date,
sum(order_details.quantity * pizzas.price) as revenue
from order_details join pizzas 
on order_details.pizza_id = pizzas.pizza_id
join orders
on orders.order_id= order_details.order_id
group by orders.order_date) as sales;
