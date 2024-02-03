import { authenticateAdmin } from './API/auth.js';
import { fetchOrders } from './API/fetchOrders.js';
import { renderTemplate } from './handlebarsTemplateCompile.js';

document.addEventListener("DOMContentLoaded", async function() {
    try {
        // Authenticate admin and get the access token
        const accessToken = await authenticateAdmin();

        // Fetch orders
        const apiData = await fetchOrders(accessToken, 1, 10);
        // retrieve all 10 orders from the api
        const purchaseOrders = apiData.data;
        // Prepare data for Handlebars template
        const apiDataForTemplate = {
            items: purchaseOrders.map(item => ({
                purchase_uuid: item.uuid,
                status: item.order_status[0].title,
            })),
        };

        // Render the template and replace the content of the container
        const renderedHtml = renderTemplate('#fetch-orders', apiDataForTemplate);
        document.body.innerHTML = renderedHtml;
    } catch (error) {
        console.error('Error:', error);
    }
});