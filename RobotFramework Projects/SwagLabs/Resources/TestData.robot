*** Settings ***
Resource  ../Resources/PageObjects.robot

*** Variables ***
# Test Data Variables
${USERNAME_LOGIN}        standard_user
${PASSWORD_LOGIN}        secret_sauce
@{PRODUCT_NAMES_LIST}    Sauce Labs Backpack  Sauce Labs Bike Light  Sauce Labs Bolt T-Shirt
...                      Sauce Labs Fleece Jacket  Sauce Labs Onesie  Test.allTheThings() T-Shirt (Red)
@{DROPDOWN_VALUES_LIST}  Name (A to Z)  Name (Z to A)  Price (low to high)  Price (high to low)
@{MENU_VALUES_LIST}      All Items  About  Logout  Reset App State
