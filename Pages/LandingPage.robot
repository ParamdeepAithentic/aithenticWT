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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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
    wait until element is visible    ${Kc_username}       60
    Input Text          ${Kc_username}     ${email}
    wait until element is visible    ${Kc_password}    60
    Input Password      ${Kc_password}     ${valid_password}
    Click Button        ${Kc_loginBtn}
#    wait until location contains    asset-overview     60
#    wait until element is visible       ${profileName}       60

Fill the login form of Admin panel
    [Arguments]     ${email}     ${valid_password}
    wait until element is visible    ${Admin_username_field}       60
    Input Text          ${Admin_username_field}     ${email}
    wait until element is visible    ${Admin_password_field}    60
    Input Password      ${Admin_password_field}     ${valid_password}
    Click Button        ${Admin_loginBtn}



