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

Get text of role field from profile personal details
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:#UserRoleId    ${wait_time}
#    Wait Until Element Is Enabled    css:#UserRoleId    ${wait_time}
    ${role_user}=    Get value       css:#UserRoleId
    log to console      ${role_user}
    set global variable     ${role_user}

Verify the logged_in user should be
    [Arguments]      ${option}
    Should Be Equal    ${role_user}    ${option}
    
Wait until i_icon is visible
    Wait Until Element Is Visible    css:#technology-list-Iicon         ${wait_time}
    Wait Until Element Is Enabled    css:#technology-list-Iicon         ${wait_time}

