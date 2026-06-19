*** Variables ***
${LOGIN_URL}  https://www.saucedemo.com/
${BROWSER}    Chrome

# XPATH Variables
${USERNAME_TEXTFIELD}      //input[@id='user-name']
${PASSWORD_TEXTFIELD}      //input[@id='password']
${LOGIN_BTN}               //input[@id='login-button']
${LOGIN_PAGE_TITLE}        //div[text()='Swag Labs']
${HOME_PAGE_TITLE}         //span[@data-test='title' and text()='Products']
${MENU_BUTTON}             //div[@class='bm-burger-button']
${LOGOUT_TEXT}             //a[@id='logout_sidebar_link']
${PRODUCT_ITEM_NAME}       //div[@class='inventory_item_name ' and text()='VALUE']

# Test Data Variables
${USERNAME_LOGIN}        standard_user
${PASSWORD_LOGIN}        secret_sauce
@{PRODUCT_NAMES_LIST}    Sauce Labs Backpack  Sauce Labs Bike Light  Sauce Labs Bolt T-Shirt
...                      Sauce Labs Fleece Jacket  Sauce Labs Onesie  Test.allTheThings() T-Shirt (Red)
