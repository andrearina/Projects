*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../Resources/Resources.robot

*** Keywords ***

Open Swag Labs Site
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    ${arg1}=    Set Variable    --disable-features=PasswordLeakDetection
    Call Method    ${options}    add_argument    ${arg1}

    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Wait Until Element Is Visible  ${LOGIN_PAGE_TITLE}  timeout=10s

Enter User Credentials
    Input Text    ${USERNAME_TEXTFIELD}    ${USERNAME_LOGIN}
    Input Text    ${PASSWORD_TEXTFIELD}    ${PASSWORD_LOGIN}
    Click Element    ${LOGIN_BTN}

Login To Swag Labs Site
    Open Swag Labs Site
    Enter User Credentials
    Wait Until Element Is Visible  ${HOME_PAGE_TITLE}  timeout=10s

Logout Of Swag Labs Site
    Wait Until Element Is Visible  ${MENU_BUTTON}  timeout=10s
    Click Element  ${MENU_BUTTON}
    Click Element  ${LOGOUT_TEXT}
    Wait Until Element Is Visible  ${LOGIN_PAGE_TITLE}  timeout=10s

Close Swag Labs Site
    [Documentation]
    Run Keyword And Ignore Error    Logout Of Swag Labs Site
    Close All Browsers

Verify If Element Is Visible
    [Arguments]  ${element}
        Wait Until Element Is Visible  ${element}  timeout=10s
        Element Should Be Visible  ${element}

Verify Multiple Elements Are Visible
    [Arguments]  ${format}  ${locator}  @{products}
    FOR  ${item}  IN  @{products}
        IF  ${format}
             ${final_locator}=    Replace String    ${locator}    VALUE    ${item}
            Verify If Element Is Visible    ${final_locator}
        ELSE
            Verify If Element Is Visible  ${item}
        END
    END

Verify Products Are Displayed
    [Arguments]  ${format}  ${locator}  @{products}
        Verify Multiple Elements Are Visible    ${format}  ${locator}  @{products}
