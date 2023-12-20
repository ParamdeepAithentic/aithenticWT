*** Settings ***
Documentation   Contains all keyword of  Login API
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

*** Variables ***
#${base_URL}=        https://uat-api.aithentic.com/api/v1



*** Keywords ***
Fetch the refresh token from the login api
    ${body}=    Create Dictionary       Email=${email}      Password=${valid_password}
    ${response}=    POST    ${apiURL}/login       json=${body}        expected_status=200
#    log to console   ${response.json()}

    Dictionary Should Contain Key   ${response.json()}      data
    ${dataList}=    Get From Dictionary     ${response.json()}      data
    ${refresh_Token}=    Get From Dictionary     ${dataList}      refreshToken
    ${access_Token}=    Get From Dictionary     ${dataList}      access_token
    set global variable  ${access_Token}
    set global variable  ${refresh_Token}
#    log to console      Refesh token we fetch out:${refresh_Token}


