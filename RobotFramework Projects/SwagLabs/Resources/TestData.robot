*** Settings ***
Resource  ../Resources/PageObjects.robot

*** Variables ***
# Test Data Variables
${USERNAME_LOGIN}            standard_user
${PASSWORD_LOGIN}            secret_sauce
@{PRODUCT_NAMES_LIST}        Sauce Labs Backpack  Sauce Labs Bike Light  Sauce Labs Bolt T-Shirt
...                          Sauce Labs Fleece Jacket  Sauce Labs Onesie  Test.allTheThings() T-Shirt (Red)
@{DROPDOWN_VALUES_LIST}      Name (A to Z)  Name (Z to A)  Price (low to high)  Price (high to low)
@{MENU_VALUES_LIST}          All Items  About  Logout  Reset App State
@{PRODUCT_EXPECTED_LIST}     Test.allTheThings() T-Shirt (Red)  Sauce Labs Onesie  Sauce Labs Fleece Jacket  Sauce Labs Bolt T-Shirt
...                          Sauce Labs Bike Light  Sauce Labs Backpack
@{PRICE_ASC_EXPECTED_LIST}   $7.99  $9.99  $15.99  $15.99  $29.99  $49.99
@{PRICE_DES_EXPECTED_LIST}   $49.99  $29.99  $15.99  $15.99  $9.99  $7.99
