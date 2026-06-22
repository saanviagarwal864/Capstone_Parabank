*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
TC-UI-12-Access transfer funds page
    [Documentation]    Access transfer funds page without logging in the user.
    [Tags]    Defect
    Skip  DEF-01
    Open Transfer Funds Page
    Sleep    5s
    ${url}=    Get Location

    Log To Console    URL: ${url}
    Page Should Not Contain    Customer Login




