*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Resource    ../../variables/open_new_account_locators.robot

*** Keywords ***
Open New Account Page
    [Documentation]    Opens the "Open New Account" page.
    Click Element    ${open_new_account_button}
    
Select account type
    [Documentation]    Select account type from dropdown.
    [Arguments]    ${account_label}
    Click Element    ${account_type_dropdown}
    Select From List By Label    ${account_type_dropdown}  ${account_label}
    
Click on submit button
    [Documentation]    Click On Submit Button
    Click Element    ${open_new_account_submit_button}

Get the new account id
    [Documentation]    Get the account id of the newly generated account
    Wait Until Keyword Succeeds    20s  2s  Wait Until Element Is Visible    ${new_account_id_locator}
    ${account_id}=    Get Text    ${new_account_id_locator}
    Set Global Variable    ${ACCOUNT_ID_UI}   ${account_id}
    Create File    new_account_id.txt    ${account_id}
    RETURN    ${account_id}
    