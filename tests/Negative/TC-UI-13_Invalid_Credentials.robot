*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/login_page.robot

Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-13 - Invalid Credentials
    [Documentation]  Test case to verify that a user cannot log in with invalid credentials.
    [Tags]  Negative-UI
    Enter Credentials    wrong  wrong123
    Click Login Button
    Sleep    5s
    Page Should Contain    Error!
