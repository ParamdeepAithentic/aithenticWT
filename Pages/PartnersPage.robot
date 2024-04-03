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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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
${partner_searchBar}    css:input[placeholder='Search by Business Name']
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
${update_button}        xpath://button[@type='button'][normalize-space()='Update']
${select_remove_popUp_Yes}      xpath://button[normalize-space()='Yes']
${clear_text}       css:ng-select[placeholder='Select State'] span[title='Clear all']
${partner_edit_icon}        css:.fa-pencil-alt.pencil
${contactP_country}     css:#country
${contact_name}     css:#contactName

*** Keywords ***

Search by business name
    [Arguments]    ${BusinessName}
    wait until element is visible       css:thead tr       60
    wait until element is visible       ${partner_searchBar}       60
    input text      ${partner_searchBar}     ${BusinessName}
    sleep       ${search_sleep}
    wait until element is visible       //td[normalize-space()='${BusinessName}']     60
    ${get_businessName} =    get text    //td[normalize-space()='${BusinessName}']
    log to console     ${get_businessName}
    should be equal    ${BusinessName}     ${get_businessName}

Search by brand name
    [Arguments]    ${BrandName}
    wait until element is visible       css:thead tr       60
    wait until element is visible       //input[@placeholder='Search by Brand Name']       60
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      //input[@placeholder='Search by Brand Name']     ${BrandName}
    sleep       ${search_sleep}
    wait until element is visible       //td[normalize-space()='${BrandName}']     60
    log to console     ${get_brandName}
    should be equal    ${BrandName}     ${get_brandName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   PartnersPage - Search by brand name      3    ${pageTime}     ${ActualTime}    PatnersPage_Time


Select partner type
    [Arguments]    ${option}
     wait until element is visible      //span[normalize-space()='${option}']//div       60
     wait until element is enabled       //span[normalize-space()='${option}']//div       60
     click element      //span[normalize-space()='${option}']//div


Click new partner button
    wait until element is visible       ${add_Partner}        60
    wait until element is enabled       ${add_Partner}        60
    click element     ${add_Partner}

Select partner type of new partner
    [Arguments]    ${partner}
    wait until element is visible      ${click_Partner}        60
    wait until element is enabled       ${click_Partner}        60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element   ${click_Partner}
    Select partner type     ${partner}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   PartnersPage - Select partner type of new partner      4    ${pageTime}     ${ActualTime}    PatnersPage_Time


Create partner random business name
    wait until element is visible       ${click_businessName}        60
    wait until element is enabled       ${click_businessName}        60
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_BusinessName}=    Catenate    BusinessName${random_string}
    input text   ${businessName}   ${generate_BusinessName}
    set global variable    ${generate_BusinessName}


Create partner self business name
    [Arguments]    ${option}
    wait until element is visible       ${click_businessName}        60
    wait until element is enabled       ${click_businessName}        60
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    input text   ${businessName}   ${option}
    Press Keys  ${businessName}  ENTER

Enter partner business URL
    [Arguments]    ${option}
    wait until element is visible       ${businessURL}        60
    wait until element is enabled       ${businessURL}        60
    click element   ${businessURL}
    Clear element text      ${businessURL}
    input text   ${businessURL}   ${option}.net

Select partner business_name
    [Arguments]    ${option}
    wait until element is visible       ${click_businessName}        60
    wait until element is enabled       ${click_businessName}        60
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    input text   ${businessName}   ${option}
    sleep   ${search_sleep}
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]
#    Press Keys     ${businessName}       ENTER
#    sleep   ${search_sleep}


Select partner business URL
    wait until element is visible       ${select_businessURL}         60
    wait until element is enabled       ${select_businessURL}        60
    sleep      2
    click element   ${select_businessURL}
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

Select partner country
    [Arguments]    ${country}
    wait until element is visible       ${click_Country}        60
    wait until element is enabled       ${click_Country}        60
    click element   ${click_Country}
    Clear element text      ${click_Country}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${click_Country}   ${country}
    Generic.Select parameter    ${country}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   PartnersPage - Select partner country      5    ${pageTime}     ${ActualTime}    PatnersPage_Time


Click on contact person button
    wait until element is visible   ${addContact}       60
    wait until element is enabled   ${addContact}       60
    click element   ${addContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Enter random contact person
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible      ${contactPerson}       60
    wait until element is enabled      ${contactPerson}       60
    click element   ${contactPerson}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_PersonName}=    Catenate    Person_${random_string}
    input text   ${contactPerson}   ${generate_PersonName}
    wait until element is visible      css:div[role='option']       60
    click element   css:div[role='option']
    set global variable    ${generate_PersonName}

Enter random contact name
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible      ${contact_name}       60
    wait until element is enabled     ${contact_name}       60
    click element   ${contact_name}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_PersonName}=    Catenate    Person_${random_string}
    input text   ${contact_name}   ${generate_PersonName}
    wait until element is visible      css:div[role='option']       60
    click element   css:div[role='option']
    set global variable    ${generate_PersonName}

Enter self contact person
    [Arguments]    ${option}
    wait until element is visible      ${contactEmail}       60
    wait until element is enabled      ${contactEmail}       60
    click element   ${contactPerson}
    input text   ${contactPerson}   ${option}
    wait until element is visible      css:div[role='option']       60
    click element   css:div[role='option']

Enter contact business email
    [Arguments]    ${Pname}    ${Bname}
    wait until element is visible   ${contactEmail}        60
    wait until element is enabled      ${contactEmail}       60
    click element   ${contactEmail}
    clear element text    ${contactEmail}
    input text   ${contactEmail}   ${Pname}@${Bname}.net
    ${generate_ContactBusinessEmail}=    Catenate    ${Pname}@${Bname}.net
    log to console  ${Pname}@${Bname}.net
    set global variable    ${generate_ContactBusinessEmail}

Enter secondary contact business email
    [Arguments]    ${Pname}    ${email}
    wait until element is visible       ${secondary_contactEmail}       60
    wait until element is enabled       ${secondary_contactEmail}       60
    click element   ${secondary_contactEmail}
    clear element text    ${secondary_contactEmail}
    input text   ${secondary_contactEmail}   ${Pname}@${email}.net
    ${generate_SecondaryContactBusinessEmail}=    Catenate    ${Pname}@${email}.net
    log to console    secondary business email: ${Pname}@${email}.net
    set global variable    ${generate_SecondaryContactBusinessEmail}



Enter contact location
    [Arguments]    ${loc}
    wait until element is visible       ${location}     60
    wait until element is enabled       ${location}     60
    click element   ${location}
    clear element text    ${location}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text  ${location}   ${loc}
    Press Keys     ${location}       ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   PartnersPage - Enter contact location      6    ${pageTime}     ${ActualTime}    PatnersPage_Time


Save the new contact
    wait until element is visible   ${save_addNewContact}       60
    wait until element is enabled   ${save_addNewContact}       60
    click element   ${save_addNewContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    sleep   ${search_sleep}

Save the secondary contact
    wait until element is visible   ${save_secondaryNewContact}     60
    wait until element is enabled   ${save_secondaryNewContact}     60
    click element   ${save_secondaryNewContact}
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Click contact main save button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      ${main_Save}       60
    wait until element is enabled      ${main_Save}       60
    click element   ${main_Save}
    Wait Until Element Is Not Visible    ${loaderIcon}      60


Click first row of table
    wait until element is visible      css:td:nth-child(1)        60
    wait until element is enabled      css:td:nth-child(1)        60
    click element   css:td:nth-child(1)

Click on edit button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //button[normalize-space()='Edit']        60
    wait until element is enabled      //button[normalize-space()='Edit']        60
    click element   //button[normalize-space()='Edit']

Click on add custome business URL icon
    wait until element is visible      ${add_custom_businessURL}        60
    wait until element is enabled      ${add_custom_businessURL}        60
    click element   ${add_custom_businessURL}

Create partner random secondary business URL
    wait until element is visible       ${add_secondaryURL}        60
    wait until element is enabled       ${add_secondaryURL}        60
    click element   ${add_secondaryURL}
    Clear element text      ${add_secondaryURL}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_SecondaryBusinessName}=    Catenate    BusinessName${random_string}.net
    input text   ${add_secondaryURL}   ${generate_SecondaryBusinessName}
    set global variable    ${generate_SecondaryBusinessName}

Click on update button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      ${main_update_btn}        60
    wait until element is enabled      ${main_update_btn}        60
    click element   ${main_update_btn}

Save the new added contact
    wait until element is visible   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']        60
    wait until element is enabled   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']        60
    click element   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']
    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Click on the export Button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      ${partner_export_btn}        60
    wait until element is enabled      ${partner_export_btn}        60
    click element   ${partner_export_btn}


Confirm to export file
    wait until element is visible      css:.btn.button-green.m-2       60
    wait until element is enabled      css:.btn.button-green.m-2       60
    sleep       ${search_sleep}
    click element   css:.btn.button-green.m-2


Download the selected extension file
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //a[contains(text(),'${option}')]       60
    wait until element is enabled     //a[contains(text(),'${option}')]       60
    click element   //a[contains(text(),'${option}')]

Verify that the selected extension file is downloaded
    [Arguments]    ${option}
#    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //span[contains(text(),'${option}')]       60
    wait until element is enabled      //span[contains(text(),'${option}')]       60
    click element   css:.fa-file-download
    sleep       3

Remove the file from downloaded list
#    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       css:.fas.fa-times.dropDownProgressBar       60
    wait until element is enabled       css:.fas.fa-times.dropDownProgressBar       60
    click element       css:.fas.fa-times.dropDownProgressBar

Select the partner row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']       60
    click element       //td[normalize-space()='${option}']

Add Unique address_one of partner
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible     ${partner_address_Line1}         60
    wait until element is enabled     ${partner_address_Line1}         60
    click element      ${partner_address_Line1}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${partner_address_Line1}     Address_${generate_newaddress_one}
    Press Keys  ${partner_address_Line1}            ENTER
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Add Unique address_two of partner
    wait until element is visible     ${partner_address_Line2}         60
    wait until element is enabled     ${partner_address_Line2}         60
    click element      ${partner_address_Line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_two}=    Catenate    ${random_string}
    input text      ${partner_address_Line2}     Address_${generate_newaddress_two}
    Press Keys  ${partner_address_Line2}            ENTER
    log to console      ${generate_newaddress_two}
    set global variable    ${generate_newaddress_two}

Select State
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible   ${partner_state}   60
    wait until element is enabled   ${partner_state}   60
    click element   ${partner_state}
    clear element text      ${partner_state}
    Generic.Select parameter    ${address}

Select City
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible   ${partner_city}   60
    wait until element is enabled   ${partner_city}   60
    click element   ${partner_city}
    clear element text      ${partner_city}
    Generic.Select parameter    ${address}


Zip code Input
    [Arguments]     ${code}
    wait until element is visible      ${zip_code}   60
    wait until element is enabled     ${zip_code}   60
    click element    ${zip_code}
    input text  ${zip_code}    ${code}

Save new Address
    wait until element is visible       ${save_address}     60
    wait until element is enabled       ${save_address}     60
    click element       ${save_address}
    wait until element is not visible       ${loaderIcon}    60
    sleep   ${search_sleep}

Click on Add new Address of partner
    [Arguments]     ${option}
    Generic.select parameter    ${option}

Click on Add new Contact of partner
    [Arguments]     ${option}
    Generic.select parameter    ${option}

Click on three dots of partners listing
    wait until element is visible   ${three_dots}   60
    click element   ${three_dots}

Select option from three dots of partner
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

#option: Edit, Deactivate, Activate, Remove

click on plus icon to add another business_url
    wait until element is visible       css:.fas.fa-plus        60
    click element       css:.fas.fa-plus

Add second business_url
    [Arguments]    ${name}
    wait until element is visible       ${secondary_contactURL}     60
    wait until element is enabled       ${secondary_contactURL}     60
    click element   ${secondary_contactURL}
    clear element text    ${secondary_contactURL}
    ${generate_SecondaryContactBusinessURL}=   Catenate    ${name}.com
    input text   ${secondary_contactURL}   ${name}.com
    log to console    secondary business URL: ${name}.com
    set global variable     ${generate_SecondaryContactBusinessURL}

Select country
    [Arguments]    ${name}
    wait until element is visible       ${contactP_country}       60
    wait until element is enabled       ${contactP_country}       60
    click element   ${contactP_country}
    input text      ${contactP_country}        ${name}
    Press Keys      ${contactP_country}       ENTER

Add new address_two of partner
    wait until element is visible     ${partner_newaddress_Line2}         60
    wait until element is enabled     ${partner_newaddress_Line2}         60
    click element      ${partner_newaddress_Line2}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_two}=    Catenate    ${random_string}
    input text      ${partner_newaddress_Line2}     Address_${generate_newaddress_two}
    Press Keys  ${partner_newaddress_Line2}            ENTER
    log to console      ${generate_newaddress_two}
    set global variable    ${generate_newaddress_two}

Add new zip code of partner
    [Arguments]     ${code}
    wait until element is visible      ${new_zipcode}    60
    wait until element is enabled      ${new_zipcode}    60
    clear element text      ${new_zipcode}
    click element    ${new_zipcode}
    input text   ${new_zipcode}    ${code}


click on edit icon
    wait until element is not visible       ${loaderIcon}       60
    sleep       ${search_sleep}
    wait until element is visible   ${partner_edit_icon}   60
    wait until element is enabled   ${partner_edit_icon}   60
    click element       ${partner_edit_icon}

Click on cross-icon for clearing text
    wait until element is visible    ${clear_text}   60
    wait until element is enabled    ${clear_text}   60
    click element       ${clear_text}

Update the partner information
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible       ${update_button}        60
    wait until element is enabled      ${update_button}        60
    click element       ${update_button}
    sleep   ${search_sleep}

Enter new_business_email of contact
    [Arguments]    ${Pname}    ${Bname}
    wait until element is visible       ${new_contactEmail}     60
    wait until element is enabled       ${new_contactEmail}     60
    click element   ${new_contactEmail}
    clear element text    ${new_contactEmail}
    input text   ${new_contactEmail}   ${Pname}@${Bname}.net
    ${generate_ContactBusinessEmail}=    Catenate    ${Pname}@${Bname}.net
    log to console  ${Pname}@${Bname}.net
    set global variable    ${generate_ContactBusinessEmail}

Select option from the pop up
    [Arguments]    ${option}
    Generic.click on the button         ${option}

Click on the save button
    [Arguments]     ${option}
    Generic.click on the button         ${option}

Click here to add link of contract details
    wait until element is visible   (//a[normalize-space()='Click here to add'])[2]        60
    wait until element is enabled      (//a[normalize-space()='Click here to add'])[2]       60
    click element   (//a[normalize-space()='Click here to add'])[2]

Enter contact business email via link
    [Arguments]    ${Pname}
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   css:#businessEmail        60
    wait until element is enabled      css:#businessEmail       60
    click element   css:#businessEmail
    ${generate_ContactBusinessEmailvialink}=    Catenate    ${Pname}@yopmail.net
    input text   css:#businessEmail  ${generate_ContactBusinessEmailvialink}
    log to console  ${generate_ContactBusinessEmailvialink}
    set global variable    ${generate_ContactBusinessEmailvialink}

Enter random contact person via link
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible      css:#contactName     60
    wait until element is enabled      css:#contactName       60
    click element   css:#contactName
    ${random_string} =    Generate Random String       6      [NUMBERS]
    ${generate_contactPersonName}=    Catenate    Person_${random_string}
    input text   css:#contactName   ${generate_contactPersonName}
    log to console  ${generate_contactPersonName}
    set global variable      ${generate_contactPersonName}
    Press Keys  css:#contactName    ENTER

Enter contact location via link
    [Arguments]    ${loc}
    wait until element is visible       css:#forLcoations     60
    wait until element is enabled       css:#forLcoations     60
    click element   css:#forLcoations
    input text  css:#forLcoations   ${loc}
    Press Keys     css:#forLcoations       ENTER

Click on save button of contact via link
    [Arguments]     ${button}
    wait until element is visible   //div[@id='contactModalContract']//button[normalize-space()='${button}']      60
    click element   //div[@id='contactModalContract']//button[normalize-space()='${button}']

Enter and select contact name via link
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   css:#contName   60
    click element   css:#contName
    input text  css:#contName       ${generate_contactPersonName}
    Press Keys  css:#contName   ENTER

Click on back to contracts link via contract
    wait until element is visible   css:.back.theme-blue    60
    click element   css:.back.theme-blue

Verify status after withdraw the contract
    [Arguments]    ${option}
    wait until element is visible   //td[normalize-space()='${option}']      60
# options: active, inactive, pending

Click on the three buttons link of contract via view smart details
    [Arguments]     ${option}
    wait until element is visible   //b[normalize-space()='${option}:']/../../..//a[@class='back pointer ng-star-inserted'][normalize-space()='1']      60
    click element   //b[normalize-space()='${option}:']/../../..//a[@class='back pointer ng-star-inserted'][normalize-space()='1']


Click on back to contract details button link
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   css:.back.pointer.font-weight-bold    60
    click element   css:.back.pointer.font-weight-bold

Download the contract pdf
    wait until element is not visible   ${loaderIcon}   60
    wait until element is visible   //i[@title='Download PDF Version']      60
    click element   //i[@title='Download PDF Version']

Verify pages with the element
    [Arguments]    ${option}
    wait until element is visible   //th[normalize-space()='${option}']     60
# option: Yes, No