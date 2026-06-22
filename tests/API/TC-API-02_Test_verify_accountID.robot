*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment

*** Test Cases ***
TC-API-02 - Verify accountID
    [Documentation]  Test case to verify new Account ID present in GET accounts response
    [Tags]  API
    Create API Session
    Login And Get Customer Id
    Open New Account
    ${response}=    GET On Session    parabank   /customers/${CUSTOMER_ID}/accounts
    Should Be Equal As Strings    ${response.status_code}    200
    ${body}=    Parse XML    ${response.text}
    Should Contain    ${response.text}    ${NEW_ACCOUNT_ID}

    
