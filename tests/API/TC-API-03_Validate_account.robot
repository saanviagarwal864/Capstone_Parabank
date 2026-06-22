*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment

*** Test Cases ***
TC-API-03 - Verify account details
    [Documentation]    Test case to verify that the account details are correct for a given account ID.
    [Tags]    API
    Create API Session
    Login And Get Customer Id
    Open New Account
    Should Contain Any    ${NEW_ACCOUNT_TYPE}    LOAN   CHECKING   SAVINGS
    Log To Console    Type of the new account is: ${NEW_ACCOUNT_TYPE}
    Should Not Be Empty    ${NEW_ACCOUNT_BALANCE}
    Log To Console    Balance of the new account is: ${NEW_ACCOUNT_BALANCE}



