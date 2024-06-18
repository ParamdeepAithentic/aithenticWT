*** Settings ***
Documentation     Contains all keyword of user account page
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


*** Variables ***
${user_accountEmail}     css:#Email
${user_accountPassword}     //input[@id='Password']
${user_accountConfirmPassword}     css:#Password_confirmation
${user_accountChkBox}     css:.checkmark
${user_accountSubmitBTN}     css:button[type='submit']


${alert_Msg}     //span[@class='msg d-inline-flex ng-star-inserted']
${loaderIcon}     //div[@role='status']



*** Keywords ***
Enter the user ID
    [Arguments]    ${email}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       ${user_accountEmail}       ${wait_time}
    wait until element is enabled       ${user_accountEmail}       ${wait_time}
    Clear Element Text      ${user_accountEmail}
    input text      ${user_accountEmail}     ${email}

Enter the password
    [Arguments]    ${password}
    wait until element is visible       ${user_accountPassword}       ${wait_time}
    wait until element is enabled       ${user_accountPassword}       ${wait_time}
    Clear Element Text      ${user_accountPassword}
    input text      ${user_accountPassword}     ${password}

Confirm the entered password
    [Arguments]    ${confirmPassword}
    wait until element is visible       ${user_accountConfirmPassword}       ${wait_time}
    wait until element is enabled       ${user_accountConfirmPassword}       ${wait_time}
    Clear Element Text      ${user_accountConfirmPassword}
    input text      ${user_accountConfirmPassword}     ${confirmPassword}

Click on term and condition checkbox
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       ${user_accountChkBox}       ${wait_time}
    wait until element is enabled       ${user_accountChkBox}       ${wait_time}
    click element       ${user_accountChkBox}

Click create account button
    wait until element is visible       ${user_accountSubmitBTN}       ${wait_time}
    wait until element is enabled       ${user_accountSubmitBTN}       ${wait_time}
    click element       ${user_accountSubmitBTN}
    wait until element is not visible       ${shadow}          ${wait_time}

