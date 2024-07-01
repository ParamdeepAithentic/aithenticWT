*** Settings ***
Documentation   Contains all keyword of  team member page
Library           SeleniumLibrary
Library           ExcelLibrary
Library           String
Library           Collections
Library           BuiltIn
Library           random
Library           DateTime
Library           OperatingSystem
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
${TMFname}     css:#FirstName
${TMLname}     css:#LastName
${TMBusinessEmail}     css:#Email
${TMDepartmentName}     css:.qa-DepartmentId input

${TMLocation}     css:.qa-LocationTypeId input

${TMRole}     css:.qa-member-role input


${teamMember_Action_btn}     css:#Team-Member-Actions
${name_SearchBar}        //input[@placeholder='Search by Name']
${Dept_SearchBar}       //input[@placeholder='Search by Department Name']
${three_dots}       css:.three-dots


*** Keywords ***
Click on add team member action button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      ${teamMember_Action_btn}      ${wait_time}
    wait until element is enabled      ${teamMember_Action_btn}      ${wait_time}
    sleep   ${search_sleep}
    click element      ${teamMember_Action_btn}

Select option from team member action menu
    wait until element is visible      //a[normalize-space()='Add Member']      ${wait_time}
    wait until element is enabled      //a[normalize-space()='Add Member']      ${wait_time}
    click element      //a[normalize-space()='Add Member']

Choose option after clicking on Action button
    [Arguments]    ${option}
    wait until element is enabled       //a[@title='${option}']
    wait until element is visible       //a[@title='${option}']
    click element       //a[@title='${option}']
    sleep   ${search_sleep}

Enter team member first name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMFname}=    Catenate    TMFname_${random_string}
    wait until element is visible       ${TMFname}     ${wait_time}
    input text   ${TMFname}    ${generated_TMFname}
    log to console      ${generated_TMFname}
    set global variable       ${generated_TMFname}

Enter team member first name self
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       ${TMFname}     ${wait_time}
    input text   ${TMFname}    ${option}

Enter team member last name self
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       ${TMLname}     ${wait_time}
    input text   ${TMLname}    ${option}

Enter team member last name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       ${TMLname}    ${wait_time}
    input text   ${TMLname}   ${generated_TMLname}
    log to console      ${generated_TMLname}
    set global variable  ${generated_TMLname}

Enter team member business email
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       ${TMBusinessEmail}    ${wait_time}
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}
    Set Global Variable    ${generated_TMbusinessEmail}

Enter team member business email self
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    wait until element is visible       ${TMBusinessEmail}    ${wait_time}
    input text   ${TMBusinessEmail}   ${option}

Enter team member business email_mailinator
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@mailinator.com
    wait until element is visible       ${TMBusinessEmail}    ${wait_time}
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}
    Set Global Variable    ${generated_TMbusinessEmail}

Enter team member business email with cool fr nf email
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@cool.fr.nf
    wait until element is visible       ${TMBusinessEmail}    ${wait_time}
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}
    log to console      ${generated_TMbusinessEmail}
    set global variable     ${generated_TMbusinessEmail}


Click on team member department
    wait until element is enabled     ${TMDepartmentName}     ${wait_time}
    wait until element is visible     ${TMDepartmentName}      ${wait_time}
    click element   ${TMDepartmentName}

Click on add here in department field
    [Arguments]    ${option}
    wait until element is not visible       //span[normalize-space()='Please enter a valid Mobile Number']     ${wait_time}
    Sleep       ${search_sleep}
    Generic.click on the tab    ${option}
#    wait until element is visible   //a[normalize-space()='Click here to add']      ${wait_time}
#    wait until element is enabled        //a[normalize-space()='Click here to add']      ${wait_time}
#    click element       //a[normalize-space()='Click here to add']

Select team member department
    [Arguments]    ${option}
    wait until element is visible       ${TMDepartmentName}     ${wait_time}
    input text      ${TMDepartmentName}         ${option}
    Generic.Select parameter        ${option}


Select team member role
    [Arguments]    ${option}
    Generic.Enter value into field  ${TMRole}     ${option}
    Generic.Select parameter        ${option}

Click on team member location
    wait until element is visible     ${TMLocation}     ${wait_time}
    wait until element is enabled     ${TMLocation}      ${wait_time}
    click element   ${TMLocation}

Select team member location
    wait until element is visible     //div[contains (@id, '-2')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-2')]       ${wait_time}
    click element   //div[contains (@id, '-2')]

Save the team member form
    [Arguments]    ${option}
    wait until element is not visible       //span[normalize-space()='Please enter a valid Mobile Number']    ${wait_time}
    wait until element is visible     css:.${option}-member-qa       ${wait_time}
    wait until element is enabled     css:.${option}-member-qa       ${wait_time}
    click element   css:.${option}-member-qa

Enter the Position in member form
    [Arguments]    ${option}
    wait until element is visible       css:#Position       ${wait_time}
    input text      css:#Position       ${option}

Search Team Member by name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      ${name_SearchBar}     ${wait_time}
    click element      ${name_SearchBar}
    Clear Element Text      ${name_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${name_SearchBar}   ${name}
    sleep      ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Click on three dots of Team Member listing
    wait until element is visible   ${three_dots}   ${wait_time}
    click element   ${three_dots}

Select option from three dots of Team Member
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Click on the tab
    [Arguments]         ${option}
    wait until element is visible       css:#member-${option}-tab     ${wait_time}
    click element       css:#member-${option}-tab

Click on the button
    [Arguments]    ${option}
    Generic.Click on the button     ${option}

Search the department name
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      ${Dept_SearchBar}     ${wait_time}
    click element      ${Dept_SearchBar}
    Clear Element Text      ${Dept_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${Dept_SearchBar}   ${name}


Verify resulted row contains Dept_name
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       css:.table.department       ${wait_time}
    sleep       ${search_sleep}
    Table column should contain      css:.table.department      2       ${generated_DepartmentNumber}

Select team member location with new domain
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]


Click on back to member list of member list
    wait until element is visible   css:span[class='back']      ${wait_time}
    click element   css:span[class='back']

Click on search by brand, product and asset id of asset history via team member
    [Arguments]     ${option}
    wait until element is visible   css:.search-location-qa     ${wait_time}
    click element   css:.search-location-qa
    input text  css:.search-location-qa     ${option}

verify status of first name in member list
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']     ${wait_time}

Enter assign to field
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']     ${wait_time}

Verify the first row of asset history under team member
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   css:.table-hover    ${wait_time}

Click on convert to team member confirm pop up
    wait until element is visible   css:.qa-convert-assignee-tm-confirm     ${wait_time}
    wait until element is enabled   css:.qa-convert-assignee-tm-confirm     ${wait_time}
    sleep   ${search_sleep}
    click element   css:.qa-convert-assignee-tm-confirm
    wait until element is not visible       ${shadow}          ${wait_time}

Click on asset history tab under team member
    wait until element is visible    css:.asset-history-qa   ${wait_time}
    wait until element is enabled  css:.asset-history-qa   ${wait_time}
    click element    css:.asset-history-qa

Enter team member business email_mailinator while converting assignee to team member
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessemail}=    Catenate    TMBusinessEmail_${random_string}@mailinator.com
    wait until element is visible       css:#businessEmail    ${wait_time}
    input text   css:#businessEmail   ${generated_TMbusinessemail}
    log to console      ${generated_TMbusinessemail}

Enter the Position in member form while converting assignee to team member
    [Arguments]    ${option}
    wait until element is visible       css:#position       ${wait_time}
    input text      css:#position       ${option}

Select team member role while converting assignee to team member
    [Arguments]    ${option}
    Generic.Enter value into field  css:#userRole     ${option}
    Generic.Select parameter        ${option}

Click on details tab under team member
    wait until element is visible   css:.member-details-qa      ${wait_time}
    wait until element is enabled   css:.member-details-qa      ${wait_time}
    click element   css:.member-details-qa

Select team member status while converting assignee to team member
    [Arguments]    ${option}
    wait until element is visible       css:#status     ${wait_time}
    click element   css:#status
    input text   css:#status   ${option}
    Generic.Select parameter     ${option}

Create random employee id
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_memberEmpID}=    Catenate    ${random_string}
    wait until element is visible       css:#employeeId    ${wait_time}
    wait until element is enabled       css:#employeeId    ${wait_time}
    input text   css:#employeeId   ${generated_memberEmpID}
    set global variable    ${generated_memberEmpID}

Download the selected extension file of team member
    [Arguments]    ${option}
    wait until element is visible  //a[normalize-space()='Export as ${option}']     ${wait_time}
    wait until element is enabled   //a[normalize-space()='Export as ${option}']     ${wait_time}
    click element   //a[normalize-space()='Export as ${option}']
#    sleep   ${search_sleep}
    Wait Until Element Is Not Visible    //a[normalize-space()='Export as ${option}']      ${wait_time}


#Verify the status of team member
#    [Arguments]    ${option}
#    wait until element is visible       css:thead tr       ${wait_time}
#    wait until element is enabled      //tbody//tr[1]//td[6]     ${wait_time}
#    ${status_text}=     Get text        //tbody//tr[1]//td[6]
#    Log To Console      ${status_text}
#    Set Global Variable         ${status_text}
#    Should Be Equal    ${status_text}       ${option}

Enter team member first name while editing
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Tmfname}=    Catenate    tmfname_${random_string}
    wait until element is visible       css:#firstName     ${wait_time}
    input text   css:#firstName    ${generated_Tmfname}
    log to console      ${generated_Tmfname}
    set global variable       ${generated_Tmfname}

Enter team member last name while editing
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Tmlname}=    Catenate    TMLast_${random_string}
    wait until element is visible       css:#lastName    ${wait_time}
    input text   css:#lastName   ${generated_Tmlname}
    log to console      ${generated_Tmlname}
    set global variable  ${generated_Tmlname}

Click on remove option under three dots
    wait until element is visible       css:.member-remove-qa    ${wait_time}
    wait until element is visible       css:.member-remove-qa   ${wait_time}
    click element       css:.member-remove-qa

Select option from remove TM warning pop-up
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.confirm-${option}-members-qa       ${wait_time}
    wait until element is enabled       css:.confirm-${option}-members-qa       ${wait_time}
    click element       css:.confirm-${option}-members-qa
    TeamMemberPage.Close the remove warning pop-up

Close the remove warning pop-up
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //h5[normalize-space()='Remove Team-Member']//parent::div//button[contains(@class,'close')]      ${wait_time}
    wait until element is enabled      //h5[normalize-space()='Remove Team-Member']//parent::div//button[contains(@class,'close')]        ${wait_time}
    click element       //h5[normalize-space()='Remove Team-Member']//parent::div//button[contains(@class,'close')]

Verify Team member added after delete
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //td[normalize-space()='${option}']     ${wait_time}