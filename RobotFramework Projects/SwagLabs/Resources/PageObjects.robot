*** Variables ***
${LOGIN_URL}  https://www.saucedemo.com/
${BROWSER}    Chrome

# XPATH Variables
${USERNAME_TEXTFIELD}      //input[@id='user-name']
${PASSWORD_TEXTFIELD}      //input[@id='password']
${LOGIN_BTN}               //input[@id='login-button']
${LOGIN_PAGE_TITLE}        //div[text()='Swag Labs']
${HOME_PAGE_TITLE}         //span[@data-test='title' and text()='Products']
${MENU_BUTTON}             //div[@class='bm-burger-button']//button[@id='react-burger-menu-btn']
${LOGOUT_TEXT}             //a[@data-test='logout-sidebar-link']
${PRODUCT_ITEM_NAME}       //div[@class='inventory_item_name ' and text()='VALUE']
${DROPDOWN_FILTER}         //select[@data-test='product-sort-container']
${DROPDOWN_FILTER_VALUE}   //option[text()='VALUE']
${MENU_FILTER_VALUE}       //a[@id='inventory_sidebar_link' and contains(text(),'VALUE')]
${MENU_FILTER_EXIT_ICON}   //button[@id='react-burger-cross-btn']
${MENU_FILTER_ITEMS}       //a[@id='inventory_sidebar_link']
${MENU_FILTER_ABOUT}       //a[@id='about_sidebar_link']
${MENU_FILTER_LOGOUT}      //a[@id='logout_sidebar_link']
${MENU_FILTER_RESET}       //a[@id='reset_sidebar_link']
