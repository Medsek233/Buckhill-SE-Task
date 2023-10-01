
## Weekly Report View

To display the weely report view, you should open a database client, create and seed the databases using [PETSHOP DATA](https://github.com/Medsek233/Buckhill-SE-Task/blob/main/SQL%20Queries%20and%20Helpers/1-2.%20WEEKLY%20ORDERS/ENV/db_data.sql)

In this task, I have created a sql procedure to create the view since aliases in the view are not allowed. 


I wanted to introduce you to the weekly_order_report view and the associated procedure [CreateOrUpdateWeeklyOrderReport](https://github.com/Medsek233/Buckhill-SE-Task/blob/main/SQL%20Queries%20and%20Helpers/1-3.%20WEEKLY%20REPORT/CreateOrUpdateWeeklyOrderReport.sql)
## weekly_order_report View:  that manages it. 
   Purpose: Provides a weekly report of our orders.

   How it Works:It groups our order data from the past 7 days into batches of 6 based on the order’s ID.

   Each row in the view represents orders, and each order is transformed into a string format (UUID::ProductCount::Amount).

   The view has columns for each day of the week, showing the respective orders for that day.
## CreateOrUpdateWeeklyOrderReport Procedure:
   Purpose: Create or update the weekly_order_report view with dynamically generated columns based on the current date, e.g., “Monday 25/09/2023”.

   How it Works:First, it determines the formatted column names based on the current date.

   Then, using dynamic SQL, it creates or updates the weekly_order_report view with the appropriate column names.

   This means that every time we run the procedure, the view’s column names update to reflect the days of the current week.

   How to Run the Procedure:

   Simply execute the following in our SQL environment:

   CALL CreateOrUpdateWeeklyOrderReport();

   Once you’ve run the procedure, you can query the weekly_order_report view to get the latest weekly report.
