*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment


*** Test Cases ***
TC-API-01 - GET Accounts using customerId
    [Documentation]  Test case for retrieving accounts using a customerId returns the expected response.
    [Tags]  API
    Create API Session
    Login And Get Customer Id
    ${response}=  GET On Session    parabank      /customers/${CUSTOMER_ID}/accounts
    
    ${body}=  Parse Xml        ${response.text}
    @{accounts}=  Get Elements    ${body}    account

    FOR    ${account}    IN    @{accounts}
        ${accountId}=  Get Element Text        ${account}    id
        Log To Console       Account ID: ${accountId}
        ${balance}=  Get Element Text        ${account}    balance
        Log To Console       Balance: ${balance}
        ${type}=  Get Element Text       ${account}    type
        Log To Console       Type: ${type}
        ${customerId}=  Get Element Text       ${account}    customerId
        Log To Console       Customer ID: ${customerId}
    END
    

    Should Be Equal As Integers    ${response.status_code}    200

    Should Not Be Empty    ${response.text}



