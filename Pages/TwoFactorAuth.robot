*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
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

*** Variables ***
${account_created_alert_Msg}     css:.msg.d-inline-flex
${account_OTP_alert_Msg}     //span[normalize-space()='OTP sent successfully']

${otp_Input}     css:.inputs.ng-untouched.ng-pristine.ng-invalid[formcontrolname='digit1']
#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March
${twoFA_verify_btn}     css:button[type='submit']


*** Keywords ***
Enter the otp
    [Arguments]    ${otp}
     wait until element is visible      ${otp_Input}       60
     wait until element is enabled      ${otp_Input}       60
     input text     ${otp_Input}    ${otp}

Click verification button
    wait until element is visible      ${twoFA_verify_btn}       60
    wait until element is enabled      ${twoFA_verify_btn}       60
    click element   ${twoFA_verify_btn}