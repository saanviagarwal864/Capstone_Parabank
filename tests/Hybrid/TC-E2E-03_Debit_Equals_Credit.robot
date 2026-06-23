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
TC-E2E-03 - Fund transfer and validation
    [Documentation]    Perform fund transfer via UI and validate consistency via API
    [Tags]    Hybrid
    Register Or Login User
    Open New Account Page
    Select Account Type    SAVINGS
    Sleep    3s
    Click On Submit Button
    Get The New Account Id
    ${Source_account_id}=    Get File    new_account_id.txt
    Create API Session
    ${source_balance_before}=  Get Account Balance    ${Source_account_id}
    Sleep    5s

    Open New Account Page
    Select Account Type    SAVINGS
    Sleep    3s
    Click On Submit Button
    Get The New Account Id
    ${Destination_account_id}=    Get File    new_account_id.txt
    ${Destination_balance_before}=  Get Account Balance    ${Destination_account_id}
    Sleep    5s

    Open Transfer Funds Page
    Input Transfer Amount    80
    Click Element    id=fromAccountId
    Wait Until Page Contains    ${Source_account_id}  timeout=20s
    Select From List By Value    id=fromAccountId    ${Source_account_id}
    Click Element    id=toAccountId
    Wait Until Page Contains    ${Destination_account_id}   timeout=20s
    Select From List By Value    id=toAccountId    ${Destination_account_id}
    Submit Transfer Funds
    Sleep    5s

    ${source_balance_after}=    Get Account Balance    ${Source_account_id}
    ${destination_balance_after}=    Get Account Balance    ${Destination_account_id}

    Log To Console    Source Before: ${source_balance_before}
    Log To Console    Source After : ${source_balance_after}

    Log To Console    Destination Before: ${Destination_balance_before}
    Log To Console    Destination After : ${destination_balance_after}

    ${debited}=     Evaluate    ${source_balance_before} - ${source_balance_after}
    ${credited}=    Evaluate    ${destination_balance_after} - ${destination_balance_before}

    Should Be Equal As Numbers    ${debited}    ${credited}
    Should Be Equal As Numbers    ${debited}    80

    Log To Console    amount_debited == amount_credited == transfer_amount

    





