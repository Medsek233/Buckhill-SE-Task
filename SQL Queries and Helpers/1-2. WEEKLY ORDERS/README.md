## Weekly Order View

To display the weely order view, you should open a database client, create and seed the databases using [PETSHOP DATA](https://github.com/Medsek233/Buckhill-SE-Task), then run the SQL statement to create the view. [Weekly Order View
](https://github.com/Medsek233/Buckhill_Technical_Task/blob/main/SQL%20Tasks/weekly_orders_view.sql).

The clause `WHERE o.created_at >= (CURDATE() - INTERVAL 6 DAY)` will display orders from the past 7 days, including today, from midnight to midnight. To include the current time, you should use `WHERE o.created_at >= (NOW() - INTERVAL 6 DAY)`
