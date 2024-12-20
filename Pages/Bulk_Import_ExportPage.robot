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

${loaderIcon}     //div[@role='status']

###############profile option##########
${profileName}     css:#user-name-nav
${full_Profile_List}     //div[@class='dropdown-menu themeScrollBar profile-dropdown ng-tns-c166-0 show']/div/ul/li
${select_technology_type_via link}  css:#addProductType
${save_product_modal}     css:button[class='btn button-green mt-0 mx-2 ng-star-inserted']
${search_productName}     css:#searchbar-product
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
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${generated_addProductName}
    set global variable    ${generated_addProductName}

Enter the new value in the brand name column in bulk_import
    [Arguments]    ${option}    ${brandName}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${brandName}

Select option from status column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[class='ag-rich-select-row']    ${wait_time}
    wait until element is enabled      css:div[class='ag-rich-select-row']    ${wait_time}
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='Rich Select Field'] div:nth-child(4) div    ${wait_time}
    wait until element is enabled      css:div[aria-label='Rich Select Field'] div:nth-child(4) div    ${wait_time}
    click element       css:div[aria-label='Rich Select Field'] div:nth-child(4) div

Select option from technology group column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    wait until element is enabled      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='Rich Select Field'] div:nth-child(4) div    ${wait_time}
    wait until element is enabled      css:div[aria-label='Rich Select Field'] div:nth-child(4) div    ${wait_time}
    click element       css:div[aria-label='Rich Select Field'] div:nth-child(4) div

Enter the value in the product_description column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is product Description

Enter the value in the product_feature column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is the Feature of product

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Verify the upload message text - bulk import tech
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     ${wait_time}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']     ${wait_time}
    wait until element contains      css:.ag-center-cols-container div[col-id='${option}']      Upload is prepared      ${wait_time}
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     ${wait_time}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']     ${wait_time}
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}


Click on I_m_done button when popup appears
    [Arguments]     ${option}
     wait until element is visible       css:.${option}-qa     ${wait_time}
     wait until element is enabled       css:.${option}-qa     ${wait_time}
     click element      css:.${option}-qa


Verify product added using bulk_import_export
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${search_productName}    ${wait_time}
     wait until element is enabled      ${search_productName}    ${wait_time}
     click element     ${search_productName}
     Clear Element Text     ${search_productName}
     input text   ${search_productName}  ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     ${wait_time}
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}

Enter the new value in the product name column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditProductName}=    Catenate    ProductName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditProductName}
    set global variable    ${generated_EditProductName}

Enter the new value in the brand name column in bulk_edit
    [Arguments]    ${option}    ${brandName}
    DashboardPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${brandName}

Select option from status column in bulk_edit
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[class='ag-rich-select-row']    ${wait_time}
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column in bulk_edit
    [Arguments]    ${option}    ${option2}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='Rich Select Field'] div:nth-child(${option2}) div    ${wait_time}
    click element       css:div[aria-label='Rich Select Field'] div:nth-child(${option2}) div
Click on Refresh icon of product-list page
    wait until element is visible       css:.reset-product-qa        ${wait_time}
    click element       css:.reset-product-qa
    wait until element is not visible      ${loaderIcon}     ${wait_time}

Enter the new value in the department name column in bulk_import
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_addDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input     ${generated_addDepartmentName}
    set global variable    ${generated_addDepartmentName}

Select option from department status column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      //div[@class='ag-virtual-list-item ag-rich-select-virtual-list-item']//div[normalize-space()='Inactive']    ${wait_time}
    click element       //div[@class='ag-virtual-list-item ag-rich-select-virtual-list-item']//div[normalize-space()='Inactive']

Enter the new value in the cost center column in bulk_import
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_addCostCenter}=    Catenate    ${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${generated_addCostCenter}
    set global variable    ${generated_addCostCenter}

Verify department added using bulk_import_export
   [Arguments]    ${departmentName}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      ${searchBar_department}     ${wait_time}
    click element      ${searchBar_department}
    Clear Element Text      ${searchBar_department}
    input text   ${searchBar_department}   ${departmentName}
    sleep       ${search_sleep}
    Wait Until Element Contains    //td[normalize-space()='${departmentName}']      ${departmentName}     ${wait_time}
    ${get_departmentName} =    get text    ${fetch_departmentName}
    log to console     ${get_departmentName}
    should be equal    ${departmentName}     ${get_departmentName}

Enter the new value in the department name column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditDepartmentName}
    set global variable    ${generated_EditDepartmentName}

Select option from department status column in bulk_edit
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:.ag-rich-select-row.ag-rich-select-row-selected    ${wait_time}
    click element       css:.ag-rich-select-row.ag-rich-select-row-selected

Enter the new value in the cost center column in bulk_edit
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10     [NUMBERS]
    ${generated_EditCostCenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditCostCenter}
    set global variable    ${generated_EditCostCenter}

Confirm the exit import process pop appears
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      ${wait_time}

Enter the new value in the building name column
    [Arguments]    ${option}    ${buildingName}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input     ${wait_time}
    input text      css:.ag-center-cols-container div[col-id='${option}'] input     ${buildingName}

Enter the new value in the floor number column
    [Arguments]    ${option}    ${floorNumber}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${floorNumber}

Enter the new value in the room number column
    [Arguments]    ${option}    ${roomNumber}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${roomNumber}

Enter the new value in the state column
    [Arguments]    ${option}    ${state}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${state}

Enter the new value in the city column
    [Arguments]    ${option}    ${city}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${city}

Enter the new value of cost center in location bulk edit
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generated_costcenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element    css:.ag-center-cols-container div[col-id='${option}']
    input text   //textarea[@aria-label='Input Editor']   ${generated_costcenter}
    Press Keys  //textarea[@aria-label='Input Editor']    ENTER
    set global variable    ${generated_costcenter}

Enter the new value in the location name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_NewLocationName}=    Catenate    LocationName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_NewLocationName}
    set global variable    ${generated_NewLocationName}

Search by location name
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     click element      ${search_LocationName}
     Clear Element Text      ${search_LocationName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_LocationName}   ${LocationName}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
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
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of assigned in the last name column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    LName_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Enter the new value of assigned in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    ${generated_assigneeFname}@yopmail.net
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Enter the new value of assigned in the ID column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generated_assigneeEmpID}=    Catenate    EmployeeID_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmpID}
    set global variable    ${generated_assigneeEmpID}

Search by empID
     [Arguments]    ${empID}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
     input text   ${assignedUser_searchBar}     ${empID}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the assigned empID from the row   ${empID}
     should be equal    ${fetch_assignedUserEmpID}     ${empID}

Search assigned user by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     click element      ${assignedUser_searchBar}
     Clear Element Text      ${assignedUser_searchBar}
     input text   ${assignedUser_searchBar}     ${name}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the assigned user name from the row   ${name}
     should be equal    ${fetch_assignedUserFname}     ${name}

Enter the new value of team member in the phone number column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_assigneeFname}=    Catenate    90${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeFname}
    set global variable    ${generated_assigneeFname}

Enter the new value of team member in the email column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeLname}=    Catenate    BusinessEmail${random_string}@mail-mario.fr.nf
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeLname}
    set global variable    ${generated_assigneeLname}

Enter the new value of team member in the department column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(5) div    ${wait_time}
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(5) div

Enter the new value of team member in the location column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    ${wait_time}
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div

Enter the new value of team member in the role column
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    wait until element is visible       css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div    ${wait_time}
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div

Click employee id box to scroll
    wait until element is not visible      ${loaderIcon}     ${wait_time}
    wait until element is visible       css:.ag-center-cols-container div[col-id='EmployeeId']      ${wait_time}
    click element       css:.ag-center-cols-container div[col-id='EmployeeId']

Search team member by first and last name
     [Arguments]    ${name}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     click element      ${teamMember_searchBar}
     Clear Element Text      ${teamMember_searchBar}

     input text   ${teamMember_searchBar}     ${name}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the team member name from the row   ${name}
     should be equal    ${fetch_teamMemberFname}     ${name}

click on the arrow of product
    [Arguments]     ${text}     ${number}
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible    (//span[normalize-space()='${text}']//following-sibling::span)[${number}]     ${wait_time}
    wait until element is enabled   (//span[normalize-space()='${text}']//following-sibling::span)[${number}]      ${wait_time}
    click element   (//span[normalize-space()='${text}']//following-sibling::span)[${number}]

Enter the new value in the product, brand, group and type value in bulk_edit of technology
    [Arguments]     ${option}   ${text}
    sleep       ${search_sleep}
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible   (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]   ${wait_time}
    wait until element is enabled   (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]   ${wait_time}
    double click element    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]
    Press Keys    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     CONTROL+A
    Press Keys    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     DELETE
    sleep   2
    double click element    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]
    input text    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]//input     ${text}
    Press Keys      (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]       ENTER
    sleep   ${search_sleep}

Select the new value of technology group in bulk edit of technology
    [Arguments]     ${option}   ${text}
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible   (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]   ${wait_time}
    wait until element is enabled   (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]   ${wait_time}
    double click element    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]
    wait until element is visible   //div[contains(text(),'${text}')]   ${wait_time}
    Press Keys      //div[contains(text(),'${text}')]       ENTER

Enter the new value of asset id of bulk edit of technology
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assetidbulkedit}=    Catenate    AssetID_${random_string}
    wait until element is visible       (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]//input    ${wait_time}
    input text   (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]//input   ${generated_assetidbulkedit}
    Press Keys      (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]       ENTER
    set global variable    ${generated_assetidbulkedit}

Click on confirm pop up of update button
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-warning  ${wait_time}
    click element   css:.qa-confirm-technology-bulk-edit-warning
#    sleep   ${search_sleep}
    wait until element is not visible       ${shadow}          60

Click on confirm button under pop up of finish button of bulk edit
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-finish      ${wait_time}
    click element   css:.qa-confirm-technology-bulk-edit-finish
    wait until element is not visible       ${shadow}          60

Click on confirm button under pop up of exit button of bulk edit
    wait until element is visible  css:.qa-confirm-technology-bulk-edit-exit    ${wait_time}
    click element   css:.qa-confirm-technology-bulk-edit-exit
    wait until element is not visible       ${shadow}          60


Enter the new value of first name in bulk import of team member
    [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Firstname}=    Catenate    FName_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}

    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input    ${generated_Firstname}
    set global variable    ${generated_Firstname}

Enter the new value of last name in bulk import of team member
    [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_lastname}=    Catenate    LName_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input    ${generated_lastname}
    set global variable    ${generated_lastname}

Enter position and title of team member bulk import
    [Arguments]     ${option}
    wait until element is visible   css:.ag-center-cols-container div[col-id='Position']    ${wait_time}
    wait until element is enabled   css:.ag-center-cols-container div[col-id='Position']    ${wait_time}
    double click element    css:.ag-center-cols-container div[col-id='Position']
    input text      css:.ag-center-cols-container div[col-id='Position'] input      ${option}
    Press Keys      css:.ag-center-cols-container div[col-id='Position']       ENTER

Scroll Element
    [Arguments]  ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    scroll element into view    (//div[@data-ref='eBodyViewport']//div[@col-id='${option}'])[1]


Click on the fields and select value from dropdown of technology bulk edit
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible   css:.ag-center-cols-container div[col-id='${option}']      ${wait_time}
    wait until element is enabled   css:.ag-center-cols-container div[col-id='${option}']      ${wait_time}
    double click element    css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div      ${wait_time}
    click element   css:div[class='ag-theme-alpine ag-popup'] div:nth-child(3) div
    sleep   ${search_sleep}

Enter random employee id of bulk import
     [Arguments]    ${option}
    MemberPage.Double click team member bulk import    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_employeeid}=    Catenate    EmployeeID_${random_string}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input     ${generated_employeeid}
    set global variable    ${generated_employeeid}

Perform the keyboard action
    [Arguments]  ${option}
    Generic.Click keyboard button   css:.ag-center-cols-container div[col-id='${option}']       TAB


Enter the new value in the first address column
    [Arguments]    ${option}    ${address}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter random zip code of bulk import of loaction
     [Arguments]    ${option}
    LocationPage.Double click    ${option}
    ${random_string} =    Generate Random String       7      [NUMBERS]
    ${generated_zipcode}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    input text  css:.ag-center-cols-container div[col-id='${option}'] input     ${generated_zipcode}
    set global variable    ${generated_zipcode}

click on checkbox under technology bulk import
    wait until element is visible   //label[contains(text(),'- Create new assets as well as update data on exis')]      ${wait_time}
    wait until element is enabled   //label[contains(text(),'- Create new assets as well as update data on exis')]      ${wait_time}
    click element   //label[contains(text(),'- Create new assets as well as update data on exis')]
    wait until element is not visible       ${loaderIcon}       ${wait_time}

Enter the new value of serial number of technology bulk import
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_serialnumber}=    Catenate    SerialNumber_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_serialnumber}
    set global variable    ${generated_serialnumber}

Enter the new value of asset id of technology bulk import
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generated_bulk_import_assetid}=    Catenate    AssetID_${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_bulk_import_assetid}
    log to console      ${generated_bulk_import_assetid}
    set global variable    ${generated_bulk_import_assetid}

Enter the new value in the fields of technology bulk import
    [Arguments]    ${option}    ${address}
    LocationPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter the new value in cost type field of technology bulk import
    [Arguments]    ${option}    ${address}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter the new value in last Payment date field of technology bulk import
    [Arguments]    ${option}    ${address}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${address}

Enter the new value of country in location bulk import
    [Arguments]    ${option}    ${option1}
    MemberPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
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
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_SubnetIp}
    set global variable    ${generated_SubnetIp}

Enter static IP subnet
    [Arguments]    ${option}        ${option1}
    MemberPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled       css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${option1}


Click on the confirm button of finish pop up
    wait until element is visible   css:.qa-confirm-finish-bulk-edit       ${wait_time}
    wait until element is enabled   css:.qa-confirm-finish-bulk-edit       ${wait_time}
    click element   css:.qa-confirm-finish-bulk-edit


Click on confirm warning button after update
    wait until element is visible   css:.qa-confirm-technology-bulk-edit-warning      ${wait_time}
    wait until element is enabled   css:.qa-confirm-technology-bulk-edit-warning       ${wait_time}
    click element   css:.qa-confirm-technology-bulk-edit-warning
    wait until element is not visible       ${shadow}          60

click on all checkbox under technology bulk import
    [Arguments]     ${option}
    wait until element is visible   //label[contains(text(),'${option}')]      ${wait_time}
    wait until element is enabled   //label[contains(text(),'${option}')]      ${wait_time}
    click element   //label[contains(text(),'${option}')]
    wait until element is not visible       ${loaderIcon}       ${wait_time}

Create unique department name random under technology bulk import
    wait until element is visible       //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input        ${wait_time}
    wait until element is enabled       //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_Department_bulk}=    Catenate    DeptNo_${random_string}
    input text   //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input   ${generated_Department_bulk}
    sleep      ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_Department_bulk}
    set global variable    ${generated_Department_bulk}

Select department status ynder technology bulk import
    [Arguments]    ${option}
    wait until element is visible       css:.qa-statusFilterDropdown input        ${wait_time}
    wait until element is enabled       css:.qa-statusFilterDropdown input       ${wait_time}
    click element    css:.qa-statusFilterDropdown input
    Clear Element Text      ${add_dept_status}
    Generic.Select parameter    ${option}

Select department cost center under technology bulk import
    [Arguments]    ${option}
    wait until element is visible       //form[contains(@class,'ng-dirty')]//input[@id='costCenter']        ${wait_time}
    wait until element is enabled       //form[contains(@class,'ng-dirty')]//input[@id='costCenter']        ${wait_time}
    input text    //form[contains(@class,'ng-dirty')]//input[@id='costCenter']   ${option}

Search by location name under technology bulk import
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     click element      css:.searchLocation-QA
     Clear Element Text     css:.searchLocation-QA
     input text   css:.searchLocation-QA   ${LocationName}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the location Name from the row   ${LocationName}
     should be equal    ${fetch_locationName}     ${LocationName}

Add product feature bulk import
    wait until element is visible       css:#features     ${wait_time}
    wait until element is enabled       css:#features     ${wait_time}
    input text    css:#features    This is the features of new product added.

Select product status technology bulk import
    [Arguments]    ${option}
    wait until element is visible       css:#Product-Status     ${wait_time}
    click element  css:#Product-Status
    input text   css:#Product-Status  ${option}
    Generic.Select parameter     ${option}

Save added product details technology bulk import
    wait until element is visible      //div[@class='modal-footer']//button[normalize-space()='Save']       ${wait_time}
    wait until element is enabled      //div[@class='modal-footer']//button[normalize-space()='Save']       ${wait_time}
    click element   //div[@class='modal-footer']//button[normalize-space()='Save']
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Select partner business URL technology bulk import
    wait until element is visible       //input[@id='businessUrl']        ${wait_time}
    wait until element is enabled       //input[@id='businessUrl']        ${wait_time}
    sleep      2
    click element   //input[@id='businessUrl']
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Enter contact business email via link under technology bulk import
    [Arguments]    ${Pname}    ${Bname}
    wait until element is visible   css:#ContactEmail        ${wait_time}
    wait until element is enabled      css:#ContactEmail       ${wait_time}
    click element   css:#ContactEmail
    clear element text    css:#ContactEmail
    input text  css:#ContactEmail   ${Pname}@${Bname}
    ${generate_ContactBusinessEmail}=    Catenate    ${Pname}@${Bname}
    log to console  ${Pname}@${Bname}
    set global variable    ${generate_ContactBusinessEmail}

Click on team member location technology bulk import
    [Arguments]     ${option}
    wait until element is visible     ${TMLocation}     ${wait_time}
    wait until element is enabled     ${TMLocation}      ${wait_time}
    click element   ${TMLocation}
    input text     ${TMLocation}        ${option}
    wait until element is visible   //span[normalize-space()='${option}']       ${wait_time}
    wait until element is visible   //span[normalize-space()='${option}']       ${wait_time}
    click element   //span[normalize-space()='${option}']

Click on the confirm button under pop up in technology bulk import
#    wait until element is visible     ${loaderIcon}    ${wait_time}
    wait until element is visible     //div[@id='confirmUpload']//button[@type='button'][normalize-space()='Confirm']    ${wait_time}
    wait until element is enabled    //div[@id='confirmUpload']//button[@type='button'][normalize-space()='Confirm']      ${wait_time}
    click element   //div[@id='confirmUpload']//button[@type='button'][normalize-space()='Confirm']
    wait until element is not visible     ${loaderIcon}    ${wait_time}

Select option from budget currency in technology bulk import
    [Arguments]    ${option}    ${option2}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
#    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='Rich Select Field'] div:nth-child(${option2}) div    ${wait_time}
    click element       css:div[aria-label='Rich Select Field'] div:nth-child(${option2}) div

Search Team Member by name under asset wizard
    [Arguments]    ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      css:#seacrhbar-member-wizard     ${wait_time}
    click element      css:#seacrhbar-member-wizard
    Clear Element Text      css:#seacrhbar-member-wizard
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   css:#seacrhbar-member-wizard   ${name}
    sleep      ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Verify Brand added under asset wizard
   [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      css:#seacrhbar-brand-wizard     ${wait_time}
     click element      css:#seacrhbar-brand-wizard
     Clear Element Text      css:#seacrhbar-brand-wizard
     input text   css:#seacrhbar-brand-wizard   ${BrandName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${BrandName}']      ${BrandName}     ${wait_time}
     ${get_brandName} =    get text    ${fetch_brandName}
     log to console     ${get_brandName}
     should be equal    ${BrandName}     ${get_brandName}

Search by business name under asset wizard
    [Arguments]    ${BusinessName}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       css:#seacrhbar-partner-wizard       ${wait_time}
    input text      css:#seacrhbar-partner-wizard     ${BusinessName}
    sleep       ${search_sleep}
    wait until element is visible       //td[normalize-space()='${BusinessName}']     ${wait_time}
    ${get_businessName} =    get text    //td[normalize-space()='${BusinessName}']
    log to console     ${get_businessName}
    should be equal    ${BusinessName}     ${get_businessName}

Verify product added using bulk_import_export under asset wizard
    [Arguments]     ${productName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      css:#seacrhbar-product-wizard    ${wait_time}
     wait until element is enabled      css:#seacrhbar-product-wizard     ${wait_time}
     click element     css:#seacrhbar-product-wizard
     input text   css:#seacrhbar-product-wizard     ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     ${wait_time}
     ${get_productName1} =    get text    //td[normalize-space()='${productName}']
     log to console     ${get_productName1}
     should be equal    ${productName}     ${get_productName1}

Verify department added using bulk_import_export under asset wizard
    [Arguments]     ${departmentName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      css:#seacrhbar-department-wizard    ${wait_time}
     wait until element is enabled      css:#seacrhbar-department-wizard     ${wait_time}
     click element     css:#seacrhbar-department-wizard
     input text   css:#seacrhbar-department-wizard     ${departmentName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${departmentName}']      ${departmentName}      ${wait_time}
     ${get_departmentName1} =    get text    //td[normalize-space()='${departmentName}']
     log to console     ${get_departmentName1}
     should be equal    ${departmentName}     ${get_departmentName1}

Verify that element is not enabled
    [Arguments]         ${option}
    wait until element is visible    //button[contains(@class,'disabled-button')][normalize-space()='${option}']        ${wait_time}

Enter static value in the fields of department bulk import
    [Arguments]    ${option}        ${option1}
    DashboardPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${option1}

Clear the text of the field
    [Arguments]     ${option}
    Wait Until Element Is Visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Wait Until Element Is Enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double Click Element               css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CTRL+a    BACKSPACE

Verify that element is enabled
    [Arguments]         ${option}
    wait until element is visible    //button[normalize-space()='${option}']       ${wait_time}

Double click to clear the dropdown
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE
    sleep       ${search_sleep}

Clear the text of the field under team member
    [Arguments]     ${option}
    Wait Until Element Is Visible      css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    Wait Until Element Is Enabled      css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    Double Click Element               css:.ag-pinned-left-cols-container div[col-id='${option}']
    Press Keys    css:.ag-pinned-left-cols-container div[col-id='${option}']     CTRL+a    BACKSPACE
    sleep       ${search_sleep}

Enter the random value in the brand field under product bulk import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_addBrandName}=    Catenate    BrandName${random_string}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${generated_addBrandName}
    set global variable    ${generated_addBrandName}

Enter the static value in the product name column in bulk_import
    [Arguments]    ${option}    ${ProductName}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    ${wait_time}
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${ProductName}

#Enter the 101 characters in the bulk import
#    [Arguments]    ${option}
#    Bulk_Import_ExportPage.Double click    ${option}
#    ${random_string} =    Generate Random String       100      [NUMBERS]
#    ${generated_addProductName_more}=    Catenate    ProductName${random_string}
#    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
#    wait until element is enabled       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     ${wait_time}
#    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${generated_addProductName_more}
#    set global variable    ${generated_addProductName_more}


Clear the text of the field with delete
    [Arguments]     ${option}
    Wait Until Element Is Visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Wait Until Element Is Enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Enter the new value of assigned in the email column for bulk import and edit
    [Arguments]    ${option}
    MemberPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assigneeEmail}=    Catenate    BusinessEmail${random_string}@yopmail.net
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    ${wait_time}
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_assigneeEmail}
    set global variable    ${generated_assigneeEmail}

Select the department from dropdown under technology bulk import
    [Arguments]     ${option}
    wait until element is visible       //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input        ${wait_time}
    wait until element is enabled       //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input        ${wait_time}
    click element   //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input
    input text   //div[contains(@class,'full-page-block')]//ng-select[contains(@id,'department-name')]//input  ${option}
    sleep      ${search_sleep}
    wait until element is visible      //span[contains(text(),'${option}')]       ${wait_time}
    wait until element is enabled       //span[contains(text(),'${option}')]        ${wait_time}
    click element   //span[contains(text(),'${option}')]


Select the status under add department technology bulk import
    wait until element is visible       (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]        ${wait_time}
    wait until element is enabled      (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]       ${wait_time}
    click element   (//ng-select[contains(@class,'qa-add-department-status')]//input)[1]
    sleep      ${search_sleep}
    wait until element is visible     //div[contains(@id,'1')]       ${wait_time}
    wait until element is enabled       //div[contains(@id,'1')]       ${wait_time}
    click element   //div[contains(@id,'1')]

Enter cost center under add department technology bulk import
    [Arguments]     ${option}
    wait until element is visible       (//input[@id='costCenter'])[1]        ${wait_time}
    wait until element is enabled      (//input[@id='costCenter'])[1]       ${wait_time}
    click element   (//input[@id='costCenter'])[1]
    input text  (//input[@id='costCenter'])[1]  ${option}

Click on the bulk import option under asset wizard via technology
    wait until element is visible       css:.qa-department-bulk-import        ${wait_time}
    wait until element is enabled      css:.qa-department-bulk-import       ${wait_time}
    click element   css:.qa-department-bulk-import

Click on the location bulk import option under asset wizard via technology
    wait until element is visible       css:.qa-addLocation-bulk        ${wait_time}
    wait until element is enabled      css:.qa-addLocation-bulk       ${wait_time}
    click element   css:.qa-addLocation-bulk

Click on the product bulk import option under asset wizard via technology
    wait until element is visible       css:.qa-add-bulk-product        ${wait_time}
    wait until element is enabled      css:.qa-add-bulk-product       ${wait_time}
    click element   css:.qa-add-bulk-product

Click on the team member bulk import under asset wizard
    wait until element is visible       css:.qa-add-bulk-member       ${wait_time}
    wait until element is enabled      css:.qa-add-bulk-member       ${wait_time}
    click element   css:.qa-add-bulk-member

Clear the text of the field with delete under asset wizard
    [Arguments]     ${option}
    Wait Until Element Is Visible      css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    Wait Until Element Is Enabled      css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    Press Keys    css:.ag-pinned-left-cols-container div[col-id='${option}']     DELETE

Enter static value in the fields of team membder bulk import under asset wizard
    [Arguments]    ${option}        ${option1}
    MemberPage.Double click team member bulk import    ${option}
    wait until element is visible       css:.ag-pinned-left-cols-container div[col-id='${option}']    ${wait_time}
    input text  css:.ag-pinned-left-cols-container div[col-id='${option}'] input   ${option1}

Search with invalid data on search bar under asset wizard
    [Arguments]    ${option}        $[option1}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      css:#seacrhbar-${option}-wizard    ${wait_time}
     wait until element is enabled      css:#seacrhbar-${option}-wizard     ${wait_time}
     click element     css:#seacrhbar-${option}-wizard
     input text   css:#seacrhbar-${option}-wizard     $[option1}
     sleep       ${search_sleep}