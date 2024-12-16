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

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
Verify asset history of assigned users
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_AssigneduserFirstName}    ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
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
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_AssigneduserFirstName}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    MemberPage.Enter assign to field   Dc Dc
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    Generic.Wait until table get load
    MemberPage.Click on assigned user tab   Assigned Users
    Generic.Wait until table get load
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
    [Tags]   Smoke     Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Search assigned user by first name   Assign_Param Deep
#    sleep   ${search_sleep}
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Update and delete assignee from side option
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Edit
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users updated successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Remove
    MemberPage.Click on confirm button under remove pop up of assigned user
    Generic.Fetch alert message text and compare it with       Assigned Users deleted successfully

Add_edit_delete_assignee_via_profile_list
    [Tags]    NT
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Assigned Users
    Generic.Verify your current page location contains     assignee-list
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Edit
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users updated successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Remove
    MemberPage.Click on confirm button under remove pop up of assigned user
    Generic.Fetch alert message text and compare it with       Assigned Users deleted successfully

Update and delete assignee from side option but edit via details
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Details
    Generic.click on the button    Edit
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users updated successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Remove
    MemberPage.Click on confirm button under remove pop up of assigned user
    Generic.Fetch alert message text and compare it with       Assigned Users deleted successfully

Add_edit_delete_assignee_via_profile_list_via_details
    [Tags]    NT
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Assigned Users
    Generic.Verify your current page location contains     assignee-list
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Details
    Generic.click on the button    Edit
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users updated successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Remove
    MemberPage.Click on confirm button under remove pop up of assigned user
    Generic.Fetch alert message text and compare it with       Assigned Users deleted successfully

Verify all the validations of Add Assigned Users via technology
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Click on save button of assigned user
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page          Please enter Assignee Name
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page          Please enter Assignee Name
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter invalid business email of assigned users       samuel@yopmail
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page           Please enter valid Business Email
    LoginPage.Clear the element text of field under login page      ${assigneeEmail}
    MemberPage.Enter invalid business email of assigned users       samuelyopmail
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page           Please enter valid Business Email
    LoginPage.Clear the element text of field under login page      ${assigneeEmail}
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_AssigneduserFirstName}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    Generic.Wait until table get load
    MemberPage.Click on assigned user tab   Assigned Users
    Generic.Wait until table get load
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Remove
    MemberPage.Click on confirm button under remove pop up of assigned user
    Generic.Fetch alert message text and compare it with       Assigned Users cannot removed as have assigned items

Verify the validations while edit the assigned user
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Details
    Generic.click on the button    Edit
    MemberPage.Clear the data of the field under member page      AssignedFirstName
    MemberPage.Clear the data of the field under member page      AssignedLastName
    MemberPage.Click on save button of assigned user
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page          Please enter Assignee Name
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page          Please enter Assignee Name

Verify all the validate validations of the assigned user while adding assigned user
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name already exists
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page     AssignedLastName
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visibilty of same user exist validation while adding
    MemberPage.Click on the save button of add assignee pop up if user is same      save
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create static assign to employee_ID      EmployeeID_9001
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page     AssignedLastName
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create static assign to employee_ID      EmployeeID_9001
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Enter invalid business email of assigned users       Johnny@yopmail.net
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & email already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visibilty of same user exist validation for cancel button
    MemberPage.Click on the save button of add assignee pop up if user is same      cancel
    Generic.Verify your current page location contains      memberslist

Verify all the validate validations of the assigned user while edit assigned user
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Click on the edit option under three dots of member
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page      AssignedEmployeeId
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page      AssignedLastName
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Click on save button of assigned user

    Generic.Fetch alert message text and compare it with        Same user name already exists
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visibilty of same user exist validation for cancel button
    MemberPage.Click on the save button of add assignee pop up if user is same      cancel
    MemberPage.Clear the element text in search bar of assigned user
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Click on the edit option under three dots of member
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page      AssignedEmployeeId
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page      AssignedLastName
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create static assign to employee_ID      EmployeeID_9001
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedEmployeeId
    MemberPage.Enter first name of static assigned users       Johnny
    MemberPage.Enter last name of static assigned users       Doe
    MemberPage.Create static assign to employee_ID      EmployeeID_9001
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    MemberPage.Enter invalid business email of assigned users       Johnny@yopmail.net
    LoginPage.Clear the element text of field under login page      AssignedEmployeeId
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & email already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page      AssignedEmployeeId
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visibilty of same user exist validation for cancel button
    MemberPage.Click on the save button of add assignee pop up if user is same      cancel
    Generic.Verify your current page location contains      memberslist

Asset Wizard : Verify the validations of add assigned User
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       Admin, Asset managers and Asset users.
    Generic.click on the button     Next
    MemberPage.Click on assigned user under asset wizard
    Generic.Wait until table get load
    MemberPage.Click on Add assignee button
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    Generic.Wait until table get load
    MemberPage.Click on Add assignee button
    MemberPage.Enter first name of static assigned users       ${generated_AssigneduserFirstName}
    MemberPage.Enter last name of static assigned users       ${generated_TMLname}
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name already exists
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page     AssignedLastName
    MemberPage.Enter first name of static assigned users       ${generated_AssigneduserFirstName}
    MemberPage.Enter last name of static assigned users       ${generated_TMLname}
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visiblity of validation pop-up in asset wizard         Same user name already exists
    MemberPage.Click on the save button of add assignee pop up if user is same      save
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    Generic.Wait until table get load
    MemberPage.Click on Add assignee button
    MemberPage.Enter first name of static assigned users       ${generated_AssigneduserFirstName}
    MemberPage.Enter last name of static assigned users       ${generated_TMLname}
    MemberPage.Enter the static employee id     ${generate_employeeid}
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedFirstName
    LoginPage.Clear the element text of field under login page     AssignedLastName
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Enter first name of static assigned users       ${generated_AssigneduserFirstName}
    MemberPage.Enter last name of static assigned users       ${generated_TMLname}
    MemberPage.Create static assign to employee_ID      ${generate_employeeid}
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & employee Id already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Enter first name of static assigned users       ${generated_AssigneduserFirstName}
    MemberPage.Enter last name of static assigned users       ${generated_TMLname}
    MemberPage.Enter business email of static assigned users       ${generated_TMbusinessEmail}
    TechnologyPage.Create unique assign to employee_ID random
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Same user name & email already exists
    LoginPage.Clear the element text of field under login page      AssignedEmail
    LoginPage.Clear the element text of field under login page    AssignedEmployeeId
    MemberPage.Create random assignee email not link with first name
    MemberPage.Click on save button of assigned user
    MemberPage.Verify the visibilty of same user exist validation for cancel button
    MemberPage.Click on the save button of add assignee pop up if user is same      cancel
    Generic.Verify your current page location contains      member-list