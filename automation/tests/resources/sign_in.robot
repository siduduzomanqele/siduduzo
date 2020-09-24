*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    ${present}=  Get Element Attribute  id=inventory_sidebar_link    attribute=href
    Log  ${present}
    Run Keyword If  '${present}' =='https://www.saucedemo.com/inventory.html'  Execute Javascript   document.querySelector('#logout_sidebar_link').click()
    wait until element is visible  user-name  timeout=30
    Input Text  id=user-name  ${username}
    Input Text   id=password  ${password}
    Click Button    id=login-button
    Run Keyword If  '${username}' == '${LOCK_USER}'   wait until page contains  Epic sadface: Sorry, this user has been locked out  timeout=5s
    ...             ELSE   wait until element is visible   inventory_container  timeout=10s

Login required
    Go TO   https://www.saucedemo.com/inventory.html
    wait until page contains  Please login  timeout=5



    
