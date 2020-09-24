*** Keywords ***
get list of products from csv file
    [Arguments]  ${file}
    ${file_name}=  Set Variable  ../tests/data/positive/${file}.csv    
    ${list_of_items}=  csv.Read file  ${file_name}
    [Return]  ${list_of_items}

List of products  
    Execute Javascript   document.querySelector('#inventory_sidebar_link').click()

Select Products
    [Arguments]  ${item}  ${index}
    List of products 
    Wait Until Page Contains   Products  timeout=30s
    Wait Until Keyword Succeeds  10 sec  2 sec  Execute Javascript  document.querySelector('#${item}').click()