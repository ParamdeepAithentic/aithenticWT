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
#    wait until element is visible   ${Create_new_contact_button}      60
    Wait Until Element Is Enabled   ${Create_new_contact_button}        60
    click element       ${Create_new_contact_button}
    sleep       2

Select type of contract
    [Arguments]    ${option}
    wait until element is visible       (//button[contains(text(),'${option}')])[1]     60
    click element   (//button[contains(text(),'${option}')])[1]
    wait until element is visible       ${contactType}   60


Enter contract type
    [Arguments]    ${option}
    Wait Until Element Is Not Visible       ${dd_loader}    60
    Wait Until Element Is Enabled      ${contactType}   60
    click element       ${contactType}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${contactType}      ${option}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   ContractPage - Enter contract type      3    ${pageTime}     ${ActualTime}    ContractPage_Time


Enter contract with
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${pdf_modal}    60
    Wait Until Element Is Enabled      ${pdf_modal}     60
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
    Wait Until Element Is Visible       ${pleaseWaitValidation}    60
    Wait Until Element Is Not Visible       ${pleaseWaitValidation}    60
    click element       ${Contract_brand}
    Clear Element Text      ${Contract_brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${Contract_brand}      ${option}
#    sleep       2
    Press Keys      ${Contract_brand}      ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   ContractPage - Enter contract brand      5    ${pageTime}     ${ActualTime}    ContractPage_Time



Enter contract location
    [Arguments]    ${option}
    Wait Until Element Is Enabled     ${location}       60
    click element       ${location}
    Clear Element Text      ${location}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${location}      ${option}
#    sleep       2
    Press Keys      ${location}      ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   ContractPage - Enter contract location      6    ${pageTime}     ${ActualTime}    ContractPage_Time



Enter contract permission
    [Arguments]    ${option}
#    Wait Until Element Is Visible       ${pleaseWaitValidation}    60
    Wait Until Element Is Not Visible       ${pleaseWaitValidation}    60
#    Wait Until Element Is Enabled     ${contactPermission}      60
    click element       ${contactPermission}
    input text  ${contactPermission}     ${option}
    Generic.Select parameter    ${option}

Select contract start date
    Generic.Enter current date      ${startDate}
    Press Keys      ${location}      ENTER

Select contract end date
    [Arguments]    ${date}
    Wait Until Element Is Visible       ${endDate}
    Generic.Enter self date     ${endDate}       ${date}
    Press Keys      ${location}      ENTER

Select contract function
    [Arguments]    ${option}
    wait until element is visible    ${contractFunction}      60
    wait until element is visible   css:ng-select[placeholder='Select Contract Function'] span[title='Clear all']     60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element       css:ng-select[placeholder='Select Contract Function'] span[title='Clear all']
    click element       ${contractFunction}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   ContractPage - Select contract function      7    ${pageTime}     ${ActualTime}    ContractPage_Time


Click preview selection button on contact
     wait until element is visible    ${previewSelectionButton}      60
     click element      ${previewSelectionButton}
     wait until element is visible       ${loaderIcon}       60
     Wait Until Element Is Not Visible    ${loaderIcon}      60

Enter contract description comment
     [Arguments]    ${option}
     Wait Until Element Is Enabled       ${contractDescription}    60
     click element       ${contractDescription}
     input text  ${contractDescription}     ${option}


Enter contract name
    [Arguments]    ${option}
     Wait Until Element Is Visible       ${contractName}    60
     click element       ${contractName}
     input text  ${contractName}     ${option}
     Press Keys      ${contractName}      ENTER


Select the checkboxes
    Wait Until Element Is Enabled       ${chkBoxOne}    60
    click element   ${chkBoxOne}
    Wait Until Element Is Enabled       ${chkBoxTwo}    60
    click element   ${chkBoxTwo}

Save create contract button
    Wait Until Element Is Enabled       ${click_createContract_btn}    60
    click element       ${click_createContract_btn}


Save contract modal
    [Arguments]     ${option}
    Wait Until Element Is Visible       ${save_contract_modal}      60
    Wait Until Element Is Enabled       //div[@id='createOrGenerateContract']//div//div//div//div//button[contains(text(),'${option}')]     60
    click element       //div[@id='createOrGenerateContract']//div//div//div//div//button[contains(text(),'${option}')]
#    Wait Until Element Is Not Visible    ${loaderIcon}      60

Fetch the contract ID from the row
    wait until element is visible       css:.pr-4     60
    ${fetch_contract_ID} =    get text    css:.pr-4
    set global variable    ${fetch_contract_ID}
    log to console    Contract_ID= ${fetch_contract_ID}

Fetch the contract Brand Name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_contract_brandName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_contract_brandName}
    log to console     Contract_BrandName=${fetch_contract_brandName}

Search by contract BrandName
    [Arguments]    ${BrandName}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     wait until element is visible      ${contractID_SearchBar}     60
     click element      ${contractID_SearchBar}
     Clear Element Text      ${contractID_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${contractID_SearchBar}   ${BrandName}
     #    Generic.Enter value into field      ${asset_SearchBar}     ${BrandName}
     wait until element is visible       ${loaderIcon}       60
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the contract Brand Name from the row   ${BrandName}
     should be equal    ${fetch_Contract_BrandName}     ${BrandName}
     ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   ContractPage - Search by contract BrandName      8    ${pageTime}     ${ActualTime}    ContractPage_Time



#     //td[normalize-space()='BusinessName26100']

Click on the first tab row
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible    css:.table-row.text-left.ng-star-inserted td        60
    sleep    1
    click element    css:.table-row.text-left.ng-star-inserted td

Verify technology is null
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       //span[normalize-space()='-']       60

Save the contract details
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    wait until element is visible    //button[@data-target="#${option}Contract"]        60
    click element    //button[@data-target="#${option}Contract"]

#//button[@data-target="#AcceptContract"]
#//button[@data-target="#declineContract"]


Select the contract form pop up checkboxes
    wait until element is visible    css:form[class='ng-untouched ng-pristine ng-invalid ng-star-inserted']     60
    wait until element is visible    css:label[for='authorize']     60
    wait until element is visible    css:label[for='acknowledged']      60
    click element    css:label[for='authorize']
    click element    css:label[for='acknowledged']

#label[for='authorize']
#label[for='acknowledged']
Save the contract pop up details
#    [Arguments]     ${option}
    wait until element is visible    css:#accept-contract-detail      60
    click element    css:#accept-contract-detail