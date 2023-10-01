/*
Additionally, create a second view where we can visualize a weekly report
  with 7 columns, each column will be labeled with the day and date,
  and each row will show a concatenation of these elements and they will be separated
  by a double colon ::
-order_uuid
-number of products
-order amount in cents
  */


CREATE VIEW weekly_reports_view AS
select (case
            when (dayofweek(`so`.`created_at`) = 2) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Monday`,
       (case
            when (dayofweek(`so`.`created_at`) = 3) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Tuesday`,
       (case
            when (dayofweek(`so`.`created_at`) = 4) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Wednesday`,
       (case
            when (dayofweek(`so`.`created_at`) = 5) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Thursday`,
       (case
            when (dayofweek(`so`.`created_at`) = 6) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Friday`,
       (case
            when (dayofweek(`so`.`created_at`) = 7) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Saturday`,
       (case
            when (dayofweek(`so`.`created_at`) = 1) then concat_ws('::', `so`.`id`, `so`.`shipping_method`,
                                                                   `so`.`shipping_price`)
            else '' end) AS `Sunday`
from `demo`.`shop_orders` `so`
where (`so`.`created_at` between (curdate() - interval (dayofweek(curdate()) - 1) day)
  and (curdate() + interval (7 - dayofweek(curdate())) day))
