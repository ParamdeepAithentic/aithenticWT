*** Settings ***
Documentation   Contains all keyword of KeyClockPage page
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
#//a[@title='Asecure Cloud Login']
#Sign in to Aithentic
${Kc_username}     css:#username
${Kc_password}      css:#password
${Kc_loginBtn}     css:#kc-login


*** Keywords ***
#Click on add department
#    wait until element is visible      ${add_dept_btn}      ${wait_time}
#    wait until element is enabled      ${add_dept_btn}      ${wait_time}
#    click element      ${add_dept_btn}
#
#
#Enter user name
#    wait until element is visible      ${add_dept_btn}      ${wait_time}
#    wait until element is enabled      ${add_dept_btn}      ${wait_time}
#    click element      ${add_dept_btn}