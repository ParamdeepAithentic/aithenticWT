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
     wait until element is visible      ${otp_Input}       ${wait_time}
     wait until element is enabled      ${otp_Input}       ${wait_time}
     input text     ${otp_Input}    ${otp}

Enter the Admin Access OTP
     [Arguments]    ${otp}
     wait until element is visible      ${admin_otp_Input}       ${wait_time}
     wait until element is enabled      ${admin_otp_Input}       ${wait_time}
     input text     ${admin_otp_Input}    ${otp}

Click verification button
    wait until element is visible      ${twoFA_verify_btn}       ${wait_time}
    wait until element is enabled      ${twoFA_verify_btn}       ${wait_time}
    click element   ${twoFA_verify_btn}
    wait until element is not visible       ${shadow}          60

Click on the verify button
    wait until element is visible       ${admin_verify_btn}     ${wait_time}
    Wait until element is enabled       ${admin_verify_btn}     ${wait_time}
    click element       ${admin_verify_btn}
    wait until element is not visible       ${shadow}          60