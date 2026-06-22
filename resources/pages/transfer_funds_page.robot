*** Settings ***
Library     SeleniumLibrary
Resource    ../../variables/transfer_funds_locators.robot

*** Keywords ***
Open Transfer Funds Page
    [Documentation]    Opens the "Transfer Funds" page.
    Click Element    ${transfer_funds_button}    
    
Input Transfer Amount
    [Documentation]    Inputs the transfer amount.
    [Arguments]    ${amount}
    Click Element    ${amount_input}
    Input Text    ${amount_input}    ${amount}
    
    
Select To Account
    [Documentation]    Selects the "To Account" from the dropdown.
    Wait Until Element Is Visible    ${to_account_dropdown}
    Click Element    ${to_account_dropdown}
    Wait Until Page Contains    ${ACCOUNT_ID_UI}  10s
    Select From List By Value    id=toAccountId   ${ACCOUNT_ID_UI}
#    Click Element    ${to_account_locator}
    Sleep  5s

Select accounts by Value
    [Documentation]  If account id is available select account id via value from dropdown
    [Arguments]    ${from_acc}   ${to_acc}
    Wait Until Element Is Visible    ${from_account_dropdown}  timeout=10s
    ${abc}=  Get List Items    ${from_account_dropdown}
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${from_account_dropdown}    ${from_acc}
    Wait Until Keyword Succeeds    10s   1s    Select From List By Value    ${to_account_dropdown}      ${to_acc}



Submit Transfer Funds
    [Documentation]    Submits the transfer funds form.
    Click Element    ${transfer_funds_submit_button}
    Sleep    2s