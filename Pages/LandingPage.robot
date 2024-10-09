*** Settings ***
Documentation   Contains all keyword of Landing page
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
*** Variables ***
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block

${Kc_username}     css:#username
${Kc_password}      css:#password
${Kc_loginBtn}     css:#kc-login

${Admin_username_field}     css:#email
${Admin_password_field}     css:#password
${Admin_loginBtn}          //button[normalize-space()='Log In']


*** Keywords ***

Fill the login Form
    [Arguments]     ${email}     ${valid_password}
    wait until element is visible    ${Kc_username}       ${wait_time}
    Input Text          ${Kc_username}     ${email}
    wait until element is visible    ${Kc_password}    ${wait_time}
    Input Password      ${Kc_password}     ${valid_password}
    Click Button        ${Kc_loginBtn}
    wait until element is not visible       ${shadow}          ${wait_time}

Verify you are on dashboard page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]    ${wait_time}
    wait until element is enabled    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]    ${wait_time}


Fill the login form of Admin panel
    [Arguments]     ${email}     ${valid_password}
    wait until element is visible    ${Admin_username_field}       ${wait_time}
    Input Text          ${Admin_username_field}     ${email}
    wait until element is visible    ${Admin_password_field}    ${wait_time}
    Input Password      ${Admin_password_field}     ${valid_password}
    Click Button        ${Admin_loginBtn}
    wait until element is not visible       ${shadow}          ${wait_time}

Fill the login Form with email only
    [Arguments]     ${email}
    wait until element is visible    ${Kc_username}       ${wait_time}
    Input Text          ${Kc_username}     ${email}
    Click Button        ${Kc_loginBtn}

Fill the login Form with password only
    [Arguments]     ${valid_password}
    wait until element is visible    ${Kc_password}       ${wait_time}
    Input Text          ${Kc_password}    ${valid_password}
    Click Button        ${Kc_password}