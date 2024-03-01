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

Verify Reports Key Data records count
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
    Generic.select the option from the side menu    Dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Departments
    Generic.Verify your current page location contains          department-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Department
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Locations
    Generic.Verify your current page location contains          locationlist
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Location
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Team Members
    Generic.Verify your current page location contains          memberslist
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Team Members
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Assigned Users
    Generic.Verify your current page location contains          assignee-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Assigned_users
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Partners
    Generic.Verify your current page location contains          partner-listing
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Partners
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under key data       Contracts
    Generic.Verify your current page location contains          contracts-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Contracts

Verify Reports Technology Types records count
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
    Generic.select the option from the side menu    Dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under Technology Types       Hardware
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Hardware
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under Technology Types       License
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      License
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under Technology Types       Virtual Machines
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Virtual Machines
    Go back
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under Technology Types      Maintenance
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Maintenance
    Go back
    Generic.Verify your current page location contains         account-overview
    ReportsPage.Click on tab under Technology Types       Subscription
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify that key_data is equals to total number of counts      Subscription

Verify reports modules data
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    ReportsPage.Click on tab under Modules       Manage Technology
    Generic.Verify your current page location contains          technology-list
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count
    ReportsPage.Verify number of modules are equals to total counts     Manage Technology
    Go back
    ReportsPage.Click on tab under Modules       Network Discovery Agents
    Generic.Verify your current page location contains          discovery-assets
    ReportsPage.Fetch total installed Agents      Installed Agents -
    ReportsPage.Verify number of modules are equals to total counts       Network Discovery Agents