*** Keywords ***

Place an Order
    [Arguments]  
    ${file_name}=  Set Variable  ../tests/data/positive/items.csv    
    ${list_of_items}=  csv.Read file  ${file_name}
    ${count}=  Get Length  ${list_of_items}
    log  ${count}

    FOR    ${i}    IN RANGE   ${count}
        ${line}=  Set Variable  ${list_of_items[${i}]}
        Log  ${line}
        ${item}=  Set Variable  ${line}[0]
        wait until element is visible   ${item}  timeout=30s
        Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelector('#${item}').click()
        Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelectorAll('button')[3].click()
        Wait Until Keyword Succeeds  10 sec  2 sec  Click Link  xpath=//a[@href="./cart.html"]
        Wait Until Page Contains  Your Cart  timeout=5s
        ${continue} =  Evaluate  ${i} + 1
        ${checkout} =  Evaluate  ${count} - 1
        Run Keyword If  ${i} < ${checkout}   Execute Javascript  document.querySelectorAll('.btn_secondary')[${continue}].click()
        ...             ELSE   Click Link       xpath=//a[@href="./checkout-step-one.html"]
    END
    Wait Until Page Contains  Checkout: Your Information  timeout=5s
    ${file}=  Set Variable  ../tests/data/positive/customer_details.csv    
    ${customer_details}=  csv.Read file  ${file}
    ${line}=  Set Variable  ${customer_details[0]}
    Log  ${line}
    ${name}=  Set Variable  ${line}[0]
    Input Text  id=first-name   ${name}
    ${last_name}=  Set Variable  ${line}[1]
    Input Text  id=last-name    ${last_name}
    ${postal_code}=  Set Variable  ${line}[2]
    Input Text  id=postal-code   ${postal_code}
    Submit Form
    Wait Until Page Contains  Checkout: Overview  timeout=5s
    Click Link       xpath=//a[@href="./checkout-complete.html"]
    Wait Until Page Contains  Finish  timeout=5s

Item not added to the cart
    ${file_name}=  Set Variable  ../tests/data/negative/items.csv    
    ${list_of_items}=  csv.Read file  ${file_name}
    ${line}=  Set Variable  ${list_of_items[0]}
    Log  ${line}
    ${item}=  Set Variable  ${line}[0]
    Execute Javascript  document.querySelector('#inventory_sidebar_link').click()
    wait until element is visible   ${item}  timeout=30s
    Wait Until Keyword Succeeds  10 sec  2 sec  Click Link  xpath=//a[@href="./cart.html"]
    Wait Until Page Contains  Your Cart  timeout=5s
    ${button_remove}=  Execute Javascript  document.querySelectorAll('.btn_secondary')[0].innerText
    log  ${button_remove}  
    Should Be Equal As Strings    ${button_remove}   REMOVE

