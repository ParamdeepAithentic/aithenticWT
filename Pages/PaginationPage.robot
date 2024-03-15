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
Wait till table get loaded
    wait until element is visible       //td[normalize-space()='1']      60
    wait until element is enabled       //td[normalize-space()='1']      60

Click on the pagination dropdown
    wait until element is visible   ${GetDropDown_count}      60
    wait until element is enabled   ${GetDropDown_count}       60
    click element       ${GetDropDown_count}


Select the value from the pagination drop down count
    [Arguments]    ${option}
    wait until element is visible   //span[normalize-space()='${option}']       60
    wait until element is enabled   //span[normalize-space()='${option}']        60
    click element       //span[normalize-space()='${option}']


Fetch the selected value of the dropdown
    ${get_count_of_dropDown_value} =    get text    ${GetDropDown_count}
    ${dropDown_value_as_number}=   Convert To Integer   ${get_count_of_dropDown_value}
    set global variable    ${dropDown_value_as_number}
    Log to console  Selected value :${dropDown_value_as_number}


Get count of total rows
    wait until element is visible       //td[normalize-space()='1']      60
    wait until element is enabled       //td[normalize-space()='1']      60
    ${elements} =  Get WebElements     ${TotalRow_count}
    ${row_count} =    Get Length    ${elements}
    set global variable    ${row_count}


Fetch the total count
    wait until element is enabled       ${Totalcount_field}      60
    wait until element is visible   ${Totalcount_field}      60
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_count}    Get Substring    ${parts[1]}    3
    Log to console  Total count is :${total_count}

Scroll within the element
    [Arguments]    ${option}
    Execute JavaScript    document.querySelector('tbody tr:nth-child(${option}) td:nth-child(1)').scrollIntoView(true);

