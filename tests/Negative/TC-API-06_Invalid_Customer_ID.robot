*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment


*** Test Cases ***
TC-API-08 - GET Accounts using invalid customerId
    [Documentation]  Test case for retrieving accounts using a invalid customerId returns the expected response code.
    [Tags]  Negative-API
    Create API Session
    ${response}=  GET On Session    parabank      /customers/999999/accounts    expected_status=400
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Response: ${response.text}

    Should Be Equal As Integers    ${response.status_code}    400



