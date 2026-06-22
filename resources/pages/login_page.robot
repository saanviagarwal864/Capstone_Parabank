*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***
Enter Credentials
    [Arguments]    ${username_login}    ${password_login}
    [Documentation]  Login with valid credentials
    Input Text    ${username_login_input}    ${username_login}
    Input Text    ${password_login_input}    ${password_login}
Click Login Button
    [Documentation]  Clicks the login button
    Click Element    ${login_button}
    
Click Logout Button
    [Documentation]  Clicks the logout button
    Click Element    ${log_out_button}
    

