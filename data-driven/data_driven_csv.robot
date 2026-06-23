*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords/common_keywords.robot
Resource    ../resources/pages/register_page.robot
Library    DataDriver   file=${CURDIR}/login_data.csv  dialect=excel

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown  Close Application

Test Template  Register User


*** Test Cases ***
Test Case For Data Driven   ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${SSN}    ${Username}    ${Password}    ${Confirm}
   [Documentation]      Data driven testing using csv
   [Tags]   datadriver

*** Keywords ***

Register User
    [Arguments]    ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${SSN}    ${Username}    ${Password}    ${Confirm}
     Open Register Page
     Fill Registration Form    ${Firstname}    ${Lastname}    ${Address}    ${City}    ${State}    ${Zipcode}    ${SSN}    ${Username}    ${Password}    ${Confirm}
     Submit Register Form
     Page Should Contain    Welcome ${Username}






