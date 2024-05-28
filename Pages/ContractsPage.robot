*** Settings ***
Documentation   Contains all keyword of Contract page
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
Resource        ../Pages/LoginPage.robot
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

*** Variables ***

${Create_new_contact_button}     css:a[data-toggle='modal']
${contactType}     css:#contractType   #click
${companyId}     css:#CompanyId       #enter contract with
${dd_loader}    css:.ng-spinner-loader.ng-star-inserted   #wait till hide
${Contract_brand}     css:#brand
${selectOption}     css:.ng-option-label.ng-star-inserted
${location}     css:#locations      #add location
${contactPermission}     css:#contractPermissions        #click contact permission
${startDate}     css:#startDate      #start date    take from genric file
${endDate}     css:#endDate        #end date    put self input 12/12/2028
${contractFunction}     css:#contractFunction
${previewSelectionButton}     //button[normalize-space()='Preview Selection']
${loaderIcon}     //div[@role='status']

${pdf_modal}     css:object[type='application/pdf']
${pleaseWaitValidation}     css:span[class='invalidInput']

${contractDescription}     css:#ContractDescription
${contractName}     css:#contName
${chkBoxOne}     //label[contains(text(),"I'm authorized")]
${chkBoxTwo}     //label[contains(text(),'I have read and acknowledged')]

${click_createContract_btn}     //button[normalize-space()='Create Contract']
${save_contract_modal}     css:div[id='createOrGenerateContract'] div div div div


${contractID_SearchBar}      css:#searchInput
${fetch_Contract_BrandName}     css:tbody tr:nth-child(1) td:nth-child(2)



*** Keywords ***

Click on create new contract button
    Wait Until Element Is Enabled   ${Create_new_contact_button}        ${wait_time}
    click element       ${Create_new_contact_button}
    sleep       2

Select type of contract
    [Arguments]    ${option}
    wait until element is visible       (//button[contains(text(),'${option}')])[1]     ${wait_time}
    wait until element is enabled       (//button[contains(text(),'${option}')])[1]     ${wait_time}
    click element   (//button[contains(text(),'${option}')])[1]
    wait until element is visible       ${contactType}   ${wait_time}


Enter contract type
    [Arguments]    ${option}
    Wait Until Element Is Not Visible       ${dd_loader}    ${wait_time}
    Wait Until Element Is Enabled      ${contactType}   ${wait_time}
    click element       ${contactType}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${contactType}      ${option}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   ContractPage - Enter contract type      3    ${pageTime}     ${ActualTime}    ContractPage_Time


Enter contract with
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${pdf_modal}    ${wait_time}
    Wait Until Element Is Enabled      ${pdf_modal}     ${wait_time}
    click element       ${companyId}
    Clear Element Text      ${companyId}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${companyId}      ${option}
    sleep       1
    Press Keys     ${companyId}       ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   ContractPage - Enter contract with      4    ${pageTime}     ${ActualTime}    ContractPage_Time



Enter contract brand
    [Arguments]    ${option}
    Wait Until Element Is Not Visible       ${pleaseWaitValidation}    ${wait_time}
    click element       ${Contract_brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${Contract_brand}      ${option}
    Wait Until Element Is Visible       //ng-select[@labelforid='brand']//ng-dropdown-panel//span[normalize-space()='${option}']    ${wait_time}
    Wait Until Element Is enabled       //ng-select[@labelforid='brand']//ng-dropdown-panel//span[normalize-space()='${option}']    ${wait_time}
    click element       //ng-select[@labelforid='brand']//ng-dropdown-panel//span[normalize-space()='${option}']
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   ContractPage - Enter contract brand      5    ${pageTime}     ${ActualTime}    ContractPage_Time



Enter contract location
    [Arguments]    ${option}
    Wait Until Element Is Enabled     ${location}       ${wait_time}
    click element       ${location}
    Clear Element Text      ${location}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${location}      ${option}
    Press Keys      ${location}      ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   ContractPage - Enter contract location      6    ${pageTime}     ${ActualTime}    ContractPage_Time

Enter contract permission
    [Arguments]    ${option}
    Wait Until Element Is Not Visible       ${pleaseWaitValidation}    ${wait_time}
    click element       ${contactPermission}
    input text  ${contactPermission}     ${option}
    Generic.Select parameter    ${option}

Select contract start date
    Generic.Enter current date      ${startDate}
    Press Keys      ${location}      ENTER

Select contract end date
    [Arguments]    ${date}
    Wait Until Element Is Visible       ${endDate}      ${wait_time}
    Generic.Enter self date     ${endDate}       ${date}
    Press Keys      ${location}      ENTER

Select contract function
    [Arguments]    ${option}
    wait until element is visible    ${contractFunction}      ${wait_time}
    wait until element is visible   css:ng-select[placeholder='Select Contract Function'] span[title='Clear all']     ${wait_time}
    wait until element is enabled   css:ng-select[placeholder='Select Contract Function'] span[title='Clear all']     ${wait_time}
    ${StartTime1} =     Get Current Time in Milliseconds
    click element       css:ng-select[placeholder='Select Contract Function'] span[title='Clear all']
    click element       ${contractFunction}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   ContractPage - Select contract function      7    ${pageTime}     ${ActualTime}    ContractPage_Time


Click on generate contract button on select asset page
    [Arguments]    ${option}
    Generic.click on the button link        ${option}

Wait until PDF is loaded properly
    wait until element is visible    ${pdf_modal}      ${wait_time}

Click preview selection button on contact
     wait until element is visible    ${previewSelectionButton}      ${wait_time}
     wait until element is enabled    ${previewSelectionButton}      ${wait_time}
     click element      ${previewSelectionButton}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Enter contract description comment
     [Arguments]    ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Wait Until Element Is Enabled       ${contractDescription}    ${wait_time}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     click element       ${contractDescription}
     input text  ${contractDescription}     ${option}


Enter contract name
    [Arguments]    ${option}
     Wait Until Element Is Visible       ${contractName}    ${wait_time}
     Wait Until Element Is enabled       ${contractName}    ${wait_time}
     click element       ${contractName}
     input text  ${contractName}     ${option}
     Press Keys      ${contractName}      ENTER


Select the checkboxes
    Wait Until Element Is Enabled       ${chkBoxOne}    ${wait_time}
    click element   ${chkBoxOne}
    Wait Until Element Is Enabled       ${chkBoxTwo}    ${wait_time}
    click element   ${chkBoxTwo}

Save create contract button
    Wait Until Element Is Enabled       ${click_createContract_btn}    ${wait_time}
    click element       ${click_createContract_btn}


Save contract modal
    [Arguments]     ${option}
    Wait Until Element Is Visible       ${save_contract_modal}      ${wait_time}
    Wait Until Element Is Enabled       //div[@id='createOrGenerateContract']//div//div//div//div//button[contains(text(),'${option}')]     ${wait_time}
    click element       //div[@id='createOrGenerateContract']//div//div//div//div//button[contains(text(),'${option}')]


Fetch the contract ID from the row
    wait until element is visible       css:.pr-4     ${wait_time}
    ${fetch_contract_ID} =    get text    css:.pr-4
    set global variable    ${fetch_contract_ID}
    log to console    Contract_ID= ${fetch_contract_ID}

Fetch the contract Brand Name from the row
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_contract_brandName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_contract_brandName}
    log to console     Contract_BrandName=${fetch_contract_brandName}

Search by contract BrandName
    [Arguments]    ${BrandName}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     wait until element is visible      ${contractID_SearchBar}     ${wait_time}
     wait until element is enabled      ${contractID_SearchBar}     ${wait_time}
     click element      ${contractID_SearchBar}
     Clear Element Text      ${contractID_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${contractID_SearchBar}   ${BrandName}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the contract Brand Name from the row   ${BrandName}
     should be equal    ${fetch_Contract_BrandName}     ${BrandName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  8  ${pageHeading}   ContractPage - Search by contract BrandName      8    ${pageTime}     ${ActualTime}    ContractPage_Time

Click on the first tab row of contract list page table
    [Arguments]
    sleep   ${yop_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //tbody//tr//td[normalize-space()='View']        ${wait_time}
    wait until element is enabled    //tbody//tr//td[normalize-space()='View']        ${wait_time}
    click element    //tbody//tr//td[normalize-space()='View']

Click on the first tab row
    [Arguments]     ${option}
    sleep   ${yop_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //td[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled    //td[normalize-space()='${option}']        ${wait_time}
    click element    //td[normalize-space()='${option}']


Verify technology is null
    Wait Until Element Is Visible       ${pdf_modal}    ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //span[normalize-space()='-']       ${wait_time}

Save the contract details
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    wait until element is visible    //button[@data-target="#${option}Contract"]        ${wait_time}
    wait until element is enabled    //button[@data-target="#${option}Contract"]        ${wait_time}
    click element    //button[@data-target="#${option}Contract"]

Select the contract form pop up checkboxes
    wait until element is visible    css:form[class='ng-untouched ng-pristine ng-invalid ng-star-inserted']     ${wait_time}
    wait until element is visible    css:label[for='authorize']     ${wait_time}
    wait until element is visible    css:label[for='acknowledged']      ${wait_time}
    wait until element is enabled    css:label[for='acknowledged']      ${wait_time}
    click element    css:label[for='authorize']
    click element    css:label[for='acknowledged']

Save the contract pop up details
    wait until element is visible    css:#accept-contract-detail      ${wait_time}
    wait until element is enabled    css:#accept-contract-detail      ${wait_time}
    click element    css:#accept-contract-detail

Click on add new contact for this partner link under contract
    wait until element is visible   //span[normalize-space()='Add new Contact for this Partner']    ${wait_time}
    wait until element is enabled   //span[normalize-space()='Add new Contact for this Partner']    ${wait_time}
    click element   //span[normalize-space()='Add new Contact for this Partner']

Click on back to contract link
    wait until element is not visible    ${loaderIcon}  ${wait_time}
    wait until element is visible   //span[@class='back']   ${wait_time}
    wait until element is enabled   //span[@class='back']   ${wait_time}
    click element   //span[@class='back']
    wait until element is not visible    ${loaderIcon}  ${wait_time}