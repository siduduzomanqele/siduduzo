*** Keywords ***
check out items
    add to cart
    Execute Javascript  document.querySelectorAll('.checkout_button')[0].click()
    checkout.Your information
    checkout.Checkout Overview
    Execute Javascript  document.querySelectorAll('.cart_button')[0]


Your information
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
    
Checkout Overview 
    Wait Until Page Contains  Checkout: Overview  timeout=5s
    Click Link       xpath=//a[@href="./checkout-complete.html"]
    Wait Until Page Contains  Finish  timeout=5s