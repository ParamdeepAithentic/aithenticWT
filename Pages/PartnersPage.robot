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

*** Variables ***
${add_Partner}     css:a[title='Add New Partner']
${partner_export_btn}     //a[@id='dropdownMenuButton']
${click_Partner}     css:ng-select[placeholder='Select Partner Type'] div[role='combobox']
${click_businessName}     css:ng-select[placeholder='Select or Search a Business Name'] input[type='text']
${businessName}     css:div[aria-expanded='true'] input[type='text']
${businessURL}     css:#businessUrl
${click_Country}     css:#country
${addContact}     //span[normalize-space()='Add new Contact']
${contactPerson}     css:[formcontrolname=CompanyContactId] input
${contactEmail}     css:#ContactEmail
#${secondary_contactPerson}     css:[formcontrolname=CompanyContactId] input
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




${partner_searchBar}    css:input[placeholder='Search by Business Name']


${loaderIcon}     //div[@role='status']


*** Keywords ***

Search by business name
    [Arguments]    ${BusinessName}
    wait until element is visible       ${partner_searchBar}       60
    Clear Element Text      ${partner_searchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${partner_searchBar}     ${BusinessName}
    sleep       1
#    Wait Until Element Contains    ${fetch_assetID}     ${generate_BusinessName}    60
    wait until element is visible       //td[normalize-space()='${BusinessName}']     60
    ${get_businessName} =    get text    //td[normalize-space()='${BusinessName}']
#    log to console     ${generate_BusinessName}
    log to console     ${get_businessName}
    should be equal    ${BusinessName}     ${get_businessName}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   PartnersPage - Search by business name      3    ${pageTime}     ${ActualTime}    PatnersPage_Time




Select partner type
    [Arguments]    ${option}
     wait until element is visible      //span[normalize-space()='${option}']//div       60
     wait until element is enabled       //span[normalize-space()='${option}']//div       60
     click element      //span[normalize-space()='${option}']//div


Click new partner button
    wait until element is visible       ${add_Partner}        60
    click element     ${add_Partner}

Select partner type of new partner
    [Arguments]    ${partner}
    wait until element is enabled       ${click_Partner}        60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element   ${click_Partner}
    Select partner type     ${partner}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   PartnersPage - Select partner type of new partner      4    ${pageTime}     ${ActualTime}    PatnersPage_Time


Create partner random business name
    wait until element is enabled       ${click_businessName}        60
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generate_BusinessName}=    Catenate    BusinessName${random_string}
    input text   ${businessName}   ${generate_BusinessName}
    set global variable    ${generate_BusinessName}

Create partner self business name
    [Arguments]    ${option}
    wait until element is enabled       ${click_businessName}        60
    click element   ${click_businessName}
    Clear element text      ${click_businessName}
    input text   ${businessName}   ${option}

Enter partner business URL
    [Arguments]    ${option}
    wait until element is enabled       ${businessURL}        60
    click element   ${businessURL}
    Clear element text      ${businessURL}
    input text   ${businessURL}   ${option}.net

Select partner country
    [Arguments]    ${country}
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
    wait until element is enabled   ${addContact}
    click element   ${addContact}
#    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Enter random contact person
    wait until element is visible      ${contactPerson}       60
    click element   ${contactPerson}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generate_PersonName}=    Catenate    Person_${random_string}
    input text   ${contactPerson}   ${generate_PersonName}
    wait until element is visible      css:div[role='option']       60
    click element   css:div[role='option']
    set global variable    ${generate_PersonName}

Enter self contact person
    [Arguments]    ${option}
    wait until element is visible      ${contactEmail}       60
    click element   ${contactPerson}
    input text   ${contactPerson}   ${option}
    wait until element is visible      css:div[role='option']       60
    click element   css:div[role='option']

Enter contact business email
    [Arguments]    ${Pname}    ${Bname}
    click element   ${contactEmail}
    clear element text    ${contactEmail}
    input text   ${contactEmail}   ${Pname}@${Bname}.net
    log to console  ${Pname}@${Bname}.net

Enter secondary contact business email
    [Arguments]    ${Pname}    ${email}
    click element   ${secondary_contactEmail}
    clear element text    ${secondary_contactEmail}
    input text   ${secondary_contactEmail}   ${Pname}@${email}.net
    log to console    secondary business email: ${Pname}@${email}.net

Choose contact country
    [Arguments]    ${country}   ${code}     ${phoneNo}
    click element   ${click_countryTag}
    wait until element is visible   ${contact_Country_search}
    click element   ${contact_Country_search}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text  ${contact_Country_search}   ${country}
    Generic.Select parameter      ${code}
    input text     ${phone}     ${phoneNo}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   PartnersPage - Choose contact country      6    ${pageTime}     ${ActualTime}    PatnersPage_Time


Enter contact location
    [Arguments]    ${loc}
    click element   ${location}
    clear element text    ${location}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text  ${location}   ${loc}
    Press Keys     ${location}       ENTER
#    Generic.Select parameter        ${select_loc}   #United States - Main Office - 21 - 2
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   PartnersPage - Enter contact location      7    ${pageTime}     ${ActualTime}    PatnersPage_Time


Save the new contact
    wait until element is enabled   ${save_addNewContact}
    click element   ${save_addNewContact}
#    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Save the secondary contact
    wait until element is enabled   ${save_secondaryNewContact}
    click element   ${save_secondaryNewContact}
#    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Click contact main save button
    wait until element is visible      ${main_Save}       60
    click element   ${main_Save}
#    wait until element is visible      ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60


Click first row of table
    wait until element is visible      css:td:nth-child(1)        60
    wait until element is enabled      css:td:nth-child(1)        60
    click element   css:td:nth-child(1)


Click on edit button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //button[normalize-space()='Edit']        60
    click element   //button[normalize-space()='Edit']

Click on add custome business URL icon
    wait until element is visible      ${add_custom_businessURL}        60
    click element   ${add_custom_businessURL}



Create partner random secondary business URL
    wait until element is enabled       ${add_secondaryURL}        60
    click element   ${add_secondaryURL}
    Clear element text      ${add_secondaryURL}
    ${random_string} =    Generate Random String       8      [NUMBERS]
    ${generate_SecondaryBusinessName}=    Catenate    BusinessName${random_string}.net
    input text   ${add_secondaryURL}   ${generate_SecondaryBusinessName}
    set global variable    ${generate_SecondaryBusinessName}

Click on update button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      ${main_update_btn}        60
    click element   ${main_update_btn}

Save the new added contact
    wait until element is enabled   //form[@class='ng-untouched ng-dirty ng-valid']//button[@type='button'][normalize-space()='Add']
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
    sleep       1
    click element   css:.btn.button-green.m-2


Download the selected extension file
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //a[contains(text(),'${option}')]       60
    click element   //a[contains(text(),'${option}')]

Verify that the selected extension file is downloaded
    [Arguments]    ${option}
#    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible      //span[contains(text(),'${option}')]       60
    click element   css:.fa-file-download
    sleep       3

Remove the file from downloaded list
#    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       css:.fas.fa-times.dropDownProgressBar       60
    click element       css:.fas.fa-times.dropDownProgressBar

Select the partner row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']       60
    click element       //td[normalize-space()='${option}']

