// auth.js
export async function authenticateAdmin(email, password) {
    const authEndpoint = 'http://pet-shop.buckhill.com.hr/api/v1/admin/login';

    const credentials = {
        email: email,
        password: password
    };

    try {
        const response = await fetch(authEndpoint, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(credentials)
        });

        if (!response.ok) {
            throw new Error('Authentication failed');
        }

        const data = await response.json();
        const accessToken = data.data.token; // Assuming the token is directly under 'token' in the response

        // Store the access token in localStorage
        localStorage.setItem('accessToken', accessToken);
        return accessToken;
    } catch (error) {
        console.error('Authentication error:', error);
        throw error;
    }
}
