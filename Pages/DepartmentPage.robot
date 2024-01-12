*** Settings ***
Documentation   Contains all keyword of  Department page
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

*** Variables ***
${department_ActionBTN}      css:#Team-Member-Actions

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
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_DeptName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_DeptName}
    set global variable    ${generated_DeptName}


Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE


Select option from side menu in department list
    [Arguments]    ${option}
    wait until element is visible      //span[normalize-space()='${option}']    60
    wait until element is enabled      //span[normalize-space()='${option}']    60
    click element      //span[normalize-space()='${option}']


