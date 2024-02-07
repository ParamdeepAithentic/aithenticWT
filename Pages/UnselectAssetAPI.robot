*** Settings ***
Documentation   Contains all keyword of  Replace domain API
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
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/UnselectAssetAPI.robot



*** Variables ***
#${base_URL}        https://uat-api.aithentic.com
#${API_URL}          https://qa-api.aithentic.com/api/v1
#${HEADERS}          Content-Type=application/json
${Email_ID}          johns@mai.25u.com


*** Keywords ***

Hit API Endpoint

    ${body}=    Create Dictionary       Email=${Email_ID}
    ${response}=    POST    ${apiURL}/unmatch-assets     json=${body}        expected_status=200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Response Body: ${response.text}