*** Settings ***
Documentation   Contains all test cases of Team member page
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
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Create team member form
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Select option from team member action menu
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email
    TeamMemberPage.Click on team member department
#    TeamMemberPage.Select team member department
    TeamMemberPage.Select team member department        DepartmentName09041
    TeamMemberPage.Select team member role     CSPM
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save

Add Team member page - Add New Department and assign that department to Team member
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    sleep       ${yop_sleep}
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Select team member department        ${generated_DepartmentNumber}
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}

Edit Team member page - Edit New Department and assign that department to Team member
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    sleep       ${yop_sleep}
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Select team member department        ${generated_DepartmentNumber}
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Details
    TeamMemberPage.Click on the tab         details
    TeamMemberPage.Click on the button      Edit
    Generic.Verify your current page location contains      updatemembers
    TeamMemberPage.Click on add here in department field        Click here to add
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TeamMemberPage.Click on the button      Update
    Generic.Fetch alert message text and compare it with        Team Member updated successfully
    Generic.Verify your current page location contains          memberslist

Verify all i-icon of team member page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on i-icon of team-members tab
    Generic.Verify pop-up is visible after clicking on i-icon
    TeamMemberPage.Click on i-icon of team-members tab
