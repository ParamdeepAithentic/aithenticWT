*** Settings ***
Documentation   Contains all test cases of Member page
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
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
Assigned Users Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      asset-overview
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  23  ${pageHeading}   Page Load - Total Page Load Time of Team Members     23    ${pageTime}     ${ActualTime}    PageLoad_Time

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
    sleep      ${yop_sleep}
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
    sleep       ${search_sleep}
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
    MemberPage.Enter team member department     Do not Delete this Department
    MemberPage.Enter team member location    United States - Main Office - 21 - 2
    MemberPage.Enter team member role   Admin
    MemberPage.Save new team member form    save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    MemberPage.Search team member by first and last name   ${generate_teamMember_FirstName} ${generate_teamMember_LastName}
    MemberPage.Click on team member user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep     ${yop_sleep}
    Switch Window       aithentic | Edit - Members
    Generic.Verify your current page location contains      member-bulk-edit
#    Enter the new value of team member in the first name column

    MemberPage.Enter the new value of team member in the phone number column    MobileNo
    MemberPage.Enter the new value of team member in the email column      Email
    MemberPage.Enter the new value of team member in the department column      DepartmentName
    MemberPage.Enter the new value of team member in the location column        LocationName
    MemberPage.Enter the new value of team member in the role column     UserRoleName
    Generic.Click on the button     Update
    MemberPage.Click employee id box to scroll
    MemberPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Exit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    sleep       ${search_sleep}
    Switch Window       aithentic | Member - List
    MemberPage.Search team member by first and last name    ${generate_teamMember_FirstName} ${generate_teamMember_LastName}

Verify asset history of assigned users
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab under team member      Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_AssigneduserFirstName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    MemberPage.Enter assign to field        Dc Dc
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    MemberPage.Search assigned user by asset id     ${generated_AssetID}
    MemberPage.Click on view button link of assigned user
    Generic.Verify your current page contains this text     Technology

Search asset history with Asset ID of Assigned User
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    ${generated_BrandName}
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_AssigneduserFirstName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    MemberPage.Enter assign to field   Dc Dc
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    MemberPage.Search assigned user by asset id     ${generated_AssetID}
    MemberPage.Verify the first row of asset history under team member
    MemberPage.verify status of first name in member list of assigned user   ${generated_BrandName}
    MemberPage.Click on refresh icon of asset history under assigned user
    MemberPage.Search assigned user by asset id     ${generated_BrandName}
    MemberPage.Verify the first row of asset history under team member
    MemberPage.verify status of first name in member list of assigned user   ${generated_AssetID}
    MemberPage.Click on refresh icon of asset history under assigned user
    MemberPage.Search assigned user by asset id     ${generated_product}
    MemberPage.Verify the first row of asset history under team member
    MemberPage.verify status of first name in member list of assigned user   ${generated_AssetID}

Export Assigned User Asset History list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Search assigned user by first name   Assign_Param Singh_Param
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Testing
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    ${generated_BrandName}
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Add assetID for technology lifecycle information random
    MemberPage.Enter assign to field    Assign_Param Singh_Param
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully