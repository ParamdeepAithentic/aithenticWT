*** Settings ***
Documentation   Contains all keyword of  Message page
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
Resource        ../Pages/Admin_PanelPage.robot
Resource        ../Pages/PaginationPage.robot
Resource        ../Pages/DisconnectConnectorAPI.robot
Resource        ../Pages/UnselectAssetAPI.robot
*** Variables ***

${message_assetID}     css:#Asset-Id
${message_contractID}     css:#Contract-Id
${message_Recipient}     css:#Recipient_list

${message_status}     css:#message-Status
${message_subject}     css:#ClientMessageSubject
${message_details}     css:#ClientMessageDetail

${team_memeber_lname}     css:#LastName
${team_memeber_deptID}     css:.qa-DepartmentId input
${team_memeber_location}     css:.qa-LocationTypeId input




*** Keywords ***
Enter asset ID
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_assetID}      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   2
    Press Keys     ${message_assetID}       ENTER

Enter contract ID
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_contractID}      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   2
    Generic.Enter value into field  ${message_contractID}      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep       2
    Press Keys     ${message_contractID}       ENTER
    sleep       2

Enter Recipient list
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_Recipient}      ${option}
    sleep   2
    Press Keys     ${message_Recipient}       ENTER
#generateBusinessName

Select side option from message list
    [Arguments]     ${option}
    wait until element is visible    //span[normalize-space()='${option}']   ${wait_time}
    click element       //span[normalize-space()='${option}']
#sent/Compose/Inbox

Select compose message pop up option
    [Arguments]     ${option}
    sleep   ${search_sleep}
    wait until element is visible    css:.qa-${option}-send-invite   ${wait_time}
    wait until element is enabled    css:.qa-${option}-send-invite   ${wait_time}
    click element       css:.qa-${option}-send-invite
    wait until element is not visible       ${shadow}          60
#yes/no

Select message status
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_status}      ${option}
    Press Keys     ${message_status}       ENTER
#public/ private

Enter message subject
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_subject}       ${option}

Enter message details
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_details}       ${option}



Save compose message
    [Arguments]     ${option}
#    sleep   ${search_sleep}
    wait until element is visible    css:.${option}-message-qa   ${wait_time}
    wait until element is enabled    css:.${option}-message-qa   ${wait_time}
    click element       css:.${option}-message-qa
    wait until element is not visible       ${shadow}          60
#send/cancel

Enter team member last name
    [Arguments]     ${option}
    Generic.Enter value into field  ${team_memeber_lname}       ${option}
#phelps
Enter team member department ID
    [Arguments]     ${option}
    Generic.Enter value into field  ${team_memeber_deptID}      ${option}
    Press Keys     ${team_memeber_deptID}       ENTER
#HR
Enter team member location
    [Arguments]     ${option}
    Generic.Enter value into field  ${team_memeber_location}      ${option}
    Press Keys     ${team_memeber_location}       ENTER
#Canada
Save team member
    [Arguments]     ${option}
    wait until element is visible    css:.${option}-member-qa   ${wait_time}
    click element       css:.${option}-member-qa
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          60
#save/cancel

Click on select partner filter from message side bar list
    wait until element is not visible   ${loaderIcon}      ${wait_time}
    wait until element is visible    //tbody      ${wait_time}
    wait until element is visible    css:.partner-filters-qa   ${wait_time}
    wait until element is enabled    css:.partner-filters-qa   ${wait_time}
    click element       css:.partner-filters-qa

Select the filter from partner
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}      ${wait_time}
    wait until element is visible    //div[contains(@class,'SubGroupNew ')]//following-sibling::div//label[normalize-space()=' ${option}']   ${wait_time}
    wait until element is enabled    //div[contains(@class,'SubGroupNew ')]//following-sibling::div//label[normalize-space()=' ${option}']   ${wait_time}
    click element       //div[contains(@class,'SubGroupNew ')]//following-sibling::div//label[normalize-space()=' ${option}']
    sleep       ${search_sleep}
    wait until element is visible      //tbody      ${wait_time}

Fetch and verify the partner type from the table of the message
    wait until element is not visible   ${loaderIcon}      ${wait_time}
    wait until element is visible       (//tbody//td)[4]        ${wait_time}
    wait until element is enabled       (//tbody//td)[4]        ${wait_time}
    ${text}=        Get text        (//tbody//td)[4]            ${wait_time}
    log to console      ${text}
    set global variable     ${text}


Table has no records
    wait until element is not visible   ${loaderIcon}      ${wait_time}
    wait until element is visible       //td//span        ${wait_time}
    wait until element is enabled      //td//span        ${wait_time}
    ${fetch_no_records}=        Get text        //td//span            ${wait_time}
    log to console      ${fetch_no_records}
    set global variable     ${fetch_no_records}

Fetch the country from location filter and click
    [Arguments]     ${option}       ${option1}      ${option2}
#    ${element_count}=    Get Element Count    css:.qa-total-count-list
#    Log      ${element_count}
    TRY
    FOR    ${index}    IN RANGE    1    ${total_count + 1}
        Wait Until Element Is Visible   (//div[normalize-space()='${option}']//following-sibling::div//parent::div//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]      ${wait_time}
        Wait Until Element Is Enabled   (//div[normalize-space()='${option}']//following-sibling::div//parent::div//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]       ${wait_time}
        ${element1}=    Get Text    (//div[normalize-space()='${option}']//following-sibling::div//parent::div//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]
        ${original_string}=    Set Variable    ${element1}
        ${New_Country}=    Evaluate    '${original_string}'.strip()
        Log    Element ${index}: ${New_Country}
        Run Keyword If    '${New_Country}' == '${option2}'    Run Keyword       Continue For Loop
    END
    EXCEPT
        Wait Until Element Is Visible       //span[normalize-space()='No Records']      ${wait_time}
        Log    There is no data in the table
    END

Comapre the total count after selecting filter
    Should be equal     ${total_count_again}        ${total_count}