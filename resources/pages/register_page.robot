*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/register_locators.robot

*** Keywords ***
Open Register Page
    [Documentation]    Opens the register page by clicking the register button.
    Click Element    ${register_page_button}

Fill Registration Form
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zip_code}    ${ssn}    ${username}    ${password}    ${confirm_password}
    [Documentation]    Fills the register form with the provided user information.
    Wait Until Element Is Enabled    ${first_name_input}    10s
    Click Element    ${first_name_input}
    Input Text    ${first_name_input}    ${first_name}
    Click Element    ${last_name_input}
    Input Text    ${last_name_input}    ${last_name}
    Click Element    ${address_input}
    Input Text    ${address_input}    ${address}
    Click Element    ${city_input}
    Input Text    ${city_input}    ${city}
    Click Element    ${state_input}
    Input Text    ${state_input}    ${state}
    Click Element    ${zip_code_input}
    Input Text    ${zip_code_input}    ${zip_code}
    Click Element    ${ssn_input}
    Input Text    ${ssn_input}    ${ssn}
    Click Element    ${username_register_input}
    Input Text    ${username_register_input}    ${username}
    Click Element    ${password_register_input}
    Input Text    ${password_register_input}    ${password}
    Click Element    ${confirm_password_input}
    Input Text    ${confirm_password_input}    ${confirm_password}
    Sleep    5s

Submit Register Form
    [Documentation]    Submits the register form by clicking the register button.
    Click Element    ${register_button}
    Sleep  10s

