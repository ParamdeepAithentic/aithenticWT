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
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/MemberPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Download the preview sheets for supplier
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Preview
    ITperformancePage.Select preview file type        Supplier, Support Partner and Supplier by Location Report
    ITperformancePage.Download the sheet after Preview

Download the preview sheets for brand report
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Preview
    ITperformancePage.Select preview file type        Brand Report
    ITperformancePage.Download the sheet after Preview


Download the preview sheets for asset report
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Preview
    ITperformancePage.Select preview file type        Asset Report
    ITperformancePage.Download the sheet after Preview



Export the sheets for asset supplier
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Export
    ITperformancePage.Select export file type        Supplier, Support Partner and Supplier by Location Report
    ITperformancePage.Verify Export file

Export the sheets for asset brand report
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Export
    ITperformancePage.Select export file type        Brand Report
    ITperformancePage.Verify Export file

Export the sheets for asset asset report
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    ITperformancePage.select the option from the drawer     IT Performance
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on the button     Export
    ITperformancePage.Select export file type        Asset Report
    ITperformancePage.Verify Export file









































