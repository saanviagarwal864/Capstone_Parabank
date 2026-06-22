*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_UI_03 - Register with empty fields
    [Documentation]  Test case to verify that registration fails when all input fields are empty.
    [Tags]  Negative-UI
    Open Register Page
    Sleep    2s
    Submit Register Form
    Sleep    5s
    @{texts}=  Create List
    ...  First name is required.
    ...  Last name is required.
    ...  Address is required.
    ...  City is required.
    ...  State is required.
    ...  Zip Code is required.
    ...  Social Security Number is required.
    ...  Username is required.
    ...  Password is required.
    ...  Password confirmation is required.

    FOR  ${text}  IN   @{texts}
        Page Should Contain    ${text}
    END