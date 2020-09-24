*** Keywords ***
Clear cart
    Execute Javascript   document.querySelector('#reset_sidebar_link').click()

add to cart
    [Documentation]  Product Name in both Products page and Cart page should be same
    [Arguments]
    ${list_of_items}=  product.get list of products from csv file  items
    ${count}=  Get Length  ${list_of_items}
    log  ${count}
    Clear cart

    FOR    ${i}    IN RANGE   ${count}
        ${line}=  Set Variable  ${list_of_items[${i}]}
        Log  ${line}
        ${item}=  Set Variable  ${line}[0]
        product.Select Products  ${item}  ${i}
 
        Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelectorAll('button')[3].click()
        Wait Until Keyword Succeeds  10 sec  2 sec  Click Link  xpath=//a[@href="./cart.html"]
        Wait Until Page Contains  Your Cart  timeout=5s
        ${number_of_items} =  Evaluate  ${i} + 1
        ${tostring}=  Convert To String   ${number_of_items}   
        Element Text Should Be  class:shopping_cart_badge  ${tostring}
    END

remove items from the cart
    Clear cart
    add to cart
    ${list_of_items}=  product.get list of products from csv file  items
    ${count}=  Get Length  ${list_of_items}
    log  ${count}
    FOR    ${i}    IN RANGE   ${count}
        log  ${i}
        ${item_to_remove} =  Evaluate  ${count} - ${i} - 1
        Run Keyword If  ${i} == 0  Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelectorAll('.cart_button')[${i}].click()
        ...             ELSE   Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelectorAll('.cart_button')[${item_to_remove}].click()
    END
    Page should not contain element  class:shopping_cart_badge

