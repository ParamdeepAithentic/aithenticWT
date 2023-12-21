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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    sleep   2
    Press Keys     ${message_assetID}       ENTER

Enter contract ID
    [Arguments]     ${option}
    Generic.Enter value into field  ${message_contractID}      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    sleep   2
    Generic.Enter value into field  ${message_contractID}      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
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
    wait until element is visible    //span[normalize-space()='${option}']   60
    click element       //span[normalize-space()='${option}']
#sent/Compose/Inbox

Select compose message pop up option
    [Arguments]     ${option}
    sleep   ${search_sleep}
    wait until element is visible    css:.qa-${option}-send-invite   60
    wait until element is enabled    css:.qa-${option}-send-invite   60
    click element       css:.qa-${option}-send-invite
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
    wait until element is visible    css:.${option}-message-qa   60
    wait until element is enabled    css:.${option}-message-qa   60
    click element       css:.${option}-message-qa
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
    wait until element is visible    css:.${option}-member-qa   60
    click element       css:.${option}-member-qa
    Wait Until Element Is Not Visible    ${loaderIcon}      60
#save/cancel