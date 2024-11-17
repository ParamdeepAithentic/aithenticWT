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

Get and Verify the validation after login with email only
    [Arguments]         ${text}
    wait until element is visible       //div[contains(@class,'error-custom')]//span     ${wait_time}
    wait until element is enabled        //div[contains(@class,'error-custom')]//span     ${wait_time}
    ${get_login_validation} =    get text    //div[contains(@class,'error-custom')]//span
    set global variable    ${get_login_validation}
    log to console    ${get_login_validation}
    should be equal    ${get_login_validation}     ${text}

Clear the element text of field under login page
    [Arguments]    ${locator}
    Click Element    css:#${locator}
    ${text}=    Execute JavaScript    return document.querySelector("#${locator}").value
    Log    Initial text: ${text}

    WHILE    '${text}' != ''
        Press Keys    css:#${locator}    BACKSPACE
        ${text}=    Execute JavaScript    return document.querySelector("#${locator}").value
        Log    Updated text: ${text}
    END
    Log    Field is now cleared

Clear the text of some fields
    [Arguments]    ${locator}
    wait until element is visible       ${locator}     ${wait_time}
    wait until element is enabled        ${locator}     ${wait_time}
    click element   ${locator}
    clear element text      ${locator}


Get and Verify the validation after entering invalid email under forgot password
    [Arguments]         ${text}
    wait until element is visible       //span[contains(@id,'error-username')]     ${wait_time}
    wait until element is enabled        //span[contains(@id,'error-username')]     ${wait_time}
    ${get_forgotpassword_validation} =    get text    //span[contains(@id,'error-username')]
    set global variable    ${get_forgotpassword_validation}
    log to console    ${get_forgotpassword_validation}
    should be equal   ${get_forgotpassword_validation}     ${text}

Click on the fields
    Wait Until Element Is visible      css:#AssignedEmail        ${wait_time}
    Wait Until Element Is enabled      css:#AssignedEmail        ${wait_time}
    click element       css:#AssignedEmail
    Wait Until Element Is visible         css:#AssignedEmployeeId        ${wait_time}
    Wait Until Element Is enabled        css:#AssignedEmployeeId     ${wait_time}
    click element       css:#AssignedEmployeeId



