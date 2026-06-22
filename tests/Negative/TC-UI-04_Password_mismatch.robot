*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/pages/register_page.robot
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_UI_04 - Register with password mismatch
    [Documentation]  Test case to verify that registration fails when the password and confirm password fields do not match.
    [Tags]  Negative-UI
    Open Register Page
    Fill Registration Form
    ...    Tina
    ...    Sharma
    ...    Jaipur
    ...    Jaipur
    ...    Rajasthan
    ...    302001
    ...    123456
    ...    tina
    ...    test123
    ...    test999
    Submit Register Form
    Sleep    5s
    Page Should Contain    Passwords did not match.
