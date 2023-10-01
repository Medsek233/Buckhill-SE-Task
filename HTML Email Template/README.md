## HTML email template

I have recreated the email template please check the sample here [Email Template
](https://my-trai-files.ams3.digitaloceanspaces.com/test.pdf).

I created a view that displays 10 orders with their status. You can click on the order_uuid to fetch the email template of the order.

The scripts will run as follows: 
       
 - We will call the login api endpoint and log the admin using the credentials.
 - The access token will be stored so we can easily use it when calling protected endpoints
 - Then we will map the orders to the view and display the orders with their status [index.html](http://localhost/Buckhill-SE-Task/HTML%20Email%20Template/index.html)
 - When you click on the order_uuid, the email template will be fetched and displayed. For example: [email_template.html](http://localhost/Buckhill-SE-Task/HTML%20Email%20Template/fetchOrder.show.html?uuid=)
- The email template will be displayed and data fetched using conditional rendering using handlebars built-in helpers.


## JsonLogic (Bonus)

In the table on the index page, we can click on **Apply rule** to check whether to send the email or not based on the given condition.
