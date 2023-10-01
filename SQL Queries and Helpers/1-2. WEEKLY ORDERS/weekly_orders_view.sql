
/*Write an SQL statement to create a view that will be updated daily
  showing all the orders for the current week including
  products, clients, payments and status details:*/


CREATE VIEW weekly_orders_view AS
select `o`.`user_id`    AS `user_id`,
       `o`.`products`   AS `products`,
       `u`.`first_name` AS `Client Name`,
       `p`.`type`       AS `Payment Type`,
       `p`.`details`    AS `Payment Details`,
       `os`.`title`     AS `Order Status`

from (((`petshop`.`orders` `o` join `petshop`.`users` `u` on ((`o`.`user_id` = `u`.`id`))) join `petshop`.`payments` `p`
       on ((`o`.`payment_id` = `p`.`id`))) join `petshop`.`orders_status` `os` on ((`o`.`order_status_id` = `os`.`id`)))
where (`o`.`created_at` >= (curdate() - interval 6 day))


/*The where (`o`.`created_at` >= (curdate() - interval 6 day)) will show the orders
 from the last 7 days (including today) from midnight to midnight. In order to include the datetime we should use
  where (`o`.`created_at` >= (now() - interval 6 day))*/