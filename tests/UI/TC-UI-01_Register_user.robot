*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot



Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC_UI_01 - Register user
    [Documentation]  Register user with valid details
    [Tags]  UI
    Open Register Page
    Fill Registration Form
    ...    Riya
    ...    Jain
    ...    123 Main St
    ...    New York
    ...    NY
    ...    10001
    ...    123-45-6789
    ...    riya
    ...    riya123
    ...    riya123
    Submit Register Form