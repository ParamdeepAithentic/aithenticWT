*** Settings ***
Documentation   Contains all keyword of Subscription page
Library         SeleniumLibrary
Library         ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Resource        ../Pages/Generic.robot
Resource        ../Pages/DashboardPage.robot
Resource        ../Pages/DepartmentPage.robot
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/LoginPage.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot
Resource        ../Pages/PaginationPage.robot

*** Variables ***
${TotalRow_count}       css:.table.table-hover tr.table-row
${GetDropDown_count}     css:.qa-technology-per-page .ng-value span.ng-value-label
${Totalcount_field}        css:.qa-total-count-list
${Totalcount_field1}        (//p[contains(@class,'qa-total-count-list')])[2]
${saveBTN1}         css:button[class='btn button-green']

*** Keywords ***

Check the table get load
    wait until element is visible       (//td[normalize-space()='1'])[1]      ${wait_time}
    wait until element is enabled       (//td[normalize-space()='1'])[1]      ${wait_time}

Click on the pagination dropdown
    [Arguments]     ${option}
    wait until element is visible   css:.qa-${option}-per-page .ng-value span.ng-value-label      ${wait_time}
    wait until element is enabled   css:.qa-${option}-per-page .ng-value span.ng-value-label      ${wait_time}
    click element       css:.qa-${option}-per-page .ng-value span.ng-value-label


Select the value from the pagination drop down count
    [Arguments]    ${option}
    wait until element is visible   //span[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled   //span[normalize-space()='${option}']        ${wait_time}
    click element       //span[normalize-space()='${option}']


Fetch the selected value of the dropdown
    [Arguments]     ${option}
    wait until element is visible       (//td[normalize-space()='1'])[1]      ${wait_time}
    wait until element is enabled       (//td[normalize-space()='1'])[1]      ${wait_time}
    ${get_count_of_dropDown_value} =    get text    css:.qa-${option}-per-page .ng-value span.ng-value-label
    ${dropDown_value_as_number}=   Convert To Integer   ${get_count_of_dropDown_value}
    set global variable    ${dropDown_value_as_number}
    Log to console  Selected value :${dropDown_value_as_number}


Get count of total rows
    wait until element is visible       (//td[normalize-space()='1'])[1]      ${wait_time}
    wait until element is enabled       (//td[normalize-space()='1'])[1]      ${wait_time}
    ${elements} =  Get WebElements     ${TotalRow_count}
    ${row_count} =    Get Length    ${elements}
    ${total_table_row_count}=   Convert To Integer   ${row_count}
    set global variable    ${total_table_row_count}


Fetch the total count
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is enabled       ${Totalcount_field}      ${wait_time}
    wait until element is visible   ${Totalcount_field}      ${wait_time}
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_row_count}    Get Substring    ${parts[1]}    3
    ${total_data_count}=   Convert To Integer   ${total_row_count}
    Log to console  Total count is :${total_data_count}
    set global variable    ${total_data_count}



Verify Pagination and Row Count
    Run Keyword If    '${dropDown_value_as_number}' == '${total_table_row_count}'
    ...    Run Keywords
    ...    Scroll within the element    ${dropDown_value_as_number}
    ...    AND    Return From Keyword

    Run Keyword If    '${total_table_row_count}' == '${total_data_count}'
    ...    Run Keywords     PaginationPage.Fetch the total count    AND
    ...    Scroll within the element    ${total_table_row_count}
    ...    AND    Return From Keyword

Scroll within the element
    [Arguments]    ${option}
    Execute JavaScript    document.querySelector('tbody tr:nth-child(${option}) td:nth-child(1)').scrollIntoView(true);
    wait until element is visible       //td[normalize-space()='${option}']      ${wait_time}

Log WebElements
    [Arguments]     ${option}
    ${elements} =    Get WebElements    //div[contains(@class, 'scroll-host')]//span
    ${element_count} =    Get Length    ${elements}
    FOR    ${index}    IN RANGE    0    ${element_count}
        wait until element is visible     //div[contains (@id, '-${index}')]       ${wait_time}
        wait until element is enabled     //div[contains (@id, '-${index}')]       ${wait_time}
        click element   //div[contains (@id, '-${index}')]
        Run Keywords    Fetch the selected value of the dropdown  ${option}   AND      Check the table get load       AND      Get count of total rows     AND     Verify Pagination and Row Count     AND     PaginationPage.Fetch the total count   AND     Click on the pagination dropdown  ${option}
    END


#############################################################################################################################################


Fetch the selected value of the product dropdown
    [Arguments]     ${option}
    wait until element is visible       //tbody/tr[1]      ${wait_time}
    wait until element is enabled       //tbody/tr[1]      ${wait_time}
    ${get_count_of_dropDown_value} =    get text    css:.qa-${option}-per-page .ng-value span.ng-value-label
    ${dropDown_value_as_number}=   Convert To Integer   ${get_count_of_dropDown_value}
    set global variable    ${dropDown_value_as_number}
    Log to console  Selected value :${dropDown_value_as_number}

Check the table get load of product dropdown
    wait until element is visible       //tbody/tr[1]      ${wait_time}
    wait until element is enabled       //tbody/tr[1]      ${wait_time}

Log WebElements of Product Dropdown
    [Arguments]     ${option}
    ${elements} =    Get WebElements    //div[contains(@class, 'scroll-host')]//span
    ${element_count} =    Get Length    ${elements}
    FOR    ${index}    IN RANGE    0    ${element_count}
        wait until element is visible     //div[contains (@id, '-${index}')]       ${wait_time}
        wait until element is enabled     //div[contains (@id, '-${index}')]       ${wait_time}
        click element   //div[contains (@id, '-${index}')]
        Run Keywords    Fetch the selected value of the product dropdown     ${option}   AND      Check the table get load of product dropdown      AND      Get count of total rows from Product Dropdown     AND     Verify Pagination and Row Count for product dropdown     AND     PaginationPage.Fetch the total count   AND     Click on the pagination dropdown  ${option}
    END


Get count of total rows from Product Dropdown
    wait until element is visible       //tbody/tr[1]      ${wait_time}
    wait until element is enabled       //tbody/tr[1]      ${wait_time}
    ${elements} =  Get WebElements     ${TotalRow_count}
    ${row_count} =    Get Length    ${elements}
    ${total_table_row_count}=   Convert To Integer   ${row_count}
    set global variable    ${total_table_row_count}

Verify Pagination and Row Count for product dropdown
    Run Keyword If    '${dropDown_value_as_number}' == '${total_table_row_count}'
    ...    Run Keywords
    ...    Scroll within the element of product dropdown    ${dropDown_value_as_number}
    ...    AND    Return From Keyword

    Run Keyword If    '${total_table_row_count}' == '${total_data_count}'
    ...    Run Keywords     PaginationPage.Fetch the total count    AND
    ...    Scroll within the element of product dropdown    ${total_table_row_count}
    ...    AND    Return From Keyword


Scroll within the element of product dropdown
    [Arguments]    ${option}
    Execute JavaScript    document.querySelector('tbody tr:nth-child(${option}) td:nth-child(1)').scrollIntoView(true);
    wait until element is visible       //tbody/tr[${option}]      ${wait_time}

Close the advance Search pop-up
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[@id='advanceSearchPopup']//button//span[normalize-space()='×']    ${wait_time}
    Wait Until Element Is Enabled    //div[@id='advanceSearchPopup']//button//span[normalize-space()='×']     ${wait_time}
    Click Element    //div[@id='advanceSearchPopup']//button//span[normalize-space()='×']

Clear the brand from brand input field
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //ng-select[@id='BrandName']//span[@title='Clear all']    ${wait_time}
    Wait Until Element Is Enabled    //ng-select[@id='BrandName']//span[@title='Clear all']     ${wait_time}
    Click Element    //ng-select[@id='BrandName']//span[@title='Clear all']
    sleep  ${search_sleep}

Fetch the total count of OCS
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is enabled       ${Totalcount_field1}      ${wait_time}
    wait until element is visible   ${Totalcount_field1}      ${wait_time}
    ${text}=     get text   ${Totalcount_field1}
    ${parts}    Split String    ${text}    Total Count :
    ${total_row_count}    Get Substring    ${parts[1]}    3
    ${total_data_count}=   Convert To Integer   ${total_row_count}
    Log to console  Total count is :${total_data_count}
    set global variable    ${total_data_count}

Click on the pagination dropdown of OCS
    [Arguments]     ${option}
    wait until element is visible   (//ng-select[contains(@class,'qa-${option}-per-page')]//span[contains(@class,'ng-value-label')])[2]      ${wait_time}
    wait until element is enabled   (//ng-select[contains(@class,'qa-${option}-per-page')]//span[contains(@class,'ng-value-label')])[2]      ${wait_time}
    click element       (//ng-select[contains(@class,'qa-${option}-per-page')]//span[contains(@class,'ng-value-label')])[2]

Log WebElements of Product Dropdown of OCS
   [Arguments]     ${option}
    ${elements} =    Get WebElements    //div[contains(@class, 'scroll-host')]//span
    ${element_count} =    Get Length    ${elements}
    FOR    ${index}    IN RANGE    0    ${element_count}
        wait until element is visible     //div[contains (@id, '-${index}')]       ${wait_time}
        wait until element is enabled     //div[contains (@id, '-${index}')]       ${wait_time}
        click element   //div[contains (@id, '-${index}')]
        Run Keywords   Fetch the selected value of the product dropdown of OCS     ${option}   AND      Check the table get load of product dropdown      AND      Get count of total rows from Product Dropdown     AND     Verify Pagination and Row Count for product dropdown     AND     Fetch the total count of OCS   AND     Click on the pagination dropdown of OCS  ${option}
    END

Fetch the selected value of the product dropdown of OCS
    [Arguments]     ${option}
    wait until element is visible       //tbody/tr[1]      ${wait_time}
    wait until element is enabled       //tbody/tr[1]      ${wait_time}
    ${get_count_of_dropDown_value} =    get text    (//ng-select[contains(@class,'qa-${option}-per-page')]//span[contains(@class,'ng-value-label')])[2]
    ${dropDown_value_as_number}=   Convert To Integer   ${get_count_of_dropDown_value}
    set global variable    ${dropDown_value_as_number}
    Log to console  Selected value :${dropDown_value_as_number}

Enter the input in the brand field of discovered asset
    wait until element is visible   //div[@class='full-width-field']//ng-select[@id='BrandName']//input[@type='text']      ${wait_time}
    wait until element is enabled   //div[@class='full-width-field']//ng-select[@id='BrandName']//input[@type='text']      ${wait_time}
    click element       //div[@class='full-width-field']//ng-select[@id='BrandName']//input[@type='text']

Select parameter from brand dropdown list of OCS
    [Arguments]    ${option}
    ${StartTime1} =     Get Current Time in Milliseconds
    Clear Element Text     //div[@class='full-width-field']//ng-select[@id='BrandName']//input[@type='text']
    input text    //div[@class='full-width-field']//ng-select[@id='BrandName']//input[@type='text']   ${option}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   Technology Page - Select parameter from brand dropdown list      5    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Click on save technology form button of OCS
    wait until element is visible       ${saveBTN1}       ${wait_time}
    wait until element is enabled       ${saveBTN1}       ${wait_time}
    click element       ${saveBTN1}



    

