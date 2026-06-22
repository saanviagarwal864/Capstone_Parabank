*** Variables ***
${register_page_button}    xpath=//a[text()="Register"]
${first_name_input}    xpath=//input[@id="customer.firstName"]
${last_name_input}    xpath=//input[@id="customer.lastName"]
${address_input}    xpath=//input[@id="customer.address.street"]
${city_input}    xpath=//input[@id="customer.address.city"]
${state_input}    xpath=//input[@id="customer.address.state"]
${zip_code_input}    xpath=//input[@id="customer.address.zipCode"]
${ssn_input}    xpath=//input[@id="customer.ssn"]
${username_register_input}    xpath=//input[@id="customer.username"]
${password_register_input}    xpath=//input[@id="customer.password"]
${confirm_password_input}    xpath=//input[@id="repeatedPassword"]
${register_button}    xpath=(//input[@type="submit"])[2]

