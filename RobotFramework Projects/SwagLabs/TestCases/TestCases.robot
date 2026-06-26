*** Settings ***
Library        SeleniumLibrary
Library        String
Resource      ../Keywords/Keywords.robot

Test Setup      Login To Swag Labs Site
Test Teardown   Close Swag Labs Site
    
*** Test Cases ***
TC01: Verify User Can Log In And Access The Products Page
    [Documentation]  Verify successful login and validate the Products page elements.
    Verify Items Are Displayed  ${True}  ${PRODUCT_ITEM_NAME}  @{PRODUCT_NAMES_LIST}
    Verify Dropdown Filter Options Are Displayed  @{DROPDOWN_VALUES_LIST}
    Verify Menu Button Options Are Displayed

TC02: Verify Product Sorting By Name And Price
    [Documentation]  Verifies that the product list is sorted correctly using all available filter options.
    Verify Ascending Or Descending Order Of Products  True     Name (A to Z)         ${PRODUCT_NAMES_LIST}
    Verify Ascending Or Descending Order Of Products  True     Name (Z to A)         ${PRODUCT_EXPECTED_LIST}
    Verify Ascending Or Descending Order Of Products  False    Price (low to high)   ${PRICE_ASC_EXPECTED_LIST}
    Verify Ascending Or Descending Order Of Products  False    Price (high to low)   ${PRICE_DES_EXPECTED_LIST}
