*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_UI_05 - Register with duplicate username
    [Documentation]  Test case to verify that registration fails when the username is already taken.
    [Tags]  Negative-UI
    Open Register Page
    Fill Registration Form
    ...    John
    ...    Doe
    ...    123 Main St
    ...    New York
    ...    NY
    ...    10001
    ...    123-45-6789
    ...    john
    ...    doe
    ...    doe
    Submit Register Form
    Sleep    5s
    Page Should Contain    This username already exists.