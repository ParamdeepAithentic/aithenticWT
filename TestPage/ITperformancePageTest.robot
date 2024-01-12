*** Settings ***
Documentation   Contains all test cases of ITperformance page
Library           SeleniumLibrary
Library           ExcelLibrary
Library           String
Library           Collections
Library           BuiltIn
Library           random
Library           DateTime
Library           OperatingSystem
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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Download sheet for Forecasts
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of supplier_partner_location and download sheet
    Generic.Fetch alert message text and compare it with        Spend Forecasts sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        SpendForecastsReports

Download sheet for aging
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of brand report and download sheet
    Generic.Fetch alert message text and compare it with        Aging Analytics sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        AgingAnalyticsReports

Download sheet for investments
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of asset report and download sheet
    Generic.Fetch alert message text and compare it with        Investment by Partners sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        sspslReport

Download all sheets with download all button
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on download all button

