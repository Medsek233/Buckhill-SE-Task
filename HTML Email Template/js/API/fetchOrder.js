export async function fetchOrder(accessToken,uuid) {
    const apiEndpoint = 'https://pet-shop.buckhill.com.hr/api/v1/order/'+uuid;

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