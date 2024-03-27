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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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
    [Tags]      Sanity
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

Verify team member Asset history
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123

    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     asset-overview
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.verify status of first name in member list   Active
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Asset History

Search asset history with Asset ID
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     asset-overview
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.verify status of first name in member list   Active
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     TMFname_
    TeamMemberPage.Click on back to member list of member list
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    Generic.click on the tab    1
    Generic.Verify your current page location contains      technology-list
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Edit
    Generic.Verify your current page location contains     edit-technology
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to    Milan     Johar
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member  ${generated_AssetID}
    TeamMemberPage.Verify the first row of asset history under team member
    TeamMemberPage.verify status of first name in member list   ${generated_AssetID}

Verify user is able to export team member asset history list
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form   debut@cool.fr.nf    Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Paramdeep@112
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     asset-overview
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.verify status of first name in member list   Active
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       BrandName2994855827

    TechnologyPage.Select parameter from technology dropdown list     Product_321654
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to   Milan     Johar
#    sleep       ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    TeamMemberPage.Click on back to member list of member list
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       BrandName6162258049
    TechnologyPage.Select parameter from technology dropdown list     Product_00123
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to   Milan     Johar
#    sleep       ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    TeamMemberPage.Click on back to member list of member list
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       BrandName07438136700
    TechnologyPage.Select parameter from technology dropdown list     Product_0089
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to   Milan       Johar
#    sleep       ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    TeamMemberPage.Click on back to member list of member list
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       BrandName19312998123
    TechnologyPage.Select parameter from technology dropdown list     Product_00456
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to   Milan     Johar
#    sleep       ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    TeamMemberPage.Click on back to member list of member list
#   TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       BrandName0914413203
    TechnologyPage.Select parameter from technology dropdown list    Product_78965
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information assign to   ${generated_TMFname}       ${generated_TMLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.click on the button link    Edit
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to   Milan     Johar
#    sleep       ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page contains this text             Technology
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_TMFname}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
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
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member  ${generated_AssetID}
    TeamMemberPage.Verify the first row of asset history under team member
    TeamMemberPage.verify status of first name in member list   BrandName0914413203
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member  BrandName0914413203
    TeamMemberPage.Verify the first row of asset history under team member
    TeamMemberPage.verify status of first name in member list   Product_78965
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member   Product_78965
    TeamMemberPage.Verify the first row of asset history under team member
    TeamMemberPage.verify status of first name in member list   ${generated_AssetID}

Convert Assignee to Team Member
    [Tags]    retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    TechnologyPage.Select parameter from brand dropdown list    QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815324
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
    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page location contains      asset-history
    MemberPage.Search assigned user by asset id     ${generated_AssetID}
    TeamMemberPage.Click on back to member list of member list
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Convert to TM
    TeamMemberPage.Click on convert to team member confirm pop up
    Sleep   ${yop_sleep}
    switch window   aithentic | Update - Member
    Generic.Verify your current page location contains      convertmember
    TeamMemberPage.Select team member department        DepartmentName09041
    TeamMemberPage.Enter team member business email_mailinator while converting assignee to team member
    TeamMemberPage.Enter the Position in member form while converting assignee to team member        QA
    Select team member status while converting assignee to team member  Active
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Select team member role while converting assignee to team member    Admin
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields    employeeId
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}       ${generate_employeeid}
    TeamMemberpage.Click on asset history tab under team member
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
    TeamMemberpage.Click on details tab under team member
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_AssigneduserFirstName}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Details
    Generic.Verify your current page contains this text    Team Member Details
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields    employeeId
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}       ${generate_employeeid}
    TeamMemberPage.Click on asset history tab under team member
    Generic.Verify your current page contains this text     Previously Assigned Assets
    TeamMemberPage.Click on search by brand, product and asset id of asset history via team member      ${generated_AssetID}
    Generic.Wait until table get load

Check the validation of business email id
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Convert to TM
    TeamMemberPage.Click on convert to team member confirm pop up
    Sleep   ${yop_sleep}
    switch window   aithentic | Update - Member
    Generic.Verify your current page location contains      convertmember
    TeamMemberPage.Select team member department        DepartmentName09041
    TeamMemberPage.Enter the Position in member form while converting assignee to team member        QA
    Select team member status while converting assignee to team member  Active
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Select team member role while converting assignee to team member    Admin
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        The Email Address must end with one of the following: mailinator.com automationqa2023090514421014.com.


Convert Assignee to team member in case of employee id is not system generated
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab     Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Select option from action button of assigned user    Add Assignee
    MemberPage.Enter first name of assigned users
    MemberPage.Enter last name of assigned users
    MemberPage.Enter business email of assigned users
    MemberPage.Click on save button of assigned user
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    MemberPage.Search assigned user by first name   ${generated_AssigneduserFirstName}
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Convert to TM
    TeamMemberPage.Click on convert to team member confirm pop up
    Sleep   ${yop_sleep}
    switch window   aithentic | Update - Member
    Generic.Verify your current page location contains      convertmember
    TeamMemberPage.Select team member department        DepartmentName09041
    TeamMemberPage.Enter team member business email_mailinator while converting assignee to team member
    TeamMemberPage.Enter the Position in member form while converting assignee to team member        QA
    Select team member status while converting assignee to team member  Active
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location
    TeamMemberPage.Select team member role while converting assignee to team member    Admin
    TeamMemberPage.Create random employee id
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name   ${generated_AssigneduserFirstName}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated