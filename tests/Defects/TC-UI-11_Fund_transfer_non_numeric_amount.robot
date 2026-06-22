*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-11-Non-numeric amount transfer
    [Documentation]    Transferring non-numeric amount should show invalid amount but shows internal error.
    [Tags]    Defect
    Skip  DEF-04
    Register Or Login User
    Open Transfer Funds Page
    Input Transfer Amount    abc
    Submit Transfer Funds
    Page Should Contain    An internal error has occurred and has been logged.