*** Settings ***
Documentation   Contains all keyword of Partner page
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
${add_Partner}     css:a[title='Add New Partner']
${partner_export_btn}     //a[@id='dropdownMenuButton']
${click_Partner}         css:ng-select[placeholder='Select Partner Type']
${click_businessName}     css:ng-select[placeholder='Select or Search a Business Name'] input[type='text']
${businessName}     css:div[aria-expanded='true'] input[type='text']
${businessURL}     css:#businessUrl
${select_businessURL}     css:.qa-BusinessUrl
${click_Country}     css:#country
${addContact}     //span[normalize-space()='Add new Contact']


${contactPerson}     css:#contactPerson
${contactEmail}     css:#ContactEmail

${secondary_contactEmail}     css:#businessEmail
${click_countryTag}     css:.iti__selected-flag.dropdown-toggle
${contact_Country_search}     css:#country-search-box
${phone}     css:#phone
${location}     css:[formcontrolname=LocationTypeId] input

${save_addNewContact}     //span[normalize-space()='Save']
${save_secondaryNewContact}     css:#contactModal .button-green

${cancel_addNewContact}     //div[@id='addContactModal']//button[@data-dismiss='modal'][normalize-space()='Cancel']
${main_Save}    css:form[autocomplete='off'] div div button[type='submit']
${main_update_btn}        //button[normalize-space()='Update']


${add_custom_businessURL}     css:.fas.fa-plus.float-right
${add_secondaryURL}     css:input[formcontrolname='Businessurl']
${three_dots}       css:.three-dots
${save_address}     css:button[class='btn button-green mt-0 ml-1 ng-star-inserted']
${partner_searchBar}    css:#searchbar-partner
${partner_address_Line2}     css:#StreetAddress2
${partner_address_Line1}     css:#addressLine1
${partner_state}        css:#state
${partner_city}     css:#city
${zip_code}     css:.qa-Zip         #css:#Zip
${secondary_contactURL}     css:input[formcontrolname='Businessurl']
${loaderIcon}     //div[@role='status']
${partner_newaddress_Line2}     css:#addressLine2
${new_zipcode}      css:#zip
${new_contactEmail}     css:#businessEmail
${update_button}       xpath://button[@type='button'][normalize-space()='Update']
${select_remove_popUp_Yes}      xpath://button[normalize-space()='Yes']
${clear_text}       css:ng-select[placeholder='Select State'] span[title='Clear all']
${partner_edit_icon}        css:.fa-pencil-alt.pencil
${contactP_country}     css:#country
${contact_name}     css:#contactName

${Page_Fetch}       css:.pagination ul a
${fetch_brandName}    css:td:nth-child(2)

*** Keywords ***

Search by business name
    [Arguments]    ${BusinessName}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       ${partner_searchBar}       ${wait_time}
    input text      ${partner_searchBar}     ${BusinessName}
    sleep       ${search_sleep}
    wait until element is visible       //td[normalize-space()='${BusinessName}']     ${wait_time}
    ${get_businessName} =    get text    //td[normalize-space()='${BusinessName}']
    log to console     ${get_businessName}
    should be equal    ${BusinessName}     ${get_businessName}

Search by brand name
    [Arguments]    ${BrandName}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       //input[@placeholder='Search by Brand Name']       ${wait_time}
    input text      //input[@placeholder='Search by Brand Name']     ${BrandName}
    sleep       ${search_sleep}
    wait until element is visible       //td[normalize-space()='${BrandName}']     ${wait_time}
    ${get_brandName} =    get text   //td[normalize-space()='${BrandName}']
    log to console     ${get_brandName}
    should be equal    ${BrandName}     ${get_brandName}


Select partner type
    [Arguments]    ${option}
     wait until element is visible      //span[normalize-space()='${option}']//div       ${wait_time}
     wait until element is enabled       //span[normalize-space()='${option}']//div       ${wait_time}
     click element      //span[normalize-space()='${option}']//div


Click new partner button
    wait until element is visible       ${add_Partner}        ${wait_time}
    wait until element is enabled       ${add_Partner}        ${wait_time}
    click element     ${add_Partner}

Select partner type of new partner
    [Arguments]    ${partner}
    wait until element is visible      ${click_Partner}        ${wait_time}
    wait until element is enabled       ${click_Partner}        ${wait_time}
    click element   ${click_Partner}
    Select partner type     ${partner}


Create partner random business name
    wait until element is visible       ${click_businessName}        ${wait_time}
    wait until element is enabled       ${click_businessName}        ${wait_time}
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_BusinessName}=    Catenate    BusinessName${random_string}
    input text   ${businessName}   ${generate_BusinessName}
    set global variable    ${generate_BusinessName}
    wait until element is not visible       //div[contains(@class,'dropdown-panel-items')]//div[contains(@class,'option')][normalize-space()='Loading...']    ${wait_time}


Create partner random business name for testing
    wait until element is visible       ${click_businessName}        ${wait_time}
    wait until element is enabled       ${click_businessName}        ${wait_time}
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_BusinessName}=    Catenate    JASBusinessName${random_string}
    input text   ${businessName}   ${generate_BusinessName}
    set global variable    ${generate_BusinessName}


Create partner self business name
    [Arguments]    ${option}
    wait until element is visible       ${click_businessName}        ${wait_time}
    wait until element is enabled       ${click_businessName}        ${wait_time}
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    input text   ${businessName}   ${option}
    Press Keys  ${businessName}  ENTER

Enter partner business URL
    [Arguments]    ${option}
    wait until element is visible       ${businessURL}        ${wait_time}
    wait until element is enabled       ${businessURL}        ${wait_time}
    click element   ${businessURL}
    Clear element text      ${businessURL}
    input text   ${businessURL}   ${option}.net

Select partner business_name
    [Arguments]    ${option}
    wait until element is visible       ${click_businessName}        ${wait_time}
    wait until element is enabled       ${click_businessName}        ${wait_time}
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    input text   ${businessName}   ${option}
    ${selected_option}=    Convert To Lowercase    ${option}
#    sleep   ${search_sleep}
    wait until element is visible     //div[contains (@id, '-0')]        ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]
#    Press Keys     ${businessName}       ENTER
    sleep   ${search_sleep}


Select partner business URL
    sleep      2
    wait until element is visible       css:#businessUrl         ${wait_time}
    wait until element is enabled       css:#businessUrl        ${wait_time}
    click element   css:#businessUrl
#    click element   ${click_businessName}
#    wait until element is not visible      //div[contains(text(),'Select Business URL')]         ${wait_time}
#    wait until element is enabled      //div[contains(text(),'Select Business URL')]         ${wait_time}
#    sleep      2
#    click element   ${click_businessName}
#    click element   ${select_businessURL}
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Select partner business URL for static business
    wait until element is visible       ${select_businessURL}         ${wait_time}
    wait until element is enabled       ${select_businessURL}        ${wait_time}
    sleep      2
    click element   ${select_businessURL}
    wait until element is visible     //div[contains (@id, '-0')]//span[contains(text(),'qabusiness04191432')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]//span[contains(text(),'qabusiness04191432')]       ${wait_time}
    click element   //div[contains (@id, '-0')]//span[contains(text(),'qabusiness04191432')]

Select partner country
    [Arguments]    ${country}
    wait until element is visible       ${click_Country}        ${wait_time}
    wait until element is enabled       ${click_Country}        ${wait_time}
    click element   ${click_Country}
    Clear element text      ${click_Country}
    input text   ${click_Country}   ${country}
    Generic.Select parameter    ${country}


Click on contact person button
    sleep   ${search_sleep}
    wait until element is visible   ${addContact}       ${wait_time}
    wait until element is enabled   ${addContact}       ${wait_time}
    sleep       ${search_sleep}
    click element   ${addContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       //label[@for='businessName']//parent::div//div[contains(@class,'spinner-loader')]       ${wait_time}


Enter random contact person
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible      ${contactPerson}       ${wait_time}
    wait until element is enabled      ${contactPerson}       ${wait_time}
    sleep       ${search_sleep}
    click element   ${contactPerson}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_PersonName}=    Catenate    Person_${random_string}
    input text   ${contactPerson}   ${generate_PersonName}
    wait until element is visible      css:div[role='option']       ${wait_time}
    click element   css:div[role='option']
    set global variable    ${generate_PersonName}

Enter random contact name
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible      ${contact_name}       ${wait_time}
    wait until element is enabled     ${contact_name}       ${wait_time}
    click element   ${contact_name}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_PersonName}=    Catenate    Person_${random_string}
    input text   ${contact_name}   ${generate_PersonName}
#    wait until element is visible      css:div[role='option']       ${wait_time}
#    click element   css:div[role='option']
#    set global variable    ${generate_PersonName}

Enter self contact person
    [Arguments]    ${option}
    wait until element is visible      ${contactEmail}       ${wait_time}
    wait until element is enabled      ${contactEmail}       ${wait_time}
    click element   ${contactPerson}
    input text   ${contactPerson}   ${option}
    wait until element is visible      css:div[role='option']       ${wait_time}
    click element   css:div[role='option']

Enter contact business email
    [Arguments]    ${Pname}    ${Bname}
    wait until element is visible   ${contactEmail}        ${wait_time}
    wait until element is enabled      ${contactEmail}       ${wait_time}
    click element   ${contactEmail}
    clear element text    ${contactEmail}
    input text   ${contactEmail}   ${Pname}@${Bname}.net
    ${generate_ContactBusinessEmail}=    Catenate    ${Pname}@${Bname}.net
    log to console  ${Pname}@${Bname}.net
    set global variable    ${generate_ContactBusinessEmail}

Enter secondary contact business email
    [Arguments]    ${Pname}    ${email}
    wait until element is visible       ${secondary_contactEmail}       ${wait_time}
    wait until element is enabled       ${secondary_contactEmail}       ${wait_time}
    click element   ${secondary_contactEmail}
    clear element text    ${secondary_contactEmail}
    input text   ${secondary_contactEmail}   ${Pname}@${email}.net
    ${generate_SecondaryContactBusinessEmail}=    Catenate    ${Pname}@${email}.net
    log to console    secondary business email: ${Pname}@${email}.net
    set global variable    ${generate_SecondaryContactBusinessEmail}



Enter contact location
    [Arguments]    ${loc}
    wait until element is visible       ${location}     ${wait_time}
    wait until element is enabled       ${location}     ${wait_time}
    click element   ${location}
    clear element text    ${location}
    input text  ${location}   ${loc}
    Press Keys     ${location}       ENTER


Save the new contact
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   ${save_addNewContact}       ${wait_time}
    wait until element is enabled   ${save_addNewContact}       ${wait_time}
    click element   ${save_addNewContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   ${search_sleep}
    wait until element is not visible       //div[@id='contactModal']//div[contains(@class,'modal-content')]         ${wait_time}

Save the secondary contact
    wait until element is visible   ${save_secondaryNewContact}     ${wait_time}
    wait until element is enabled   ${save_secondaryNewContact}     ${wait_time}
    click element   ${save_secondaryNewContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Click contact main save button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      ${main_Save}       ${wait_time}
    wait until element is enabled      ${main_Save}       ${wait_time}
    wait until element is not visible       //span[normalize-space()='Please enter a valid Mobile Number']     ${wait_time}
    click element   ${main_Save}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          60

Click first row of table
    wait until element is visible      css:td:nth-child(1)        ${wait_time}
    wait until element is enabled      css:td:nth-child(1)        ${wait_time}
    click element   css:td:nth-child(1)

Click on edit button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //button[normalize-space()='Edit']        ${wait_time}
    wait until element is enabled      //button[normalize-space()='Edit']        ${wait_time}
    click element   //button[normalize-space()='Edit']
    wait until element is not visible       ${shadow}          60

Click on add custome business URL icon
    wait until element is visible      ${add_custom_businessURL}        ${wait_time}
    wait until element is enabled      ${add_custom_businessURL}        ${wait_time}
    click element   ${add_custom_businessURL}

Create partner random secondary business URL
    wait until element is visible       ${add_secondaryURL}        ${wait_time}
    wait until element is enabled       ${add_secondaryURL}        ${wait_time}
    click element   ${add_secondaryURL}
    Clear element text      ${add_secondaryURL}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_SecondaryBusinessName}=    Catenate    BusinessName${random_string}.net
    input text   ${add_secondaryURL}   ${generate_SecondaryBusinessName}
    set global variable    ${generate_SecondaryBusinessName}


Click on update button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      ${main_update_btn}        ${wait_time}
    wait until element is enabled      ${main_update_btn}        ${wait_time}
    click element   ${main_update_btn}
    wait until element is not visible       ${shadow}          60

Save the new added contact
    wait until element is visible   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']        ${wait_time}
    wait until element is enabled   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']        ${wait_time}
    click element   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']
    wait until element is visible      ${loaderIcon}       ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Click on the export Button
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      ${partner_export_btn}        ${wait_time}
    wait until element is enabled      ${partner_export_btn}        ${wait_time}
    sleep   ${search_sleep}
    click element   ${partner_export_btn}
    wait until element is not visible       ${shadow}          60

Confirm to export file
    [Arguments]    ${option}
    wait until element is visible      css:.qa-${option}-export      ${wait_time}
    wait until element is enabled      css:.qa-${option}-export       ${wait_time}
    sleep       ${search_sleep}
    click element   css:.qa-${option}-export
    wait until element is not visible       css:.qa-${option}-export          ${wait_time}



Download the selected extension file
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //a[contains(text(),'${option}')]       ${wait_time}
    wait until element is enabled     //a[contains(text(),'${option}')]       ${wait_time}
    sleep   ${search_sleep}
    click element   //a[contains(text(),'${option}')]

Verify that the selected extension file is downloaded
    [Arguments]    ${option}
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //span[contains(text(),'${option}')]       120
    wait until element is enabled      //span[contains(text(),'${option}')]       120
    click element   css:.fa-file-download
    sleep   ${search_sleep}

Remove the file from downloaded list
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.fas.fa-times.dropDownProgressBar       ${wait_time}
    wait until element is enabled       css:.fas.fa-times.dropDownProgressBar       ${wait_time}
    click element       css:.fas.fa-times.dropDownProgressBar

Select the partner row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']       ${wait_time}
    click element       //td[normalize-space()='${option}']

Add Unique address_one of partner
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     ${partner_address_Line1}         ${wait_time}
    wait until element is enabled     ${partner_address_Line1}         ${wait_time}
    click element      ${partner_address_Line1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${partner_address_Line1}     Address_${generate_newaddress_one}
    Press Keys  ${partner_address_Line1}            ENTER
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Add Unique address_two of partner
    wait until element is visible     ${partner_address_Line2}         ${wait_time}
    wait until element is enabled     ${partner_address_Line2}         ${wait_time}
    click element      ${partner_address_Line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_two}=    Catenate    ${random_string}
    input text      ${partner_address_Line2}     Address_${generate_newaddress_two}
    Press Keys  ${partner_address_Line2}            ENTER
    log to console      ${generate_newaddress_two}
    set global variable    ${generate_newaddress_two}

Select State
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible   ${partner_state}   ${wait_time}
    wait until element is enabled   ${partner_state}   ${wait_time}
    click element   ${partner_state}
    clear element text      ${partner_state}
    Generic.Select parameter    ${address}

Select City
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible   ${partner_city}   ${wait_time}
    wait until element is enabled   ${partner_city}   ${wait_time}
    click element   ${partner_city}
    clear element text      ${partner_city}
    Generic.Select parameter    ${address}


Zip code Input
    [Arguments]     ${code}
    wait until element is visible      ${zip_code}   ${wait_time}
    wait until element is enabled     ${zip_code}   ${wait_time}
    click element    ${zip_code}
    input text  ${zip_code}    ${code}

Save new Address
    wait until element is visible       ${save_address}     ${wait_time}
    wait until element is enabled       ${save_address}     ${wait_time}
    click element       ${save_address}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    sleep   ${search_sleep}
    wait until element is not visible       //div[@id='addAddressModal']//div[contains(@class,'modal-content')]    ${wait_time}

Click on Add new Address of partner
    [Arguments]     ${option}
    Generic.select parameter    ${option}

Click on Add new Contact of partner
    [Arguments]     ${option}
    Generic.select parameter    ${option}

Click on three dots of partners listing
    wait until element is visible   ${three_dots}   ${wait_time}
    click element   ${three_dots}
    sleep   ${search_sleep}

Select option from three dots of partner
    [Arguments]     ${option}
    Generic.Select simple option from profile list       ${option}
    sleep   ${search_sleep}

#option: Edit, Deactivate, Activate, Remove

click on plus icon to add another business_url
    wait until element is visible       css:.fas.fa-plus        ${wait_time}
    click element       css:.fas.fa-plus

Add second business_url
    [Arguments]    ${name}
    wait until element is visible       ${secondary_contactURL}     ${wait_time}
    wait until element is enabled       ${secondary_contactURL}     ${wait_time}
    click element   ${secondary_contactURL}
    clear element text    ${secondary_contactURL}
    ${generate_SecondaryContactBusinessURL}=   Catenate    ${name}.com
    input text   ${secondary_contactURL}   ${name}.com
    log to console    secondary business URL: ${name}.com
    set global variable     ${generate_SecondaryContactBusinessURL}

Select country
    [Arguments]    ${name}
    wait until element is visible       ${contactP_country}       ${wait_time}
    wait until element is enabled       ${contactP_country}       ${wait_time}
    click element   ${contactP_country}
    input text      ${contactP_country}        ${name}
    Press Keys      ${contactP_country}       ENTER

Add new address_two of partner
    wait until element is visible     ${partner_newaddress_Line2}         ${wait_time}
    wait until element is enabled     ${partner_newaddress_Line2}         ${wait_time}
    click element      ${partner_newaddress_Line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_two}=    Catenate    ${random_string}
    input text      ${partner_newaddress_Line2}     Address_${generate_newaddress_two}
    Press Keys  ${partner_newaddress_Line2}            ENTER
    log to console      ${generate_newaddress_two}
    set global variable    ${generate_newaddress_two}

Add new zip code of partner
    [Arguments]     ${code}
    wait until element is visible      ${new_zipcode}    ${wait_time}
    wait until element is enabled      ${new_zipcode}    ${wait_time}
    clear element text      ${new_zipcode}
    click element    ${new_zipcode}
    input text   ${new_zipcode}    ${code}


click on edit icon
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    sleep       ${search_sleep}
    wait until element is visible   ${partner_edit_icon}   ${wait_time}
    wait until element is enabled   ${partner_edit_icon}   ${wait_time}
    click element       ${partner_edit_icon}

Click on cross-icon for clearing text
    wait until element is visible    ${clear_text}   ${wait_time}
    wait until element is enabled    ${clear_text}   ${wait_time}
    click element       ${clear_text}

Update the partner information
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible       ${update_button}        ${wait_time}
    wait until element is enabled      ${update_button}        ${wait_time}
    sleep   ${search_sleep}
    click element       ${update_button}
    sleep   ${search_sleep}
    wait until element is not visible       //div[@id='addressModal']//div[contains(@class,'modal-content')]        ${wait_time}
    wait until element is not visible       ${shadow}          60

Enter new_business_email of contact
    [Arguments]    ${Pname}    ${Bname}
    wait until element is visible       ${new_contactEmail}     ${wait_time}
    wait until element is enabled       ${new_contactEmail}     ${wait_time}
    click element   ${new_contactEmail}
    clear element text    ${new_contactEmail}
    input text   ${new_contactEmail}   ${Pname}@${Bname}.net
    ${generate_ContactBusinessEmail}=    Catenate    ${Pname}@${Bname}.net
    log to console  ${Pname}@${Bname}.net
    set global variable    ${generate_ContactBusinessEmail}

Select option from the pop up
    [Arguments]    ${option}
    Generic.click on the button         ${option}
    sleep   ${search_sleep}

Click on the save button
    [Arguments]     ${option}
    Generic.click on the button         ${option}

Click here to add link of contract details
    wait until element is visible   (//a[normalize-space()='Click here to add'])[2]        ${wait_time}
    wait until element is enabled      (//a[normalize-space()='Click here to add'])[2]       ${wait_time}
    click element   (//a[normalize-space()='Click here to add'])[2]

Enter contact business email via link
    [Arguments]    ${Pname}
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   css:#businessEmail        ${wait_time}
    wait until element is enabled      css:#businessEmail       ${wait_time}
    click element   css:#businessEmail
    ${generate_ContactBusinessEmailvialink}=    Catenate    ${Pname}@yopmail.net
    input text   css:#businessEmail  ${generate_ContactBusinessEmailvialink}
    log to console  ${generate_ContactBusinessEmailvialink}
    set global variable    ${generate_ContactBusinessEmailvialink}

Enter random contact person via link
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible      css:#contactName     ${wait_time}
    wait until element is enabled      css:#contactName       ${wait_time}
    click element   css:#contactName
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generate_contactPersonName}=    Catenate    Person_${random_string}
    input text   css:#contactName   ${generate_contactPersonName}
    log to console  ${generate_contactPersonName}
    set global variable      ${generate_contactPersonName}
    Press Keys  css:#contactName    ENTER

Enter contact location via link
    [Arguments]    ${loc}
    wait until element is visible       css:#forLcoations     ${wait_time}
    wait until element is enabled       css:#forLcoations     ${wait_time}
    click element   css:#forLcoations
    input text  css:#forLcoations   ${loc}
    Press Keys     css:#forLcoations       ENTER

Click on save button of contact via link
    [Arguments]     ${button}
    wait until element is visible   //div[@id='contactModalContract']//button[normalize-space()='${button}']      ${wait_time}
    click element   //div[@id='contactModalContract']//button[normalize-space()='${button}']
    wait until element is not visible   //div[@id='contactModal']//div[contains(@class,'modal-content')]     ${wait_time}
    wait until element is not visible       ${shadow}          60

Enter and select contact name via link
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   css:#contName   ${wait_time}
    click element   css:#contName
    input text  css:#contName       ${generate_contactPersonName}
    Press Keys  css:#contName   ENTER

Click on back to contracts link via contract
    wait until element is visible   css:.back.theme-blue    ${wait_time}
    click element   css:.back.theme-blue

Verify status after withdraw the contract
    [Arguments]    ${option}
    wait until element is visible   //td[normalize-space()='${option}']      ${wait_time}
# options: active, inactive, pending

Click on the three buttons link of contract via view smart details
    [Arguments]     ${option}
    wait until element is visible   //b[normalize-space()='${option}:']/../../..//a[@class='back pointer ng-star-inserted'][normalize-space()='1']      ${wait_time}
    click element   //b[normalize-space()='${option}:']/../../..//a[@class='back pointer ng-star-inserted'][normalize-space()='1']


Click on back to contract details button link
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   css:.back.pointer.font-weight-bold    ${wait_time}
    click element   css:.back.pointer.font-weight-bold

Download the contract pdf
    wait until element is not visible   ${loaderIcon}   ${wait_time}
    wait until element is visible   //i[@title='Download PDF Version']      ${wait_time}
    click element   //i[@title='Download PDF Version']

Verify pages with the element
    [Arguments]    ${option}
    wait until element is visible   //th[normalize-space()='${option}']     ${wait_time}
# option: Yes, No

Click on the export button of partner under technology details page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@id,'partners')]//button[@id='dropdownMenuButton']        ${wait_time}
    wait until element is enabled      //div[contains(@id,'partners')]//button[@id='dropdownMenuButton']        ${wait_time}
    sleep       ${search_sleep}
    click element  //div[contains(@id,'partners')]//button[@id='dropdownMenuButton']


Download the selected extension file of partner under technology details
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@id,'partners')]//a[contains(text(),'${option}')]       ${wait_time}
    wait until element is enabled     //div[contains(@id,'partners')]//a[contains(text(),'${option}')]       ${wait_time}
    click element   //div[contains(@id,'partners')]//a[contains(text(),'${option}')]


Click on pencil icon of address and contact under partner
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    (//i[contains(@class,'fa-pencil-alt')])[${option}]       ${wait_time}
    wait until element is enabled   (//i[contains(@class,'fa-pencil-alt')])[${option}]      ${wait_time}
    click element   (//i[contains(@class,'fa-pencil-alt')])[${option}]

Update the partner information of edit contact
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is visible      //div[@id='contactModal']//div[@class='modal-content']//following-sibling::button[normalize-space()='Update']        ${wait_time}
    wait until element is enabled     //div[@id='contactModal']//div[@class='modal-content']//following-sibling::button[normalize-space()='Update']        ${wait_time}
    click element       //div[@id='contactModal']//div[@class='modal-content']//following-sibling::button[normalize-space()='Update']
    wait until element is not visible   ${loaderIcon}       ${wait_time}
    wait until element is not visible       ${shadow}          60
    sleep   ${search_sleep}

Select the partner address country
    [Arguments]     ${country}
    wait until element is visible       ${click_Country}        ${wait_time}
    wait until element is enabled       ${click_Country}        ${wait_time}
    click element   ${click_Country}
    Clear element text      ${click_Country}
    input text   ${click_Country}   ${country}
    Press Keys   ${click_Country}       ENTER

Wait for add address pop up hide
    wait until element is not visible       //div[@id='addAddressModal']//div[contains(@class,'modal-content')]     ${wait_time}
    wait until element is not visible       ${shadow}          60

Wait for add contact pop up hide
    wait until element is not visible      //div[@id='contactModal']//div[contains(@class,'modal-content')]     ${wait_time}
#    wait until element is not visible       ${shadow}          60

Click on the filters from partner module
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody
    wait until element is visible       //span[contains(text(),'${option}')]       ${wait_time}
    wait until element is enabled       //span[contains(text(),'${option}')]       ${wait_time}
    click element       //span[contains(text(),'${option}')]

Checkmark after clicking on the filters
    [Arguments]     ${filter}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       //label[normalize-space()=' ${filter}']     ${wait_time}
    wait until element is enabled       //label[normalize-space()=' ${filter}']      ${wait_time}
    click element       //label[normalize-space()=' ${filter}']
    sleep       ${search_sleep}
    wait until element is not visible       ${loaderIcon}       ${wait_time}


Fetch the selected filter and verify from Table
    [Arguments]     ${option}       ${option1}      ${option2}
    Run Keyword IF      ${total_count_again} > 500       Filter and verify with pagination    ${option}       ${option1}      ${option2}    ELSE     Filter and verify without pagination  ${option}       ${option1}      ${option2}

Click Next Button And Wait For Page To Load
    Generic.Scroll Window To End
    Wait Until Element Is visible    //li[contains(@class,'pagination-next')]//a       ${wait_time}
    Wait Until Element Is enabled    //li[contains(@class,'pagination-next')]//a       ${wait_time}
    click element       //li[contains(@class,'pagination-next')]//a

Page fetch method
    wait until element is visible   css:.pagination ul a        ${wait_time}
    ${Page_Fetchstr}=      get element count        css:.pagination ul a
    ${Page_Fetch}=  convert to integer   ${Page_Fetchstr}
    log to console      ${Page_Fetch}
    set global variable     ${Page_Fetch}

Filter and verify with pagination
    [Arguments]     ${option}       ${option1}      ${option2}

    sleep   ${yop_sleep}
    PartnersPage.Page fetch method
    FOR    ${page}    IN RANGE    1   ${Page_Fetch}
            FOR    ${index}    IN RANGE    1        501              #${total_count} + 1
                Wait Until Element Is Visible   (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]      ${wait_time}
                Wait Until Element Is Enabled   (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]       ${wait_time}
                ${element1}=    Get Text    (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]
#                Scroll Element Into View    (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]
                ${original_string}=    Set Variable    ${element1}
                ${New_filter}=    Evaluate    '${original_string}'.strip()
                Log    Element ${index}: ${New_filter}
                Run Keyword If    '${New_filter}' == '${option2}'    Run Keyword       Continue For Loop

            END
            ${till_last_page}=    Run Keyword     Click Next Button And Wait For Page To Load      #//a[@aria-label='Next page']
            Exit For Loop If    ${till_last_page}
        END

Filter and verify without pagination
    [Arguments]     ${option}       ${option1}      ${option2}
    FOR    ${index}    IN RANGE    1    ${total_count_again + 1}
            Wait Until Element Is Visible   (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]      ${wait_time}
            Wait Until Element Is Enabled   (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]       ${wait_time}
#            Mouse over    (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]
            ${element1}=    Get Text    (//div[normalize-space()='${option}']//ancestor::thead//following-sibling::tbody//tr//td[normalize-space()='${option1}'])[${index}]
            ${original_string}=    Set Variable    ${element1}
            ${New_filter}=    Evaluate    '${original_string}'.strip()
            Log    Element ${index}: ${New_filter}
            Run Keyword If    '${New_filter}' == '${option2}'    Run Keyword       Continue For Loop
    END

Search by static business name
    [Arguments]    ${BusinessName}
    wait until element is not visible      ${loaderIcon}     ${wait_time}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is not visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]      ${wait_time}
    wait until element is visible       ${partner_searchBar}       ${wait_time}
    input text      ${partner_searchBar}     ${BusinessName}
    sleep       ${search_sleep}
    wait until element is not visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]      ${wait_time}


Verify the search static support partner
    [Arguments]    ${option}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //td[normalize-space()='${option}']   ${wait_time}
    Set Global Variable    ${status}
    RETURN    ${status}


Get new support Partner
    [Arguments]         ${option}       ${option1}
    Run Keyword If    ${status} == True
        ...    PartnersPage.Skip case
        ...    ELSE  Run Keywords     PartnersPage.Create the support partner     ${option}       ${option1}
        ...    AND    Return From Keyword


Skip case
     log   Element is already there

Create the support partner
    [Arguments]         ${option}       ${option1}
    PartnersPage.Click new partner button
    PartnersPage.Select partner type of new partner     ${option}
    PartnersPage.Select partner business_name     ${option1}
    Sleep    ${search_sleep}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
#   PartnersPage.Enter partner business URL      ${generate_BusinessName}

    PartnersPage.Click on the save button   Save
    Sleep     5
    Generic.Fetch alert message text and compare it with    Partner created successfully

Create many partners
    FOR    ${index}    IN RANGE    100
        PartnersPage.Click new partner button
        Generic.Verify your current page location contains    addpartner
        PartnersPage.Select partner type of new partner    Manufacturer
        ${random_business_name}    Evaluate    "BusinessName${index}"
        PartnersPage.Create partner random business name for testing
        PartnersPage.Enter partner business URL    ${generate_BusinessName}
        PartnersPage.Select partner country    United States
        Sleep    ${search_sleep}

        #-------------------------- CONTACT --------------------------------------------------------------
        PartnersPage.Click contact main save button
#        Sleep    5
       Generic.Fetch alert message text and compare it with    Partner created successfully
#        PartnersPage.Search by business name    ${generate_BusinessName}
    END
Clear the data of the fields while adding partner
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //ng-select[@placeholder='${option}']//span[@title='Clear all']        ${wait_time}
    wait until element is enabled   //ng-select[@placeholder='${option}']//span[@title='Clear all']        ${wait_time}
    click element       //ng-select[@placeholder='${option}']//span[@title='Clear all']

Clear the data of Partner Business URL
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        ${businessURL}  ${wait_time}
    Clear Element text     ${businessURL}
    input text          ${businessURL}      url
    Clear Element text     ${businessURL}

Verify the validations of these fields
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //label[normalize-space()='${option}']//parent::div//p//span    ${wait_time}
    wait until element is enabled       //label[normalize-space()='${option}']//parent::div//p//span      ${wait_time}
    ${Partner_validation1}=     get text        //label[normalize-space()='${option}']//parent::div//p//span
    log     ${Partner_validation1}
    set global variable     ${Partner_validation1}

Verify the validation of Partner business URL
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       (//label[normalize-space()='Business URL']//parent::div//p//span)[2]    ${wait_time}
    wait until element is enabled      (//label[normalize-space()='Business URL']//parent::div//p//span)[2]      ${wait_time}
    ${Partner_validation2}=     get text       (//label[normalize-space()='Business URL']//parent::div//p//span)[2]
    log     ${Partner_validation2}
    set global variable     ${Partner_validation2}

Compare the Validations on Partner Page
    [Arguments]         ${option1}      ${option2}
    Should be equal       ${option1}      ${option2}

Cancel the pop-ups
    [Arguments]         ${option1}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //div[@id='${option1}']//button[@data-dismiss='modal'][normalize-space()='Cancel']    ${wait_time}
    wait until element is enabled      //div[@id='${option1}']//button[@data-dismiss='modal'][normalize-space()='Cancel']      ${wait_time}
    click element       //div[@id='${option1}']//button[@data-dismiss='modal'][normalize-space()='Cancel']
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    sleep       2

Clear the field of country in add adddress of partner
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       (//ng-select[contains(@class,'country')]//span[contains(@class,'ng-clear-wrapper')])[2]        ${wait_time}
    wait until element is enabled       (//ng-select[contains(@class,'country')]//span[contains(@class,'ng-clear-wrapper')])[2]        ${wait_time}
    click element   (//ng-select[contains(@class,'country')]//span[contains(@class,'ng-clear-wrapper')])[2]
    wait until element is not visible    ${loaderIcon}      ${wait_time}

Clear the field for edit business URL
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        //label[normalize-space()='Business URL']//parent::div//span[contains(@class,'ng-value-icon')]  ${wait_time}
    wait until element is enabled        //label[normalize-space()='Business URL']//parent::div//span[contains(@class,'ng-value-icon')]  ${wait_time}
    Click element     //label[normalize-space()='Business URL']//parent::div//span[contains(@class,'ng-value-icon')]

Verify the validation of Partner business URL while edit partner
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //label[normalize-space()='Business URL']//parent::div//p//span    ${wait_time}
    wait until element is enabled      //label[normalize-space()='Business URL']//parent::div//p//span      ${wait_time}
    ${Partner_validation_URL}=     get text       //label[normalize-space()='Business URL']//parent::div//p//span
    log     ${Partner_validation_URL}
    set global variable     ${Partner_validation_URL}

Clear the field of country on edit partner
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        css:.qa-Country .ng-clear-wrapper   ${wait_time}
    wait until element is enabled        css:.qa-Country .ng-clear-wrapper   ${wait_time}
    Click element     css:.qa-Country .ng-clear-wrapper

Cancel the Edit partner
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        //div[contains(@class,'welcome-main')]//button[contains(@class,'button-red')][normalize-space()='Cancel']   ${wait_time}
    wait until element is enabled        //div[contains(@class,'welcome-main')]//button[contains(@class,'button-red')][normalize-space()='Cancel']   ${wait_time}
    Click element     //div[contains(@class,'welcome-main')]//button[contains(@class,'button-red')][normalize-space()='Cancel']

Edit the country of add new address
    Wait Until Element Is Not Visible    ${alert_Msg}          ${wait_time}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        //ng-select[@placeholder='Select Country']//span[@title='Clear all']   ${wait_time}
    wait until element is enabled        //ng-select[@placeholder='Select Country']//span[@title='Clear all']   ${wait_time}
    Click element     //ng-select[@placeholder='Select Country']//span[@title='Clear all']

Select the contact name when add new contact on edit partner
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      ${contact_name}       ${wait_time}
    wait until element is enabled     ${contact_name}       ${wait_time}
    click element   ${contact_name}
    wait until element is not visible       //div[contains(@id,'0')]        ${wait_time}
    click element       //div[contains(@id,'0')]

Add the contact of Edit partner
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //h5[normalize-space()='Contact']//parent::div//following-sibling::div//button[normalize-space()='Add']   ${wait_time}
    wait until element is enabled        //h5[normalize-space()='Contact']//parent::div//following-sibling::div//button[normalize-space()='Add']   ${wait_time}
    Click element     //h5[normalize-space()='Contact']//parent::div//following-sibling::div//button[normalize-space()='Add']

Compare the total count after selecting filter
    Should be equal     ${total_count_again}        ${total_count_int}