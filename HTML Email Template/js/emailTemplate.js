import { authenticateAdmin } from './API/auth.js';
import { fetchOrder } from './API/fetchOrder.js';
import { renderTemplate } from './handlebarsTemplateCompile.js';
import { formatISODate } from "./dateUtils.js";
import StatusEnum from './Enums/statusEnum.js';

document.addEventListener("DOMContentLoaded", async function() {
    try {
        // Authenticate admin and get the access token
        const accessToken = await authenticateAdmin();
        //get order uuid from url
        const urlParams = new URLSearchParams(window.location.search);
        const order_uuid = urlParams.get('uuid');

        // Fetch order
        const apiData = await fetchOrder(accessToken, order_uuid);

        // retrieve the order based on uuid from the api
        const fetchedOrder = apiData.data;
        const isoDate = fetchedOrder.created_at;
        const formattedDate = formatISODate(isoDate);
        // Check if the API provides the amount_paid property
        const amountPaid = fetchedOrder.amount_paid ? fetchedOrder.amount_paid : 0;
        // Prepare data for Handlebars template
        const apiDataForTemplate = {
            user_first_name: fetchedOrder.user.first_name,
            user_last_name: fetchedOrder.user.last_name,
            user_middle_name: fetchedOrder.user.middle_name ? fetchedOrder.user.middle_name : '',
            purchase_id: fetchedOrder.uuid,
            status: fetchedOrder.order_status[0].title,
            items: fetchedOrder.products.map(item => ({
                name: item.product,
                quantity: item.quantity,
                price: item.price
            })),
            purchaseDate: formattedDate,
            total: fetchedOrder.amount,
            amountPaid: amountPaid,
            amountDue: (fetchedOrder.amount + fetchedOrder.delivery_fee - amountPaid).toFixed(2),
            isPaid: fetchedOrder.order_status[0].title === StatusEnum.PAID,
            isCanceled: fetchedOrder.order_status[0].title === StatusEnum.CANCELLED,
            isShipped: fetchedOrder.order_status[0].title === StatusEnum.SHIPPED,
            isPendingPayment: fetchedOrder.order_status[0].title === StatusEnum.PENDING_PAYMENT,
            isOpen: fetchedOrder.order_status[0].title === StatusEnum.OPEN
        };

        // Render the template and replace the content of the container
        const renderedHtml = renderTemplate('#email-template', apiDataForTemplate);
        document.body.innerHTML = renderedHtml;
    } catch (error) {
        console.error('Error:', error);
    }
});