*** Settings ***
Documentation   Contains all test cases of Landing page
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
Resource        ../Pages/LoginPage.robot
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

Suite Setup    Get Current Date and Time
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link


*** Test Cases ***
Validate Succesful Login
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains    dashboard