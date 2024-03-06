*** Settings ***
Documentation   Contains all keyword of  Member page
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot


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



${assignedUser_searchBar}     css:.swarch-assignee-qa
${teamMember_searchBar}     css:.search-member-qa
${upload_Message_Text}     css:.ag-center-cols-container div[col-id='Upload']

${assignedUser_Edit_popUp}         css:#confirmUpload app-confirm-cancel-button

${TeamMember_status}     //td[normalize-space()='Invited']



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
    wait until element is enabled       ${assigneeFname}    60
    input text   ${assigneeFname}   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Create random assignee last name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName${random_string}
    wait until element is visible       ${assigneeLname}    60
    wait until element is enabled       ${assigneeLname}    60
    input text   ${assigneeLname}   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Create random assignee email
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@mailinator.com
    wait until element is visible       ${assigneeEmail}    60
    wait until element is enabled       ${assigneeEmail}    60
    input text   ${assigneeEmail}   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Create random assignee ID
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    ${random_string}
    wait until element is visible       ${assigneeEmpID}    60
    wait until element is enabled       ${assigneeEmpID}    60
    input text   ${assigneeEmpID}   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

Save the add assignee
    [Arguments]    ${option}
    Wait Until Element Is visible    css:div[class='w-100 modal-footer'] button[type='submit']    60
    Wait Until Element Is Enabled    css:div[class='w-100 modal-footer'] button[type='submit']    60
    click element      css:div[class='w-100 modal-footer'] button[type='submit']
    wait until element is not visible      ${loaderIcon}     60

#Click on the button
#    [Arguments]    ${option}
#    Wait Until Element Is Enabled    //button[normalize-space()='${option}']      60
#    click element      //button[normalize-space()='${option}']
#Exit, Check Data, Upload, Confirm

Confirm the exit import process pop appers
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      60

Fetch the assigned user name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    wait until element is enabled       //td[normalize-space()='${option}']     60
    ${fetch_assignedUserFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserFname}
    log to console     AssignedUser_Name=${fetch_assignedUserFname}

Fetch the team member name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    wait until element is enabled       //td[normalize-space()='${option}']     60
    ${fetch_teamMemberFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_teamMemberFname}
    log to console     TeamMember_Name=${fetch_teamMemberFname}

Fetch the assigned empID from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    wait until element is enabled       //td[normalize-space()='${option}']     60
    ${fetch_assignedUserEmpID} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserEmpID}
    log to console     AssignedUser_EmpID=${fetch_assignedUserEmpID}

Fetch the team member updated status from the row
    [Arguments]    ${status}
    wait until element is visible       //td[normalize-space()='${status}']     60
    wait until element is enabled       //td[normalize-space()='${status}']     60
    ${fetch_teamMemberStatus} =    get text    //td[normalize-space()='${status}']
    should be equal    ${fetch_teamMemberStatus}     ${status}

#FirstName,LastName,AssignedEmail,'AssignedEmployeeId'
Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    60
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
    wait until element is enabled      ${teamMember_FirstName}       60
    click element   ${teamMember_FirstName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_FirstName}=    Catenate    TMfirstName_${random_string}
    input text   ${teamMember_FirstName}   ${generate_teamMember_FirstName}
    set global variable    ${generate_teamMember_FirstName}

Enter team member last name
    wait until element is visible      ${teamMember_LastName}       60
    wait until element is enabled      ${teamMember_LastName}       60
    click element   ${teamMember_LastName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_LastName}=    Catenate    TMlastName_${random_string}
    input text   ${teamMember_LastName}   ${generate_teamMember_LastName}
    set global variable    ${generate_teamMember_LastName}

Enter team member business email
    wait until element is visible      ${teamMember_Email}       60
    wait until element is enabled      ${teamMember_Email}       60
    click element   ${teamMember_Email}
    ${random_string} =    Generate Random String       7      [NUMBERS]
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

Click on assigned user tab under team member
    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}    60
    wait until element is visible   //span[normalize-space()='${option}']   60
    wait until element is enabled   //span[normalize-space()='${option}']   60
    click element   //span[normalize-space()='${option}']

Click on action button of assigned users
    wait until element is not visible      ${loaderIcon}    60
    wait until element is visible   css:#Assignee-Actions      60
    wait until element is enabled   css:#Assignee-Actions      60
    click element   css:#Assignee-Actions

Select option from action button of assigned user
    [Arguments]    ${option}
    Generic.click on the button link    ${option}

Enter first name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssigneduserFirstName}=    Catenate    TMFname_${random_string}
    wait until element is visible       css:.qa-AssignedFirstName     60
    wait until element is enabled       css:.qa-AssignedFirstName     60
    input text   css:.qa-AssignedFirstName    ${generated_AssigneduserFirstName}
    log to console      ${generated_AssigneduserFirstName}
    set global variable       ${generated_AssigneduserFirstName}

Enter last name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       css:.qa-AssignedLastName    60
    wait until element is enabled       css:.qa-AssignedLastName    60
    input text   css:.qa-AssignedLastName   ${generated_TMLname}
    log to console      ${generated_TMLname}
    set global variable     ${generated_TMLname}

Enter business email of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       css:.qa-AssignedEmail    60
    input text   css:.qa-AssignedEmail   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}

Click on save button of assigned user
    wait until element is visible   css:.qa-save-assignee-modal     60
    wait until element is enabled   css:.qa-save-assignee-modal     60
    click element   css:.qa-save-assignee-modal

Search assigned user by first name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       60
    wait until element is visible      css:input[placeholder='Search by Assignee Name or Employee Id']     60
    wait until element is enabled      css:input[placeholder='Search by Assignee Name or Employee Id']     60
    click element      css:input[placeholder='Search by Assignee Name or Employee Id']
    input text   css:input[placeholder='Search by Assignee Name or Employee Id']   ${name}
    sleep      ${search_sleep}
    wait until element is visible      //td[normalize-space()='1']      60
    wait until element is visible       css:thead tr       60

Click on three dots of Team Member listing
    wait until element is visible   ${three_dots}   60
    wait until element is enabled   ${three_dots}   60
    click element   ${three_dots}

Select option from three dots of Team Member
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Enter assign to field
    [Arguments]     ${option}
    wait until element is visible   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]   60
    wait until element is enabled   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]   60
    click element   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]
    click element   css:#assignTO
    input text   css:#assignTO   ${option}
    wait until element is visible  //span[normalize-space()='${option}']    60
    click element   //span[normalize-space()='${option}']

Search assigned user by asset id
    [Arguments]    ${name}
    wait until element is visible       css:.table-hover tr       60
    wait until element is visible      css:.search-location-qa     60
    wait until element is enabled      css:.search-location-qa     60
    click element      css:.search-location-qa
    input text   css:.search-location-qa   ${name}
    sleep      ${search_sleep}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible       css:.table-hover tr       60

Click on view button link of assigned user
    wait until element is visible   //td[normalize-space()='View']      60
    wait until element is enabled   //td[normalize-space()='View']      60
    click element   //td[normalize-space()='View']

Verify the first row of asset history under team member
    wait until element is not visible   ${loaderIcon}    60
    wait until element is visible   css:.table-hover    60

Click on refresh icon of asset history under assigned user
    wait until element is visible   css:.reset-search-qa    60
    wait until element is enabled   css:.reset-search-qa    60
    click element   css:.reset-search-qa

verify status of first name in member list of assigned user
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']     60
    wait until element is enabled   //td[normalize-space()='${option}']     60

Double click team member bulk import
    [Arguments]    ${option}
    wait until element is visible      css:.ag-pinned-left-cols-container div[col-id='${option}']   60
    wait until element is enabled      css:.ag-pinned-left-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-pinned-left-cols-container div[col-id='${option}']