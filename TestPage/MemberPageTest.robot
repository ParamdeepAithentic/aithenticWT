*** Settings ***
Documentation   To validate the Login form
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
Resource        ../Pages/MemberPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
Assigned Users Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  21  ${pageHeading}   Page Load - Total Page Load Time of Team Members     21    ${pageTime}     ${ActualTime}    PageLoad_Time

    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Click on assigned user action button
    MemberPage.Choose the option from the action menu   Add Assignee
    MemberPage.Create random assignee first name
    MemberPage.Create random assignee last name
    MemberPage.Create random assignee email
    MemberPage.Create random assignee ID
    MemberPage.Save the add assignee    save
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first and last name    ${generated_assigneeFname} ${generated_assigneeLname}
    MemberPage.Click on assigned user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep   5
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains      assignee-bulk-edit
    MemberPage.Enter the new value of assigned in the first name column    FirstName
    MemberPage.Enter the new value of assigned in the last name column      LastName
    MemberPage.Enter the new value of assigned in the email column      AssignedEmail
    MemberPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Upload      #Check Data
    MemberPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Exit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    sleep       1
    Switch Window       aithentic | Member - List
    MemberPage.Search assigned user by first and last name    ${generated_assigneeFname} ${generated_assigneeLname}
    MemberPage.Search by empID  ${generated_assigneeEmpID}




Team Member Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Team Members
    MemberPage.Click on team member action button
    MemberPage.Choose the option from the action menu   Add Member
    Generic.Verify your current page location contains      addmembers
    MemberPage.Enter team member first name
    MemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    MemberPage.Enter team member business email
    MemberPage.Enter team member department     HR
    MemberPage.Enter team member location    United States - Main Office - 21 - 2
    MemberPage.Enter team member role   Admin
    MemberPage.Save new team member form    save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    MemberPage.Search team member by first and last name   ${generate_teamMember_FirstName} ${generate_teamMember_LastName}
    MemberPage.Click on team member user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep   5
    Switch Window       aithentic | Edit - Members
    Generic.Verify your current page location contains      member-bulk-edit
#    Enter the new value of team member in the first name column

    MemberPage.Enter the new value of team member in the phone number column    MobileNo
    MemberPage.Enter the new value of team member in the email column      Email
    MemberPage.Enter the new value of team member in the department column      DepartmentName
    MemberPage.Enter the new value of team member in the location column        LocationName
    MemberPage.Enter the new value of team member in the role column     UserRoleName


























