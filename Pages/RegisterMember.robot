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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot
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
${partner_fname}        css:#FirstName
${partner_flname}        css:#LastName
${tc_chkbox}        css:.checkmark.theme-blue
${click_registerBTN}     css:button[type='submit']
${loaderIcon}     //div[@role='status']

*** Keywords ***
Fill first name for partner register member
    [Arguments]    ${fisrtName}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       ${partner_fname}       60
    Clear Element Text      ${partner_fname}
    input text      ${partner_fname}     ${fisrtName}


Fill last name for partner register member
    [Arguments]    ${lastName}
    wait until element is visible       ${partner_flname}       60
    Clear Element Text      ${partner_flname}
    input text      ${partner_flname}     ${lastName}

Check the term and condition checkbox
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       ${tc_chkbox}       60
    wait until element is enabled       ${tc_chkbox}       60
    click element       ${tc_chkbox}

Submit the registration form
    wait until element is visible       ${click_registerBTN}       60
    wait until element is enabled       ${click_registerBTN}       60
    click element       ${click_registerBTN}

