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

*** Variables ***
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block
${drawerList}       //ul[@class='list-unstyled w-100 d-inline-block mt-3 pt-0']/li
${side_options}     //ul[@id='common-side-bar-left']//li
${profile_option}        //img[@alt='icon']
${loaderIcon}     //div[@role='status']

###############profile option##########
${profileName}     css:#user-name-nav
${full_Profile_List}     //div[@class='dropdown-menu themeScrollBar profile-dropdown ng-tns-c166-0 show']/div/ul/li
#//div[@aria-labelledby='dropdownMenuButton']//li
######## Add brand #########
${add_Brand}    css:a[title='Click here to Add Brand']
${add_brandName}    css:#Name
${add_brand_mfc_URL}    //input[@formcontrolname='Domain']
${brand_country}    css:#brandCountry
${select_country}   css:.ng-option-label.ng-star-inserted

${brand_saveBTN}        //button[@title='Click here to Save']
${brand_saveBtn_main}     css:button[class='btn button-green mt-0 m5px mr-0 add-brand-qa ng-star-inserted']
${search_brandName}     css:input[placeholder='Search by Brand Name']
${fetch_brandName}    css:td:nth-child(2)

########## Add product #####

${add_Product}     css:a[title='Click here to Add Product']
${actionBTN}       css:#Team-Member-Actions
${add_Product_modal}     css:div[id='addProductPopup'] div[role='document'] div[role='document'] div[class='modal-content']
${ProductName}     css:#ProductName
${enterAndSelect_Brand}     css:.qa-BrandName input
${ProductDescription}     //div[@class='card-container themeScrollBar mt-1 p-2']//textarea[@id='ProductDescription']
${ProductFeatures}     css:#ProductFeatures


${ProductStatus}     //input[@id='ProductStatus']
${select_technology_group}     css:nz-tree-select[id='TechGroupId'] div nz-select-search
${select_technology_type}     //div[@class='ng-select-container'][normalize-space()='Select Technology Type']
${save_product_modal}     css:button[class='btn button-green mt-0 mx-2 ng-star-inserted']
${search_productName}     css:input[placeholder='Search by Product Name or Description']
${fetch_productName}    css:td:nth-child(2)

${add_dept_btn}     //a[normalize-space()='Add Department']
${add_dept_name}     css:.profile-section-department div ng-select#department-name input
${add_dept_status}     css:.profile-section-department div ng-select.qa-add-department-status input
${add_dept_costCenter}     css:.profile-section-department .qa-add-department-costCenter


${searchBar_department}     css:input[placeholder='Search by Department Name']
${fetch_departmentName}     css:td:nth-child(2)
${address_Line}     xpath://input[@id='addressLine1']
${address_line2}    xpath://input[@id='addressLine2']
${table}        css:.table.table-hover.border-grey.bg-white
${column}       1

################################### Network Discovery ######################################################
#//button[normalize-space()='Download Agent']




*** Keywords ***
Click on add department
    wait until element is visible      ${add_dept_btn}      60
    wait until element is enabled      ${add_dept_btn}      60
    click element      ${add_dept_btn}


Save the department
    [Arguments]    ${option}
    wait until element is visible       css:.profile-section-department div button.qa-${option}-department-modal      60
    click element       css:.profile-section-department div button.qa-${option}-department-modal
#add, close


Select the option from action menu
    [Arguments]    ${option}
    wait until element is visible       css:.qa-product-bulk-${option}     60
    wait until element is enabled       css:.qa-product-bulk-${option}     60
    click element   css:.qa-product-bulk-${option}

Select the option from department action menu
    [Arguments]    ${option}
    wait until element is visible       css:a[title='${option}']     60
    wait until element is enabled       css:a[title='${option}']     60
    click element   css:a[title='${option}']

Select brand from list
    [Arguments]    ${BrandName}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}     ${BrandName}
    Generic.Select parameter     ${BrandName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   DashboardPage - Select brand from list      3    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product from list
    [Arguments]    ${ProductName}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}   ${ProductName}
    Generic.Select parameter     ${ProductName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   DashboardPage - Select product from list      4    ${pageTime}     ${ActualTime}    DashboardPage_Time


Select an option from company details side list
    [Arguments]    ${option}
    Generic.Select parameter    ${option}

Click on download agent button to download
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Generic.click on the button     ${option}

Create random productName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Click on action button
    wait until element is visible       ${actionBTN}   60
    click element       ${actionBTN}
#    wait until element is visible       ${add_Product_modal}    60
#    wait until element is visible       ${ProductName}      60

Click add product button
    wait until element is visible       ${add_Product}   60
    wait until element is enabled       ${add_Product}   60
    click element       ${add_Product}
    wait until element is visible       ${add_Product_modal}    60
    wait until element is visible       ${ProductName}      60

Create product name random
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Create product name self
    [Arguments]    ${option}
    wait until element is visible   ${ProductName}      60
    input text   ${ProductName}   ${option}


Add product brand name
    [Arguments]    ${option}
    wait until element is visible       ${enterAndSelect_Brand}     60
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}    ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   DashboardPage - Add product brand name      5    ${pageTime}     ${ActualTime}    DashboardPage_Time


Add product description
    wait until element is visible       ${ProductDescription}     60
    input text   ${ProductDescription}   This is the description of new product added.

Add product feature
    wait until element is visible       ${ProductFeatures}     60
    input text   ${ProductFeatures}   This is the features of new product added.

Select product status
    [Arguments]    ${option}
    wait until element is visible       ${ProductStatus}     60
    click element   ${ProductStatus}
    Clear Element Text      ${ProductStatus}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${ProductStatus}   ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   DashboardPage - Select product status      6    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product technology type
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_type}     60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element   ${select_technology_type}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   DashboardPage - Select product technology type      7    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product technology group
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_group}     60
    Mouse Over      ${select_technology_group}
    click element   ${select_technology_group}
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       60
    click element       //span[normalize-space()='${option}']

Save added product details
    wait until element is visible      ${save_product_modal}       60
    click element   ${save_product_modal}
#    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60
######---- verify pull on server

Verify product added
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_productName}     60
     click element      ${search_productName}
     Clear Element Text      ${search_productName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_productName}   ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     60
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}
     ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   DashboardPage - Verify product added      8    ${pageTime}     ${ActualTime}    DashboardPage_Time


Click add brand button
    wait until element is visible       ${add_Brand}        60
    click element   ${add_Brand}


Create random brandName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_BrandName}=    Catenate    BrandName${random_string}
    input text   ${add_brandName}   ${generated_BrandName}
    log to console      ${generated_BrandName}
    set global variable    ${generated_BrandName}


Add self created brand name
    [Arguments]    ${option}
    wait until element is visible       ${add_brandName}        60
    input text   ${add_brandName}   ${option}
    log to console      ${generated_BrandName}

Add business manufacturer URL
    [Arguments]    ${option}
    ${generated_BrandURL}=    Catenate    ${option}.com
    input text   ${add_brand_mfc_URL}   ${generated_BrandURL}
    log to console      ${generated_BrandURL}
    set global variable    ${generated_BrandURL}

Add brand manufacturer country
    [Arguments]    ${country}
    click element   ${brand_country}
    Clear Element Text      ${brand_country}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${brand_country}   ${country}
    Generic.Select parameter     ${country}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   DashboardPage - Add brand manufacturer country      9    ${pageTime}     ${ActualTime}    DashboardPage_Time



Save added brand details
    wait until element is visible       ${brand_saveBTN}        60
    click element   ${brand_saveBTN}

Click added brand main save button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       ${brand_saveBtn_main}
    click element   ${brand_saveBtn_main}
#    wait until element is visible      ${search_brandName}     60

Verify Brand added
   [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${search_brandName}     60
     click element      ${search_brandName}
     Clear Element Text      ${search_brandName}
#     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_brandName}   ${BrandName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${BrandName}']      ${BrandName}     60
     ${get_brandName} =    get text    ${fetch_brandName}
     log to console     ${get_brandName}
     should be equal    ${BrandName}     ${get_brandName}
     click element  css:.fas.fa-ellipsis-h.three-dots
#     ${EndTime1} =     Get Current Time in Milliseconds
#    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
#    Calculate Running time  10  ${pageHeading}   DashboardPage - Verify Brand added      10    ${pageTime}     ${ActualTime}    DashboardPage_Time



select the option from the dashboard drawer
    [Arguments]     ${option}
    wait until element is visible    //span[normalize-space()='${option}']      60
    click element    //span[normalize-space()='${option}']


################################### WELCOME PAGE AND AHEAD ###############
Click on complete setup button
    [Arguments]     ${option}
    wait until element is visible    //button[normalize-space()='${option}']        60
    click element    //button[normalize-space()='${option}']


Select the asset ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}      60
    click element    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}


Select the employee ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}       60
    click element    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}


Select the location ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-location-id-${option}       60
    click element    css:.checkmark.qa-inner-customcheckbox-location-id-${option}


#ProductId, BrandName, ProductStatus,TechType, GroupName, ProductDescription
Enter the new value in the product name column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditProductName}=    Catenate    ProductName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditProductName}
    set global variable    ${generated_EditProductName}

Enter the new value in the brand name column
    [Arguments]    ${option}    ${brandName}
    DashboardPage.Double click    ${option}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${brandName}

Select option from status column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[class='ag-rich-select-row']    60
    click element       css:div[class='ag-rich-select-row']

Select option from technology type column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='List'] div:nth-child(4) div    60
    click element       css:div[aria-label='List'] div:nth-child(4) div


Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Create unique department name random
    wait until element is visible       ${add_dept_name}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_dept_name}   ${generated_DepartmentNumber}
    sleep       1
    click element     css:div[role='option']
    log to console      ${generated_DepartmentNumber}
    set global variable    ${generated_DepartmentNumber}

Select department status
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_status}        60
    click element     ${add_dept_status}
    Clear Element Text      ${add_dept_status}
    Generic.Select parameter    ${option}

Select department cost center
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_costCenter}        60
    input text    ${add_dept_costCenter}   ${option}

Verify department added
   [Arguments]    ${departmentName}
    wait until element is visible       css:thead tr       60
    wait until element is visible      ${searchBar_department}     60
    click element      ${searchBar_department}
    Clear Element Text      ${searchBar_department}
#    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${searchBar_department}   ${departmentName}
    sleep       ${search_sleep}
    Wait Until Element Contains    //td[normalize-space()='${departmentName}']      ${departmentName}     60
    ${get_departmentName} =    get text    ${fetch_departmentName}
    log to console     ${get_departmentName}
    should be equal    ${departmentName}     ${get_departmentName}
#    ${EndTime1} =     Get Current Time in Milliseconds
#    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
#    Calculate Running time  8  ${pageHeading}   DashboardPage - Verify product added      8    ${pageTime}     ${ActualTime}    DashboardPage_Time

Enter the new value in the department name column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_EditDepartmentName}=    Catenate    DepartmentName${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditDepartmentName}
    set global variable    ${generated_EditDepartmentName}

Select option from department status column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:.ag-rich-select-row.ag-rich-select-row-selected    60
    click element       css:.ag-rich-select-row.ag-rich-select-row-selected


Enter the new value in the cost center column
    [Arguments]    ${option}
    DashboardPage.Double click    ${option}
    ${random_string} =    Generate Random String       4      [NUMBERS]
    ${generated_EditCostCenter}=    Catenate    ${random_string}
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}'] input    60
    input text   css:.ag-center-cols-container div[col-id='${option}'] input   ${generated_EditCostCenter}
    set global variable    ${generated_EditCostCenter}

Verify the upload message text
    [Arguments]    ${option}    ${text}
    wait until element is not visible      ${loaderIcon}     60
    wait until element is visible       css:.ag-center-cols-container div[col-id='${option}']     60
    ${fetch_text} =    get text    css:.ag-center-cols-container div[col-id='${option}']
    log to console  uploadtext:${fetch_text}
    should be equal    ${fetch_text}    ${text}

Confirm the exit import process pop appers
    Wait Until Element Is Visible    ${assignedUser_Edit_popUp}      60

Verify the side option list parameters
   wait until element is visible   ${side_options}      60
   @{expectedList} =    Create List        Aithentic logo    Dashboard       Messages        Location        Team Members      Partners      Contracts      Technology      #Asecure-Cloud-Login
   ${elements} =  Get WebElements     ${side_options}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      ${title}=    Get Element Attribute    ${element}    title
      Append To List    ${actualList}     ${title}
   END
   lists should be equal    ${expectedList}    ${actualList}


Verify the drawer list parameters
   wait until element is visible   ${drawerList}        60
   @{expectedList} =    Create List      Asset Overview     IT Performance       Subscription        Reports
   ${elements} =  Get WebElements     ${drawerList}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   lists should be equal    ${expectedList}    ${actualList}


#####NOT WORKING#########
Verify the profile option list parameters
    wait until element is visible    ${profile_option}      60
    click element    ${profile_option}
    sleep       2
    ${elements} =  Get WebElements     ${full_Profile_List}
    @{actualList} =   Create List
    FOR  ${element}  IN      @{elements}

      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
    END

Click on Dropdown List
    wait until element is visible   css:#user-name-nav  60
    Click element   css:#user-name-nav

Select option from Dashboard List
    [Arguments]     ${option}
    wait until element is visible   xpath://a[contains(text(),'${option}')]  60
    click element   xpath://a[contains(text(),'${option}')]  60

Select Technology from personal deatils section
    [Arguments]     ${option}
    wait until element is visible   xpath://span[normalize-space()='${option}']     60
    click element   xpath://span[normalize-space()='${option}']

Click on View Your Added Brand List
    wait until element is visible   xpath://a[normalize-space()='View Your Added Brand List']   60
    click element   xpath://a[normalize-space()='View Your Added Brand List']

Click on Add New Address
    wait until element is visible   xpath://span[@title='Click here to add address']    60
    click element   xpath://span[@title='Click here to add address']

Enter Brand Address Line one
    wait until element is visible     ${address_Line}         60
    wait until element is enabled     ${address_Line}         60
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [LETTERS]
    ${generate_AddressLine}=    Catenate    ${random_string}
    input text      ${address_Line}     ${generate_AddressLine}
    log to console      ${generate_AddressLine}
    set global variable    ${generate_AddressLine}

Enter Brand address line two
    wait until element is visible     ${address_line2}         60
    wait until element is enabled     ${address_line2}         60
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [LETTERS]
    ${generate_AddressLine2}=    Catenate    ${random_string}
    input text      ${address_line2}     ${generate_AddressLine2}
    log to console      ${generate_AddressLine2}
    set global variable    ${generate_AddressLine2}

Select State
    [Arguments]     ${country}
    Wait until element is visible   css:#State  60
    click element   css:#State
    wait until element is visible   css:span[title='${country}']    60
    click element   css:span[title='${country}']

Select City
    [Arguments]     ${city}
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible   css:#City   60
    click element   css:#City
    wait until element is visible   css:span[title='${city}']     60
    click element   css:span[title='${city}']

Click on Save Button
    wait until element is visible   css:button[aria-label='Close'][type='submit']   60
    click element   css:button[aria-label='Close'][type='submit']

Zip code Input
    [Arguments]     ${code}
    wait until element is visible   css:#zip    60
    click element   css:#zip
    input text  css:#zip    ${code}

Click on Edit address
    wait until element is visible   css:i[title='Click here to edit address']   60
    click element   css:i[title='Click here to edit address']
     wait until element is not visible       ${loaderIcon}    60

#Loader Icon Invisible
#    wait until element is not visible       ${loaderIcon}    60

See added brand link
    wait until element is visible   //a[normalize-space()='View Your Added Brand List']   60
    click element   //a[normalize-space()='View Your Added Brand List']

Enter Brand New Address Line one
    wait until element is visible     ${address_Line}         60
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [LETTERS]
    ${generate_newaddress}=    Catenate    ${random_string}
    input text      ${address_Line}     ${generate_newaddress}
    Press Keys  ${address_Line}            ENTER
#    wait until element is visible   ${generate_newaddress}      60
#    click element   ${generate_newaddress}
    log to console      ${generate_newaddress}
    set global variable    ${generate_newaddress}

Enter Brand new address line two
     wait until element is visible     ${address_line2}         60
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [LETTERS]
    ${generate_newaddress}=    Catenate    ${random_string}
    input text      ${address_line2}     ${generate_newaddress}

#    wait until element is visible   ${generate_newaddress}      60
#    click element   ${generate_newaddress}
    log to console      ${generate_newaddress}
    set global variable    ${generate_newaddress}


Click on main Save Button
    wait until element is visible   //button[@type='button'][normalize-space()='Save']    60
    click element   //button[@type='button'][normalize-space()='Save']





