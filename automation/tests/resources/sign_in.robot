*** Keywords ***
Login
    [Arguments]  ${username}  ${password}
    wait until element is visible  user-name  timeout=30
    Input Text  id=user-name  ${username}
    Input Text   id=password  ${password}
    Click Button    id=login-button
    Run Keyword If  '${username}' == '${LOCK_USER}'   wait until page contains  Epic sadface: Sorry, this user has been locked out  timeout=5s
    ...             ELSE   wait until element is visible   inventory_container  timeout=10s

    
