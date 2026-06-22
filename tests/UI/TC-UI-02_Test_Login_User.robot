*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot


Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_UI_02 - Login User
    [Documentation]  Test case to verify user login functionality
    [Tags]  UI
    Register or login user




