*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py
Resource  ../../resources/pages/login_page.robot
Resource  ../../resources/pages/register_page.robot

*** Variables ***
${BROWSER}  chrome
${UI_ENV}  qa_ui

*** Keywords ***
Load Environment
    Load Env    ${UI_ENV}
    ${url}=  Get Env    baseurl_ui
    ${username}=  Get Env    username
    ${password}=  Get Env    password

    Set Global Variable    ${BASE_URL}  ${url}
    Set Global Variable    ${USERNAME}  ${username}
    Set Global Variable    ${PASSWORD}  ${password}

Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL}  ${BROWSER}
    Maximize Browser Window
    Sleep    30

Close Application
    [Documentation]  Closing the application
    Close All Browsers

Register or login user
    [Documentation]    Checks if the user can log in with valid credentials, if not, it registers the user and then logs in.
    Enter Credentials    ${USERNAME}    ${PASSWORD}
    Click Login Button
    ${status}=    Run Keyword And Return Status
    ...    Wait Until Page Contains
    ...    Accounts Overview
    ...    timeout=10s
    IF    not ${status}
        Go To    https://parabank.parasoft.com/parabank/register.htm
        Fill Registration Form
        ...    Priyaa
        ...    Sharma
        ...    Jaipur
        ...    Jaipur
        ...    Rajasthan
        ...    302001
        ...    123456
        ...    priyaaa
        ...    priya123
        ...    priya123
        Submit Register Form
        Page Should Contain    Welcome
        Click Logout Button
        Enter Credentials    priyaaa    priya123
        Click Login Button
        Wait Until Page Contains
        ...    Accounts Overview
        ...    timeout=10s
    END


