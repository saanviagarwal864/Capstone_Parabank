*** Settings ***
Library    SeleniumLibrary
Library    XML
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/hybrid_keywords.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup     Hybrid Setup
Test Setup      Open Application
Test Teardown   Close Application

*** Test Cases ***
TC-E2E-01 - Create Checking Account via UI Validate in API
    [Documentation]    Create CHECKING account in UI and validate account details through API.
    [Tags]    HYBRID
    Register Or Login User
    Open New Account Page
    Select Account Type    CHECKING
    Sleep    4s
    Click On Submit Button
    Get The New Account Id
    ${account_id}=    Get File    new_account_id.txt
    Log To Console    New Account ID: ${account_id}
    Create API session

    ${response}=    GET On Session    parabank    /accounts/${account_id}
    Should Be Equal As Integers    ${response.status_code}    200
    ${body}=  Parse Xml    ${response.text}
    ${api_account_id}=  Get Element Text    ${body}  id
    ${account_type}=  Get Element Text   ${body}   type
    ${account_balance}=  Get Element Text    ${body}  balance
    
    Should Be Equal    ${api_account_id}   ${account_id}
    Log To Console    api_account_id = ${api_account_id} and ui_account_id = ${account_id} are same
    Should Be Equal As Strings    ${account_type}  CHECKING
    Log To Console     account type = ${account_type}
    Should Be True     isinstance(${account_balance}, (int, float))
    Log To Console    account balance = ${account_balance} is numeric
    