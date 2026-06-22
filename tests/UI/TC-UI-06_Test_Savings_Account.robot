*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-06 - Create Savings Account
    [Documentation]  Test case to verify that a user can create a savings account successfully.
    [Tags]  UI
    Register or login user
    Open New Account Page
    Select Account Type   SAVINGS
    Click On Submit Button
    Sleep    5s
    Page Should Contain    Account Opened!
    Page Should Contain    Congratulations, your account is now open.

