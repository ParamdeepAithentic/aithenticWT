*** Settings ***
Documentation     Verify the Dashboard page test
Library          SeleniumLibrary
Library           ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
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
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/DepartmentPage.robot

*** Variables ***
${department_ActionBTN}      css:#Team-Member-Actions
.qa-department-name input
.qa-status input
#costCenter




*** Keywords ***
Click on added department action button
    Wait Until Element Is Visible       ${department_ActionBTN}    60
    Wait Until Element Is Enabled      ${department_ActionBTN}     60
    click element       ${department_ActionBTN}

Choose the option from the action menu
    [Arguments]    ${option}
    Wait Until Element Is Visible       //a[contains(text(),'${option}')]    60
    Wait Until Element Is Enabled      //a[contains(text(),'${option}')]     60
    click element       //a[contains(text(),'${option}')]
#Add Department, Bulk Edit, Bulk Import

Enter the new value of department in the depatment name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    90000${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}



