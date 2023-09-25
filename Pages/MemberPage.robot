*** Settings ***
Documentation     Verify the Dashboard page test
Library          SeleniumLibrary
Library           ExcelLibrary
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
Resource        ../Pages/PartnersPage.robot
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
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/MemberPage.robot



*** Variables ***
${assignedUser_ActionBtn}      css:#Assignee-Actions
${teamMember_ActionBtn}      css:#Team-Member-Actions
${add_assigneeBTN}     //a[contains(text(),'Add Assignee')]
${assigneeFname}     css:#AssignedFirstName
${assigneeLname}     css:#AssignedLastName
${assigneeEmail}     css:#AssignedEmail
${assigneeEmpID}     css:#AssignedEmployeeId
${save_assigneeForm}     css:.w-100.modal-footer .button-green

${teamMember_FirstName}     css:#FirstName
${teamMember_LastName}     css:#LastName
${teamMember_Email}     css:#Email

#mobile number - partner code       Choose contact country
#css:.qa-DepartmentId input
#css:.qa-LocationTypeId input
#css:.qa-member-role input



${assignedUser_searchBar}     css:input.swarch-assignee-qa
${teamMember_searchBar}     css:.search-member-qa
${upload_Message_Text}     css:.ag-center-cols-container div[col-id='Upload']

${assignedUser_Edit_popUp}         css:#confirmUpload app-confirm-cancel-button



*** Keywords ***
Click on assigned user tab
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Wait Until Element Is Visible       css:i[title='${option}']    60
     Wait Until Element Is Enabled      css:i[title='${option}']     60
     click element       css:i[title='${option}']

Click on assigned user action button
    Wait Until Element Is Visible       ${assignedUser_ActionBtn}    60
    Wait Until Element Is Enabled      ${assignedUser_ActionBtn}     60
    click element       ${assignedUser_ActionBtn}

Click on team member user action button
    Wait Until Element Is Visible       ${teamMember_ActionBtn}    60
    Wait Until Element Is Enabled      ${teamMember_ActionBtn}     60
    click element       ${teamMember_ActionBtn}

Choose the option from the action menu
    [Arguments]    ${option}
    Wait Until Element Is Visible       //a[contains(text(),'${option}')]    60
    Wait Until Element Is Enabled      //a[contains(text(),'${option}')]     60
    click element       //a[contains(text(),'${option}')]
#Add Assignee, Bulk Edit, Bulk Import

Create random assignee first name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    FName${random_string}
    wait until element is visible       ${assigneeFname}    60
    input text   ${assigneeFname}   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Create random assignee last name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName${random_string}
    wait until element is visible       ${assigneeLname}    60
    input text   ${assigneeLname}   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Create random assignee email
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@mailinator.com
    wait until element is visible       ${assigneeEmail}    60
    input text   ${assigneeEmail}   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Create random assignee ID
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    ${random_string}
    wait until element is visible       ${assigneeEmpID}    60
    input text   ${assigneeEmpID}   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

Save the add assignee
    [Arguments]    ${option}
    Wait Until Element Is Enabled    css:div[class='w-100 modal-footer'] button[type='submit']    60
    click element      css:div[class='w-100 modal-footer'] button[type='submit']
    wait until element is not visible      ${loaderIcon}     60


Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     60
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

#Click on the button
#    [Arguments]    ${option}
#    Wait Until Element Is Enabled    //button[normalize-space()='${option}']      60
#    click element      //button[normalize-space()='${option}']
#Exit, Check Data, Upload, Confirm


Confirm the exit import process pop appers
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      60


Search assigned user by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     wait until element is not visible      ${loaderIcon}     60
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
#     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${assignedUser_searchBar}     ${name}
     sleep   1
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the assigned user name from the row   ${name}
     should be equal    ${fetch_assignedUserFname}     ${name}

Fetch the assigned user name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_assignedUserFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserFname}
    log to console     AssignedUser_Name=${fetch_assignedUserFname}



Search team member by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     wait until element is not visible      ${loaderIcon}     60
     click element      ${teamMember_searchBar}
     Clear Element Text      ${teamMember_searchBar}

     input text   ${teamMember_searchBar}     ${name}
     sleep   1
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the team member name from the row   ${name}
     should be equal    ${fetch_teamMemberFname}     ${name}

Fetch the team member name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_teamMemberFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_teamMemberFname}
    log to console     TeamMember_Name=${fetch_teamMemberFname}


Search by empID
     [Arguments]    ${empID}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     wait until element is not visible      ${loaderIcon}     60
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
#     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${assignedUser_searchBar}     ${empID}
     sleep   1
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the assigned empID from the row   ${empID}
     should be equal    ${fetch_assignedUserEmpID}     ${empID}


Fetch the assigned empID from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_assignedUserEmpID} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserEmpID}
    log to console     AssignedUser_EmpID=${fetch_assignedUserEmpID}


Enter the new value of assigned in the first name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    FName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of assigned in the last name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}



Enter the new value of assigned in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@yopmail.net
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Enter the new value of assigned in the ID column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

#FirstName,LastName,AssignedEmail,'AssignedEmployeeId'
Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

#------------------------------------------------------------------------------------------------------------------
Click on team member action button
    Wait Until Element Is Visible       ${teamMember_ActionBtn}    60
    Wait Until Element Is Enabled      ${teamMember_ActionBtn}     60
    click element       ${teamMember_ActionBtn}

Enter team member first name
    wait until element is visible      ${teamMember_FirstName}       60
    click element   ${teamMember_FirstName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_FirstName}=    Catenate    TMfirstName_${random_string}
    input text   ${teamMember_FirstName}   ${generate_teamMember_FirstName}
    set global variable    ${generate_teamMember_FirstName}

Enter team member last name
    wait until element is visible      ${teamMember_LastName}       60
    click element   ${teamMember_LastName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_LastName}=    Catenate    TMlastName_${random_string}
    input text   ${teamMember_LastName}   ${generate_teamMember_LastName}
    set global variable    ${generate_teamMember_LastName}

Enter team member business email
    wait until element is visible      ${teamMember_Email}       60
    click element   ${teamMember_Email}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_email}=    Catenate    TMemail_${random_string}@mailinator.com
    input text   ${teamMember_Email}   ${generate_teamMember_email}
    set global variable    ${generate_teamMember_email}

Enter team member department
    [Arguments]    ${option}
    Enter value into field  css:.qa-DepartmentId input   ${option}
    Generic.Select parameter    ${option}
Enter team member location
    [Arguments]    ${option}
    Enter value into field   css:.qa-LocationTypeId input   ${option}
    Generic.Select parameter    ${option}
Enter team member role
    [Arguments]    ${option}
    Enter value into field   css:.qa-member-role input   ${option}
    Generic.Select parameter    ${option}


Save new team member form
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.${option}-member-qa    60
    Wait Until Element Is Enabled      css:.${option}-member-qa     60
    click element      css:.${option}-member-qa


#MobileNo,Email,DepartmentName,LocationName,UserRoleName
Enter the new value of team member in the phone number column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    FName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of team member in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Enter the new value of team member in the department column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div
Enter the new value of team member in the location column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div
Enter the new value of team member in the role column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div
