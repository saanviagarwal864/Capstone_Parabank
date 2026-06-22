*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../../config/environment.py
Library    OperatingSystem
Library    XML

*** Variables ***
${API_ENV}    qa_api

*** Keywords ***
Load API Environment
    Load Env    ${API_ENV}
    ${baseurl}=  Get Env    baseurl_api
    ${username}=  Get Env    username
    ${password}=  Get Env    password
    ${account_id}=  Get Env    account_id

    Set Global Variable    ${BASEURL_API}  ${baseurl}
    Set Global Variable    ${USERNAME}  ${username}
    Set Global Variable    ${PASSWORD}  ${password}
    Set Global Variable    ${ACCOUNT_ID}  ${account_id}

Create API session
    Create Session  parabank   ${BASEURL_API}

Login and get customer id
    ${response}=    GET On Session  parabank    /login/${USERNAME}/${PASSWORD}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.text}
    ${xml}=    Parse XML    ${response.text}
    ${customer_id}=    Get Element Text    ${xml}    id
    Log To Console    Customer ID: ${customer_id}
    Set Global Variable    ${CUSTOMER_ID}  ${customer_id}

Open new account
    [Documentation]    Opens new account for logged in user
    ${params}=    Create Dictionary    customerId=${CUSTOMER_ID}    newAccountType=1    fromAccountId=${ACCOUNT_ID}
    ${response}=    POST On Session    parabank   /createAccount   params=${params}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.text}
    ${body}=    Parse XML    ${response.text}
    ${account_id}=    Get Element Text    ${body}    id

    Log To Console    Account ID: ${account_id}
    Set Global Variable    ${NEW_ACCOUNT_ID}  ${account_id}
    
    ${balance}=    Get Element Text    ${body}    balance
    ${type}=    Get Element Text    ${body}    type

    Set Global Variable    ${NEW_ACCOUNT_BALANCE}  ${balance}
    Set Global Variable    ${NEW_ACCOUNT_TYPE}  ${type}


Transfer Funds
    [Arguments]    ${from_account}    ${to_account}    ${amount}
    ${params}=    Create Dictionary    fromAccountId=${from_account}    toAccountId=${to_account}    amount=${amount}
    ${response}=    POST On Session    parabank    /transfer   params=${params}
    Should Be Equal As Integers    ${response.status_code}    200

Get Account Balance
    [Documentation]    Get balance of a account
    [Arguments]    ${account_id}
    ${response}=  GET On Session    parabank   /accounts/${account_id}
    ${body}=    Parse XML    ${response.text}
    ${balance}=    Get Element Text    ${body}    balance
    RETURN    ${balance}








