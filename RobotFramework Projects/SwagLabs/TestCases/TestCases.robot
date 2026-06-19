*** Settings ***
Library        SeleniumLibrary
Library        String
Resource      ../Keywords/Keywords.robot

Test Setup      Login To Swag Labs Site
Test Teardown   Close Swag Labs Site
    
*** Test Cases ***
TC01: Verify User Can Log In and Access the Products Page
    Verify Products Are Displayed  ${True}  ${PRODUCT_ITEM_NAME}  @{PRODUCT_NAMES_LIST} 
