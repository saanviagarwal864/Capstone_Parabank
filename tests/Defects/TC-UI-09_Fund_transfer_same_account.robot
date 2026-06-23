*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-09-Same account transfer
    [Documentation]    Fund transfer between same account should be invalid but is valid and successful.
    [Tags]    Defect
    Register Or Login User
    Open Transfer Funds Page
    Input Transfer Amount    100
    Sleep    5s
    Submit Transfer Funds
    Sleep    4s
    Page Should Contain    Transfer Complete!
