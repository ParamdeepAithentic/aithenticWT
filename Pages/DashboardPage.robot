*** Settings ***
Documentation   Contains all keyword of  Dashboard page
Library           SeleniumLibrary
Library           ExcelLibrary
Library           String
Library           Collections
Library           BuiltIn
Library           random
Library           DateTime
Library           OperatingSystem
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
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block
${drawerList}        css:.profileContainer .list-unstyled li       #//ul[@class='list-unstyled w-100 d-inline-block mt-3 pt-0']/li
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
${brand_saveBtn_main}     css:.add-brand-qa
${search_brandName}     css:input[placeholder='Search by Brand Name']
${fetch_brandName}    css:td:nth-child(2)


########## Add product #####

${add_Product}     css:a[title='Click here to Add Product']
${actionBTN}       css:#Team-Member-Actions
${add_Product_modal}     css:div[id='addProductPopup'] div[role='document'] div[role='document'] div[class='modal-content']
${ProductName}     css:#ProductName
${enterAndSelect_Brand}     css:.qa-BrandName input
#${ProductDescription}     //div[@class='card-container themeScrollBar mt-1 p-2']//textarea[@id='ProductDescription']
${ProductDescription}       css:.qa-add-product-description
${ProductDescription_viaLink}     css:#ProductDescription
${ProductFeatures}     css:#ProductFeatures


${ProductFeatures_viaLink}      css:#addProductFeat

${ProductStatus}     //input[@id='ProductStatus']
${ProductStatus_viaLink}        css:#addProductStatus

${select_technology_group}     css:nz-tree-select[id='TechGroupId'] div nz-select-search
${select_technology_type}     //div[@class='ng-select-container'][normalize-space()='Select Technology Type']
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

${address_Line}     css:#addressLine1
${address_line2}    css:#addressLine2
${brand_linklist}   css:.qa-back-brand-list
${brandnew_addressstate}    css:#addressState
${editnew_brandaddressline2}    css:input[formcontrolname=StreetAddress2]
${editnew_brandaddressline1}    css:#CompanyAddressId
${editcity_edit}        css:#addressCity
${editstate_edit}       css:#addressState
${editbrand_addressline2}   css:input[formcontrolname=StreetAddress2]
${editbrand_addressline1}   css:input[formcontrolname=StreetAddress1]
${brand_crossicon}      //div[@class='row no-gutters mb-1']//div[2]//div[1]//div[2]//span[1]
${brandadd_urlplusicon}     css:i[title='Click here to add Business url']
${Brand_threedots}      css:.three-dots
${brand_mainsaveButton}     //button[@type='button'][normalize-space()='Save']
${Viewyour_addedbrandlist}      //a[normalize-space()='View Your Added Brand List']
${Editaddress_icon}     css:i[title='Click here to edit address']
${zipcode_input}        css:#zip
${Brand_savebutton}     css:button[aria-label='Close'][type='submit']
${add brand_link}   //a[normalize-space()='Add Brand']
${Select_city while adding brand}   css:#City
${Select_state while adding brand}  css:#State
${clickadd_newaddress}  //span[@title='Click here to add address']
${share_toEmail}      css:#toEmail
${Totalcount_field}        css:.qa-total-count-list
${dept_searchbar}       css:input[placeholder='Search by Department Name']
${three_dots_dept}      css:.three-dots


${search_technology_group}     css:.qa-selectedTechnologyGroups input

${search_technology_group}      (//div[@class='ng-input']//input)[2]
${search_by_brand_name}            (//div[@class='ng-input']//input)[3]

*** Keywords ***
Click on add department
    wait until element is visible      ${add_dept_btn}      ${wait_time}
    wait until element is enabled      ${add_dept_btn}      ${wait_time}
    click element      ${add_dept_btn}


Save the department
    [Arguments]    ${option}
    wait until element is visible       css:.profile-section-department div button.qa-${option}-department-modal      ${wait_time}
    wait until element is enabled       css:.profile-section-department div button.qa-${option}-department-modal      ${wait_time}
    click element       css:.profile-section-department div button.qa-${option}-department-modal
#options: add, close


Select the option from action menu
    [Arguments]    ${option}
    wait until element is visible       css:.qa-product-bulk-${option}     ${wait_time}
    wait until element is enabled       css:.qa-product-bulk-${option}     ${wait_time}
    click element   css:.qa-product-bulk-${option}

Select the option from department action menu
    [Arguments]    ${option}
    wait until element is visible       css:a[title='${option}']     ${wait_time}
    wait until element is enabled       css:a[title='${option}']     ${wait_time}
    click element   css:a[title='${option}']

Select brand from list
    [Arguments]    ${BrandName}
    wait until element is visible       ${enterAndSelect_Brand}     ${wait_time}
    wait until element is enabled       ${enterAndSelect_Brand}     ${wait_time}
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
    wait until element is visible       ${enterAndSelect_Brand}     ${wait_time}
    wait until element is enabled       ${enterAndSelect_Brand}     ${wait_time}
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
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Generic.click on the button     ${option}

Create random productName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Click on action button
    wait until element is visible       ${actionBTN}   ${wait_time}
    wait until element is enabled       ${actionBTN}   ${wait_time}
    click element       ${actionBTN}

Click add product button
    wait until element is visible       ${add_Product}   ${wait_time}
    wait until element is enabled       ${add_Product}   ${wait_time}
    click element       ${add_Product}
    wait until element is visible       ${add_Product_modal}    ${wait_time}
    wait until element is visible       ${ProductName}      ${wait_time}

Create product name random
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_product}=    Catenate    Product_${random_string}
    input text   ${ProductName}   ${generated_product}
    log to console      ${generated_product}
    set global variable    ${generated_product}

Create product name self
    [Arguments]    ${option}
    wait until element is visible   ${ProductName}      ${wait_time}
    wait until element is enabled   ${ProductName}      ${wait_time}
    input text   ${ProductName}   ${option}


Add product brand name
    [Arguments]    ${option}
    wait until element is visible       ${enterAndSelect_Brand}     ${wait_time}
    click element   ${enterAndSelect_Brand}
    Clear Element Text      ${enterAndSelect_Brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${enterAndSelect_Brand}    ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   DashboardPage - Select option from brand name dropdown via add product pop up of product page     5    ${pageTime}     ${ActualTime}    DashboardPage_Time
    sleep   ${search_sleep}

Add product description
    wait until element is visible       ${ProductDescription}     ${wait_time}
    wait until element is enabled       ${ProductDescription}     ${wait_time}
    input text   ${ProductDescription}   This is the description of new product added.

Add product description via link
    wait until element is visible       ${ProductDescription_viaLink}     ${wait_time}
    wait until element is enabled       ${ProductDescription_viaLink}     ${wait_time}
    input text   ${ProductDescription_viaLink}   This is the description of new product added.

Add product feature
    wait until element is visible       ${ProductFeatures}     ${wait_time}
    wait until element is enabled       ${ProductFeatures}     ${wait_time}
    input text   ${ProductFeatures}   This is the features of new product added.

Add product feature via link
    wait until element is visible       ${ProductFeatures_viaLink}     ${wait_time}
    input text   ${ProductFeatures_viaLink}   This is the features of new product added.

Select product status
    [Arguments]    ${option}
    wait until element is visible       ${ProductStatus}     ${wait_time}
    click element   ${ProductStatus}
    Clear Element Text      ${ProductStatus}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${ProductStatus}   ${option}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   DashboardPage - Select option from product status dropdown via add product pop up of product page      6    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product status via link
    [Arguments]    ${option}
    scroll element into view    css:#addProductType
    wait until element is visible       ${ProductStatus_viaLink}     ${wait_time}
    click element   ${ProductStatus_viaLink}
    Clear Element Text      ${ProductStatus_viaLink}
    input text   ${ProductStatus_viaLink}   ${option}
    Generic.Select parameter     ${option}

Select product technology type
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_type}     ${wait_time}
    ${StartTime1} =     Get Current Time in Milliseconds
    click element   ${select_technology_type}
    Generic.Select parameter     ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   DashboardPage - Select option from product technology type dropdown via add product pop up of product page       7    ${pageTime}     ${ActualTime}    DashboardPage_Time

Select product technology type via technology
    [Arguments]    ${option}
    Generic.Scroll the page till    900
    wait until element is visible       ${select_technology_type_via link}     ${wait_time}
    click element   ${select_technology_type_via link}
    Generic.Select parameter     ${option}

Select product technology group
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_group}     ${wait_time}
    Mouse Over      ${select_technology_group}
    click element   ${select_technology_group}
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled      //span[normalize-space()='${option}']       ${wait_time}
    click element       //span[normalize-space()='${option}']

Select product technology group via link
    [Arguments]    ${option}
    wait until element is visible       css:nz-tree-select[formcontrolname=TechGroupId] input     ${wait_time}
    Mouse Over      css:nz-tree-select[formcontrolname=TechGroupId] input
    click element   css:nz-tree-select[formcontrolname=TechGroupId] input
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       ${wait_time}
    click element       //span[normalize-space()='${option}']

Save added product details
    wait until element is visible      ${save_product_modal}       ${wait_time}
    click element   ${save_product_modal}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}


Verify product added
   [Arguments]    ${productName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${search_productName}     ${wait_time}
     click element      ${search_productName}
     Clear Element Text      ${search_productName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_productName}   ${productName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${productName}']      ${productName}     ${wait_time}
     ${get_productName} =    get text    ${fetch_productName}
     log to console     ${get_productName}
     should be equal    ${productName}     ${get_productName}
     ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   DashboardPage - Search the product on the add product listing page      8    ${pageTime}     ${ActualTime}    DashboardPage_Time


Click add brand button
    wait until element is visible       ${add_Brand}        ${wait_time}
    click element   ${add_Brand}


Create random brandName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_BrandName}=    Catenate    BrandName${random_string}
    input text   ${add_brandName}   ${generated_BrandName}
    log to console      ${generated_BrandName}
    set global variable    ${generated_BrandName}


Add self created brand name
    [Arguments]    ${option}
    wait until element is visible       ${add_brandName}        ${wait_time}
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
    Calculate Running time  9  ${pageHeading}   DashboardPage - Select the option from brand manufacturer country dropdown via add new brand      9    ${pageTime}     ${ActualTime}    DashboardPage_Time


Save added brand details
    wait until element is visible       ${brand_saveBTN}        ${wait_time}
    click element   ${brand_saveBTN}

Click added brand main save button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       ${brand_saveBtn_main}
    click element   ${brand_saveBtn_main}

Verify Brand added
   [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${search_brandName}     ${wait_time}
     click element      ${search_brandName}
     Clear Element Text      ${search_brandName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_brandName}   ${BrandName}
     sleep       ${search_sleep}
     Wait Until Element Contains    //td[normalize-space()='${BrandName}']      ${BrandName}     ${wait_time}
     ${get_brandName} =    get text    ${fetch_brandName}
     log to console     ${get_brandName}
     should be equal    ${BrandName}     ${get_brandName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  10  ${pageHeading}   DashboardPage - Search the brand on the add brand listing page      10    ${pageTime}     ${ActualTime}    DashboardPage_Time

select the option from the dashboard drawer
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //span[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled    //span[normalize-space()='${option}']      ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}                # Remove later
    click element    //span[normalize-space()='${option}']

################################### WELCOME PAGE AND AHEAD ###############
Click on complete setup button
    [Arguments]     ${option}
    wait until element is visible    //button[normalize-space()='${option}']        ${wait_time}
    wait until element is enabled    //button[normalize-space()='${option}']        ${wait_time}
    click element    //button[normalize-space()='${option}']

Select the asset ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}      ${wait_time}
    wait until element is enabled    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}      ${wait_time}
    click element    css:.checkmark.qa-inner-customcheckbox-asset-id-${option}

Select the employee ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}       ${wait_time}
    wait until element is enabled    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}       ${wait_time}
    click element    css:.checkmark.qa-inner-customcheckbox-employee-id-${option}

Select the location ID checkbox
    [Arguments]     ${option}
    wait until element is visible    css:.checkmark.qa-inner-customcheckbox-location-id-${option}       ${wait_time}
    wait until element is enabled    css:.checkmark.qa-inner-customcheckbox-location-id-${option}       ${wait_time}
    click element    css:.checkmark.qa-inner-customcheckbox-location-id-${option}
#options: ProductId, BrandName, ProductStatus,TechType, GroupName, ProductDescription


Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    wait until element is enabled      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Create unique department name random
    wait until element is visible       ${add_dept_name}        ${wait_time}
    wait until element is enabled       ${add_dept_name}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_dept_name}   ${generated_DepartmentNumber}
    sleep       1
    click element     css:div[role='option']
    log to console      ${generated_DepartmentNumber}
    set global variable    ${generated_DepartmentNumber}

Select department status
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_status}        ${wait_time}
    wait until element is enabled       ${add_dept_status}        ${wait_time}
    click element     ${add_dept_status}
    Clear Element Text      ${add_dept_status}
    Generic.Select parameter    ${option}

Select department cost center
    [Arguments]    ${option}
    wait until element is visible       ${add_dept_costCenter}        ${wait_time}
    wait until element is enabled       ${add_dept_costCenter}        ${wait_time}
    input text    ${add_dept_costCenter}   ${option}

Verify department added
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


Verify the side option list parameters
   wait until element is visible   ${side_options}      ${wait_time}
   @{expectedList} =    Create List        Aithentic logo    Dashboard       Messages        Location        Team Members      Partners      Contracts      Technology      CSPM     Asset Discovery
   ${elements} =  Get WebElements     ${side_options}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      ${title}=    Get Element Attribute    ${element}    title
      Append To List    ${actualList}     ${title}
   END
   lists should be equal    ${expectedList}    ${actualList}

Verify the drawer list parameters
   wait until element is visible   ${drawerList}        ${wait_time}
   @{expectedList} =    Create List     Management Console    Account Overview      Asset Overview     IT Performances     Subscription
   ${elements} =  Get WebElements     ${drawerList}
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   lists should be equal    ${expectedList}    ${actualList}

#####NOT WORKING#########
Verify the profile option list parameters
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible    ${profile_option}      ${wait_time}
    click element    ${profile_option}
    sleep       2
    ${elements} =  Get WebElements     ${full_Profile_List}
    @{actualList} =   Create List
    FOR  ${element}  IN      @{elements}

      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
    END

Select Technology from personal deatils section
    [Arguments]     ${option}
    wait until element is visible   xpath://span[normalize-space()='${option}']     ${wait_time}
    click element   xpath://span[normalize-space()='${option}']

Click on View Your Added Brand List
    wait until element is visible   ${Viewyour_addedbrandlist}   ${wait_time}
    click element   ${Viewyour_addedbrandlist}

Click on Add New Address
    wait until element is visible   ${clickadd_newaddress}    ${wait_time}
    click element   ${clickadd_newaddress}

Enter Brand Address Line one
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible     ${address_Line}         ${wait_time}
    wait until element is enabled     ${address_Line}         ${wait_time}
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_AddressLineone}=    Catenate    Address_${random_string}
    input text      ${address_Line}     ${generate_AddressLineone}
    log to console      ${generate_AddressLineone}

Enter Brand address line two
    wait until element is visible     ${address_line2}         ${wait_time}
    wait until element is enabled     ${address_line2}         ${wait_time}
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_AddressLine2}=    Catenate    Address_${random_string}
    input text      ${address_line2}     ${generate_AddressLine2}
    log to console      ${generate_AddressLine2}

Select State
    [Arguments]     ${country}
    Wait until element is visible   ${Select_state while adding brand}  ${wait_time}
    click element   ${Select_state while adding brand}
    wait until element is visible   css:span[title='${country}']    ${wait_time}
    click element   css:span[title='${country}']

Select City
    [Arguments]     ${city}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible   ${Select_city while adding brand}   ${wait_time}
    click element   ${Select_city while adding brand}
    wait until element is visible   css:span[title='${city}']     ${wait_time}
    click element   css:span[title='${city}']

Click on Save Button
    wait until element is visible   ${Brand_savebutton}   ${wait_time}
    click element   ${Brand_savebutton}

Zip code Input
    [Arguments]     ${code}
    wait until element is visible   ${zipcode_input}    ${wait_time}
    click element   ${zipcode_input}
    input text  ${zipcode_input}    ${code}

Click on Edit address
    wait until element is visible   ${Editaddress_icon}   ${wait_time}
    click element   ${Editaddress_icon}
    wait until element is not visible       ${loaderIcon}    ${wait_time}

Enter Brand New Address Line one
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible     ${address_Line}         ${wait_time}
    click element      ${address_Line}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddressone}=    Catenate    Address_${random_string}
    input text      ${address_Line}     ${generate_newaddressone}
    Press Keys  ${address_Line}            ENTER
    log to console      ${generate_newaddressone}

Enter Brand new address line two
    wait until element is visible     ${address_line2}         ${wait_time}
    click element      ${address_line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddresstwo}=    Catenate    Address_${random_string}
    input text      ${address_line2}     ${generate_newaddresstwo}
    log to console  ${generate_newaddresstwo}

Click on main Save Button
    wait until element is visible   ${brand_mainsaveButton}    ${wait_time}
    click element   ${brand_mainsaveButton}

click on share icon of dashboard page
    wait until element is visible       css:.fa-share-alt              ${wait_time}
    click element       css:.fa-share-alt

Enter to Email into popup
    Wait Until Element Is Not Visible    ${loaderIcon}    ${wait_time}
    wait until element is visible      ${share_toEmail}         ${wait_time}
    wait until element is enabled      ${share_toEmail}         ${wait_time}
    click element       ${share_toEmail}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_sharetoEmail}=    Catenate    ToEmail_${random_string}@yopmail.net
    input text      ${share_toEmail}     ${generate_sharetoEmail}
    log to console      ${generate_sharetoEmail}
    set global variable    ${generate_sharetoEmail}

Click on Send Invite button
   Generic.click on the button     Send Invite

Click on Register button in email
    wait until element is visible       css:button[type='button']       ${wait_time}
    click element       css:button[type='button']

Enter business email
    wait until element is enabled       ${register_Email}        ${wait_time}
    click element   ${register_Email}
    Clear element text      ${register_Email}
    input text      ${register_Email}       ${generate_sharetoEmail}

Enter account_holder_name
    wait until element is visible       css:.ng-pristine .ng-touched        ${wait_time}
    click element       css:.ng-pristine .ng-touched
    input text      css:.ng-pristine .ng-touched        Tanisha

click on Help center icon of dashboard page
    wait until element is visible       css:.fa-question-circle         ${wait_time}
    click element       css:.fa-question-circle

Click on link of information center list
    [Arguments]     ${link_name}
    Wait Until Element Is Not Visible    ${loaderIcon}    ${wait_time}
    wait until element is visible       //span[contains(text(),'${link_name}')]     ${wait_time}
    wait until element is enabled       //span[contains(text(),'${link_name}')]     ${wait_time}
    click element       //span[contains(text(),'${link_name}')]

Click on link of Support
    [Arguments]     ${link_name}
    Wait Until Element Is Not Visible    ${loaderIcon}    ${wait_time}
    wait until element is visible       //span[contains(text(),'${link_name}')]     ${wait_time}
    wait until element is visible       //span[contains(text(),'${link_name}')]     ${wait_time}
    click element       //span[contains(text(),'${link_name}')]

Search any keyword of FAQ section
    [Arguments]    ${option}
    Generic.Enter value into field      css:#questions      ${option}


Verify the keyword
    [Arguments]    ${option}
    wait until element is visible    //div[contains(text(),'${option}')]      ${wait_time}


Verify no result found with wrong FAQ
    wait until element is visible      //div[normalize-space()='No results found']        ${wait_time}


Click on three dots
    wait until element is visible   ${Brand_threedots}   ${wait_time}
    click element   ${Brand_threedots}

click on Plus icon
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   ${brandadd_urlplusicon}   ${wait_time}
    click element   ${brandadd_urlplusicon}

Add static Business Manufacturer URL
    [Arguments]    ${option}
    wait until element is visible       ${add_brand_mfc_URL}
    click element       ${add_brand_mfc_URL}
    input text      ${add_brand_mfc_URL}        ${option}

Click on Cross Icon
    wait until element is visible   ${brand_crossicon}    ${wait_time}
    click element   ${brand_crossicon}

Edit Brand Address Line one
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   ${editbrand_addressline1}           ${wait_time}
    wait until element is enabled     ${editbrand_addressline1}         ${wait_time}
    click element      ${editbrand_addressline1}
    Clear Element Text  ${editbrand_addressline1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_editAddressLine1}=    Catenate    Address_${random_string}
    input text   ${editbrand_addressline1}       ${generate_editAddressLine1}
    log to console      ${generate_editAddressLine1}

Edit Brand Address Line two
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   ${editbrand_addressline2}           ${wait_time}
    wait until element is enabled     css:#StreetAddress2         ${wait_time}
    click element      ${editbrand_addressline2}
    Clear Element Text  ${editbrand_addressline2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_editAddressLine2}=    Catenate    Address_${random_string}
    input text   ${editbrand_addressline2}        ${generate_editAddressLine2}
    log to console      ${generate_editAddressLine2}

Edit State while edit address
    [Arguments]     ${State}
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible  ${editstate_edit}   ${wait_time}
    wait until element is enabled  ${editstate_edit}   ${wait_time}
    click element  css:ng-select[placeholder='Select State'] span[title='Clear all']
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    click element   ${editstate_edit}
    wait until element is visible   css:span[title='${State}']   ${wait_time}
    click element   css:span[title='${State}']

Edit city while edit address
    [Arguments]     ${city}
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   ${editcity_edit}   ${wait_time}
    click element   ${editcity_edit}
    wait until element is visible   css:span[title='${city}']   ${wait_time}
    click element   css:span[title='${city}']

Edit New Brand Address Line one
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   ${editnew_brandaddressline1}           ${wait_time}
    wait until element is enabled     ${editnew_brandaddressline1}         ${wait_time}
    click element      ${editnew_brandaddressline1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generateNew_editAddressLine1}=    Catenate    Address_${random_string}
    input text   ${editnew_brandaddressline1}       ${generateNew_editAddressLine1}
    Press Keys  ${editnew_brandaddressline1}             ENTER
    log to console      ${generateNew_editAddressLine1}

Edit New Brand Address Line two
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   ${editnew_brandaddressline2}           ${wait_time}
    wait until element is enabled     ${editnew_brandaddressline2}         ${wait_time}
    click element      ${editnew_brandaddressline2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generateNew_editAddressLine2}=    Catenate    Address_${random_string}
    input text   ${editnew_brandaddressline2}        ${generateNew_editAddressLine2}
    log to console      ${generateNew_editAddressLine2}

Select New Address State
    [Arguments]     ${country}
    Wait until element is visible   ${brandnew_addressstate}  ${wait_time}
    click element   ${brandnew_addressstate}
    wait until element is visible   css:span[title='${country}']    ${wait_time}
    click element   css:span[title='${country}']

Click on back to brand list link
    wait until element is visible   ${brand_linklist}   ${wait_time}
    click element   ${brand_linklist}

Select option from the pop up
    [Arguments]    ${option}
    wait until element is visible   css:.qa-brand-${option}   ${wait_time}
    click element   css:.qa-brand-${option}

Add multiple brand URL as per index
    [Arguments]    ${option}
    wait until element is visible   (//input[@placeholder='example.com'])[${option}]   ${wait_time}
    wait until element is enabled   (//input[@placeholder='example.com'])[${option}]   ${wait_time}
    click element   (//input[@placeholder='example.com'])[${option}]
    Create random URL value for multiple brand addition     (//input[@placeholder='example.com'])[${option}]

Create random URL value for multiple brand addition
    [Arguments]    ${option}
    ${random_string} =    Generate Random String       15      [NUMBERS]
    ${generated_random_value}=    Catenate   ${random_string}.com
    input text   ${option}   ${generated_random_value}
    log to console      ${generated_random_value}

Enter contact name of contact person
    [Arguments]     ${contact}
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   css:#contactName    ${wait_time}
    click element   css:#contactName
    input text  css:#contactName    ${contact}
    Press Keys   css:#contactName   ENTER

Choose options inside personal_details
    [Arguments]     ${option}
    Generic.Select parameter    ${option}

Click on view added Departments list
    [Arguments]     ${option}
    Generic.click on the button link        ${option}

Click on action menu button of department
    wait until element is visible       css:#Team-Member-Actions        ${wait_time}
    click element       css:#Team-Member-Actions

Choose Add department from Action button options
    [Arguments]    ${option}
    Generic.click on the tab        ${option}

Click on cancel add department
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-department-modal        ${wait_time}
    wait until element is enabled       css:.qa-${option}-department-modal        ${wait_time}
    click element        css:.qa-${option}-department-modal
    sleep       ${search_sleep}
# option: add, close

Search by Department
    [Arguments]    ${option}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       ${dept_SearchBar}       ${wait_time}
    Clear Element Text      ${dept_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${dept_SearchBar}   ${option}
    wait until element is visible       css:thead tr       ${wait_time}

Click on three dots of Department list
    sleep       ${search_sleep}
    wait until element is visible   ${three_dots_dept}   ${wait_time}
    click element   ${three_dots_dept}

Choose option from three_dots of Department
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Search by technology-group
    [Arguments]    ${technology_group}
    wait until element is visible    ${search_technology_group}           ${wait_time}
    wait until element is enabled     ${search_technology_group}          ${wait_time}
    click element       ${search_technology_group}
    Clear Element Text          ${search_technology_group}
    input text       ${search_technology_group}        ${technology_group}

Check the value after search
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Search by brand name
    [Arguments]    ${brand_name}
    wait until element is visible    ${search_by_brand_name}           ${wait_time}
    wait until element is enabled     ${search_by_brand_name}          ${wait_time}
    click element       ${search_by_brand_name}
    Clear Element Text          ${search_by_brand_name}
    input text       ${search_by_brand_name}        ${brand_name}

Click on tab under Modules
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    Generic.Scroll the page till        7000
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     120
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    ${parts}        split string        ${count}    /
    ${first_part}=    set variable    ${parts[0]}
    log to console      Modules: ${first_part}
    set global variable     ${first_part}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p

Verify number of modules are equals to total counts
    [Arguments]    ${option}
    should be equal      ${first_part}    ${total_count}
    log to console      The Modules of ${option} is equal to total counts in ${option}

Fetch total installed Agents
    [Arguments]     ${data}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //p[contains(text(),'Installed Agents -')]      ${wait_time}
    ${Agent}=       get text          //p[contains(text(),'Installed Agents -')]
    ${parts}    Split String    ${Agent}    ${data}
    ${total_count}    Get Substring    ${parts[1]}      1
    log to console      ${total_count}
    set global variable     ${total_count}


Get and verify the text and compare it with
    [Arguments]         ${option}
    wait until element is visible       //p[normalize-space()='${option}']         ${wait_time}
    ${text}=        get text       //p[normalize-space()='${option}']
    log to console      ${text}
    should be equal     ${text}     ${option}


Verify the text from recent notifications and compare with
    [Arguments]     ${option}
    Wait Until Page Contains     Billing Details            ${wait_time}
    Wait Until Element Is Visible    (//tbody//td)[1]       ${wait_time}
    Wait Until Element Is Enabled    (//tbody//td)[1]       ${wait_time}
    ${alert_text}=   get text        (//tbody//td)[1]
    Log To Console    ${alert_text}
    Set Global Variable    ${alert_text}
    Should Be Equal    ${alert_text}    ${option}

Wait until alert is visible in the Recent Notifiation tab
    [Arguments]     ${option1}      ${option2}
    wait until page contains        ${option1} ${option2}    120

Click on View more dropdown under recent notifications
    [Arguments]     ${option}
    Wait Until Element Is Visible    //span[normalize-space()='${option}']      ${wait_time}
    Wait Until Element Is Enabled    //span[normalize-space()='${option}']      ${wait_time}
    Click Element       //span[normalize-space()='${option}']

Verify the invisiblity of view_more button
    Wait Until Element Is Not Visible       //span[normalize-space()='View More']       ${wait_time}




Fetch and compare the total count
    [Arguments]  ${value}
    wait until element is enabled       ${Totalcount_field}      ${wait_time}
    wait until element is visible   ${Totalcount_field}      ${wait_time}
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_count}    Get Substring    ${parts[1]}    3
    ${number}=   Convert To Integer   ${total_count}
    Log to console  Total count is :${total_count}
    set global variable    ${total_count}
    should be equal    ${number}     ${value}

Skip Action
    Log    Skipping action as the element value is 0

Empty Action
    Log    Skipping empty action as the element value is null

Get And Verify The Count Of tabs under renewal overview by management console
    ${element_count}=    Get Element Count    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]
    Log to console      ${element_count}

    FOR    ${index}    IN RANGE    1    ${element_count}
        Wait Until Element Is Visible   //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]       ${wait_time}
        ${element}=    Get Text    (//div[contains(@class,'-dot')])[${index}]
        Log to console   Element : ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        Log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    DashboardPage.Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    (//div[contains(@class,'-dot')])[${index}]      AND       sleep   ${yop_sleep}        AND       DashboardPage.Fetch and compare the total count  ${element_as_number}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END


Click on the dropdown of quarter end under management console
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'qa-upcoming-days')])[2]      ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,'qa-upcoming-days')])[2]      ${wait_time}
    Click Element       (//div[contains(@class,'qa-upcoming-days')])[2]

Select the first value of To dropdown of quarter
    [Arguments]     ${option}
    wait until element is visible     //div[contains (@id, '-${option}')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-${option}')]       ${wait_time}
    click element   //div[contains (@id, '-${option}')]
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is not visible       ${shadow}          ${wait_time}

Click on the first dropdown under management console
    Wait Until Element Is Visible    (//div[contains(@class,'qa-upcoming-days')])[1]      ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,'qa-upcoming-days')])[1]      ${wait_time}
    Click Element       (//div[contains(@class,'qa-upcoming-days')])[1]

Click on the filter Past under recent Activities table
    [Arguments]         ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //span[normalize-space()='${option1}']//parent::div//parent::div  ${wait_time}
    Wait Until Element Is Enabled    //span[normalize-space()='${option1}']//parent::div//parent::div  ${wait_time}
    Click Element    //span[normalize-space()='${option1}']//parent::div//parent::div
    Generic.Select parameter    ${option2}

Choose number of days inside under past filters
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'filter-dropdown-date-time')]//input[contains(@class,'alertFilterInput')]  ${wait_time}
    Wait Until Element Is Enabled    //div[contains(@class,'filter-dropdown-date-time')]//input[contains(@class,'alertFilterInput')]  ${wait_time}
    input text    //div[contains(@class,'filter-dropdown-date-time')]//input[contains(@class,'alertFilterInput')]       ${option}



Click on the filter under recent Activities table
    [Arguments]         ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'Asset Id')]//following-sibling::div//input      ${wait_time}
    Wait Until Element Is Enabled    //div[contains(text(),'Asset Id')]//following-sibling::div//input      ${wait_time}
    Input Text    //div[contains(text(),'${option1}')]//following-sibling::div//input    ${option2}
    Generic.Select parameter    ${option2}
    
Click on row of recent activities table
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //table//tbody[contains (@class, 'ng-star-inserted')]//tr//td[1]       ${wait_time}
    Wait Until Element Is Enabled    //table//tbody[contains (@class, 'ng-star-inserted')]//tr//td[1]        ${wait_time}
    Click Element       //table//tbody[contains (@class, 'ng-star-inserted')]//tr//td[1]

Click on Back to account overview button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //span[@class='back']        ${wait_time}
    Wait Until Element Is Enabled    //span[@class='back']        ${wait_time}
    Click Element       //span[@class='back']
    wait until element is not visible       ${shadow}          ${wait_time}

Reset the filters for recent activities
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.recent-activities-filters .fa-sync-alt        ${wait_time}
    Wait Until Element Is Enabled    css:.recent-activities-filters .fa-sync-alt      ${wait_time}
    Click Element      css:.recent-activities-filters .fa-sync-alt

Select option from the pop up of product
    [Arguments]    ${option}
    wait until element is visible   css:.removeProduct${option}Button-qa   ${wait_time}
    click element   css:.removeProduct${option}Button-qa
    wait until element is not visible       ${shadow}          ${wait_time}

Click on the export button under account overview tab
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible     //i[@title='Exports Alerts']        ${wait_time}
    wait until element is enabled      //i[@title='Exports Alerts']        ${wait_time}
    sleep   ${search_sleep}
    click element  //i[@title='Exports Alerts']
    wait until element is not visible       ${shadow}          ${wait_time}

Click on pre defined brand list
    [Arguments]     ${option}
    wait until element is visible   css:.qa-predefinedBrands input   ${wait_time}
    wait until element is enabled   css:.qa-predefinedBrands input   ${wait_time}
    click element   css:.qa-predefinedBrands input
    wait until element is visible   //div[contains(@class,'panel-items')]   ${wait_time}
    wait until element is enabled   //div[contains(@class,'panel-items')]  ${wait_time}
    clear element text      css:.qa-predefinedBrands input
    input text      css:.qa-predefinedBrands input      ${option}
    Generic.Select parameter    ${option}

Click on pre defined product list
    [Arguments]     ${option}
    wait until element is visible   css:.qa-selectedProductRecord input   ${wait_time}
    wait until element is enabled   css:.qa-selectedProductRecord input   ${wait_time}
    click element   css:.qa-selectedProductRecord input
    wait until element is visible   //div[contains(@class,'panel-items')]   ${wait_time}
    wait until element is enabled   //div[contains(@class,'panel-items')]  ${wait_time}
    clear element text      css:.qa-selectedProductRecord input
    input text      css:.qa-selectedProductRecord input      ${option}
    Generic.Select parameter    ${option}

Fetch the count renewals overview subtabs
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]//div[normalize-space()='${option}']//parent::div//following-sibling::div//div         ${wait_time}
    Wait Until Element Is Enabled    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]//div[normalize-space()='${option}']//parent::div//following-sibling::div//div         ${wait_time}
    ${renewal_overview_count}=      Get text    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]//div[normalize-space()='${option}']//parent::div//following-sibling::div//div
    Set Global Variable    ${renewal_overview_count}

Set Globally the count from renewal overview subtabs
    ${renewal_overview_add_count}=  Evaluate    ${renewal_overview_count} + 1
    ${renewal_overview_add_count_str}=      Convert To String    ${renewal_overview_add_count}
    Log To Console    ${renewal_overview_add_count_str}
    Set Global Variable    ${renewal_overview_add_count_str}

Compare the counts of renewal overview after adding the asset
    Should Be Equal    ${renewal_overview_add_count_str}    ${renewal_overview_count}

Click on the subtabs
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]//div[normalize-space()='${option}']//parent::div//following-sibling::div//div      ${wait_time}
    Click Element    //div[@id='renewal-overview-section']//following-sibling::div//div[contains(@class,'renew-card p')]//div[normalize-space()='${option}']//parent::div//following-sibling::div//div

Search and verify through asset_id
    [Arguments]     ${input}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.search-location-qa    ${wait_time}
    Wait Until Element Is Enabled    css:.search-location-qa    ${wait_time}
    Input Text    css:.search-location-qa    ${input}
    wait until element is visible       //table//tbody       ${wait_time}
    Wait Until Element Contains    //table//tr//td[2]     ${input}    ${wait_time}
    ${get_assetID} =    get text    //table//tr//td[2]
    log to console     ${get_assetID}
    should be equal    ${get_assetID}     ${input}

Click on Back to management console tab
    Wait Until Element Is Visible    css:span[class='back']     ${wait_time}
    Wait Until Element Is Enabled    css:span[class='back']     ${wait_time}
    Click Element     css:span[class='back']

wait until renewal overview section is load
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[@id='renewal-overview-section']//button[contains(@class,'qa-renewal-overview-download')]         ${wait_time}
    Wait Until Element Is Enabled    //div[@id='renewal-overview-section']//button[contains(@class,'qa-renewal-overview-download')]         ${wait_time}

Verify subscription overview should contain
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //p[normalize-space()='${option}']//parent::div     ${wait_time}
    Wait Until Element Is Enabled    //p[normalize-space()='${option}']//parent::div     ${wait_time}

Fetch the count under subscription overview section of management console
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //p[normalize-space()='${option}']//parent::div     ${wait_time}
    Wait Until Element Is Enabled    //p[normalize-space()='${option}']//parent::div     ${wait_time}
    Click Element     //p[normalize-space()='${option}']//parent::div
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   ${Totalcount_field}      ${wait_time}
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_count}    Get Substring    ${parts[1]}    3
    ${number}=   Convert To Integer   ${total_count}
    Log to console  Total count is :${total_count}
    set global variable    ${total_count}

Set Globally the count from subscription overview subtabs
    ${subscription_overview_add_count}=  Evaluate    ${total_count} + 1
    ${subscription_overview_add_count_str}=      Convert To String    ${subscription_overview_add_count}
    Log To Console    ${subscription_overview_add_count_str}
    Set Global Variable    ${subscription_overview_add_count_str}

Compare the counts of subscription overview
    Should Be Equal    ${subscription_overview_add_count_str}    ${total_count}

See all subscription connector
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //span[normalize-space()='See all 2']    ${wait_time}
    Wait Until Element Is Enabled    //span[normalize-space()='See all 2']     ${wait_time}
    Click Element    //span[normalize-space()='See all 2']

Click on Download-icon of subscription overview
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.qa-renewals-overview-details-download        ${wait_time}
    Wait Until Element Is Enabled    css:.qa-renewals-overview-details-download        ${wait_time}
    Click Element      css:.qa-renewals-overview-details-download

Click dropdown of subscription overview tables
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[normalize-space()='${option}']//ancestor::tr//span     ${wait_time}
    Wait Until Element Is Enabled    //div[normalize-space()='${option}']//ancestor::tr//span        ${wait_time}
    Click Element      //div[normalize-space()='${option}']//ancestor::tr//span

Click on arrow icon inside subscription overview tables
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[normalize-space()='${option}']//ancestor::tr//button     ${wait_time}
    Wait Until Element Is Enabled    //div[normalize-space()='${option}']//ancestor::tr//button     ${wait_time}
    Click Element      //div[normalize-space()='${option}']//ancestor::tr//button

Click on done button of subscription overview
    [Arguments]     ${option}
    Generic.click on the button         ${option}

Verify your current page contains this element
     wait until element is not visible   ${loaderIcon}      ${wait_time}
     Page Should Contain Element        //div[contains(text(),'No Financial Year Settings Found')]
     Page should contain element        //a[normalize-space()='here']

Click on 'click here to add' link
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible       //a[normalize-space()='here']
    wait until element is enabled       //a[normalize-space()='here']
    click element       //a[normalize-space()='here']

Enter Financial Year end date
    wait until element is visible   css:#financialYear     ${wait_time}
    wait until element is enabled   css:#financialYear     ${wait_time}
#    click element   css:#financialYear
    input text  css:#financialYear    12/31/2024
    Press Keys   css:#financialYear   TAB

Enter dates in Quarter
    [Arguments]         ${option1}      ${option2}
    wait until element is visible       css:.qa-company-information-financial-industry      ${wait_time}
    sleep       ${search_sleep}
    wait until element is visible   css:#financialYearq${option1}     ${wait_time}
    wait until element is enabled   css:#financialYearq${option1}     ${wait_time}
    input text  css:#financialYearq${option1}       ${option2}
    Press Keys   css:#financialYearq${option1}   TAB

Verify your current page not contains this element
     wait until element is not visible   ${loaderIcon}      ${wait_time}
     Page Should not Contain Element        //div[contains(text(),'No Financial Year Settings Found')]
     Page should not contain element        //a[normalize-space()='here']

Click on change password link under security
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.change-password-qa     ${wait_time}
    Wait Until Element Is Enabled    css:.change-password-qa     ${wait_time}
    Click Element      css:.change-password-qa

Enter input in the new password field
    [Arguments]     ${new_password}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='Password']     ${wait_time}
    Wait Until Element Is Enabled    //input[@id='Password']     ${wait_time}
    Click Element      //input[@id='Password']
    input text     //input[@id='Password']     ${new_password}

Enter input in the confirm password field
    [Arguments]     ${confirm_password}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='Password_confirmation']     ${wait_time}
    Wait Until Element Is Enabled    //input[@id='Password_confirmation']     ${wait_time}
    Click Element      //input[@id='Password_confirmation']
    input text     //input[@id='Password_confirmation']     ${confirm_password}

Enter the security key
    [Arguments]    ${key}
     wait until element is visible      //input[@id='SecurityCode']       ${wait_time}
     wait until element is enabled      //input[@id='SecurityCode']       ${wait_time}
     input text     //input[@id='SecurityCode']    ${key}

Click on save button under change password
    wait until element is visible      css:.security-save-password-qa       ${wait_time}
    wait until element is enabled      css:.security-save-password-qa        ${wait_time}
    click element   css:.security-save-password-qa
    wait until element is not visible       ${loaderIcon}      ${wait_time}

click on the authentication tab under security
    wait until element is visible      css:#profile-tab      ${wait_time}
    wait until element is enabled      css:#profile-tab        ${wait_time}
    click element   css:#profile-tab

Click on the checkboxes under auhtentication tab
    wait until element is visible      //label[normalize-space()='Use mobile(cell) authentication']      ${wait_time}
    wait until element is enabled      //label[normalize-space()='Use mobile(cell) authentication']        ${wait_time}
    click element   //label[normalize-space()='Use mobile(cell) authentication']
    wait until element is visible      //label[normalize-space()='Use email authentication']      ${wait_time}
    wait until element is enabled      //label[normalize-space()='Use email authentication']        ${wait_time}
    click element  //label[normalize-space()='Use email authentication']

Verify the visibility of validation message under change password
     wait until element is visible      //span[@class='invalidInput ng-star-inserted']      ${wait_time}

Wait for the visibility of the validation of password field under create account
    wait until element is visible      //li[normalize-space()='Eight to Thirty Two Characters']     ${wait_time}
    wait until element is visible      //li[normalize-space()='One Uppercase Letter']      ${wait_time}
    wait until element is visible      //li[normalize-space()='One Lowercase Letter']      ${wait_time}
    wait until element is visible      //li[normalize-space()='One Special Character']      ${wait_time}

Enter input in the recipient list field under compose message
    [Arguments]     ${message}
    wait until element is visible      //input[@id='Recipient_list']     ${wait_time}
    wait until element is visible      //input[@id='Recipient_list']      ${wait_time}
    click element   //input[@id='Recipient_list']
    input text      //input[@id='Recipient_list']       ${message}
    wait until element is visible     //span[contains(@title,'${message}')]    ${wait_time}
    wait until element is visible      //span[contains(@title,'${message}')]      ${wait_time}
    click element       //span[contains(@title,'${message}')]

Enter input in the message status field under compose message
    [Arguments]     ${message_status}
    wait until element is visible      //input[@id='message-Status']     ${wait_time}
    wait until element is visible      //input[@id='message-Status']      ${wait_time}
    click element   //input[@id='message-Status']
    input text     //input[@id='message-Status']       ${message_status}
    wait until element is visible     //span[normalize-space()='${message_status}']    ${wait_time}
    wait until element is visible     //span[normalize-space()='${message_status}']      ${wait_time}
    click element       //span[normalize-space()='${message_status}']

Enter text in the subject field under compose message
    wait until element is visible      css:#ClientMessageSubject     ${wait_time}
    wait until element is visible     css:#ClientMessageSubject      ${wait_time}
    click element   css:#ClientMessageSubject
    ${random_string} =    Generate Random String       20      [LETTERS]
    ${generated_subject}=    Catenate    Subject:${random_string}
    input text     css:#ClientMessageSubject      ${generated_subject}
    log to console     ${generated_subject}
    set global variable    ${generated_subject}

Enter text in the client message field under compose message
    wait until element is visible      css:#ClientMessageDetail     ${wait_time}
    wait until element is visible     css:#ClientMessageDetail      ${wait_time}
    click element   css:#ClientMessageDetail
    ${random_string} =    Generate Random String       20      [LETTERS]
    ${generated_client_message}=    Catenate    Client_Message:${random_string}
    input text     css:#ClientMessageDetail       ${generated_client_message}
    log to console     ${generated_client_message}
    set global variable    ${generated_client_message}

Search by subject under sent serach bar
    [Arguments]     ${data}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       //input[@placeholder='Search by To and Subject']       ${wait_time}
    Clear Element Text      //input[@placeholder='Search by To and Subject']
    input text      //input[@placeholder='Search by To and Subject']     ${data}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Search by subject under inbox serach bar
    [Arguments]     ${data}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible      //input[@placeholder='Search by From and Subject']      ${wait_time}
    Clear Element Text      //input[@placeholder='Search by From and Subject']
    input text      //input[@placeholder='Search by From and Subject']     ${data}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Click on the reply option to reply the message
    wait until element is visible       css:.reply-message-qa       ${wait_time}
    wait until element is visible      css:.reply-message-qa     ${wait_time}
    Click element     css:.reply-message-qa
    wait until element is not visible   ${loaderIcon}       ${wait_time}

Enter input in the reply back page
    wait until element is visible      //div[@class='form-fields-login']//textarea[contains(@class,'message-body')]      ${wait_time}
    wait until element is visible      //div[@class='form-fields-login']//textarea[contains(@class,'message-body')]   ${wait_time}
    Click element     //div[@class='form-fields-login']//textarea[contains(@class,'message-body')]
    ${random_string} =    Generate Random String       20      [LETTERS]
    ${generated_reply}=    Catenate    Reply:${random_string}
    input text      //div[@class='form-fields-login']//textarea[contains(@class,'message-body')]         ${generated_reply}
    log to console     ${generated_reply}
    set global variable   ${generated_reply}

Click on the flag icon to flag the message
    wait until element is visible       css:.flag-message-qa       ${wait_time}
    wait until element is visible      css:.flag-message-qa    ${wait_time}
    Click element     css:.flag-message-qa
    wait until element is not visible   ${loaderIcon}       ${wait_time}

Click on the remove option to remove the message
    wait until element is visible       css:.remove-message-qa       ${wait_time}
    wait until element is visible      css:.remove-message-qa    ${wait_time}
    Click element     css:.remove-message-qa
    wait until element is not visible   ${loaderIcon}       ${wait_time}

Click on the notifications icon under dashbaord page
    wait until element is visible       css:#bellIconId      ${wait_time}
    wait until element is visible      css:#bellIconId    ${wait_time}
    Click element     css:#bellIconId

Get the text of the recent notification
    [Arguments]      ${option}
    wait until element is visible       css:#alertTabs>div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)
    wait until element is enabled       css:#alertTabs>div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)     ${wait_time}
    ${notification} =    get text    css:#alertTabs>div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)
    set global variable     ${notification}
    log to console     ${notification}
    should be equal    ${notification}     ${option}

Verify that Management console page contains No data chart
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[@id='${option}']//div[contains(@class,'width-no-chart')]     ${wait_time}
    wait until element is enabled      //div[@id='${option}']//div[contains(@class,'width-no-chart')]      ${wait_time}

Click on No key Data under chart
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[@id='${option}']//span[normalize-space()='Key Data Check']     ${wait_time}
    wait until element is enabled      //div[@id='${option}']//span[normalize-space()='Key Data Check']      ${wait_time}
    click element       //div[@id='${option}']//span[normalize-space()='Key Data Check']

Verify and click on the finance filter under technology
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //span[normalize-space()='3']     ${wait_time}
    wait until element is enabled      //span[normalize-space()='3']      ${wait_time}
    click element       //span[normalize-space()='3']

Verify all the checkmark boxes of finance filter are auto-check
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //label[normalize-space()='${option}']//span     ${wait_time}
    wait until element is enabled      //label[normalize-space()='${option}']//span      ${wait_time}

Remove the Download Agent pop-up
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //h4[normalize-space()='Download Agent for Single Install']//parent::div//button[contains(@class,'close')]     ${wait_time}
    wait until element is enabled      //h4[normalize-space()='Download Agent for Single Install']//parent::div//button[contains(@class,'close')]      ${wait_time}
    click element   //h4[normalize-space()='Download Agent for Single Install']//parent::div//button[contains(@class,'close')]
    sleep       ${search_sleep}

Click on the status filter under Brand via profile
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'statusFilter')]       ${wait_time}
    Wait Until Element Is Enabled   //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'statusFilter')]   ${wait_time}
    click element    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'statusFilter')]

Select the option from the filters under brand via profile
    [Arguments]     ${ID}
    Wait Until Element Is Visible    //ng-select[contains(@class,'statusFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]       ${wait_time}
    Wait Until Element Is Enabled  //ng-select[contains(@class,'statusFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]   ${wait_time}
    click element    //ng-select[contains(@class,'statusFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]

Get the text of selected status filter under brand via profile
    [Arguments]     ${option}
    wait until element is visible      //ng-select[contains(@class,'statusFilter')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled      //ng-select[contains(@class,'statusFilter')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    ${fetch_Name_of_selected_status} =    get text  //ng-select[contains(@class,'statusFilter')]//following-sibling::div//span[normalize-space()='${option}']
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_status}
    ${New_status_Brand}=    Evaluate    '${original_string}'.strip()
    log to console   ${New_status_Brand}
    set global variable  ${New_status_Brand}

Click on the added brands heading
    Wait Until Element Is Visible    //p[normalize-space()='Added Brands']       ${wait_time}
    Wait Until Element Is enabled  //p[normalize-space()='Added Brands']   ${wait_time}
    click element    //p[normalize-space()='Added Brands']

Choose permission tab under members profile
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible       css:#profile-tab           ${wait_time}
    wait until element is enabled       css:#profile-tab     ${wait_time}
    click element       css:#profile-tab

Pick User role of the member
    [Arguments]     ${options}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible       //button[normalize-space()='${options}']           ${wait_time}
    wait until element is enabled       //button[normalize-space()='${options}']     ${wait_time}
    click element       //button[normalize-space()='${options}']

Verify user role have permissions
    [Arguments]     ${options}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible       css:#member-${options}           ${wait_time}
    wait until element is enabled       css:#member-${options}     ${wait_time}

Select the permission of member according to user role
    [Arguments]     ${options}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible       css:#member-${options}          ${wait_time}
    wait until element is enabled       css:#member-${options}     ${wait_time}
    sleep       ${search_sleep}
    click element       css:#member-${options}

Verify that user contains permissions
    [Arguments]         ${option1}      ${option2}
    wait until page contains    ${option1}       ${wait_time}
    wait until page contains    ${option2}       ${wait_time}

Verify that user contains read-permissions
    [Arguments]         ${option1}
    wait until page contains    ${option1}       ${wait_time}

Click on the status filter under product via profile
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'selectedStatus')]       ${wait_time}
    Wait Until Element Is Enabled   //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'selectedStatus')]   ${wait_time}
    click element    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'selectedStatus')]

Get the text of selected status filter under product via profile
    wait until element is visible      //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//span    ${wait_time}
    wait until element is enabled      //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//span    ${wait_time}
    ${fetch_Name_of_selected_status} =    get text  //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//span
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_status}
    ${New_product_Status}=    Evaluate    '${original_string}'.strip()
    log to console    ${New_product_Status}
    set global variable  ${New_product_Status}

Select the option from the filters under product via profile
    [Arguments]     ${ID}
    Wait Until Element Is Visible    //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//input[contains(@id,'item-${ID}')]       ${wait_time}
    Wait Until Element Is Enabled  //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//input[contains(@id,'item-${ID}')]   ${wait_time}
    click element    //ng-select[contains(@class,'selectedStatus')]//following-sibling::div//input[contains(@id,'item-${ID}')]

Click on the added products heading
    Wait Until Element Is Visible    //p[normalize-space()='Added Products']       ${wait_time}
    Wait Until Element Is Visible  //p[normalize-space()='Added Products']   ${wait_time}
    Wait Until Element Is Enabled  //p[normalize-space()='Added Products']   ${wait_time}
    click element    //p[normalize-space()='Added Products']

Click on the brand filter under product via profile
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'brandFilter')]       ${wait_time}
    Wait Until Element Is Enabled  //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'brandFilter')]   ${wait_time}
    click element    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'brandFilter')]

Click on the reset button under product
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'reset-button')]       ${wait_time}
    Wait Until Element Is Enabled  //div[contains(@class,'reset-button')]   ${wait_time}
    click element    //div[contains(@class,'reset-button')]

Select the option from the brand filter under product via profile
    [Arguments]     ${ID}
    Wait Until Element Is Visible    //ng-select[contains(@class,'brandFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]       ${wait_time}
    Wait Until Element Is enabled  //ng-select[contains(@class,'brandFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]   ${wait_time}
    click element    //ng-select[contains(@class,'brandFilter')]//following-sibling::div//input[contains(@id,'item-${ID}')]

Get the text of selected brand filter under product via profile
    wait until element is visible      //ng-select[contains(@class,'brandFilter')]//following-sibling::div//span    ${wait_time}
    wait until element is enabled      //ng-select[contains(@class,'brandFilter')]//following-sibling::div//span    ${wait_time}
   ${selected_Brand} =    get text    //ng-select[contains(@class,'brandFilter')]//following-sibling::div//span
    log to console    ${selected_Brand}
    Set Global Variable    ${selected_Brand}

Click on the technology group filter under product via profile
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'qa-selectedTechnology')]       ${wait_time}
    Wait Until Element Is Enabled  //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'qa-selectedTechnology')]   ${wait_time}
    click element    //div[contains(@class,'multi-select-dropdown')]//ng-select[contains(@class,'qa-selectedTechnology')]

Select the option from the technology group filter under product via profile
    [Arguments]     ${ID}
    Wait Until Element Is Visible    //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//input[contains(@id,'item-${ID}')]       ${wait_time}
    Wait Until Element Is enabled  //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//input[contains(@id,'item-${ID}')]   ${wait_time}
    click element    //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//input[contains(@id,'item-${ID}')]

Get the text of selected technology group filter under product via profile
    wait until element is visible      //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//span    ${wait_time}
    wait until element is enabled      //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//span    ${wait_time}
    ${fetch_Name_of_selected_status} =    get text  //ng-select[contains(@class,'qa-selectedTechnology')]//following-sibling::div//span
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_status}
    ${New_product_tech_group}=    Evaluate    '${original_string}'.strip()
    log to console     ${New_product_tech_group}
    set global variable   ${New_product_tech_group}