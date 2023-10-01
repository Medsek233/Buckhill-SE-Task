export async function fetchOrders(accessToken,page=1,limit=10) {
    const apiEndpoint = 'http://pet-shop.buckhill.com.hr/api/v1/orders?page='+page+'&limit='+limit;

    try {
        const response = await fetch(apiEndpoint, {
            method: 'GET',
            headers: {
                Authorization: `Bearer ${accessToken}`
            }
        });

        if (!response.ok) {
            throw new Error('API request failed');
        }

        return await response.json();
    } catch (error) {
        console.error('API request error:', error);
        throw error;
    }
}
//write logic to fetch dingle order from api and map it to handlebars