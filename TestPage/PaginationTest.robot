*** Settings ***
Documentation   Contains all test cases of OCS page
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
Resource        ../Pages/UnselectAssetAPI.robot
Resource        ../Pages/PaginationPage.robot



Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***


Verify pagination of technology Table
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Log WebElements      technology

Verify pagination of partner table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Log WebElements      partner-list

Verify pagination of contract table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     contracts
    PaginationPage.Log WebElements      contracts

Verify pagination of Department table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     department
    PaginationPage.Log WebElements      department

Verify pagination of Brand table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     brand
    PaginationPage.Log WebElements      brand

Verify pagination of Product table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     products
    PaginationPage.Log WebElements      products

Verify pagination of location Table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     location-list
    PaginationPage.Log WebElements      location-list

Verify pagination of Team Member Table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     member-list
    PaginationPage.Log WebElements      member-list

Verify pagination of Assigned User Table
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Assigned Users
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     assignee-list
    PaginationPage.Log WebElements      assignee-list