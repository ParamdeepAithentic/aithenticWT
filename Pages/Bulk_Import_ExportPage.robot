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
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      ${generated_addProductName}
    set global variable    ${generated_addProductName}

Enter the new value in the brand name column in bulk_import
    [Arguments]    ${option}    ${brandName}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    input text   xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input   ${brandName}

Select option from status column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[class='ag-rich-select-row']    60
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div

Select option from technology group column in bulk_import
    [Arguments]    ${option}
    wait until element is visible      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]    60
    Double click element      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div

Enter the value in the product_description column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is product Description

Enter the value in the product_feature column in bulk_import
    [Arguments]    ${option}
    Bulk_Import_ExportPage.Double click    ${option}
    wait until element is visible       xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]     60
    input text      xpath:(//div[@class='ag-center-cols-container']//div[@col-id='${option}'])[1]//input      This is the Feature of product

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     60
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

Click on I_m_done button when popup appears
    [Arguments]     ${option}
     wait until element is visible       //button[normalize-space()="${option}"]    60
     click element      //button[normalize-space()="${option}"]

Verify product added using bulk_import
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_productName}     60
     click element      ${search_productName}
     Clear Element Text      ${search_productName}
     input text   ${search_productName}   ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     60
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}