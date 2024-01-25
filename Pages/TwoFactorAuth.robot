*** Settings ***
Documentation     Contains all keyword of Two Factor Authentication page
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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

*** Variables ***
${account_created_alert_Msg}     css:.msg.d-inline-flex
${account_OTP_alert_Msg}     //span[normalize-space()='OTP sent successfully']

${otp_Input}     css:.inputs.ng-untouched.ng-pristine.ng-invalid[formcontrolname='digit1']
#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March
${twoFA_verify_btn}     css:button[type='submit']
${admin_otp_Input}      //input[@name='one']
${admin_verify_btn}     //button[normalize-space()='Verify']

*** Keywords ***
Enter the otp
    [Arguments]    ${otp}
     wait until element is visible      ${otp_Input}       60
     wait until element is enabled      ${otp_Input}       60
     input text     ${otp_Input}    ${otp}

Enter the Admin Access OTP
     [Arguments]    ${otp}
     wait until element is visible      ${admin_otp_Input}       60
     wait until element is enabled      ${admin_otp_Input}       60
     input text     ${admin_otp_Input}    ${otp}

Click verification button
    wait until element is visible      ${twoFA_verify_btn}       60
    wait until element is enabled      ${twoFA_verify_btn}       60
    click element   ${twoFA_verify_btn}

Click on the verify button
    wait until element is visible       ${admin_verify_btn}     60
    Wait until element is enabled       ${admin_verify_btn}     60
    click element       ${admin_verify_btn}