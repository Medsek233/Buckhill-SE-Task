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
                    ">": [{"var": "number_of_purchased_items"}, "5"]
                },
                {
                    ">": [{"var": "amount"}, "500"]
                },
                {
                    "in": [{"var": "payment_type"}, ["credit_card", "bank_transfer"]]
                }
            ]
        }

        const jsonLogicRuleC = {
            "and": [
                {
                    "==": [{"var": "order_status"}, "paid"]
                },
                {
                    "min": [{"var": "amount"}, "1000"]
                },
                {
                    "==": [{"var": "is_marketing"}, "1"]
                },
                {
                    "==": [{"var": "payment_type"}, ["credit_card"]]
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
            number_of_purchased_items: fetchedOrder.products.length,
            amount: fetchedOrder.amount,
            payment_type: fetchedOrder.payment?.type || 'not_provided'
        };
        // Data object C
        const dataC = {
            order_status: fetchedOrder.order_status[0].title,
            amount: fetchedOrder.amount,
            payment_type: fetchedOrder.payment?.type || 'not_provided',
            is_marketing: fetchedOrder.user.is_marketing,
        }

         //Apply the rules
        const isRuleASatisfied = jsonLogic.apply(jsonLogicRuleA, dataA);
        const isRuleBSatisfied = jsonLogic.apply(jsonLogicRuleB, dataB);
        const isRuleCSatisfied = jsonLogic.apply(jsonLogicRuleC, dataC);

        const apiDataForTemplate = {
            orderData:{
              order_status: fetchedOrder.order_status[0].title,
                purchaseDate: fetchedOrder.created_at,
                shippingAddress: fetchedOrder.address.shipping,
                number_of_purchased_items: fetchedOrder.products.length,
                amount: fetchedOrder.amount,
                payment_type: fetchedOrder.payment?.type || 'not_provided',
                is_marketing: fetchedOrder.user.is_marketing,
            },
             isRuleASatisfied,
            isRuleBSatisfied,
            isRuleCSatisfied,
            isRuleAPage:rule==='a',
            isRuleBPage:rule==='b',
            isRuleCPage:rule==='c',
        }
        const renderedHtml = renderTemplate('#json-logic', apiDataForTemplate);
        document.body.innerHTML = renderedHtml;
    } catch (error) {
        console.error('Error:', error);
    }
});


