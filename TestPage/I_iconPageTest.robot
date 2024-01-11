*** Settings ***
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session
*** Variables ***

*** Test Cases ***

Verify all i-icon of Dashboard page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      asset-overview
    I_iconPage.Click on i-icon of asset-overview tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of asset-overview tab
    DashboardPage.select the option from the dashboard drawer   Account Overview
    Generic.Verify your current page location contains      account-overview
    I_iconPage.Click on i-icon of account_overview tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of account_overview tab

Verify all i-icon of profile-listing
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    I_iconPage.Click on i-icon of system configuration tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of system configuration tab
    I_iconPage.Choose tabs under organization        company
    I_iconPage.Click on i-icon of industry under company financial information
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on link inside industry i-icon      https://www.naics.com/search/
    sleep       ${yop_sleep}
    switch window       NAICS & SIC Identification Tools | NAICS Association
    Generic.Verify your current page location contains      naics.com
    Generic.Verify your current page contains this text     NAICS Identification Tools
    Go back
    I_iconPage.Click on i-icon of company department
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of company department
    I_iconPage.Click on view added Departments list      View Your Added Departments List
    Generic.Verify your current page location contains      department-list
    I_iconPage.Click on action menu button of department
    I_iconPage.Choose Add department from Action button options          Add Department
    I_iconPage.Click on i-icon of cost_center in department
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in department
    I_iconPage.Click on cancel add department        close
    I_iconPage.Search by Department      Communications       #Customer Support
    I_iconPage.Click on three dots of Department list
    I_iconPage.Choose option from three_dots of Department     Details
    I_iconPage.Click on i-icon of cost_center in department
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in department
    I_iconPage.Click on cancel add department        close
    I_iconPage.Click on three dots of Department list
    I_iconPage.Choose option from three_dots of Department     Edit
    I_iconPage.Click on i-icon of cost_center in department
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in department
    I_iconPage.Click on cancel add department        close
    Generic.Verify your current page location contains      department-list
    I_iconPage.Choose options inside personal_details        Technology
    I_iconPage.Click on i-icon inside technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon inside technology

Verify all i-icon of team member page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    I_iconPage.Click on i-icon of team-members tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of team-members tab

Verify all i-icon of Technology page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    I_iconPage.Click on i-icon of technology tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on Link inside pop-up of technology
    sleep   ${yop_sleep}
    switch window       Technology Overview - Jira Service Management
    Generic.Verify your current page location contains      servicedesk
    Generic.Verify your current page contains this text     Technology Overview
    sleep   ${yop_sleep}
    switch window       aithentic | Technology - List
    I_iconPage.Click on i-icon of technology tab
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    I_iconPage.Click on i-icon of cost_center in add technology
    Generic.Verify pop-up is visible after clicking on i-icon
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    I_iconPage.Click on i-icon of cost_center in edit technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in edit technology
    I_iconPage.Click on Back tab          Back to Technology Details
    I_iconPage.Click on clone button on product details page        Clone
    I_iconPage.Click on i-icon of cost_center in clone technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on Back tab          Back to Manage Technology

Verify all i-icon of partners page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    I_iconPage.Click on i-icon of partners tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of partners tab

Verify all i-icon of Discovery assets
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu        Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    I_iconPage.Choose tab under Discovery Assets       agent-discovery
    I_iconPage.Click on i-icon inside agent discovery
    I_iconPage.Click on link inside agent_discovery i-icon
    sleep       ${yop_sleep}
    switch window       Network Discovery - Jira Service Management
    Generic.Verify your current page location contains      customer
    Generic.Verify your current page contains this text     Network Discovery
    sleep       ${yop_sleep}
    switch window       aithentic | Asset - Discovery
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    I_iconPage.Click on i_icon under network_discovery tab