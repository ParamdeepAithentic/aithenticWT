*** Settings ***
Documentation   Contains all keyword of  Register member API
Library         SeleniumLibrary
Library         ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
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
${partner_fname}        css:#FirstName
${partner_flname}        css:#LastName
${tc_chkbox}        css:.checkmark.theme-blue
${click_registerBTN}     css:button[type='submit']
${loaderIcon}     //div[@role='status']

*** Keywords ***
Fill first name for partner register member
    [Arguments]    ${fisrtName}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       ${partner_fname}       ${wait_time}
    Clear Element Text      ${partner_fname}
    input text      ${partner_fname}     ${fisrtName}


Fill last name for partner register member
    [Arguments]    ${lastName}
    wait until element is visible       ${partner_flname}       ${wait_time}
    Clear Element Text      ${partner_flname}
    input text      ${partner_flname}     ${lastName}

Check the term and condition checkbox
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       ${tc_chkbox}       ${wait_time}
    wait until element is enabled       ${tc_chkbox}       ${wait_time}
    click element       ${tc_chkbox}

Submit the registration form
    wait until element is visible       ${click_registerBTN}       ${wait_time}
    wait until element is enabled       ${click_registerBTN}       ${wait_time}
    click element       ${click_registerBTN}

