*** Settings ***
Documentation   Contains all keyword of Technology page
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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot

*** Variables ***

########################## technology form #####################
${assetTableLoader}     //div[@class='spinner-border text-loader']
${AddTechnologyButton}      //a[@class='btn button-cyan mt-0 mx-1 ng-star-inserted'][normalize-space()='Add Technology']

#############Product Information##################
${brand}       css:#brandselect
${product}      css:#selectProductName
${select_product}       //*[contains(text(), 'QASubscription')]


##############Technology Group Information for Hardware#################
${mac_addess}        css:#DYNA_14
${host_name}      css:#DYNA_24
${serial_number}      css:#DYNA_21


##############Technology Group Information for License#################
${product_version}        css:#DYNA_15
${product_edition}      css:#DYNA_32
${enter_hosted}      css:#DYNA_33
${enter_id_key}      css:#DYNA_34

##############Technology Group Information for Maintenance#################
${Contract_startDate}        css:#DYNA_7
${Contract_endDate}        css:#DYNA_17


######################Contract information################
${contract_id}     css:#TECHDYNA_3
${chargeable_basis}     //input[@id='Chargeable basis']      #User, CPU
${cost_each}     css:#TECHDYNA_7
${max_contracted}     css:#TECHDYNA_8

###############Technology Lifecycle Information################
${asset_id}     css:#AssetId
${purchase_date}      css:#PurchaseDt
${renewal_date}      css:#RenewalDate
${next_month}      //span[contains(text(),'›')]
${select_date}      //span[normalize-space()='18']
${warranty_enddt}      css:#WarrantyEndDt
${LifeCycleStatusId}     //input[@id='LifeCycleStatusId']
${status}       //span[@class='ng-option-label ng-star-inserted'][normalize-space()='Active']
${comment}      css:#Comment


###############Technology Cost Information#################
${purchase_order}      css:#PurchaseOrderNo
${paymentPartner}      css:#paymentPartner
${costType}      css:#costType
${paymentType}      css:#paymentType
${paymentPeroid}      css:#paymentPeriod
${first_paymentdate}      css:#FirstPaymentDate
${budget_payment}      css:input[placeholder='Budget Payment']
${actual_payment}      css:input[placeholder='Actual Payment']
${expenseType}      css:#ExpenseType


##############Assignment Information###############
${locationName}      css:#locationName
${departmentName}      css:#departmentName
${assignTo}      css:#assignTO


#################Partners Information###############
${supportPartner}      css:#supportPartner
${supplierPartner}      css:#supplierPartner
${select_supplierPartner}      (//div[@role='option'])[2]
${saveBTN}      css:button[class='btn button-green mt-0 mx-2']

######################### Do you need another asset################
${savePOPup}      //div[@class='modal-content ng-star-inserted']//div[@class='modal-body']
${iamDone_BTN}      //button[text()="I'm Done,Save "]
${Yes_BTN}      //span[contains(text(),'Yes')]

####################### search asset id #####################
${asset_SearchBar}      css:input[placeholder='Search by Brand, Product, Asset ID, Serial number, Software version or Assignee']
#${asset_SearchBar}      //input[@placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']
${search_loader}     css:div[role='status']
${fetch_assetID}     //td[@class='technology-asset-width pr-4']//a
${fetch_productID}      css:tbody tr:nth-child(1) td:nth-child(4)
${fetch_serialNo}       //tbody/tr
#${fetch_brandName}     css:tbody tr:nth-child(1) td:nth-child(3)
${fetch_assignee}      css:tbody tr:nth-child(1) td:nth-child(10)


${selectOption}     //div[@role='option']
${data_table}       css:.table-scrollable.mt-1.overflow-auto.table-column-common



################### Restore asset from remove asset ########
${technology_threeDot}      css:.btn.dropdown-toggle.pointer
${removePopUp}     css:.text-center.ng-star-inserted
${select_remove_popUp_No}     //button[normalize-space()='No']
${select_remove_popUp_Yes}     //button[normalize-space()='Yes']
${removedTechnology_threeDot}     css:.btn.dropdown-toggle.pointer
#${removedTechnology_chkBox}     css:.checkmark
${removedTechnology_chkBox}     //span[@class='checkmark']
${restore_BTN}     css:.qa-restore-assets
${restore_asset_chkbox}     //span[@class='checkmark']

${loaderIcon}     //div[@role='status']

${alertMsg}     css:.text-white.font-weight-bold.position-relative.py-3.pl-3.pr-4
${back_To_List_Link}     css:span[class='back']

${editIcon}     css:i[title='Click here edit product and brand']

#################### Compose message##############################
${composeMessage_status}     css:#messageStatus
${composeMessage_subject}     css:#ClientMessageSubject
${composeMessage_Details}       //div[@for='messageBody']//textarea[@id='ClientMessageDetail']
${composeMessage_sendBTN}       //div[@class='modal-footer']//button[@type='submit'][normalize-space()='Send']


############################ Add department ##########################
${add_tech_dept_name}        css:.qa-add-department-name input
${add_tech_dept_costCenter}      css:#costCenter

############################### History tab ###########################
${histortTab_ViewPopUp}     //div[@class='text-right']//button[normalize-space()='Cancel']
${attachmentTab_UploadBTN}      css:input[type='file']

${technology_address_Lineone}       css:#strretAddress1
${technology_address_Linetwo}       css:#strretAddress2
${zip}     css:#zip
${technology_employeeid}        css:#AssignedEmployeeId
${businessEmail}        css:#AssignedEmail

#${view_icon_file}       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]
#${download_icon_file}   //p[contains(text(),'.jpg')]//parent::div//i[contains(@class,"open-image-download-QA")]

*** Keywords ***
Fetch the Brand Name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    wait until element is enabled        //td[normalize-space()='${option}']     60
    ${get_fetch_brandName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${get_fetch_brandName}
    log to console     ${get_fetch_brandName}



Click on first table row checkbox and restore
    wait until element is visible       ${restore_asset_chkbox}     60
    wait until element is enabled       ${restore_asset_chkbox}     60
    click element   ${restore_asset_chkbox}
    click element   ${restore_BTN}
#    wait until element is visible       ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60


Create random unique serial number
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_serialNo}=    Catenate    serial_${random_string}
    wait until element is visible       ${serial_number}    60
    input text   ${serial_number}   ${generated_serialNo}
    set global variable    ${generated_serialNo}

Create self unique serial number
    [Arguments]    ${option}
    wait until element is visible       ${serial_number}    60
    input text   ${serial_number}    ${option}


Select and restore asset
    wait until element is visible       ${fetch_assetID}        60
    wait until element is enabled       ${fetch_assetID}        60
    wait until element is visible   ${removedTechnology_chkBox}     60
    wait until element is enabled   ${removedTechnology_chkBox}     60
    sleep   3
   Wait Until Element Is not Visible  xpath=//div[@class='fade-shadow']  60s
    click element   ${removedTechnology_chkBox}
#    Wait Until Element Is Enabled      ${restore_BTN}       60
#    click element   ${restore_BTN}
#    wait until element is visible       ${loaderIcon}       60
#    Wait Until Element Is Not Visible    ${loaderIcon}      60


Select any asset to view assert details page
    [Arguments]    ${option}
    Wait Until Element is visible    ${fetch_assetID}       60
    wait until element is enabled    ${fetch_assetID}       60
    click element       ${fetch_assetID}
    wait until element is visible       ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible    //button[normalize-space()='${option}']    60       #Restore, Edit, Remove, Clone, Disposal
    click element   //button[normalize-space()='${option}']
    sleep       2
    click element       ${back_To_List_Link}

Click on three dots of action button
    Wait Until Element Is visible      ${removedTechnology_threeDot}       60
    Wait Until Element Is Enabled      ${removedTechnology_threeDot}       60
    click element      ${removedTechnology_threeDot}

Select an option from recovery table actions
    [Arguments]    ${Option}
    wait until element is visible       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']        60
    wait until element is enabled       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']        60
    click element       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']
     #Restore, Details
#    wait until element is visible       ${loaderIcon}       60
    Wait Until Element Is Not Visible    ${loaderIcon}      60


Select an option from technology table actions
    [Arguments]    ${Option}
     sleep      ${search_sleep}
     Wait Until Element Is visible      ${technology_threeDot}       60
     Wait Until Element Is Enabled      ${technology_threeDot}       60
     click element      ${technology_threeDot}
     sleep      ${search_sleep}
     wait until element is visible       //a[normalize-space()='${Option}']       60
     wait until element is enabled       //a[normalize-space()='${Option}']       60
     click element      //a[normalize-space()='${Option}']
#options: Details, Edit, Clone , Remove, Disposal

Click on manage technology sub option
    [Arguments]    ${option}
    click element      //span[normalize-space()='${option}']
#options: Technology List, Removed Assets

Inactive or Removed technology
    [Arguments]    ${assetId}
    wait until element is visible       ${asset_SearchBar}       60
    wait until element is enabled        ${asset_SearchBar}       60
    Clear Element Text      ${asset_SearchBar}
    input text      ${asset_SearchBar}     ${assetId}
    Wait Until Element is visible    ${fetch_assetID}       60
    Wait Until Element Is Enabled      ${removedTechnology_threeDot}       60
    click element      ${removedTechnology_threeDot}

Remove asset from technology table
     wait until element is visible      ${removePopUp}        60
     wait until element is enabled       ${removePopUp}        60
     Wait Until Element Is Enabled      ${select_remove_popUp_Yes}      60
     click element      ${select_remove_popUp_Yes}


Search and remove asset
    [Arguments]    ${option}
    wait until element is visible       ${asset_SearchBar}       60
    input text      ${asset_SearchBar}     ${option}
    Wait Until Element Contains    //td[normalize-space()='${option}']     ${option}    60
    ${get_assetID} =    get text    //td[normalize-space()='${option}']
    log to console     ${get_assetID}
    should be equal    ${get_assetID}     ${option}


click on add technology button
    Wait Until Element Is Not Visible    ${assetTableLoader}        60
    wait until element is visible    ${AddTechnologyButton}     60
    wait until element is enabled       ${AddTechnologyButton}     60
    click element    ${AddTechnologyButton}

Click technology brand input field
    wait until element is enabled       ${brand}        60
    click element    ${brand}

Select parameter from brand dropdown list
    [Arguments]    ${option}
    Clear Element Text      ${brand}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text    ${brand}   ${option}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   Technology Page - Select parameter from brand dropdown list      5    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Click technology product input field
     wait until element is visible       ${product}        60
     wait until element is enabled       ${product}        60
     click element    ${product}


Select the first value of To dropdown of product
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

Select parameter from technology dropdown list
    [Arguments]      ${option}
    ${StartTime1} =     Get Current Time in Milliseconds
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input      60
    wait until element is enabled   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input     60
    Clear Element Text    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input
    Input Text    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input    ${option}
    Wait Until Element Is Visible    //td[normalize-space()='${option}']        60
    Wait Until Element Is enabled    //td[normalize-space()='${option}']        60
    Click Element       //td[normalize-space()='${option}']
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   Technology Page - Select parameter from technology dropdown list      6    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Click on add product link
    wait until element is visible   css:.qa-product-add-assets      60
    wait until element is enabled   css:.qa-product-add-assets      60
    click element   css:.qa-product-add-assets

##############Technology Group Information for hardware#################
Add mac address for technology group information for hardware
    wait until element is visible       ${mac_addess}        60
    wait until element is enabled       ${mac_addess}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    MacAddress_${random_string}
    input text   ${mac_addess}   ${result}

Add host name for technology group information for hardware
    wait until element is visible       ${host_name}        60
    wait until element is enabled       ${host_name}        60
    input text   ${host_name}   125.66

#================================ CREATE SERIAL NUMBER ==========================
Create unique serial number random
    wait until element is visible       ${serial_number}        60
    wait until element is enabled       ${serial_number}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_SerialNumber}=    Catenate    SerialNumber_${random_string}
    input text   ${serial_number}   ${generated_SerialNumber}
    log to console      ${generated_SerialNumber}
    set global variable    ${generated_SerialNumber}

Create unique serial number self
    [Arguments]    ${option}
    wait until element is visible       ${serial_number}        60
    wait until element is enabled        ${serial_number}        60
    input text   ${serial_number}   ${option}


##############Technology Group Information for maintenance#################
Add technology group information contract start date
     Generic.Enter current date       ${Contract_startDate}

Add technology group information contract end date
    [Arguments]    ${date}
    Generic.Enter self date       ${Contract_endDate}     ${date}



##############Technology Group Information for subscription#################



###############Technology Group Information for License#################
Add random technology product version
    wait until element is visible       ${product_version}        60
    wait until element is enabled       ${product_version}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    productVersion_${random_string}
    input text   ${product_version}   ${result}

Add self technology product version
    [Arguments]    ${result}
    wait until element is visible       ${product_version}        60
    wait until element is enabled       ${product_version}        60
    input text   ${product_version}   ${result}

Add random technology product edition
    wait until element is visible       ${product_edition}        60
    wait until element is enabled       ${product_edition}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    productEdition_${random_string}
    input text   ${product_edition}   ${result}

Add self technology product edition
    [Arguments]    ${result}
    wait until element is visible       ${product_edition}        60
    wait until element is enabled       ${product_edition}        60
    input text   ${product_edition}   ${result}

Add random technology hostOn
    wait until element is visible       ${enter_hosted}        60
    wait until element is enabled        ${enter_hosted}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    hostedOn_${random_string}
    input text   ${enter_hosted}   ${result}

Add self technology hostOn
    [Arguments]    ${result}
    wait until element is visible       ${enter_hosted}        60
    wait until element is enabled        ${enter_hosted}        60
    input text   ${enter_hosted}   ${result}

Add random technology idKey
    wait until element is visible       ${enter_id_key}        60
    wait until element is enabled        ${enter_id_key}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    idKey_${random_string}
    input text   ${enter_id_key}   ${result}

Add self technology idKey
    [Arguments]    ${result}
    wait until element is visible       ${enter_id_key}        60
    wait until element is enabled       ${enter_id_key}        60
    input text   ${enter_id_key}   ${result}


###############Technology Lifecycle Information################
Add assetID for technology lifecycle information random
    wait until element is not visible       ${loaderIcon}        60
    wait until element is visible       ${asset_id}        60
    wait until element is enabled       ${asset_id}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssetID}=    Catenate    AssetID_${random_string}
    input text   ${asset_id}   ${generated_AssetID}
    sleep       ${search_sleep}
    log to console      ${generated_AssetID}
    set global variable    ${generated_AssetID}

Add assetID for technology lifecycle information self
    [Arguments]    ${option}
    wait until element is visible       ${asset_id}        60
    wait until element is enabled       ${asset_id}        60
    input text   ${asset_id}   ${option}

Select purchase date
    Generic.Enter current date      ${purchase_date}

Select warranty end date
    [Arguments]    ${date}
    Generic.Enter self date     ${warranty_enddt}       ${date}

Select technology lifecycle status
    [Arguments]    ${option1}
    wait until element is visible    ${LifeCycleStatusId}      60
    wait until element is enabled    ${LifeCycleStatusId}      60
    click element       ${LifeCycleStatusId}
    wait until element is visible   //ng-select[@id='LifeCycleStatusId']//span[@title='Clear all']     60
    click element       //ng-select[@id='LifeCycleStatusId']//span[@title='Clear all']
    Generic.Select parameter    ${option1}


Select edited technology lifecycle status
    [Arguments]    ${option1}
    wait until element is not visible    ${loaderIcon}      60
    wait until element is visible    ${LifeCycleStatusId}      60
    click element       ${LifeCycleStatusId}
    wait until element is visible   xpath://span[normalize-space()='${option1}']     60
    click element   xpath://span[normalize-space()='${option1}']

Add technology lifecycle comment
    [Arguments]    ${option}
    wait until element is visible    ${comment}     60
    input text      ${comment}      ${option}       # Technology Lifecycle Information- comment

Accept updated edited technology pop up
    [Arguments]    ${option}
     wait until element is visible     //div[@id='confirmUpdates']//button[normalize-space()='${option}']      60
     wait until element is enabled     //div[@id='confirmUpdates']//button[normalize-space()='${option}']      60
     click element      //div[@id='confirmUpdates']//button[normalize-space()='${option}']

###############Technology Cost Information#################
Add order number of technology cost information
    [Arguments]    ${orderNo}
    wait until element is visible       ${purchase_order}       60
    Clear Element Text      ${purchase_order}
    input text      ${purchase_order}      ${orderNo}

Add payment partner of technology cost information
    [Arguments]    ${option1}
    wait until element is visible       ${paymentPartner}       60
    click element       ${paymentPartner}
    Clear Element Text      ${paymentPartner}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${paymentPartner}       ${option1}
    Generic.Select parameter    ${option1}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   Technology Page - Add payment partner of technology cost information     7    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add cost type of technology cost information
    [Arguments]    ${option2}
    wait until element is visible       ${costType}      60
    click element      ${costType}
    Clear Element Text      ${costType}
    input text      ${costType}       ${option2}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Select parameter    ${option2}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   Technology Page - Add cost type of technology cost information      8    ${pageTime}     ${ActualTime}    TechnologyPage_Time


Add payment type of technology cost information
    [Arguments]    ${option3}
    wait until element is not visible      ${loaderIcon}      60
    wait until element is enabled       ${paymentType}       60
    click element      ${paymentType}
    Clear Element Text      ${paymentType}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${paymentType}       ${option3}
    wait until element is visible       //*[contains(text(), '${option3}')]     60
    click element      //*[contains(text(), '${option3}')]
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   Technology Page - Add payment type of technology cost information      9    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add payment peroid of technology cost information
    [Arguments]    ${option4}
    wait until element is enabled       ${paymentPeroid}       60
    click element      ${paymentPeroid}
    Clear Element Text      ${paymentPeroid}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${paymentPeroid}     ${option4}
    Generic.Select parameter    ${option4}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  10  ${pageHeading}   Technology Page - Add payment peroid of technology cost information      10    ${pageTime}     ${ActualTime}    TechnologyPage_Time



Add first payment date of technology cost information
    [Arguments]    ${date}
     Generic.Enter self date       ${first_paymentdate}     ${date}

Click on update button of edit_technology page
    [Arguments]    ${option}
    wait until element is visible       //button[@type='submit'][normalize-space()='${option}']         60
    click element       //button[@type='submit'][normalize-space()='${option}']
# option: Update, Cancel

Add budget payment of technology cost information
    [Arguments]    ${option}
    wait until element is visible    ${budget_payment}      60
    input text      ${budget_payment}      ${option}    #1000


Add actual payment of technology cost information
    [Arguments]    ${option}
    wait until element is visible    ${actual_payment}      60
    input text      ${actual_payment}      ${option}    #1100


Add expense type of technology cost information
    [Arguments]    ${option5}
    wait until element is visible    ${expenseType}      60
    click element       ${expenseType}
    Clear Element Text      ${expenseType}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${expenseType}     ${option5}
    Generic.Select parameter    ${option5}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  11  ${pageHeading}   Technology Page - Add expense type of technology cost information      11    ${pageTime}     ${ActualTime}    TechnologyPage_Time


################################### contract information ######################

Add contract Id of contract information random
    wait until element is visible       ${contract_id}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_contractId}=    Catenate    contract_id${random_string}
    input text   ${contract_id}   ${generated_AssetID}
    log to console      ${generated_contractId}
    set global variable    ${generated_contractId}

Add contract Id of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${contract_id}        60
    input text   ${contract_id}   ${option}


Add chargeable basis of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${chargeable_basis}        60
    click element   ${chargeable_basis}
    wait until element is visible       ${chargeable_basis}        60
    ${StartTime1} =     Get Current Time in Milliseconds
    input text   ${chargeable_basis}   ${option}
    wait until element is visible    ${chargeable_basis}      60
    click element       ${chargeable_basis}
    Clear Element Text      ${chargeable_basis}
    input text      ${chargeable_basis}     ${option}
    Generic.Select parameter    ${option}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  12  ${pageHeading}   Technology Page - Add chargeable basis of contract information self      12    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add cost each of contract information random
    wait until element is visible       ${cost_each}        60
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_costEach}=    Catenate    ${random_string}
    input text   ${cost_each}   ${generated_AssetID}
    log to console      ${generated_costEach}
    set global variable    ${generated_costEach}

Add cost each of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${cost_each}        60
    input text   ${cost_each}   ${option}


Add max contracted of contract information random
    wait until element is visible       ${max_contracted}        60
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_maxContracted}=    Catenate    ${random_string}
    input text   ${max_contracted}   ${generated_maxContracted}
    log to console      ${generated_maxContracted}
    set global variable    ${generated_maxContracted}

Add max contracted of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${max_contracted}        60
    input text   ${max_contracted}   ${option}

##############Assignment Information###############
Add assignment information location
    [Arguments]    ${option1}
    wait until element is visible    ${locationName}      60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element       ${locationName}
#    Clear Element Text      ${locationName}
    Generic.Enter value into field      ${locationName}     ${option1}
    Press Keys     ${locationName}       ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  13  ${pageHeading}   Technology Page - Add assignment information location      13   ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add assignment information department name
    [Arguments]    ${option1}
#    wait until element is visible    ${departmentName}      60
    click element       ${departmentName}
#    Clear Element Text      ${departmentName}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Enter value into field      ${departmentName}     ${option1}
    Press Keys     ${departmentName}       ENTER
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  14  ${pageHeading}   Technology Page - Add assignment information department name      14    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add assignment information assign to
    [Arguments]    ${option1}   ${option2}
    wait until element is visible   ${assignTo}     60
    wait until element is enabled   ${assignTo}     60
    click element       ${assignTo}
    sleep     5
    Generic.Enter value into field      ${assignTo}     ${option1}
    wait until element is visible     //span[normalize-space()='${option1} ${option2}']      60
    Press keys  ${assignTo}     ENTER

#################Partners Information###############
Add support partner of partners information
    [Arguments]    ${option1}
    wait until element is visible    ${supportPartner}      60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element       ${supportPartner}
    Clear Element Text      ${supportPartner}
    Generic.Select parameter    ${option1}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  15  ${pageHeading}   Technology Page - Add support partner of partners information      15    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Add supplier of partners information
    [Arguments]    ${option1}
    wait until element is visible    ${supplierPartner}      60
    wait until element is enabled    ${supplierPartner}      60
    ${StartTime1} =     Get Current Time in Milliseconds
    click element       ${supplierPartner}
    Clear Element Text      ${supplierPartner}
    Generic.Select parameter    ${option1}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  16  ${pageHeading}   Technology Page - Add supplier of partners information      16   ${pageTime}     ${ActualTime}    TechnologyPage_Time


Click on save technology form button
    wait until element is visible       ${saveBTN}       60
    wait until element is enabled       ${saveBTN}       60
    click element       ${saveBTN}
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Click on save technology form pop button
    wait until element is visible       ${savePOPup}       60
    wait until element is enabled        ${savePOPup}       60
    click element       ${iamDone_BTN}


Verify that after saving technology form user redirect to technology page
    wait until element is not visible    ${alert_Msg}       60
    wait until element is enabled       ${alert_Msg}       60
    wait until location contains      technology      60


############ search item in technologies ########################
Search by AssetId
    [Arguments]    ${AssetID}
    wait until element is visible       css:thead tr       60
    wait until element is visible       ${asset_SearchBar}       60
    Clear Element Text      ${asset_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${asset_SearchBar}     ${AssetID}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       60
    Wait Until Element Contains    ${fetch_assetID}     ${AssetID}    60
    ${get_assetID} =    get text    ${fetch_assetID}
    log to console     ${get_assetID}
    should be equal    ${get_assetID}     ${AssetID}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  17  ${pageHeading}   Technology Page - Search by AssetId     17    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Search by BrandName
    [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${asset_SearchBar}     60
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${asset_SearchBar}   ${BrandName}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     60
     wait until element is visible       css:thead tr       60
     Fetch the Brand Name from the row   ${BrandName}
     should be equal    ${get_fetch_brandName}     ${BrandName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  18  ${pageHeading}   Technology Page - Search by BrandName      18    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Search by ProductName
    [Arguments]    ${product}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${asset_SearchBar}     60
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${asset_SearchBar}   ${product}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     60
     wait until element is visible       css:thead tr       60
     Wait Until Element Contains    //td[normalize-space()='${product}']        ${product}     60
     ${get_productID} =    get text    ${fetch_productID}
     log to console     ${get_productID}
     should be equal    ${product}     ${get_productID}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  19  ${pageHeading}   Technology Page - Search by ProductName      19    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Search by SerialNo
    [Arguments]    ${assertId}  ${serialNo}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${asset_SearchBar}     60
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text      ${asset_SearchBar}     ${AssetID}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     60
     wait until element is visible       css:thead tr       60
     Wait Until Element Contains    ${fetch_assetID}     ${AssetID}    60
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  20  ${pageHeading}   Technology Page - Search by SerialNo      20    ${pageTime}     ${ActualTime}    TechnologyPage_Time

Search by assignee
     [Arguments]    ${assignee}
     wait until element is visible       css:thead tr       60
     wait until element is visible      ${asset_SearchBar}     60
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${asset_SearchBar}   ${assignee}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     60
     wait until element is visible       css:thead tr       60
     Wait Until Element Contains    //td[normalize-space()='${assignee}']        ${assignee}     60
     ${get_assignee} =    get text    ${fetch_assignee}
     log to console     ${get_assignee}
     should be equal    ${assignee}     ${get_assignee}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time  21  ${pageHeading}   Technology Page - Search by assignee      21    ${pageTime}     ${ActualTime}    TechnologyPage_Time


Click on the first row of the technology table
    wait until element is visible      ${fetch_assetID}     60
    wait until element is enabled      ${fetch_assetID}     60
    click element      ${fetch_assetID}
    wait until element is not visible      ${loaderIcon}    60

Click on edit button on product details page
    [Arguments]    ${option}
    wait until element is not visible      ${loaderIcon}    60
    Generic.click on the button link     ${option}
    wait until element is not visible      ${loaderIcon}    60

Click on the edit icon on the edit technology page
    wait until element is visible      ${editIcon}     60
    wait until element is enabled      ${editIcon}     60
    click element      ${editIcon}

Click on technology Acknowledgement pop up
    [Arguments]    ${option}
    Generic.click on the button     ${option}

Click on the specific tab
    [Arguments]    ${option}
    wait until element is visible     //ul[@id='mynewTab']//li//a[@href='#${option}']        60
    wait until element is enabled     //ul[@id='mynewTab']//li//a[@href='#${option}']        60
    click element   //ul[@id='mynewTab']//li//a[@href='#${option}']
#options: details, #partners, #location, #parent-components, #components, #messages, #history, #attachments, #inbox, #sent

Verify assetID is visible
    [Arguments]    ${option}
    wait until element is visible       //b[normalize-space()='Asset Id : ${option}']       60

Click on compose message button
    [Arguments]    ${option}
    Generic.click on the button     ${option}     #//button[normalize-space()='Compose Message']


Enter Asset id in compose message
    [Arguments]    ${option}
    wait until element is visible      //div[@class='edit-bill-container']//input[@id='AssetId']        60
    wait until element is enabled      //div[@class='edit-bill-container']//input[@id='AssetId']        60
    input text       //div[@class='edit-bill-container']//input[@id='AssetId']      ${option}

Click on TO of compose message
    wait until element is visible     css:.qa-To input      60
    wait until element is enabled     css:.qa-To input       60
    click element   css:.qa-To input

Select the first value of To dropdown of compose message
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

Select compose message status
    [Arguments]    ${option4}
    wait until element is enabled       ${composeMessage_status}       60
    click element      ${composeMessage_status}
    Clear Element Text      ${composeMessage_status}
    input text      ${composeMessage_status}     ${option4}
    Generic.Select parameter    ${option4}

Enter subject of compose message
    [Arguments]    ${option}
    wait until element is visible     ${composeMessage_subject}       60
    wait until element is enabled     ${composeMessage_subject}       60
    input text     ${composeMessage_subject}         ${option}      60
    ${get_messageSubjectValue} =  Set Variable     ${option}
    set global variable    ${get_messageSubjectValue}

Enter message body of compose message
    [Arguments]    ${option}
    wait until element is visible     ${composeMessage_Details}       60
    wait until element is enabled     ${composeMessage_Details}       60
    input text     ${composeMessage_Details}      ${option}      60
    ${get_messageBodyValue} =  Set Variable     ${option}
    set global variable    ${get_messageBodyValue}

Click on the send button of compose message
    wait until element is visible    ${composeMessage_sendBTN}       60
    wait until element is enabled    ${composeMessage_sendBTN}       60
    click element   ${composeMessage_sendBTN}

Verify subject of recent added email
    [Arguments]    ${option}
    wait until element is visible         //label[normalize-space()='${option}']       60

Verify message body of recent added email
    [Arguments]    ${option}
    wait until element is visible         //p[normalize-space()='${option}']       60


Click on add location
    wait until element is visible       css:span[title='Add new location'] a        60
    wait until element is enabled       css:span[title='Add new location'] a        60
    click element       css:span[title='Add new location'] a
    sleep       ${yop_sleep}

Select country of the location
    [Arguments]    ${option}
    Generic.Enter value into field     css:#country     ${option}
    Generic.Select parameter        ${option}

Enter building_name of the location
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_buildingname}=    Catenate    Buildingname_${random_string}
    Generic.Enter value into field      css:#buildingName         ${generated_buildingname}
    set global variable    ${generated_buildingname}

Enter floor of the location
    [Arguments]    ${option}
    Generic.Enter value into field     css:#floor    ${option}

Enter room of the location
    [Arguments]    ${option}
    Generic.Enter value into field     css:#room    ${option}

Enter unique address_one of the location
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible     ${technology_address_Lineone}         60
    wait until element is enabled     ${technology_address_Lineone}         60
    click element      ${technology_address_Lineone}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${technology_address_Lineone}     Address_${generate_newaddress_one}
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Enter unique address_two of the location
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible     ${technology_address_Linetwo}         60
    wait until element is enabled     ${technology_address_Linetwo}         60
    click element      ${technology_address_Linetwo}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${technology_address_Linetwo}     Address_${generate_newaddress_one}
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Select city of location
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       css:.qa-City input      60
    wait until element is enabled   css:.qa-City input   60
    click element   css:.qa-City input
    Generic.Select parameter        ${address}

Select state of location
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       css:.qa-State input      60
    wait until element is enabled   css:.qa-State input   60
    click element   css:.qa-State input
    Generic.Select parameter        ${address}

Enter Zip_code
    [Arguments]     ${code}
    wait until element is visible      ${zip}   60
    wait until element is enabled     ${zip}   60
    click element    ${zip}
    input text  ${zip}    ${code}

Create unique assign to Business_email random
    [Arguments]    ${Fname}    ${domain}
    wait until element is visible       ${businessEmail}     60
    wait until element is enabled       ${businessEmail}     60
    click element   ${businessEmail}
    input text   ${businessEmail}   ${Fname}@${domain}.net
    ${generate_BusinessEmail}=    Catenate    ${Fname}@${Domain}.net
    log to console  ${Fname}@${Domain}.net
    set global variable    ${generate_BusinessEmail}

Create unique assign to employee_ID random
    wait until element is not visible       ${loaderIcon}    60
    wait until element is visible     ${technology_employeeid}         60
    wait until element is enabled     ${technology_employeeid}         60
    click element      ${technology_employeeid}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_employeeid}=    Catenate    EmployeeID_${random_string}
    set global variable    ${generate_employeeid}
    input text      ${technology_employeeid}     ${generate_employeeid}
    log to console      ${generate_employeeid}
#    set global variable    ${generate_employeeid}

Click on refresh location icon
    wait until element is visible       //b[normalize-space()='click here to refresh the location list']       60
    wait until element is enabled       //b[normalize-space()='click here to refresh the location list']       60
    click element       //b[normalize-space()='click here to refresh the location list']
    wait until element is visible       css:span[title='Add new location'] a       60

Enter unique location name random
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_location}=    Catenate    location_${random_string}
    Generic.Enter value into field      css:#locationName        ${generated_location}
    set global variable    ${generated_location}

Save the new added location
    [Arguments]     ${option}
    wait until element is visible       css:.qa-${option}-location       60
    wait until element is enabled       css:.qa-${option}-location       60
    click element       css:.qa-${option}-location
# option: cancel, save

Click on add department
    wait until element is visible       css:span[title='Add new department'] a        60
    wait until element is enabled       css:span[title='Add new department'] a        60
    click element       css:span[title='Add new department'] a

Create unique department name random
    wait until element is visible       ${add_tech_dept_name}        60
    wait until element is enabled       ${add_tech_dept_name}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_tech_dept_name}   ${generated_DepartmentNumber}
    sleep       ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_DepartmentNumber}
    set global variable    ${generated_DepartmentNumber}

Select department cost center
    [Arguments]    ${option}
    wait until element is visible       ${add_tech_dept_costCenter}        60
    wait until element is enabled       ${add_tech_dept_costCenter}        60
    input text    ${add_tech_dept_costCenter}   ${option}

Save the department
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-department-modal        60
    wait until element is enabled       css:.qa-${option}-department-modal        60
    click element        css:.qa-${option}-department-modal
# option: add, close

Click on add assign to
    wait until element is visible       css:span[title='Add new assignee'] a        60
    wait until element is enabled       css:span[title='Add new assignee'] a        60
    click element       css:span[title='Add new assignee'] a

Create unique assign to first name random
    wait until element is visible       css:#AssignedFirstName        60
    wait until element is enabled       css:#AssignedFirstName        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assignFname}=    Catenate    Fname_${random_string}
    input text  css:#AssignedFirstName   ${generated_assignFname}
    log to console       ${generated_assignFname}
    set global variable    ${generated_assignFname}

Create unique assign to last name random
    wait until element is visible       css:#AssignedLastName        60
    wait until element is enabled       css:#AssignedLastName        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assignLname}=    Catenate    Lname_${random_string}
    input text   css:#AssignedLastName   ${generated_assignLname}
    log to console      ${generated_assignLname}
    set global variable    ${generated_assignLname}

Save the assign to
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-assignee-modal        60
    wait until element is enabled       css:.qa-${option}-assignee-modal        60
    click element        css:.qa-${option}-assignee-modal
    wait until element is not visible        ${loaderIcon}         60
# options: save, cancel

Select tab under technology details
    [Arguments]    ${option}
    wait until element is not visible       ${loaderIcon}         60
    wait until element is visible       css:a[href='#${option}']       60
    wait until element is enabled       css:a[href='#${option}']        60
    click element        css:a[href='#${option}']

#options: details,partners,location,parent-components,components,messages,history,attachments

Click on assign partner button under technology details page
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Click on add new entry parent button under technology details page
    [Arguments]     ${option}
    wait until element is visible    //div[@id='parent-components']//button[normalize-space()='${option}']      60
    wait until element is enabled    //div[@id='parent-components']//button[normalize-space()='${option}']      60
    click element      //div[@id='parent-components']//button[normalize-space()='${option}']
#options: Add New Entry, Export

Click on add new entry component button under technology details page
    [Arguments]     ${option}
    wait until element is visible    //div[@id='components']//button[normalize-space()='${option}']      60
    wait until element is enabled    //div[@id='components']//button[normalize-space()='${option}']      60
    click element      //div[@id='components']//button[normalize-space()='${option}']

Select add new entry
    [Arguments]     ${option}
    Generic.click on the button     ${option}
#options: Existing Asset, New Asset

Click here to add support partner
    wait until element is not visible    cs:.qa-assign-support-partner .ng-spinner-loader      60
    click element       css:.qa-click-to-add-partner-support

Click here to add supplier partner
    wait until element is not visible    cs:.qa-assign-supplier-partner .ng-spinner-loader      60
    click element       css:.qa-click-to-add-partner-supplier

Click contact main save button
    wait until element is visible      ${main_Save}       60
    wait until element is enabled      ${main_Save}       60
    click element   ${main_Save}


Wait till support partner get auto polute
    [Arguments]     ${option}
    wait until element is visible    //span[normalize-space()='${option}']      120
    wait until element is enabled       //span[normalize-space()='${option}']      120

Wait till supplier partner get auto polute
    [Arguments]     ${option}
    wait until element is visible    //span[normalize-space()='${option}']      120
    wait until element is enabled   //span[normalize-space()='${option}']      120

Verify that support partner is added in partner association
    [Arguments]     ${option}
    wait until element is visible    //td[normalize-space()='${option}']      120
    wait until element is enabled      //td[normalize-space()='${option}']      120

Verify that supplier partner is added in partner association
    [Arguments]     ${option}
    wait until element is visible    //td[normalize-space()='${option}']      120
    wait until element is enabled   //td[normalize-space()='${option}']      120

Verify area changed under history tab
    [Arguments]     ${option}
    wait until element is visible    //tr[@class='ng-star-inserted']//td[@data-target='#historyViewPopUp'][normalize-space()='${option}']      60
    wait until element is enabled       //tr[@class='ng-star-inserted']//td[@data-target='#historyViewPopUp'][normalize-space()='${option}']      60

Confirm area changed with view under history tab
    [Arguments]     ${option}
    wait until element is visible       //td[normalize-space()='${option}']//following::a[normalize-space()='View']     60
    wait until element is enabled       //td[normalize-space()='${option}']//following::a[normalize-space()='View']     60
    click element   //td[normalize-space()='${option}']//following::a[normalize-space()='View']
    sleep       ${search_sleep}

Close the view history pop up
    wait until element is visible       ${histortTab_ViewPopUp}      60
    wait until element is enabled       ${histortTab_ViewPopUp}      60
    click element   ${histortTab_ViewPopUp}
    wait until element is not visible       ${histortTab_ViewPopUp}      60
    sleep   ${search_sleep}

Submit the assign partner form
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Click on upload button under technology history tab
    wait until element is visible       ${attachmentTab_UploadBTN}     60
    wait until element is enabled       ${attachmentTab_UploadBTN}      60
    click element   ${attachmentTab_UploadBTN}

Upload File under technology attachments tab
    wait until element is visible       ${attachmentTab_UploadBTN}     60
    wait until element is enabled       ${attachmentTab_UploadBTN}      60
    Choose File    ${attachmentTab_UploadBTN}    C:\Users\Paramdeep\Downloads\one.pdf


Click the add here link on supplier to add new supplier
    wait until element is visible       css:.qa-add-here-supplier     60
    wait until element is enabled       css:.qa-add-here-supplier      60
    click element   css:.qa-add-here-supplier

Click the add here link on supplier to edit new supplier
    wait until element is visible       css:.theme-blue[routerlink='/dashboard/addpartner/3']    60
    wait until element is enabled       css:.theme-blue[routerlink='/dashboard/addpartner/3']     60
    click element   css:.theme-blue[routerlink='/dashboard/addpartner/3']

Click the add here link on support to add new support partner
    wait until element is visible       css:.qa-add-here-support     60
    wait until element is enabled       css:.qa-add-here-support      60
    click element   css:.qa-add-here-support

Click the add here link on support to edit new support
    wait until element is visible       css:.theme-blue[routerlink='/dashboard/addpartner/4']     60
    wait until element is enabled       css:.theme-blue[routerlink='/dashboard/addpartner/4']      60
    click element   css:.theme-blue[routerlink='/dashboard/addpartner/4']


Click on save product pop inside technology page
    sleep       ${search_sleep}
    wait until element is visible   css:div[class='modal-footer my-1'] button[type='submit']    60
    wait until element is enabled   css:div[class='modal-footer my-1'] button[type='submit']    60
    click element   css:div[class='modal-footer my-1'] button[type='submit']

Select product technology group via technology
    [Arguments]    ${option}
    wait until element is visible       css:nz-tree-select[formcontrolname=TechGroupId] input     60
    wait until element is enabled       css:nz-tree-select[formcontrolname=TechGroupId] input     60
    Mouse Over      css:nz-tree-select[formcontrolname=TechGroupId] input
    click element   css:nz-tree-select[formcontrolname=TechGroupId] input
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       60
    wait until element is enabled      //span[normalize-space()='${option}']       60
    click element       //span[normalize-space()='${option}']

Select product technology type via technology
    [Arguments]    ${option}
    Generic.Scroll the page till    900
    wait until element is visible       ${select_technology_type_via link}     60
    wait until element is enabled       ${select_technology_type_via link}     60
    click element   ${select_technology_type_via link}
    Generic.Select parameter     ${option}

Add product description via technology
    wait until element is visible       ${ProductDescription_viaLink}     60
    wait until element is enabled       ${ProductDescription_viaLink}     60
    input text   ${ProductDescription_viaLink}   This is the description of new product added.


Add product feature via technology
    wait until element is visible       ${ProductFeatures_viaLink}     60
    wait until element is enabled       ${ProductFeatures_viaLink}     60
    input text   ${ProductFeatures_viaLink}   This is the features of new product added.

Renewal Date via technology
    wait until element is visible   css:#RenewalDate     60
    wait until element is enabled   css:#RenewalDate     60
    click element   css:#RenewalDate
    input text  css:#RenewalDate     03/26/2021

Click on action button of technology
    wait until element is not visible      ${loaderIcon}    60
    wait until element is visible   css:.qa-technology-list-actions      60
    wait until element is enabled   css:.qa-technology-list-actions      60
    click element   css:.qa-technology-list-actions

Choose add technology from action button of technology
    wait until element is visible   css:.qa-add-new-technology      60
    wait until element is enabled   css:.qa-add-new-technology      60
    click element   css:.qa-add-new-technology

Click on Bulk_edit under action button
    wait until element is visible       //a[@title="Bulk Edit"]         60
    wait until element is enabled       //a[@title="Bulk Edit"]         60
    click element       //a[@title="Bulk Edit"]

Click on Bulk_import under action button
    wait until element is visible       css:.add-bulk-member-qa     60
    wait until element is enabled        css:.add-bulk-member-qa     60
    click element         css:.add-bulk-member-qa

Click on Location tab of technology- list page
    wait until element is visible   css:#PrintQrButton   60
    wait until element is enabled   css:#PrintQrButton   60
    wait until element is visible   css:#location-tab   60
    click element   css:#location-tab

Get Value of Assignment Information Location_Department_AssginTo_IDFields
    [Arguments]     ${value}
    wait until element is visible   css:#${value}   60
    ${assign_loc_input_value} =    Get Value    css:#${value}
    Set Global Variable    ${assign_loc_input_value}
    Log To Console    ${assign_loc_input_value}

verify Text from Assignment Information
    [Arguments]     ${original}     ${compared}
    should be equal     ${original}     ${compared}

Verify parameter from past location table
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']        60

Click on current plan of subscription
    wait until element is visible   //button[normalize-space()='Current Plan']  60
    click element   //button[normalize-space()='Current Plan']

Click on pop up of available Inactive Asset
    [Arguments]     ${option}
    wait until element is visible   css:.qa-available-inactive-assests-${option}   60
    wait until element is enabled   css:.qa-available-inactive-assests-${option}   60
    click element   css:.qa-available-inactive-assests-${option}

Click on removed assets option of technology filters
    wait until element is visible   css:.qa-removed-aasets-section  60
    wait until element is enabled   css:.qa-removed-aasets-section  60
    click element   css:.qa-removed-aasets-section

Click on asset limit exceeded pop up
    wait until element is visible   css:.qa-asset-limit-exceede-technology      60
    wait until element is enabled   css:.qa-asset-limit-exceede-technology      60
    click element   css:.qa-asset-limit-exceede-technology

Click on proceed button of technology list page
    wait until element is visible   css:.qa-proceed-retore-asset-technology-list      60
    wait until element is enabled   css:.qa-proceed-retore-asset-technology-list      60
    click element   css:.qa-proceed-retore-asset-technology-list

Click on restore button of technology Details Page
    wait until element is visible   css:.qa-restore-assets      60
    wait until element is enabled   css:.qa-restore-assets      60
    click element   css:.qa-restore-assets
    wait until element is not visible   ${loaderIcon}     60

Click on back to list of technology
    wait until element is visible   ${back_To_List_Link}    60
    wait until element is enabled   ${back_To_List_Link}    60
    click element   ${back_To_List_Link}


Select the check box option from asset wizard
    [Arguments]    ${option}
    wait until element is visible   //b[normalize-space()='${option}']    60
    wait until element is enabled   //b[normalize-space()='${option}']    60
    click element   //b[normalize-space()='${option}']

Choose filter from Technology Page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //b[normalize-space()='${option}']    60
    wait until element is enabled   //b[normalize-space()='${option}']    60
    click element   //b[normalize-space()='${option}']

Select checkbox from Agent Filters
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //label[normalize-space()='${option}']//span    60
    wait until element is enabled   //label[normalize-space()='${option}']//span    60
    click element   //label[normalize-space()='${option}']//span

Verify that Agent column should contain text
    [Arguments]     ${option}
    wait until element is visible       css:thead tr       60
    Wait Until Element Contains       css:.table-row    ${option}   60


Click on cross icon of product while editing technology
    wait until element is visible   css:.cross-product      60
    wait until element is enabled   css:.cross-product      60
    click element   css:.cross-product


Click on attachment tab
    wait until element is visible   css:#PrintQrButton   60
    wait until element is enabled   css:#PrintQrButton   60
    wait until element is visible   css:#attachments-tab   60
    click element   css:#attachments-tab
#    wait until element is visible   //label[normalize-space()='Upload File']        60
#    wait until element is enabled   //label[normalize-space()='Upload File']        60
#    click element   //label[normalize-space()='Upload File']

Upload file
    [Arguments]         @{fileNames}
    ${parent_dir} =    Evaluate    os.path.dirname(os.path.dirname(os.path.abspath('${CURDIR}')))    os
    FOR    ${fileName}    IN    @{fileNames}
        Execute JavaScript    document.querySelector('input[type="file"]').style.display = 'block';
        Choose File    css=input[type="file"]    ${parent_dir}\\Files\\${fileName}
        Execute JavaScript    document.querySelector('input[type="file"]').value = '';
    END

View the file by clicking on view icon over file
    [Arguments]     ${format}
    wait until element is visible     //p[contains(text(),'${format}')]//parent::div     60
    Mouse Over    //p[contains(text(),'${format}')]//parent::div
    wait until element is visible       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]    60
    wait until element is enabled       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]    60
    click element       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]

Zoom the Image
    [Arguments]     ${option}
    wait until element is visible       css:.${option}-QA     60
    wait until element is enabled       css:.${option}-QA     60
    Click Element        css:.${option}-QA

Get and Verify the size of the image after zoom
    [Arguments]     ${zoom_type}
    Wait Until Element Is Visible       //img[@alt='Asset Image']       60
    Wait Until Element Is enabled       //img[@alt='Asset Image']       60
    ${text}=       Get Element Attribute     //img[@alt='Asset Image']       style
    ${width}    Split String    ${text}    width:
    ${original_width}    Split String From Right    ${width[1][:-3]}
#    ${original_width}    Get Substring    ${parts[1]}    1       4
    Log To Console      ${original_width}
    Zoom the Image      ${zoom_type}

    ${text}=    Get Element Attribute     //img[@alt='Asset Image']       style
    ${width}    Split String    ${text}    width:
    ${changed_width}    Split String From Right    ${width[1][:-3]}
#    ${changed_width}    Get Substring    ${parts[1]}    1       4
    Log To Console      ${changed_width}
    Zoom the Image      ${zoom_type}

   Run Keyword If    ${original_width} < ${changed_width}  Log to console    Image width increased after zoom_in
   ...      ELSE IF    ${original_width} > ${changed_width}    Log to console   Image width decreased after zoom_out
   ...      ELSE    Log to console    Image width remained the same after zoom

Click on cross icon to close the document
    Wait Until Element Is Visible    //a[normalize-space()='×']     60
    Wait Until Element Is Enabled    //a[normalize-space()='×']     60
    click element    //a[normalize-space()='×']

Remove the document by clicking on cross-icon
    [Arguments]     ${option}
    Wait Until Element Is Visible    //p[contains(text(),'${option}')]//parent::div//span    60
    Wait Until Element Is Visible    //p[contains(text(),'${option}')]//parent::div//span    60
    Click Element    //p[contains(text(),'${option}')]//parent::div//span

Download the file by clicking on download icon over file
    [Arguments]     ${format}
    wait until element is visible     //p[contains(text(),'${format}')]//parent::div//img    60
    Mouse Over    //p[contains(text(),'${format}')]//parent::div//img
    wait until element is visible       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]    60
    wait until element is enabled       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]   60
    click element       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]

click on bulk import under action button of technology
    wait until element is visible       css:.add-bulk-member-qa     60
    wait until element is enabled       css:.add-bulk-member-qa     60
    click element   css:.add-bulk-member-qa

Click on clone button on techonology details page
    [Arguments]    ${option}
    wait until element is not visible      ${loaderIcon}    60
    Generic.click on the button link     ${option}
    wait until element is not visible      ${loaderIcon}    60


#Check current directory path
#    Log To Console    ${CURDIR}


Get Parent Directory Up To Root
    [Arguments]    ${path}
    ${parent_dir} =    Evaluate    os.path.dirname(os.path.dirname(os.path.abspath('${path}')))    os
    [Return]    ${parent_dir}


Click on advanced search button link under add technology
    wait until element is visible   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']       60
    wait until element is enabled   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']       60
    click element   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']
    wait until element is not visible      ${loaderIcon}    60

Click on the row of the table inside advanced search
    Execute JavaScript    document.querySelector('.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(12)').scrollIntoView(true);
    Click Element    css:.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(5) > td:nth-child(1)

Fetch the Brand Name from the brand field
    Wait Until Element Is Visible        //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]    timeout=60s
    Wait Until Element Is Enabled        //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]    timeout=60s
    ${brand_name} =    Get text     //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]
    Log to console   Brand Name: ${brand_name}
    set global variable     ${brand_name}

Click technology advanced brand input field
    wait until element is enabled       css:#advaceBrand        60
    click element    css:#advaceBrand

Select parameter from advanced brand dropdown list
    [Arguments]    ${option}
    Clear Element Text      css:#advaceBrand
    input text    css:#advaceBrand   ${option}
    Generic.Select parameter    ${option}

Click technology advanced technology type and group input field
    [Arguments]     ${option1}
    wait until element is enabled       css:#${option1}        60
    click element    css:#${option1}


Select parameter from advanced technology type dropdown list
    [Arguments]    ${option1}    ${option}
    Clear Element Text      css:#${option1}
    input text    css:#${option1}   ${option}
    Generic.Select parameter    ${option}

Fetch the technology type from the technology type field
    Wait Until Element Is Visible        //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]    timeout=60s
    Wait Until Element Is Enabled        //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]    timeout=60s
    ${Technology_type} =    Get text     //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]
    Log to console   Technology Type: ${Technology_type}
    set global variable     ${Technology_type}

Get text of technology group inside add technology
    wait until element is visible   css:.ant-select-selection-item   60
    wait until element is enabled   css:.ant-select-selection-item   60
    ${Technology_group} =    Get text    css:.ant-select-selection-item
    Set Global Variable    ${Technology_group}
    Log To Console    Technology Group: ${Technology_group}

Enter product in the product input field
    [Arguments]     ${product}
    wait until element is visible   //input[@placeholder='-- Please enter at least 2 characters--']     60
    wait until element is enabled   //input[@placeholder='-- Please enter at least 2 characters--']     60
    click element   //input[@placeholder='-- Please enter at least 2 characters--']
    input text      //input[@placeholder='-- Please enter at least 2 characters--']     ${product}

Get text of product inside add technology
    wait until element is visible   //tbody//tr[1]//td[1]   60
    wait until element is enabled   //tbody//tr[1]//td[1]  60
    ${product} =    Get text    //tbody//tr[1]//td[1]
    Set Global Variable    ${product}
    Log To Console    Product: ${product}

Enter description in the description input field
    [Arguments]     ${description}
    wait until element is visible   //input[@formcontrolname='DescriptionContaining']     60
    wait until element is enabled   //input[@formcontrolname='DescriptionContaining']     60
    click element   //input[@formcontrolname='DescriptionContaining']
    input text      //input[@formcontrolname='DescriptionContaining']     ${description}

Get text of description inside add technology
    wait until element is visible   //tbody//tr[1]//td[2]   60
    wait until element is enabled   //tbody//tr[1]//td[2]  60
    ${description} =    Get text    //tbody//tr[1]//td[2]
    Set Global Variable   ${description}
    Log To Console    Description: ${description}

Enter feature in the description input field
    [Arguments]     ${feature}
    wait until element is visible   //input[@formcontrolname='FeatureContaining']     60
    wait until element is enabled   //input[@formcontrolname='FeatureContaining']     60
    click element   //input[@formcontrolname='FeatureContaining']
    input text      //input[@formcontrolname='FeatureContaining']     ${feature}

Get text of feature inside add technology
    wait until element is visible   //tbody//tr[1]//td[3]   60
    wait until element is enabled   //tbody//tr[1]//td[3]  60
    ${feature} =    Get text    //tbody//tr[1]//td[3]
    Set Global Variable  ${feature}
    Log To Console    Feature: ${feature}

Enter product in the product not containing input field
    [Arguments]     ${Product}
    wait until element is visible   css:input[formcontrolname='ProductNotContaining']     60
    wait until element is enabled   css:input[formcontrolname='ProductNotContaining']     60
    click element   css:input[formcontrolname='ProductNotContaining']
    input text      css:input[formcontrolname='ProductNotContaining']     ${Product}

Wait until advanced search table get load
    wait until element is visible       //div[@class='table-responsive table-scrollable table-column-common ng-star-inserted']      60
