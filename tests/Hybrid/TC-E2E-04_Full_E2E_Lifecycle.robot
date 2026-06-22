*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/hybrid_keywords.robot
Resource    ../../resources/pages/create_account_page.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup     Hybrid Setup
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-E2E-04 - Full E2E Lifecycle
    [Documentation]    Full Lifecycle E2E – Login → Create Account → Transfer → API Verify → Logout
    [Tags]    Hybrid
    Register Or Login User
    Open New Account Page
    Sleep    3s
    Click On Submit Button
    Get The New Account Id
    ${Account_A_id}=    Get File    new_account_id.txt
    Create API Session
    ${source_balance_before}=  Get Account Balance    ${Account_A_id}
    Sleep    5s

    Open New Account Page
    Sleep    3s
    Click On Submit Button
    Get The New Account Id
    ${Account_B_id}=    Get File    new_account_id.txt
    ${Destination_balance_before}=  Get Account Balance    ${Account_B_id}
    Sleep    5s

    Open Transfer Funds Page
    Input Transfer Amount    50
    Click Element    id=fromAccountId
    Wait Until Page Contains    ${Account_A_id}  timeout=10s
    Sleep    5s
    Select From List By Value    id=fromAccountId    ${Account_A_id}
    Click Element    id=toAccountId
    Wait Until Page Contains    ${Account_B_id}  timeout=10s
    Select From List By Value    id=toAccountId    ${Account_B_id}
    Submit Transfer Funds
    Sleep    5s

    ${source_balance_after}=    Get Account Balance    ${Account_A_id}
    ${destination_balance_after}=    Get Account Balance    ${Account_B_id}

    Log To Console    Source Before: ${source_balance_before}
    Log To Console    Source After : ${source_balance_after}

    Log To Console    Destination Before: ${Destination_balance_before}
    Log To Console    Destination After : ${destination_balance_after}

    ${debit}=     Evaluate    ${source_balance_before} - ${source_balance_after}
    ${credit}=    Evaluate    ${destination_balance_after} - ${destination_balance_before}

    Should Be Equal As Numbers    ${debit}    ${credit}
    Should Be Equal As Numbers    ${debit}    50

    Click Logout Button

    Page Should Contain    Customer Login










