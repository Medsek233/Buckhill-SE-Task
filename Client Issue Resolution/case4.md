# Case 4: "Amount Due" Email Wording Issue Resolution

## Issue Description
A customer has reported receiving the "Amount Due" email as expected. However, they mentioned that the wording hasn't been displayed correctly, preventing them from seeing the actual amount they need to pay. Instead, the email only reads "{amunt_due}."

## Solution Steps
To resolve the issue where a customer received an email with incorrect wording for the "Amount Due,” the following steps will be taken:

1. **Solution Engineer:**
   - Ask the customer to provide a screenshot of the email they received.
   - Collaborate with the Solution Engineer Team to investigate if the issue is related to the configuration or logic rules for sending emails to the client.
   - Work with them to review how the email templates are configured and how the variable "{amunt_due}" is being inserted.

2. **Backend Developer:**
   - Engage the Backend Developer to examine the email generation system and its backend components.
   - Check if there are any issues with how the system is processing and populating the "Amount Due" variable.
   - Collaborate to ensure that the system is correctly retrieving and displaying the actual amount to be paid.
   - If the issue is related to data retrieval or processing, the Backend Developer can assist in debugging and resolving it.

3. **Frontend Developer:**
   - While the primary issue applies to email content, it's also important to ensure that the email is correctly displayed to the customer.
   - Work with the Frontend Developer to confirm that the email template is rendered correctly in various email clients and devices.
   - Address any formatting or display issues in the email template that may be affecting how "{amunt_due}" is presented to the customer.

4. **Follow-up with the Client:**
   - Contact the client to confirm that they can see the correct "Amount Due."
   - Gather feedback to ensure their satisfaction and address any concerns.

5. **Documentation and Prevention:**
   - Document the incident, including the customer's report, the steps taken to investigate and resolve the issue, and any measures implemented to prevent future occurrences.
