*** Settings ***
Documentation     Verify the login page test
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
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot

*** Variables ***
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block


*** Keywords ***

Fill the login Form
    [Arguments]     ${email}     ${valid_password}
    wait until element is visible    id:Email       60
    Input Text          id:Email     ${email}
    wait until element is visible    id:Password    60
    Input Password      id:Password     ${valid_password}
    Click Button        //button[normalize-space()='Sign In']
#    wait until location contains    asset-overview     60
#    wait until element is visible       ${profileName}       60


