*** Settings ***
Documentation   Contains all keyword of  Dashboard page
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
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot
Resource        ../Pages/Admin_PanelPage.robot
Resource        ../Pages/Admin_PanelPage.robot
Resource        ../Pages/Admin_PanelPage.robot



*** Variables ***

${loaderIcon}     //div[@role='status']

###############profile option##########
${profileName}     css:#user-name-nav
${full_Profile_List}     //div[@class='dropdown-menu themeScrollBar profile-dropdown ng-tns-c166-0 show']/div/ul/li
${select_technology_type_via link}  css:#addProductType
${save_product_modal}     css:button[class='btn button-green mt-0 mx-2 ng-star-inserted']
${search_productName}     css:input[placeholder='Search by Product Name or Description']
${fetch_productName}    css:td:nth-child(2)

${add_dept_btn}     //a[normalize-space()='Add Department']
${add_dept_name}     css:.profile-section-department div ng-select#department-name input
${add_dept_status}     css:.profile-section-department div ng-select.qa-add-department-status input
${add_dept_costCenter}     css:.profile-section-department .qa-add-department-costCenter


${searchBar_department}     css:input[placeholder='Search by Department Name']
${fetch_departmentName}     css:td:nth-child(2)


${dept_searchbar}       css:input[placeholder='Search by Department Name']
${three_dots_dept}      css:.three-dots


${search_technology_group}     css:.qa-selectedTechnologyGroups input

${search_technology_group}      (//div[@class='ng-input']//input)[2]
${search_by_brand_name}            (//div[@class='ng-input']//input)[3]

*** Keywords ***

Enter the value in the product name column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_addProductName}=    Catenate    ProductName${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${generated_addProductName}
    set global variable    ${generated_addProductName}

Enter the new value in the brand name column in bulk_import
    [Arguments]    ${option}    ${brandName}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${brandName}

Select option from status column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[class='ag-rich-select-row']    60
    wait until element is enabled      css:div[class='ag-rich-select-row']    60
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    wait until element is enabled      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div

Select option from technology group column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    wait until element is enabled      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div

Enter the value in the product_description column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is product Description

Enter the value in the product_feature column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is the Feature of product

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     60
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']     60
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

Click on I_m_done button when popup appears
    [Arguments]     ${option}
     wait until element is visible       css:.${option}-qa     60
     wait until element is enabled       css:.${option}-qa     60
     click element      css:.${option}-qa

Verify product added using bulk_import_export
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_productName}     60
     wait until element is enabled      ${search_productName}     60
     click element      ${search_productName}
     Clear Element Text      ${search_productName}
     input text   ${search_productName}   ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     60
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}

Enter the new value in the product name column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditProductName}=    Catenate    ProductName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditProductName}
    set global variable    ${generated_EditProductName}

Enter the new value in the brand name column in bulk_edit
    [Arguments]    ${option}    ${brandName}
    DashboardPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${brandName}

Select option from status column in bulk_edit
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[class='ag-rich-select-row']    60
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column in bulk_edit
    [Arguments]    ${option}    ${option2}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='List'] div:nth-child(${option2}) div    60
    click element       css:div[aria-label='List'] div:nth-child(${option2}) div

Click on Refresh icon of product-list page
    wait until element is visible       css:.reset-product-qa        60
    click element       css:.reset-product-qa
    wait until element is not visible      ${loaderIcon}     60

Enter the new value in the department name column in bulk_import
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_addDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input     ${generated_addDepartmentName}
    set global variable    ${generated_addDepartmentName}

Select option from department status column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      //div[@class='ag-virtual-list-item ag-rich-select-virtual-list-item']//div[normalize-space()='Inactive']    60
    click element       //div[@class='ag-virtual-list-item ag-rich-select-virtual-list-item']//div[normalize-space()='Inactive']

Enter the new value in the cost center column in bulk_import
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_addCostCenter}=    Catenate    ${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${generated_addCostCenter}
    set global variable    ${generated_addCostCenter}

Verify department added using bulk_import_export
   [Arguments]    ${departmentName}
    wait until element is visible       css:thead tr       60
    wait until element is visible      ${searchBar_department}     60
    click element      ${searchBar_department}
    Clear Element Text      ${searchBar_department}
    input text   ${searchBar_department}   ${departmentName}
    sleep       ${search_sleep}
    Wait Until Element Contains    //td[normalize-space()='${departmentName}']      ${departmentName}     60
    ${get_departmentName} =    get text    ${fetch_departmentName}
    log to console     ${get_departmentName}
    should be equal    ${departmentName}     ${get_departmentName}

Enter the new value in the department name column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditDepartmentName}
    set global variable    ${generated_EditDepartmentName}

Select option from department status column in bulk_edit
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:.ag-rich-select-row.ag-rich-select-row-selected    60
    click element       css:.ag-rich-select-row.ag-rich-select-row-selected

Enter the new value in the cost center column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10     [NUMBERS]
    ${generated_EditCostCenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditCostCenter}
    set global variable    ${generated_EditCostCenter}

Confirm the exit import process pop appears
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      60

Enter the new value in the building name column
    [Arguments]    ${option}    ${buildingName}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input     60
    input text      css:.ag-center-cols-container div[col-id='${option}'] input     ${buildingName}

Enter the new value in the floor number column
    [Arguments]    ${option}    ${floorNumber}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${floorNumber}

Enter the new value in the room number column
    [Arguments]    ${option}    ${roomNumber}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${roomNumber}

Enter the new value in the state column
    [Arguments]    ${option}    ${state}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${state}

Enter the new value in the city column
    [Arguments]    ${option}    ${city}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${city}

Enter the new value of cost center in location bulk edit
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generated_costcenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element    css:.ag-center-cols-container div[col-id='${option}']
    input text   //textarea[@aria-label='Input Editor']   ${generated_costcenter}
    Press Keys  //textarea[@aria-label='Input Editor']    ENTER
    set global variable    ${generated_costcenter}

Enter the new value in the location name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_NewLocationName}=    Catenate    LocationName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_NewLocationName}
    set global variable    ${generated_NewLocationName}

Search by location name
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     60
     wait until element is visible       css:thead tr       60
     click element      ${search_LocationName}
     Clear Element Text      ${search_LocationName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_LocationName}   ${LocationName}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the location Name from the row   ${LocationName}
     should be equal    ${fetch_locationName}     ${LocationName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time    3    ${pageHeading}   Location Page - Search location name in the table    3    ${pageTime}     ${ActualTime}    LocationPage_Time

Enter the new value of assigned in the first name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    FName_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of assigned in the last name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Enter the new value of assigned in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@yopmail.net
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Enter the new value of assigned in the ID column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    EmployeeID_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

Search by empID
     [Arguments]    ${empID}
     wait until element is not visible      ${loaderIcon}     60
     wait until element is visible       css:thead tr       60
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
     input text   ${assignedUser_searchBar}     ${empID}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the assigned empID from the row   ${empID}
     should be equal    ${fetch_assignedUserEmpID}     ${empID}

Search assigned user by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
     input text   ${assignedUser_searchBar}     ${name}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the assigned user name from the row   ${name}
     should be equal    ${fetch_assignedUserFname}     ${name}

Enter the new value of team member in the phone number column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    90${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of team member in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    BusinessEmail${random_string}@mailinator.com
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Enter the new value of team member in the department column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(5) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(5) div

Enter the new value of team member in the location column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div

Enter the new value of team member in the role column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div

Click employee id box to scroll
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='EmployeeId']      60
    click element       css:.ag-center-cols-container div[col-id='EmployeeId']

Search team member by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     click element      ${teamMember_searchBar}
     Clear Element Text      ${teamMember_searchBar}

     input text   ${teamMember_searchBar}     ${name}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the team member name from the row   ${name}
     should be equal    ${fetch_teamMemberFname}     ${name}

click on the arrow of product
    [Arguments]     ${text}     ${number}
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible    (//span[normalize-space()='${text}']//following-sibling::span)[${number}]     60
    wait until element is enabled   (//span[normalize-space()='${text}']//following-sibling::span)[${number}]      60
    click element   (//span[normalize-space()='${text}']//following-sibling::span)[${number}]

Enter the new value in the product, brand, group and type value in bulk_edit of technology
    [Arguments]     ${option}   ${text}
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible   (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]   60
    wait until element is enabled   (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]   60
    double click element    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]
    Press Keys    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     CONTROL+A
    Press Keys    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     DELETE
    sleep   2
    double click element    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]
    input text    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     ${text}
    Press Keys      (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]       ENTER
    sleep   ${search_sleep}

Select the new value of technology group in bulk edit of technology
    [Arguments]     ${option}   ${text}
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible   (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]   60
    wait until element is enabled   (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]   60
    double click element    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]
    wait until element is visible   //div[contains(text(),'${text}')]   60
    Press Keys      //div[contains(text(),'${text}')]       ENTER

Enter the new value of asset id of bulk edit of technology
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assetidbulkedit}=    Catenate    AssetID_${random_string}
    wait until element is visible       (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]//input    60
    input text   (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]//input   ${generated_assetidbulkedit}
    Press Keys      (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]       ENTER
    set global variable    ${generated_assetidbulkedit}

Click on confirm pop up of update button
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-warning  60
    click element   css:.qa-confirm-technology-bulk-edit-warning
    sleep   ${search_sleep}

Click on confirm button under pop up of finish button of bulk edit
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-finish      60
    click element   css:.qa-confirm-technology-bulk-edit-finish

Click on confirm button under pop up of exit button of bulk edit
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-exit    60
    click element   css:.qa-confirm-technology-bulk-edit-exit


Enter the new value of first name in bulk import of team member
    [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Firstname}=    Catenate    FName_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    60

    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input    ${generated_Firstname}
    set global variable    ${generated_Firstname}

Enter the new value of last name in bulk import of team member
    [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_lastname}=    Catenate    LName_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    60
    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input    ${generated_lastname}
    set global variable    ${generated_lastname}

Enter position and title of team member bulk import
    [Arguments]     ${option}
    wait until element is visible   css:.ag-center-cols-container div[col-id='Position']    60
    wait until element is enabled   css:.ag-center-cols-container div[col-id='Position']    60
    double click element    css:.ag-center-cols-container div[col-id='Position']
    input text      css:.ag-center-cols-container div[col-id='Position'] input      ${option}
    Press Keys      css:.ag-center-cols-container div[col-id='Position']       ENTER

Scroll Element
    [Arguments]  ${option}
    wait until element is not visible       ${loaderIcon}       60
    scroll element into view    (//div[@ref='eBodyViewport']//div[@col-id='${option}'])[1]


Click on the fields and select value from dropdown of technology bulk edit
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible   css:.ag-center-cols-container div[col-id='${option}']      60
    wait until element is enabled   css:.ag-center-cols-container div[col-id='${option}']      60
    double click element    css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(2) div      60
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(2) div
    sleep   ${search_sleep}

Enter random employee id of bulk import
     [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_employeeid}=    Catenate    EmployeeID_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    60
    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input     ${generated_employeeid}
    set global variable    ${generated_employeeid}

Perform the keyboard action
    [Arguments]  ${option}
    Generic.Click keyboard button   css:.ag-center-cols-container div[col-id='${option}']       TAB


Enter the new value in the first address column
    [Arguments]    ${option}    ${address}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter random zip code of bulk import of loaction
     [Arguments]    ${option}
    LocationPage.Double click    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_zipcode}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    60
    input text  css:.ag-center-cols-container div[col-id='${option}'] input     ${generated_zipcode}
    set global variable    ${generated_zipcode}

click on checkbox under technology bulk import
    wait until element is visible   //label[contains(text(),'- Create new assets as well as update data on exis')]      60
    wait until element is enabled   //label[contains(text(),'- Create new assets as well as update data on exis')]      60
    click element   //label[contains(text(),'- Create new assets as well as update data on exis')]
    wait until element is not visible       ${loaderIcon}       60

Enter the new value of serial number of technology bulk import
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_serialnumber}=    Catenate    SerialNumber_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_serialnumber}
    set global variable    ${generated_serialnumber}

Enter the new value of asset id of technology bulk import
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_assetid}=    Catenate    AssetID_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assetid}
    set global variable    ${generated_assetid}

Enter the new value in the fields of technology bulk import
    [Arguments]    ${option}    ${address}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter the new value of country in location bulk import
    [Arguments]    ${option}    ${option1}
    MemberPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    60
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element    css:.ag-center-cols-container div[col-id='${option}']
    input text   //textarea[@aria-label='Input Editor']     ${option1}
    Press Keys  //textarea[@aria-label='Input Editor']    ENTER

Create random IP subnet in location bulk import
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string1} =     Evaluate    random.randint(1, 255)
    ${random_string2} =     Evaluate    random.randint(1, 255)
    ${random_string3} =     Evaluate    random.randint(1, 255)
    ${random_string4} =     Evaluate    random.randint(1, 255)
    ${generated_SubnetIp}=    Catenate    ${random_string1}.${random_string2}.${random_string3}.${random_string4}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_SubnetIp}
    set global variable    ${generated_SubnetIp}

Click on the confirm button of finish pop up
    wait until element is visible   css:.qa-confirm-finish-bulk-edit       60
    wait until element is enabled   css:.qa-confirm-finish-bulk-edit       60
    click element   css:.qa-confirm-finish-bulk-edit




