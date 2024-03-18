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
Resource        ../Pages/LoginAPI.robot
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

*** Keywords ***

Check the table get load
    wait until element is visible       (//td[normalize-space()='1'])[1]      60
    wait until element is enabled       (//td[normalize-space()='1'])[1]      60

Click on the pagination dropdown
    [Arguments]     ${option}
    wait until element is visible   css:.qa-${option}-per-page .ng-value span.ng-value-label      60
    wait until element is enabled   css:.qa-${option}-per-page .ng-value span.ng-value-label      60
    click element       css:.qa-${option}-per-page .ng-value span.ng-value-label


Select the value from the pagination drop down count
    [Arguments]    ${option}
    wait until element is visible   //span[normalize-space()='${option}']       60
    wait until element is enabled   //span[normalize-space()='${option}']        60
    click element       //span[normalize-space()='${option}']


Fetch the selected value of the dropdown
    [Arguments]     ${option}
    wait until element is visible       (//td[normalize-space()='1'])[1]      60
    wait until element is enabled       (//td[normalize-space()='1'])[1]      60
    ${get_count_of_dropDown_value} =    get text    css:.qa-${option}-per-page .ng-value span.ng-value-label
    ${dropDown_value_as_number}=   Convert To Integer   ${get_count_of_dropDown_value}
    set global variable    ${dropDown_value_as_number}
    Log to console  Selected value :${dropDown_value_as_number}


Get count of total rows
    wait until element is visible       (//td[normalize-space()='1'])[1]      60
    wait until element is enabled       (//td[normalize-space()='1'])[1]      60
    ${elements} =  Get WebElements     ${TotalRow_count}
    ${row_count} =    Get Length    ${elements}
    ${total_table_row_count}=   Convert To Integer   ${row_count}
    set global variable    ${total_table_row_count}


Fetch the total count
    wait until element is enabled       ${Totalcount_field}      60
    wait until element is visible   ${Totalcount_field}      60
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
    ...    Run Keywords     Fetch the total count    AND
    ...    Scroll within the element    ${total_table_row_count}
    ...    AND    Return From Keyword


Scroll within the element
    [Arguments]    ${option}
    Execute JavaScript    document.querySelector('tbody tr:nth-child(${option}) td:nth-child(1)').scrollIntoView(true);
    wait until element is visible       //td[normalize-space()='${option}']      60



Log WebElements
    [Arguments]     ${option}
    ${elements} =    Get WebElements    //div[contains(@class, 'scroll-host')]//span
    ${element_count} =    Get Length    ${elements}
    FOR    ${index}    IN RANGE    0    ${element_count}
        wait until element is visible     //div[contains (@id, '-${index}')]       60
        wait until element is enabled     //div[contains (@id, '-${index}')]       60
        click element   //div[contains (@id, '-${index}')]
        Run Keywords    Fetch the selected value of the dropdown  ${option}   AND      Check the table get load       AND      Get count of total rows     AND     Verify Pagination and Row Count     AND     Fetch the total count   AND     Click on the pagination dropdown  ${option}
    END