*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup    Load Environment
Test Setup     Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-08 - Test Transfer Funds
    [Documentation]  Test case to verify that a user can transfer funds successfully between two different accounts.
    [Tags]  UI
    Register or login user
    Open New Account Page
    Select Account Type   SAVINGS
    Click On Submit Button
    Sleep    5s
    Get The New Account Id
    Open Transfer Funds Page
    Input Transfer Amount    100
    Select To Account
    Sleep    4s
    Submit Transfer Funds
    Sleep    5s
    Page Should Contain    Transfer Complete
    Page Should Contain    $100.00 has been transferred from account

