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
${department_ActionBTN}      css:#Team-Member-Actions
${parent_department}                     //form[contains(@class,'ng-touched')]//ng-select[contains(@class,'qa-DepartmentParents')]//input
${sub_department}                       //form[contains(@class,'ng-touched')]//ng-select[contains(@class,'qa-DepartmentChilds')]//input


*** Keywords ***
Click on added department action button
    Wait Until Element Is Visible       ${department_ActionBTN}    ${wait_time}
    Wait Until Element Is Enabled      ${department_ActionBTN}     ${wait_time}
    click element       ${department_ActionBTN}
    wait until element is not visible       ${shadow}          60

Choose the option from the action menu
    [Arguments]    ${option}
    Wait Until Element Is Visible       //a[contains(text(),'${option}')]    ${wait_time}
    Wait Until Element Is Enabled      //a[contains(text(),'${option}')]     ${wait_time}
    click element       //a[contains(text(),'${option}')]
#Add Department, Bulk Edit, Bulk Import

Enter the new value of department in the depatment name column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_DeptName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_DeptName}
    set global variable    ${generated_DeptName}


Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE


Select option from side menu in department list
    [Arguments]    ${option}
    wait until element is visible      //span[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled      //span[normalize-space()='${option}']    ${wait_time}
    click element      //span[normalize-space()='${option}']

Search by department name
    [Arguments]    ${department}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      css:#searchbar-departmentlist     ${wait_time}
     click element      css:#searchbar-departmentlist
     Clear Element Text      css:#searchbar-departmentlist
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   css:#searchbar-departmentlist   ${department}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     Fetch the department Name from the row   ${department}
     should be equal    ${get_fetch_depName}     ${department}

Fetch the department Name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled        //td[normalize-space()='${option}']     ${wait_time}
    ${get_fetch_depName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${get_fetch_depName}
    log to console     ${get_fetch_depName}

Create random department name
    wait until element is visible       css:#predefinedDepartmentNames        ${wait_time}
    wait until element is enabled       css:#predefinedDepartmentNames        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Department}=    Catenate    DeptNo_${random_string}
    input text   css:#predefinedDepartmentNames   ${generated_Department}
    sleep       ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_Department}
    set global variable    ${generated_Department}

Verify I-icon of company information under organistaion
    wait until element is visible   //label[normalize-space()='Industry (NAICS)']//i        ${wait_time}
    wait until element is enabled   //label[normalize-space()='Industry (NAICS)']//i        ${wait_time}

Select department random cost center
    wait until element is visible       css:#costCenter        ${wait_time}
    wait until element is enabled       css:#costCenter        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_cost_center}=    Catenate    Cost_${random_string}
    input text   css:#costCenter   ${generated_cost_center}
    log to console      ${generated_cost_center}
    set global variable    ${generated_cost_center}

Search by static department name
    [Arguments]    ${department}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is not visible       css:.spinner-border     ${wait_time}
     wait until element is visible      css:#searchbar-departmentlist     ${wait_time}
     click element      css:#searchbar-departmentlist
     Clear Element Text      css:#searchbar-departmentlist
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   css:#searchbar-departmentlist   ${department}
     sleep      ${search_sleep}
     wait until element is not visible       css:.spinner-border     ${wait_time}

Verify the search static department
    [Arguments]    ${option}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //td[normalize-space()='${option}']   ${wait_time}
    Set Global Variable    ${status}
    RETURN    ${status}


Get new department
    [Arguments]         ${option}
    Run Keyword If    ${status} == True
        ...    DepartmentPage.Skip case
        ...    ELSE  Run Keywords     DepartmentPage.Create the department     ${option}
        ...    AND    Return From Keyword


Skip case
     log   Element is already there

Create the department
    [Arguments]         ${option}
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    DepartmentPage.Create static department name random     ${option}
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully

Create static department name random
    [Arguments]        ${option}
    wait until element is visible       ${add_tech_dept_name}        ${wait_time}
    wait until element is enabled       ${add_tech_dept_name}        ${wait_time}
    input text   ${add_tech_dept_name}   ${option}
    sleep       ${search_sleep}
    wait until element is visible     //span[contains(text(),'${option}')]//span        ${wait_time}
    wait until element is enabled       //span[contains(text(),'${option}')]//span         ${wait_time}
    sleep       ${search_sleep}
    click element      //span[contains(text(),'${option}')]//span

Verify the validation department name field
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //ng-select[contains(@class,'qa-add-department-name')]//following-sibling::p//span      ${wait_time}
    wait until element is enabled       //ng-select[contains(@class,'qa-add-department-name')]//following-sibling::p//span      ${wait_time}
    ${Departmentname_validation}=     Get text       //ng-select[contains(@class,'qa-add-department-name')]//following-sibling::p//span
    log     ${Departmentname_validation}
    set global variable     ${Departmentname_validation}

Verify the validation department status
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //ng-select[contains(@class,'qa-add-department-status')]//parent::app-ng-select//following-sibling::p//span      ${wait_time}
    wait until element is enabled       //ng-select[contains(@class,'qa-add-department-status')]//parent::app-ng-select//following-sibling::p//span      ${wait_time}
    ${Departmentstatus_validation}=     Get text       //ng-select[contains(@class,'qa-add-department-status')]//parent::app-ng-select//following-sibling::p//span
    log     ${Departmentstatus_validation}
    set global variable     ${Departmentstatus_validation}

Compare and verify the validation messages of department
    [Arguments]         ${option1}      ${option2}
    Should be equal       ${option1}      ${option2}

Enter the wrong status of department and verify
    [Arguments]    ${status}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    click element       (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]
    Clear Element Text      (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]
    input text   (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]   ${status}
    wait until element is visible       //div[contains(@class,"ng-option-disabled")][normalize-space()='No items found']        ${wait_time}

Clear the data of the field while adding department
    [Arguments]         ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //ng-select[contains(@class,'qa-${option}')]//span[@title='Clear all']      ${wait_time}
    wait until element is enabled       //ng-select[contains(@class,'qa-${option}')]//span[@title='Clear all']     ${wait_time}
    click element       //ng-select[contains(@class,'qa-${option}')]//span[@title='Clear all']

Create random Parent Department
    wait until element is visible       ${add_tech_dept_name}        ${wait_time}
    wait until element is enabled       ${add_tech_dept_name}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Parent_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_tech_dept_name}   ${generated_Parent_DepartmentNumber}
    sleep       ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_Parent_DepartmentNumber}
    set global variable    ${generated_Parent_DepartmentNumber}

Create random Sub Department
    wait until element is visible       ${add_tech_dept_name}        ${wait_time}
    wait until element is enabled       ${add_tech_dept_name}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Sub_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_tech_dept_name}   ${generated_Sub_DepartmentNumber}
    sleep       ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_Sub_DepartmentNumber}
    set global variable    ${generated_Sub_DepartmentNumber}

Input into parent Department
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       ${parent_department}        ${wait_time}
    wait until element is enabled       ${parent_department}        ${wait_time}
    Input text      ${parent_department}        ${option}
    Generic.Select parameter        ${option}

Input into sub Department
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       ${sub_department}        ${wait_time}
    wait until element is enabled       ${sub_department}        ${wait_time}
    Input text     ${sub_department}        ${option}
    Generic.Select parameter        ${option}

Select the option from Department filter
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    Wait Until Element Is Visible  //b[normalize-space()='Departments']    ${wait_time}
    Wait Until Element Is Visible   //b[normalize-space()='Departments']      ${wait_time}
    click element    //b[normalize-space()='Departments']

Select filter with heirarchy
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    Wait Until Element Is Visible  //span[normalize-space()='${option}']    ${wait_time}
    Wait Until Element Is Visible   //span[normalize-space()='${option}']     ${wait_time}
    click element    //span[normalize-space()='${option}']

Verify that table contains the Department Name under Department column
    [Arguments]         ${option1}      ${option2}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       //th//div[contains(@class,'columnName')][normalize-space()='${option1}']//ancestor::table//following::tr//td[contains(text(),'${option2}')]        ${wait_time}
    wait until element is enabled       //th//div[contains(@class,'columnName')][normalize-space()='${option1}']//ancestor::table//following::tr//td[contains(text(),'${option2}')]       ${wait_time}