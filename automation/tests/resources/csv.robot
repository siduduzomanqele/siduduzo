*** Keywords ***
Read file  
    [Arguments]  ${file_name}  ${delimiter}=${CSV_DELIMITER}

    ${file}=    Get File  ${file_name}
    @{lines}=    Split to lines  ${file}
    ${file_results}=   Create List

    FOR    ${line}  IN  @{lines}
       ${words} =	Split String	${line}    ${delimiter}
       Append To List  ${file_results}  ${words}
    END
    
    Log  ${file_results}
    [Return]  ${file_results}