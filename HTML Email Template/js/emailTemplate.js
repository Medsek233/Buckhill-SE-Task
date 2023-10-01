import {authenticateAdmin} from './API/auth.js';
import {fetchOrders} from './API/fetchOrders.js';
import {renderTemplate} from './handlebarsTemplateCompile.js';
import {formatISODate} from "./dateUtils.js";

document.addEventListener("DOMContentLoaded", async function () {
    try {
        const email = 'admin@buckhill.co.uk';
        const password = 'admin';

        // Authenticate admin and get the access token
        const accessToken = await authenticateAdmin(email, password);
        // 1. Fetch orders
        // 2. return fetched order to handlebars template
        // 3. display list of orders using ul and li and <a> tags pointing to email template exemple /email-template.html?order_uuid=123456789
        // 4. create email-template.html
        // 5. create email-template.js and get order uuid from url, then fetch order by uuid and display it in email-template.html and make sure to display the order uuid in the email template and map it to handlebars
        //const urlParams = new URLSearchParams(window.location.search);
        // const order_uuid = urlParams.get('order_uuid');
        // console.log(order_uuid);
        //6.get all order statuses



        // Fetch orders
        const apiData = await fetchOrders(accessToken);

        // Filter pending payment orders
        const pendingPaymentOrders = apiData.data.filter(item => item.order_status[0].title === 'pending payment'|| item.order_status[0].title === 'shipped');
        const isoDate = pendingPaymentOrders[0].created_at;
        const formattedDate = formatISODate(isoDate);
       const amountPaid = 0;
        // Prepare data for Handlebars template
        const apiDataForTemplate = {
            user_first_name: pendingPaymentOrders[0].user.first_name,
            user_last_name: pendingPaymentOrders[0].user.last_name,
            purchase_id: pendingPaymentOrders[0].uuid,
            items: pendingPaymentOrders[0].products.map(item => ({
                name: item.product,
                quantity: item.quantity,
                price: item.price
            })),
            purchaseDate: formattedDate,
            total: pendingPaymentOrders[0].amount,
            amountPaid: amountPaid,
            amountDue: (pendingPaymentOrders[0].amount + pendingPaymentOrders[0].delivery_fee - amountPaid).toFixed(2),
        };

        // Render the template and replace the content of the container
        const renderedHtml = renderTemplate('#email-template', apiDataForTemplate);
        document.body.innerHTML = renderedHtml;
    } catch (error) {
        console.error('Error:', error);
    }
});
