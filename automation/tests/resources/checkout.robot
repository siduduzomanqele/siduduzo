*** Keywords ***
check out items
    add to cart
    Execute Javascript  document.querySelectorAll('.checkout_button')[0].click()
    checkout.Your information
    checkout.Checkout Overview
    Execute Javascript  document.querySelectorAll('.cart_button')[0]


Your information
    Wait Until Page Contains  Checkout: Your Information  timeout=5s
    ${customer_details}=  product.get list of products from csv file  customer_details
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

lastname required
    add to cart
    Execute Javascript  document.querySelectorAll('.checkout_button')[0].click()
    ${customer_details}=  product.get list of products from csv file  customer_details
    ${line}=  Set Variable  ${customer_details[0]}   
    Log  ${line}
    ${name}=  Set Variable  ${line}[0]
    Input Text  id=first-name   ${name}
    ${postal_code}=  Set Variable  ${line}[2]
    Input Text  id=postal-code   ${postal_code}
    Submit Form
    Wait Until Page Contains  Error: Last Name is required  timeout=5s

firstname required
    add to cart
    Execute Javascript  document.querySelectorAll('.checkout_button')[0].click()
    ${customer_details}=  product.get list of products from csv file  customer_details
    ${line}=  Set Variable  ${customer_details[0]} 
    Log  ${line}
    ${last_name}=  Set Variable  ${line}[1]
    Input Text  id=last-name    ${last_name}
    ${postal_code}=  Set Variable  ${line}[2]
    Input Text  id=postal-code   ${postal_code}
    Submit Form
    Wait Until Page Contains  Error: First Name is required  timeout=5s

Postal required
    add to cart
    Execute Javascript  document.querySelectorAll('.checkout_button')[0].click()
    ${customer_details}=  product.get list of products from csv file  customer_details
    ${line}=  Set Variable  ${customer_details[0]}   
    Log  ${line}
    ${name}=  Set Variable  ${line}[0]
    Input Text  id=first-name   ${name}
    ${last_name}=  Set Variable  ${line}[1]
    Input Text  id=last-name    ${last_name}
    Submit Form
    Wait Until Page Contains  Error: Postal Code is required  timeout=5s



