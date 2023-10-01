import {authenticateAdmin} from './API/auth.js';
import {renderTemplate} from "./handlebarsTemplateCompile.js";
import {fetchOrder} from "./API/fetchOrder.js";

document.addEventListener("DOMContentLoaded", async function () {
    try {
        const email = 'admin@buckhill.co.uk';
        const password = 'admin';

        // Authenticate admin and get the access token
        const accessToken = await authenticateAdmin(email, password);
        //get order uuid and rule number from url
        const urlParams = new URLSearchParams(window.location.search);
        const order_uuid = urlParams.get('uuid');
        const rule= urlParams.get('rule');
        // Fetch orders
        const apiData = await fetchOrder(accessToken, order_uuid);
        // retrieve the order based on uuid from the api
        const fetchedOrder = apiData.data;
        // Prepare data for Handlebars template
        console.log("purchaseOrders",fetchedOrder);
        const jsonLogicRuleA = {
            "and": [
                {
                    "or": [
                        {
                            "==": [{"var": "order_status"}, "pending payment"]
                        },
                        {
                            "==": [{"var": "order_status"}, "shipped"]
                        }
                    ]
                },
                {
                    ">": [{"var": "purchaseDate"}, "2021-01-01T00:00:00.000000Z"]
                },
                {
                    "in": [{"var": "shippingCountry"}, ["Croatia", "Italy"]]
                }
            ]
        };

        const jsonLogicRuleB = {
            "and": [
                {
                    "==": [{"var": "order_status"}, "paid"]
                },
                {
                    ">": [{"var": "amount"}, "500"]
                },
                {
                    "==": [{"var": "payment_type"}, "credit_card"]
                }
            ]
        }

        // Data object A
        const dataA = {
            order_status: fetchedOrder.order_status[0].title,
            purchaseDate: fetchedOrder.created_at,
            shippingCountry: fetchedOrder.address.shipping
        };
        // Data object B
        const dataB = {
            order_status: fetchedOrder.order_status[0].title,
            amount: fetchedOrder.amount,
            payment_type: fetchedOrder.payment?.type || 'not_provided'
        };


        const isRuleASatisfied = jsonLogic.apply(jsonLogicRuleA, dataA);
        const isRuleBSatisfied = jsonLogic.apply(jsonLogicRuleB, dataB);

        const apiDataForTemplate = {
            resultA: isRuleASatisfied,
            resultB: isRuleBSatisfied,
            isResultA:rule==='a',
            isResultB:rule==='b'
        }
        const renderedHtml = renderTemplate('#json-logic', apiDataForTemplate);
        document.body.innerHTML = renderedHtml;
    } catch (error) {
        console.error('Error:', error);
    }
});


