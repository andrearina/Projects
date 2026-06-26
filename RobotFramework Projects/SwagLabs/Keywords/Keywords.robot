*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../Resources/TestData.robot
Library    Collections

*** Keywords ***

Open Swag Labs Site
    [Documentation]    Opens Chrome browser with disabled password manager and leak detection, then navigates to the login page and waits for page to load.
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
    Mouse Over  ${LOGOUT_TEXT}
    Click Element  ${LOGOUT_TEXT}
    Wait Until Element Is Visible  ${LOGIN_PAGE_TITLE}  timeout=10s

Close Swag Labs Site
    [Documentation]
    Run Keyword And Ignore Error    Logout Of Swag Labs Site
    Close All Browsers

Wait And Click Element
    [Arguments]  ${element}
    Wait Until Element Is Visible  ${element}  timeout=10s
    Click Element  ${element}

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

Verify Items Are Displayed
    [Arguments]  ${format}  ${locator}  @{products}
        Verify Multiple Elements Are Visible    ${format}  ${locator}  @{products}

Verify Dropdown Filter Options Are Displayed
    [Arguments]  @{dropdown_options}
    FOR  ${option}  IN  @{dropdown_options}
        Verify If Element Is Visible  ${DROPDOWN_FILTER}
        Wait And Click Element  ${DROPDOWN_FILTER}
        ${final_locator}=  Replace String  ${DROPDOWN_FILTER_VALUE}  VALUE  ${option}
        Verify If Element Is Visible  ${final_locator}
        Wait And Click Element  ${final_locator}
    END

Verify Menu Button Options Are Displayed
    Wait And Click Element  ${MENU_BUTTON}
    @{MENU_FILTER_ITEMS_LIST}  Create List  ${MENU_FILTER_ITEMS}  ${MENU_FILTER_ABOUT}  ${MENU_FILTER_LOGOUT}  ${MENU_FILTER_RESET}
    Verify Items Are Displayed  ${False}  @{MENU_FILTER_ITEMS_LIST}
    Wait And Click Element  ${MENU_FILTER_EXIT_ICON}

Select Option In Dropdown Filter
    [Arguments]  ${option}
    Verify If Element Is Visible  ${DROPDOWN_FILTER}
    Wait And Click Element  ${DROPDOWN_FILTER}
    ${final_locator}=  Replace String  ${DROPDOWN_FILTER_VALUE}  VALUE  ${option}
    Verify If Element Is Visible  ${final_locator}
    Wait And Click Element  ${final_locator}

Get All Items List
    [Arguments]    ${locator}
    @{elements}    Get WebElements    ${locator}
    @{texts}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${texts}    ${text}
    END
    RETURN    ${texts}

Verify Ascending Or Descending Order Of Products
    [Arguments]  ${product_sort}  ${option}  ${expected_list}
    IF  ${product_sort}
        Select Option In Dropdown Filter  ${option}
        ${actual_list}  Get All Items List  ${PRODUCT_NAME_TEXT}
        Lists Should Be Equal  ${actual_list}  ${expected_list}
    ELSE
        Select Option In Dropdown Filter  ${option}
        ${actual_list}  Get All Items List  ${PRODUCT_PRICE_TEXT}
        Lists Should Be Equal  ${actual_list}  ${expected_list}
    END
