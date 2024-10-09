*** Settings ***
Documentation   Contains all keyword of  Dashboard page
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

Check all the validations of login page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form with email only      ${email}
    LoginPage.Get and Verify the validation after login with email only         Invalid user id or password.
    LoginPage.Clear the element text of field under login page      ${Kc_username}
    LandingPage.Fill the login Form       testqa29jmailinator.com       Test@123
    LoginPage.Get and Verify the validation after login with email only         Invalid user id or password.
    LoginPage.Clear the element text of field under login page      ${Kc_username}
    LoginPage.Clear the element text of field under login page      ${Kc_password}
    LandingPage.Fill the login Form with password only      ${valid_password}
    LoginPage.Get and Verify the validation after login with email only         Invalid user id or password.
    LoginPage.Clear the element text of field under login page      ${Kc_password}
    LandingPage.Fill the login Form       testqa29j@mailinator.com       Test@12
    LoginPage.Get and Verify the validation after login with email only         Invalid user id or password.