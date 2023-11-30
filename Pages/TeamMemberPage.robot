*** Settings ***
Documentation   Contains all keyword of  team member page
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
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot

*** Variables ***
${TMFname}     css:#FirstName
${TMLname}     css:#LastName
${TMBusinessEmail}     css:#Email
${TMDepartmentName}     css:.qa-DepartmentId input

${TMLocation}     css:.qa-LocationTypeId input

${TMRole}     css:.qa-member-role input


${teamMember_Action_btn}     css:#Team-Member-Actions


*** Keywords ***
Click on add team member action button
    wait until element is visible      ${teamMember_Action_btn}      60
    wait until element is enabled      ${teamMember_Action_btn}      60
    click element      ${teamMember_Action_btn}

Select option from team member action menu
    wait until element is visible      //a[normalize-space()='Add Member']      60
    wait until element is enabled      //a[normalize-space()='Add Member']      60
    click element      //a[normalize-space()='Add Member']

Enter team member first name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMFname}=    Catenate    TMFname_${random_string}
    wait until element is visible       ${TMFname}     60
    input text   ${TMFname}    ${generated_TMFname}


Enter team member last name
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMLname}=    Catenate    TMLast_${random_string}
    wait until element is visible       ${TMLname}    60
    input text   ${TMLname}   ${generated_TMLname}


Enter team member business email
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_TMbusinessEmail}=    Catenate    TMBusinessEmail_${random_string}@yopmail.net
    wait until element is visible       ${TMBusinessEmail}    60
    input text   ${TMBusinessEmail}   ${generated_TMbusinessEmail}


Click on team member department
    wait until element is visible     ${TMDepartmentName}     60
    wait until element is enabled     ${TMDepartmentName}      60
    click element   ${TMDepartmentName}

Select team member department
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

Select team member role
    [Arguments]    ${option}
    Generic.Enter value into field  ${TMRole}     ${option}
    Generic.Select parameter        ${option}


Click on team member location
    wait until element is visible     ${TMLocation}     60
    wait until element is enabled     ${TMLocation}      60
    click element   ${TMLocation}

Select team member location
    wait until element is visible     //div[contains (@id, '-2')]       60
    wait until element is enabled     //div[contains (@id, '-2')]       60
    click element   //div[contains (@id, '-2')]



Save the team member form
    [Arguments]    ${option}
    wait until element is visible     css:.${option}-member-qa       60
    wait until element is enabled     css:.${option}-member-qa       60
    click element   css:.${option}-member-qa


