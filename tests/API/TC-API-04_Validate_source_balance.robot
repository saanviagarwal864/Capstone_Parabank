*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment

*** Test Cases ***
TC-API-04-Validate source account balance after and before transfer
    [Documentation]  Test case to verify that the source account balance is updated correctly after a transfer.
    [Tags]  API
    Create API Session
    Login And Get Customer Id
    Open New Account
    ${Source_account}=    Set Variable    ${NEW_ACCOUNT_ID}

    Open New Account
    ${Destination_account}=    Set Variable    ${NEW_ACCOUNT_ID}

    ${Old_source_balance}=    Get Account Balance    ${Source_account}
    Transfer Funds    ${Source_account}    ${Destination_account}    100
    ${New_source_balance}=    Get Account Balance    ${Source_account}

    ${difference}=    Evaluate  ${Old_source_balance} - ${New_source_balance}

    Log To Console    Old_source_balance=${Old_source_balance}
    Log To Console    New_source_balance=${New_source_balance}

    Should Be Equal As Numbers    ${difference}    100.0


    