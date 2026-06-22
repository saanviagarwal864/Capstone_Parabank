*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment

*** Test Cases ***
TC-API-05-Validate destination account balance after and before transfer
    [Documentation]  Test case to verify that the source account balance is updated correctly after a transfer.
    [Tags]  API
    Create API Session
    Login And Get Customer Id
    Open New Account
    ${Source_account}=  Set Variable    ${NEW_ACCOUNT_ID}
    Open New Account
    ${Destination_account}=  Set Variable    ${NEW_ACCOUNT_ID}
    
    ${Old_destination_balance}=  Get Account Balance    ${Destination_account}
    Transfer Funds    ${Source_account}  ${Destination_account}  100
    ${New_destination_balance}=  Get Account Balance    ${Destination_account}

    ${difference}=  Evaluate  ${New_destination_balance} - ${Old_destination_balance}

    Log To Console    Destination_balance_before=${Old_destination_balance}
    Log To Console    Destination_balance_after=${New_destination_balance}

    Should Be Equal As Integers    ${difference}  100

    