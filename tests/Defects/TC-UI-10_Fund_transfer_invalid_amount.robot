*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-10-Zero or negative amount transfer
    [Documentation]  Zero or negative fund transfer should be invalid but is valid and successful.
    [Tags]    Defect
    Skip  DEF-03
    Register Or Login User
    Open Transfer Funds Page
    Input Transfer Amount    0
    Submit Transfer Funds
    Page Should Contain    Transfer Complete!
    Open Transfer Funds Page
    Input Transfer Amount    -2
    Submit Transfer Funds
    Page Should Contain    Transfer Complete!

