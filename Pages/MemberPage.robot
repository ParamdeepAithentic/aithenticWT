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
${search_bar_assigned_user}     //input[@id='searchbar-assigneelist']

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
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Wait Until Element Is Visible       css:i[title='${option}']    ${wait_time}
     Wait Until Element Is Enabled      css:i[title='${option}']     ${wait_time}
     click element       css:i[title='${option}']

Click on assigned user action button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible       ${assignedUser_ActionBtn}    ${wait_time}
    Wait Until Element Is Enabled      ${assignedUser_ActionBtn}     ${wait_time}
    click element       ${assignedUser_ActionBtn}

Click on team member user action button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible       ${teamMember_ActionBtn}    ${wait_time}
    Wait Until Element Is Enabled      ${teamMember_ActionBtn}     ${wait_time}
    click element       ${teamMember_ActionBtn}

Choose the option from the action menu
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible       //a[contains(text(),'${option}')]    ${wait_time}
    Wait Until Element Is Enabled      //a[contains(text(),'${option}')]     ${wait_time}
    click element       //a[contains(text(),'${option}')]
#Add Assignee, Bulk Edit, Bulk Import

Create random assignee first name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    FName${random_string}
    wait until element is visible       ${assigneeFname}    ${wait_time}
    wait until element is enabled       ${assigneeFname}    ${wait_time}
    input text   ${assigneeFname}   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Create random assignee last name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName${random_string}
    wait until element is visible       ${assigneeLname}    ${wait_time}
    wait until element is enabled       ${assigneeLname}    ${wait_time}
    input text   ${assigneeLname}   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Create random assignee email
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@mailinator.com
    wait until element is visible       ${assigneeEmail}    ${wait_time}
    wait until element is enabled       ${assigneeEmail}    ${wait_time}
    input text   ${assigneeEmail}   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Create random assignee ID
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    ${random_string}
    wait until element is visible       ${assigneeEmpID}    ${wait_time}
    wait until element is enabled       ${assigneeEmpID}    ${wait_time}
    input text   ${assigneeEmpID}   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

Save the add assignee
    [Arguments]    ${option}
    Wait Until Element Is visible    css:div[class='w-100 modal-footer'] button[type='submit']    ${wait_time}
    Wait Until Element Is Enabled    css:div[class='w-100 modal-footer'] button[type='submit']    ${wait_time}
    click element      css:div[class='w-100 modal-footer'] button[type='submit']
    wait until element is not visible      ${loaderIcon}     ${wait_time}
    wait until element is not visible       ${shadow}          ${wait_time}

#Click on the button
#    [Arguments]    ${option}
#    Wait Until Element Is Enabled    //button[normalize-space()='${option}']      ${wait_time}
#    click element      //button[normalize-space()='${option}']
#Exit, Check Data, Upload, Confirm

Confirm the exit import process pop appers
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      ${wait_time}

Fetch the assigned user name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_assignedUserFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserFname}
    log to console     AssignedUser_Name=${fetch_assignedUserFname}

Fetch the team member name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_teamMemberFname} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_teamMemberFname}
    log to console     TeamMember_Name=${fetch_teamMemberFname}

Fetch the assigned empID from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_assignedUserEmpID} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_assignedUserEmpID}
    log to console     AssignedUser_EmpID=${fetch_assignedUserEmpID}

Fetch the team member updated status from the row
    [Arguments]    ${status}
    wait until element is visible       //td[normalize-space()='${status}']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${status}']     ${wait_time}
    ${fetch_teamMemberStatus} =    get text    //td[normalize-space()='${status}']
    should be equal    ${fetch_teamMemberStatus}     ${status}

#FirstName,LastName,AssignedEmail,'AssignedEmployeeId'
Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

#------------------------------------------------------------------------------------------------------------------
Click on team member action button
    Wait Until Element Is Visible       ${teamMember_ActionBtn}    ${wait_time}
    Wait Until Element Is Enabled      ${teamMember_ActionBtn}     ${wait_time}
    click element       ${teamMember_ActionBtn}

Enter team member first name
    wait until element is visible      ${teamMember_FirstName}       ${wait_time}
    wait until element is enabled      ${teamMember_FirstName}       ${wait_time}
    click element   ${teamMember_FirstName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_FirstName}=    Catenate    TMfirstName_${random_string}
    input text   ${teamMember_FirstName}   ${generate_teamMember_FirstName}
    set global variable    ${generate_teamMember_FirstName}

Enter team member last name
    wait until element is visible      ${teamMember_LastName}       ${wait_time}
    wait until element is enabled      ${teamMember_LastName}       ${wait_time}
    click element   ${teamMember_LastName}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generate_teamMember_LastName}=    Catenate    TMlastName_${random_string}
    input text   ${teamMember_LastName}   ${generate_teamMember_LastName}
    set global variable    ${generate_teamMember_LastName}

Enter team member business email
    wait until element is visible      ${teamMember_Email}       ${wait_time}
    wait until element is enabled      ${teamMember_Email}       ${wait_time}
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
    wait until element is not visible       //span[normalize-space()='Please enter a valid Mobile Number']     ${wait_time}
    Wait Until Element Is Visible       css:.${option}-member-qa    ${wait_time}
    Wait Until Element Is Enabled      css:.${option}-member-qa     ${wait_time}
    click element      css:.${option}-member-qa
    wait until element is not visible       ${shadow}          ${wait_time}


#MobileNo,Email,DepartmentName,LocationName,UserRoleName

Click on assigned user tab under team member
    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is visible   //span[normalize-space()='${option}']   ${wait_time}
    wait until element is enabled   //span[normalize-space()='${option}']   ${wait_time}
    sleep   ${search_sleep}
    click element   //span[normalize-space()='${option}']

Click on action button of assigned users
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is visible   css:#Assignee-Actions      ${wait_time}
    wait until element is enabled   css:#Assignee-Actions      ${wait_time}
    sleep   ${search_sleep}
    click element   css:#Assignee-Actions

Select option from action button of assigned user
    [Arguments]    ${option}
    Generic.click on the button link    ${option}

Enter first name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssigneduserFirstName}=    Catenate    TMFname_${random_string}
    wait until element is visible       css:.qa-AssignedFirstName     ${wait_time}
    wait until element is enabled       css:.qa-AssignedFirstName     ${wait_time}
    input text   css:.qa-AssignedFirstName    ${generated_AssigneduserFirstName}
    log to console      ${generated_AssigneduserFirstName}
    set global variable       ${generated_AssigneduserFirstName}

Enter last name of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       css:.qa-AssignedLastName    ${wait_time}
    wait until element is enabled       css:.qa-AssignedLastName    ${wait_time}
    input text   css:.qa-AssignedLastName   ${generated_TMLname}
    log to console      ${generated_TMLname}
    set global variable     ${generated_TMLname}

Enter business email of assigned users
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       css:.qa-AssignedEmail    ${wait_time}
    input text   css:.qa-AssignedEmail   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}

Click on save button of assigned user
    wait until element is visible   css:.qa-save-assignee-modal     ${wait_time}
    wait until element is enabled   css:.qa-save-assignee-modal     ${wait_time}
    click element   css:.qa-save-assignee-modal

Search assigned user by first name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      css:input[placeholder='Search by Assignee Name or Employee Id']     ${wait_time}
    wait until element is enabled      css:input[placeholder='Search by Assignee Name or Employee Id']     ${wait_time}
    click element      css:input[placeholder='Search by Assignee Name or Employee Id']
    input text   css:input[placeholder='Search by Assignee Name or Employee Id']   ${name}
    sleep      ${search_sleep}
    wait until element is visible      //td[contains(text(),'${name}')]      ${wait_time}
    wait until element is enabled      //td[contains(text(),'${name}')]      ${wait_time}
    wait until element is visible      //td[normalize-space()='1']      ${wait_time}
    wait until element is enabled      //td[normalize-space()='1']      ${wait_time}
    wait until element is visible       css:thead tr       ${wait_time}

Click on three dots of Team Member listing
    wait until element is visible   ${three_dots}   ${wait_time}
    wait until element is enabled   ${three_dots}   ${wait_time}
    click element   ${three_dots}

Select option from three dots of Team Member
    [Arguments]     ${option}
    Generic.Select simple option from profile list       ${option}

Enter assign to field
    [Arguments]     ${option}
    wait until element is visible   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]   ${wait_time}
    wait until element is enabled   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]   ${wait_time}
    click element   //ng-select[contains(@placeholder,'Select Assignee')]//span[contains(@title,'Clear all')]
    click element   css:#assignTO
    input text   css:#assignTO   ${option}
    wait until element is visible  //span[normalize-space()='${option}']    ${wait_time}
    click element   //span[normalize-space()='${option}']

Search assigned user by asset id
    [Arguments]    ${name}
    wait until element is visible       css:.table-hover tr       ${wait_time}
    wait until element is visible      css:.search-location-qa     ${wait_time}
    wait until element is enabled      css:.search-location-qa     ${wait_time}
    click element      css:.search-location-qa
    input text   css:.search-location-qa   ${name}
    sleep      ${search_sleep}
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible       css:.table-hover tr       ${wait_time}

Click on view button link of assigned user
    wait until element is visible   //td[normalize-space()='View']      ${wait_time}
    wait until element is enabled   //td[normalize-space()='View']      ${wait_time}
    click element   //td[normalize-space()='View']

Verify the first row of asset history under team member
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   css:.table-hover    ${wait_time}

Click on refresh icon of asset history under assigned user
    wait until element is visible   css:.reset-search-qa    ${wait_time}
    wait until element is enabled   css:.reset-search-qa    ${wait_time}
    click element   css:.reset-search-qa

verify status of first name in member list of assigned user
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled   //td[normalize-space()='${option}']     ${wait_time}

Double click team member bulk import
    [Arguments]    ${option}
    wait until element is visible      css:.ag-pinned-left-cols-container div[col-id='${option}']   ${wait_time}
    wait until element is enabled      css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-pinned-left-cols-container div[col-id='${option}']

Click on confirm button under remove pop up of assigned user
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible      //div[contains(@id,'remove-assignee')]//div[contains(@class,'modal-body')]//following-sibling::button[normalize-space()='Confirm']        ${wait_time}
    wait until element is enabled     //div[contains(@id,'remove-assignee')]//div[contains(@class,'modal-body')]//following-sibling::button[normalize-space()='Confirm']        ${wait_time}
    click element       //div[contains(@id,'remove-assignee')]//div[contains(@class,'modal-body')]//following-sibling::button[normalize-space()='Confirm']
    sleep   ${search_sleep}

Search assigned user by static first name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      css:input[placeholder='Search by Assignee Name or Employee Id']     ${wait_time}
    wait until element is enabled      css:input[placeholder='Search by Assignee Name or Employee Id']     ${wait_time}
    click element      css:input[placeholder='Search by Assignee Name or Employee Id']
    input text   css:input[placeholder='Search by Assignee Name or Employee Id']   ${name}
    sleep      ${search_sleep}

Verify the search static member
    [Arguments]    ${option}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //td[normalize-space()='${option}']   ${wait_time}
    Set Global Variable    ${status}
    RETURN    ${status}


Get new assignee
    [Arguments]         ${option}
    Run Keyword If    ${status} == True
        ...    MemberPage.Skip case
        ...    ELSE  Run Keywords     MemberPage.Create the Assignee     ${option}       ${option1}      ${option2}      ${option3}
        ...    AND    Return From Keyword


Skip case
     log   Element is already there

Create the Assignee
    [Arguments]         ${option}       ${option1}      ${option2}      ${option3}
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of static assigned users        ${option}
    MemberPage.Enter last name of static assigned users         ${option1}
    MemberPage.Enter business email of static assigned users        ${option2}
    MemberPage.Create static assign to employee_ID    ${option3}
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully


Enter first name of static assigned users
    [Arguments]     ${option}
    wait until element is visible       css:.qa-AssignedFirstName     ${wait_time}
    wait until element is enabled       css:.qa-AssignedFirstName     ${wait_time}
    click element       css:.qa-AssignedFirstName
    input text   css:.qa-AssignedFirstName    ${option}

Enter last name of static assigned users
    [Arguments]     ${option1}
    wait until element is visible       css:.qa-AssignedLastName    ${wait_time}
    wait until element is enabled       css:.qa-AssignedLastName    ${wait_time}
    click element   css:.qa-AssignedLastName
    input text   css:.qa-AssignedLastName   ${option1}

Enter business email of static assigned users
    [Arguments]     ${option2}
    wait until element is visible       css:.qa-AssignedEmail    ${wait_time}
    wait until element is enabled       css:.qa-AssignedEmail    ${wait_time}
    click element       css:.qa-AssignedEmail
    input text   css:.qa-AssignedEmail   ${option2}

Create static assign to employee_ID
    [Arguments]     ${option3}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     ${technology_employeeid}         ${wait_time}
    wait until element is enabled     ${technology_employeeid}         ${wait_time}
    click element      ${technology_employeeid}
    input text      ${technology_employeeid}      ${option3}
#    set global variable    ${generate_employeeid}

Enter invalid business email of assigned users
    [Arguments]     ${option}
    wait until element is visible       css:.qa-AssignedEmail    ${wait_time}
    wait until element is visible       css:.qa-AssignedEmail    ${wait_time}
    click element   css:.qa-AssignedEmail
    input text   css:.qa-AssignedEmail   ${option}

Clear the data of the field under member page
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:#${option}       ${wait_time}
    click element     css:#${option}
    Press Keys    css:#${option}     CONTROL+A
    FOR    ${i}    IN RANGE    20
        Press Keys    css:#${option}     BACKSPACE
    END



Create random assignee email not link with fist name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeemail}=    Catenate    Businessemail${random_string}@yopmail.net
    wait until element is visible       ${assigneeEmail}    ${wait_time}
    wait until element is enabled       ${assigneeEmail}    ${wait_time}
    input text   ${assigneeEmail}   ${generated_assigneeemail}
    set global variable    ${generated_assigneeemail}

Verify the visibilty of same user exist validation
    wait until element is visible       //div[contains(text(), 'Same user name already exists ')]    ${wait_time}
    wait until element is enabled       //div[contains(text(), 'Same user name already exists ')]    ${wait_time}

Click on the save button of add assignee pop up if user is same
    [Arguments]     ${option}
    Wait Until Element Is visible    //button[@id='${option}-assignee-modal']    ${wait_time}
    Wait Until Element Is Enabled   //button[@id='${option}-assignee-modal']    ${wait_time}
    click element      //button[@id='${option}-assignee-modal']
    sleep       2
    wait until element is not visible      ${loaderIcon}     ${wait_time}
#    wait until element is not visible       ${shadow}          ${wait_time}


Verify the visibilty of same user exist validation for cancel button
    wait until element is visible       //div[contains(text(),' Employee Id is missing.')]    ${wait_time}
    wait until element is enabled       //div[contains(text(),' Employee Id is missing.')]

Click on the edit option under three dots of member
    Wait Until Element Is visible   css:.assignee-edit-qa    ${wait_time}
    Wait Until Element Is Enabled   css:.assignee-edit-qa    ${wait_time}
    click element     css:.assignee-edit-qa


Clear the element text in search bar of assigned user
    Wait Until Element Is visible   css:input[placeholder='Search by Assignee Name or Employee Id']    ${wait_time}
    Wait Until Element Is Enabled   css:input[placeholder='Search by Assignee Name or Employee Id']    ${wait_time}
    clear element text      css:input[placeholder='Search by Assignee Name or Employee Id']

