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

########################## technology form #####################
${assetTableLoader}     //div[@class='spinner-border text-loader']
${AddTechnologyButton}     css:.qa-add-new-technology

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
${Contract_startDate}        //input[@id='Contract Start Date']
${Contract_endDate}        //input[@id='Contract End Date']


######################Contract information################
${contract_id}     css:#TECHDYNA_3
${chargeable_basis}     //input[@id='Chargeable basis']      #User, CPU
${cost_each}     //input[@id='Cost Each']
${max_contracted}     //input[@id='Max Contracted']

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
${iamDone_BTN}      //button[text()="Done "]
${Yes_BTN}      //span[contains(text(),'Yes')]

####################### search asset id #####################

#${asset_SearchBar}      css:input[placeholder='Ssearch by Brand, Product, Asset ID, Serial Num, Software VS, Assignee or Host Name']
${asset_SearchBar}      css:#searchbar-technology


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
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled        //td[normalize-space()='${option}']     ${wait_time}
    ${get_fetch_brandName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${get_fetch_brandName}
    log to console     ${get_fetch_brandName}



Click on first table row checkbox and restore
    wait until element is visible       ${restore_asset_chkbox}     ${wait_time}
    wait until element is enabled       ${restore_asset_chkbox}     ${wait_time}
    click element   ${restore_asset_chkbox}
    click element   ${restore_BTN}
#    wait until element is visible       ${loaderIcon}       ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          60


Create random unique serial number
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_serialNo}=    Catenate    serial_${random_string}
    wait until element is visible       ${serial_number}    ${wait_time}
    input text   ${serial_number}   ${generated_serialNo}
    set global variable    ${generated_serialNo}

Create self unique serial number
    [Arguments]    ${option}
    wait until element is visible       ${serial_number}    ${wait_time}
    input text   ${serial_number}    ${option}


Select and restore asset
    wait until element is visible       ${fetch_assetID}        ${wait_time}
    wait until element is enabled       ${fetch_assetID}        ${wait_time}
    wait until element is visible   ${removedTechnology_chkBox}     ${wait_time}
    wait until element is enabled   ${removedTechnology_chkBox}     ${wait_time}
    sleep   3
    Wait Until Element Is not Visible  xpath=//div[@class='fade-shadow']  ${wait_time}s
    click element   ${removedTechnology_chkBox}
#    Wait Until Element Is Enabled      ${restore_BTN}       ${wait_time}
#    click element   ${restore_BTN}
#    wait until element is visible       ${loaderIcon}       ${wait_time}
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}


Select any asset to view assert details page
    [Arguments]    ${option}
    Wait Until Element is visible    ${fetch_assetID}       ${wait_time}
    wait until element is enabled    ${fetch_assetID}       ${wait_time}
    click element       ${fetch_assetID}
    wait until element is visible       ${loaderIcon}       ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //button[normalize-space()='${option}']    ${wait_time}       #Restore, Edit, Remove, Clone, Disposal
    click element   //button[normalize-space()='${option}']
    wait until element is not visible       ${shadow}          60
    sleep       2
    click element       ${back_To_List_Link}

Click on three dots of action button
    Wait Until Element Is visible      ${removedTechnology_threeDot}       ${wait_time}
    Wait Until Element Is Enabled      ${removedTechnology_threeDot}       ${wait_time}
    click element      ${removedTechnology_threeDot}

Select an option from recovery table actions
    [Arguments]    ${Option}
    wait until element is visible       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']        ${wait_time}
    wait until element is enabled       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']        ${wait_time}
    click element       //a[@class='dropdown-item ng-star-inserted'][normalize-space()='${Option}']
     #Restore, Details
#    wait until element is visible       ${loaderIcon}       ${wait_time}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#    wait until element is not visible       ${shadow}          60


Select an option from technology table actions
    [Arguments]    ${Option}
     sleep      ${search_sleep}
     Wait Until Element Is visible      ${technology_threeDot}       ${wait_time}
     Wait Until Element Is Enabled      ${technology_threeDot}       ${wait_time}
     click element      ${technology_threeDot}
     sleep      ${search_sleep}
     wait until element is visible       //a[normalize-space()='${Option}']       ${wait_time}
     wait until element is enabled       //a[normalize-space()='${Option}']       ${wait_time}
     click element      //a[normalize-space()='${Option}']
#options: Details, Edit, Clone , Remove, Disposal

Click on manage technology sub option
    [Arguments]    ${option}
    click element      //span[normalize-space()='${option}']
#options: Technology List, Removed Assets

Inactive or Removed technology
    [Arguments]    ${assetId}
    wait until element is visible       ${asset_SearchBar}       ${wait_time}
    wait until element is enabled        ${asset_SearchBar}       ${wait_time}
    Clear Element Text      ${asset_SearchBar}
    input text      ${asset_SearchBar}     ${assetId}
    Wait Until Element is visible    ${fetch_assetID}       ${wait_time}
    Wait Until Element Is Enabled      ${removedTechnology_threeDot}       ${wait_time}
    click element      ${removedTechnology_threeDot}

Remove asset from technology table
#     wait until element is visible      ${removePopUp}        ${wait_time}
#     wait until element is enabled       ${removePopUp}        ${wait_time}
     sleep      ${search_sleep}
     Wait Until Element Is Enabled      ${select_remove_popUp_Yes}      ${wait_time}
     sleep      ${search_sleep}
     click element      ${select_remove_popUp_Yes}
     sleep      ${search_sleep}


Search and remove asset
    [Arguments]    ${option}
    wait until element is visible       ${asset_SearchBar}       ${wait_time}
    input text      ${asset_SearchBar}     ${option}
    Wait Until Element Contains    //td[normalize-space()='${option}']     ${option}    ${wait_time}
    ${get_assetID} =    get text    //td[normalize-space()='${option}']
    log to console     ${get_assetID}
    should be equal    ${get_assetID}     ${option}


click on add technology button
    Wait Until Element Is Not Visible    ${assetTableLoader}        ${wait_time}
    wait until element is visible    ${AddTechnologyButton}     ${wait_time}
    wait until element is enabled       ${AddTechnologyButton}     ${wait_time}
    click element    ${AddTechnologyButton}
    wait until element is visible    //p[normalize-space()='Add New Technology']     ${wait_time}


Click technology brand input field
    Wait Until Element Is Not Visible    //input[@id='brandselect']//ancestor::ng-select[@id='BrandName']//following-sibling::div[contains(@class,'spinner-loader')]        ${wait_time}
    wait until element is visible       ${brand}        ${wait_time}
    wait until element is enabled       ${brand}        ${wait_time}
    sleep       ${search_sleep}
    click element    ${brand}

Select parameter from brand dropdown list
    [Arguments]    ${option}
    Clear Element Text      ${brand}
    input text    ${brand}   ${option}
    Generic.Select parameter    ${option}

Click technology product input field
     wait until element is visible       ${product}        ${wait_time}
     wait until element is enabled       ${product}        ${wait_time}
     click element    ${product}


Select the first value of To dropdown of product
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Select parameter from technology dropdown list
    [Arguments]      ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input      ${wait_time}
    wait until element is enabled   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input     ${wait_time}
    Clear Element Text    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input
    Input Text    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input    ${option}
    Wait Until Element Is Visible    //td[normalize-space()='${option}']        ${wait_time}
    Wait Until Element Is enabled    //td[normalize-space()='${option}']        ${wait_time}
    Click Element       //td[normalize-space()='${option}']
    sleep   ${search_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is not Visible    (//input[@id='brandselect']//parent::div//following::div[contains(@class,'spinner-loader')])[1]       ${wait_time}

Click on add product link
    wait until element is visible   css:.qa-product-add-assets      ${wait_time}
    wait until element is enabled   css:.qa-product-add-assets      ${wait_time}
    click element   css:.qa-product-add-assets

##############Technology Group Information for hardware#################
Add mac address for technology group information for hardware
    wait until element is visible       ${mac_addess}        ${wait_time}
    wait until element is enabled       ${mac_addess}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    MacAddress_${random_string}
    input text   ${mac_addess}   ${result}

Add host name for technology group information for hardware
    wait until element is visible       ${host_name}        ${wait_time}
    wait until element is enabled       ${host_name}        ${wait_time}
    input text   ${host_name}   125.66

Add host name for technology group information for hardware random
    wait until element is visible       ${host_name}        ${wait_time}
    wait until element is enabled       ${host_name}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    HostName_${random_string}
    input text   ${host_name}   ${result}
    log to console      ${result}
    set global variable    ${result}


#================================ CREATE SERIAL NUMBER ==========================
Create unique serial number random
    wait until element is visible       ${serial_number}        ${wait_time}
    wait until element is enabled       ${serial_number}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_SerialNumber}=    Catenate    SerialNumber_${random_string}
    input text   ${serial_number}   ${generated_SerialNumber}
    log to console      ${generated_SerialNumber}
    set global variable    ${generated_SerialNumber}

Create unique serial number self
    [Arguments]    ${option}
    wait until element is visible       ${serial_number}        ${wait_time}
    wait until element is enabled        ${serial_number}        ${wait_time}
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
    wait until element is visible       ${product_version}        ${wait_time}
    wait until element is enabled       ${product_version}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    ProductVersion_${random_string}
    input text   ${product_version}   ${result}
    Log To Console    ${result}
    Set Global Variable    ${result}

Add self technology product version
    [Arguments]    ${result}
    wait until element is visible       ${product_version}        ${wait_time}
    wait until element is enabled       ${product_version}        ${wait_time}
    input text   ${product_version}   ${result}

Add random technology product edition
    wait until element is visible       ${product_edition}        ${wait_time}
    wait until element is enabled       ${product_edition}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    productEdition_${random_string}
    input text   ${product_edition}   ${result}

Add self technology product edition
    [Arguments]    ${result}
    wait until element is visible       ${product_edition}        ${wait_time}
    wait until element is enabled       ${product_edition}        ${wait_time}
    input text   ${product_edition}   ${result}

Add random technology hostOn
    wait until element is visible       ${enter_hosted}        ${wait_time}
    wait until element is enabled        ${enter_hosted}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    hostedOn_${random_string}
    input text   ${enter_hosted}   ${result}

Add self technology hostOn
    [Arguments]    ${result}
    wait until element is visible       ${enter_hosted}        ${wait_time}
    wait until element is enabled        ${enter_hosted}        ${wait_time}
    input text   ${enter_hosted}   ${result}

Add random technology idKey
    wait until element is visible       ${enter_id_key}        ${wait_time}
    wait until element is enabled        ${enter_id_key}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${result}=    Catenate    idKey_${random_string}
    input text   ${enter_id_key}   ${result}

Add self technology idKey
    [Arguments]    ${result}
    wait until element is visible       ${enter_id_key}        ${wait_time}
    wait until element is enabled       ${enter_id_key}        ${wait_time}
    input text   ${enter_id_key}   ${result}


###############Technology Lifecycle Information################
Add assetID for technology lifecycle information random
    wait until element is not visible       ${loaderIcon}        ${wait_time}
    wait until element is visible       ${asset_id}        ${wait_time}
    wait until element is enabled       ${asset_id}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssetID}=    Catenate    AssetID_${random_string}
    input text   ${asset_id}   ${generated_AssetID}
    sleep       ${search_sleep}
    log to console      ${generated_AssetID}
    set global variable    ${generated_AssetID}

Add New_Parent assetID for technology lifecycle information random
    wait until element is not visible       ${loaderIcon}        ${wait_time}
    wait until element is visible       ${asset_id}        ${wait_time}
    wait until element is enabled       ${asset_id}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_NewParent_AssetID}=    Catenate    AssetID_${random_string}
    input text   ${asset_id}   ${generated_NewParent_AssetID}
    sleep       ${search_sleep}
    log to console      ${generated_NewParent_AssetID}
    set global variable    ${generated_NewParentAssetID}

Add New_Component assetID for technology lifecycle information random
    wait until element is not visible       ${loaderIcon}        ${wait_time}
    wait until element is visible       ${asset_id}        ${wait_time}
    wait until element is enabled       ${asset_id}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_NewComponent_AssetID}=    Catenate    AssetID_${random_string}
    input text   ${asset_id}   ${generated_NewComponent_AssetID}
    sleep       ${search_sleep}
    log to console      ${generated_NewComponent_AssetID}
    set global variable     ${generated_NewComponent_AssetID}


Add assetID for technology lifecycle information self
    [Arguments]    ${option}
    wait until element is visible       ${asset_id}        ${wait_time}
    wait until element is enabled       ${asset_id}        ${wait_time}
    input text   ${asset_id}   ${option}

Select purchase date
    Generic.Enter current date      ${purchase_date}

Select purchase date self
    [Arguments]    ${date}
    Generic.Enter self date     ${purchase_date}       ${date}

Select warranty end date
    [Arguments]    ${date}
    Generic.Enter self date     ${warranty_enddt}       ${date}

Select technology lifecycle status
    [Arguments]    ${option1}
    #Scroll Element Into View        css:#Comment
    wait until element is visible   //ng-select[@id='LifeCycleStatusId']//span[@title='Clear all']    ${wait_time}
    wait until element is enabled   //ng-select[@id='LifeCycleStatusId']//span[@title='Clear all']    ${wait_time}
    click element       //ng-select[@id='LifeCycleStatusId']//span[@title='Clear all']
    wait until element is visible    ${LifeCycleStatusId}      ${wait_time}
    wait until element is enabled    ${LifeCycleStatusId}      ${wait_time}
    click element       ${LifeCycleStatusId}
    wait until element is visible   //ng-select[contains(@class,'qa-LifeCycleStatusId')]//ng-dropdown-panel//span[normalize-space()='Active']      ${wait_time}
    wait until element is enabled  //ng-select[contains(@class,'qa-LifeCycleStatusId')]//ng-dropdown-panel//span[normalize-space()='Active']      ${wait_time}
    click element   //ng-select[contains(@class,'qa-LifeCycleStatusId')]//ng-dropdown-panel//span[normalize-space()='Active']
    Generic.Wait for the spinner to get disable
    #Generic.Select parameter    ${option1}


Select edited technology lifecycle status
    [Arguments]    ${option1}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    ${LifeCycleStatusId}      ${wait_time}
    Clear Element Text    ${LifeCycleStatusId}
    click element     ${LifeCycleStatusId}
    wait until element is visible   //span[normalize-space()='${option1}']     ${wait_time}
    click element   //span[normalize-space()='${option1}']
    Generic.Wait for the spinner to get disable

Add technology lifecycle comment
    [Arguments]    ${option}
    wait until element is visible    ${comment}     ${wait_time}
    input text      ${comment}      ${option}       # Technology Lifecycle Information- comment

Accept updated edited technology pop up
    [Arguments]    ${option}
     wait until element is visible     //div[@id='confirmUpdates']//button[normalize-space()='${option}']      ${wait_time}
     wait until element is enabled     //div[@id='confirmUpdates']//button[normalize-space()='${option}']      ${wait_time}
     click element      //div[@id='confirmUpdates']//button[normalize-space()='${option}']
#     wait until element is not visible       ${shadow}          60

###############Technology Cost Information#################
Add order number of technology cost information
    [Arguments]    ${orderNo}
    wait until element is visible       ${purchase_order}       ${wait_time}
    Clear Element Text      ${purchase_order}
    input text      ${purchase_order}      ${orderNo}

Add payment partner of technology cost information
    [Arguments]    ${option1}
    wait until element is visible       ${paymentPartner}       ${wait_time}
    click element       ${paymentPartner}
    Clear Element Text      ${paymentPartner}
    input text      ${paymentPartner}       ${option1}
    Generic.Select parameter    ${option1}

Add cost type of technology cost information
    [Arguments]    ${option2}
    wait until element is visible       ${costType}      ${wait_time}
    click element      ${costType}
    Clear Element Text      ${costType}
    input text      ${costType}       ${option2}
    Generic.Select parameter    ${option2}


Add payment type of technology cost information
    [Arguments]    ${option3}
    wait until element is not visible      ${loaderIcon}      ${wait_time}
    wait until element is enabled       ${paymentType}       ${wait_time}
    click element      ${paymentType}
    Clear Element Text      ${paymentType}
    input text      ${paymentType}       ${option3}
    wait until element is visible       //*[contains(text(), '${option3}')]     ${wait_time}
    click element      //*[contains(text(), '${option3}')]

Add payment peroid of technology cost information
    [Arguments]    ${option4}
    wait until element is enabled       ${paymentPeroid}       ${wait_time}
    click element      ${paymentPeroid}
    Clear Element Text      ${paymentPeroid}
    input text      ${paymentPeroid}     ${option4}
    Generic.Select parameter    ${option4}



Add first payment date of technology cost information
    [Arguments]    ${date}
     Generic.Enter self date       ${first_paymentdate}     ${date}

Click on update button of edit_technology page
    [Arguments]    ${option}
    wait until element is visible       //button[@type='submit'][normalize-space()='${option}']         ${wait_time}
    click element       //button[@type='submit'][normalize-space()='${option}']
# option: Update, Cancel

Add budget payment of technology cost information
    [Arguments]    ${option}
    wait until element is visible    ${budget_payment}      ${wait_time}
    input text      ${budget_payment}      ${option}    #1000


Add actual payment of technology cost information
    [Arguments]    ${option}
    wait until element is visible    ${actual_payment}      ${wait_time}
    input text      ${actual_payment}      ${option}    #1100


Add expense type of technology cost information
    [Arguments]    ${option5}
    wait until element is visible    ${expenseType}      ${wait_time}
    click element       ${expenseType}
    Clear Element Text      ${expenseType}
    input text      ${expenseType}     ${option5}
    Generic.Select parameter    ${option5}


################################### contract information ######################

Add contract Id of contract information random
    wait until element is visible       ${contract_id}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_contractId}=    Catenate    contract_id${random_string}
    input text   ${contract_id}   ${generated_AssetID}
    log to console      ${generated_contractId}
    set global variable    ${generated_contractId}

Add contract Id of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${contract_id}        ${wait_time}
    input text   ${contract_id}   ${option}


Add chargeable basis of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${chargeable_basis}        ${wait_time}
    click element   ${chargeable_basis}
    wait until element is visible       ${chargeable_basis}        ${wait_time}
    input text   ${chargeable_basis}   ${option}
    wait until element is visible    ${chargeable_basis}      ${wait_time}
    click element       ${chargeable_basis}
    Clear Element Text      ${chargeable_basis}
    input text      ${chargeable_basis}     ${option}
    Generic.Select parameter    ${option}

Add cost each of contract information random
    wait until element is visible       ${cost_each}        ${wait_time}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_costEach}=    Catenate    ${random_string}
    input text   ${cost_each}   ${generated_AssetID}
    log to console      ${generated_costEach}
    set global variable    ${generated_costEach}

Add cost each of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${cost_each}        ${wait_time}
    input text   ${cost_each}   ${option}


Add max contracted of contract information random
    wait until element is visible       ${max_contracted}        ${wait_time}
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_maxContracted}=    Catenate    ${random_string}
    input text   ${max_contracted}   ${generated_maxContracted}
    log to console      ${generated_maxContracted}
    set global variable    ${generated_maxContracted}

Add max contracted of contract information self
    [Arguments]    ${option}
    wait until element is visible       ${max_contracted}        ${wait_time}
    input text   ${max_contracted}   ${option}

##############Assignment Information###############
Add assignment information location
    [Arguments]    ${option1}
    wait until element is visible    ${locationName}      ${wait_time}
    click element       ${locationName}
#    Clear Element Text      ${locationName}
    Generic.Enter value into field      ${locationName}     ${option1}
    Press Keys     ${locationName}       ENTER
    Generic.Wait for the spinner to get disable

Add assignment information department name
    [Arguments]    ${option1}
#    wait until element is visible    ${departmentName}      ${wait_time}
    click element       ${departmentName}
#    Clear Element Text      ${departmentName}
    Generic.Enter value into field      ${departmentName}     ${option1}
    Press Keys     ${departmentName}       ENTER
    Generic.Wait for the spinner to get disable

Add assignment information assign to
    [Arguments]    ${option1}   ${option2}
    wait until element is visible   ${assignTo}     ${wait_time}
    wait until element is enabled   ${assignTo}     ${wait_time}
    click element       ${assignTo}
    sleep     5
    Generic.Enter value into field      ${assignTo}     ${option1}
    wait until element is visible     //span[normalize-space()='${option1} ${option2}']      ${wait_time}
    Press keys  ${assignTo}     ENTER
    Generic.Wait for the spinner to get disable

#################Partners Information###############
Add support partner of partners information
    [Arguments]    ${option1}
    wait until element is visible    ${supportPartner}      ${wait_time}
    click element       ${supportPartner}
    Clear Element Text      ${supportPartner}
    Generic.Select parameter    ${option1}

Add supplier of partners information
    [Arguments]    ${option1}
    wait until element is visible    ${supplierPartner}      ${wait_time}
    wait until element is enabled    ${supplierPartner}      ${wait_time}
    click element       ${supplierPartner}
    Clear Element Text      ${supplierPartner}
    Generic.Select parameter    ${option1}


Click on save technology form button
    wait until element is visible       ${saveBTN}       ${wait_time}
    wait until element is enabled       ${saveBTN}       ${wait_time}
    click element       ${saveBTN}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Click on save technology form pop button
    wait until element is visible       ${savePOPup}       ${wait_time}
    wait until element is enabled        ${savePOPup}       ${wait_time}
    click element       ${iamDone_BTN}
    wait until element is not visible       ${shadow}          60


Verify that after saving technology form user redirect to technology page
    wait until element is not visible    ${alert_Msg}       ${wait_time}
    wait until element is enabled       ${alert_Msg}       ${wait_time}
    wait until location contains      technology      ${wait_time}


############ search item in technologies ########################
Search by AssetId
    [Arguments]    ${AssetID}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       ${asset_SearchBar}       ${wait_time}
    Clear Element Text      ${asset_SearchBar}
    input text      ${asset_SearchBar}     ${AssetID}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}
    Wait Until Element Contains    ${fetch_assetID}     ${AssetID}    ${wait_time}
    ${get_assetID} =    get text    ${fetch_assetID}
    log to console     ${get_assetID}
    should be equal    ${get_assetID}     ${AssetID}

#    TechnologyPage.Click on manage technology sub option       Technology List

Search by BrandName
    [Arguments]    ${BrandName}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${asset_SearchBar}     ${wait_time}
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     input text   ${asset_SearchBar}   ${BrandName}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     Fetch the Brand Name from the row   ${BrandName}
     should be equal    ${get_fetch_brandName}     ${BrandName}

Search by ProductName
    [Arguments]    ${product}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${asset_SearchBar}     ${wait_time}
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     input text   ${asset_SearchBar}   ${product}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     Wait Until Element Contains    //td[normalize-space()='${product}']        ${product}     ${wait_time}
     ${get_productID} =    get text    ${fetch_productID}
     log to console     ${get_productID}
     should be equal    ${product}     ${get_productID}

Search by SerialNo
    [Arguments]    ${assertId}  ${serialNo}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${asset_SearchBar}     ${wait_time}
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     input text      ${asset_SearchBar}     ${AssetID}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     Wait Until Element Contains    ${fetch_assetID}     ${AssetID}    ${wait_time}

Search by assignee
     [Arguments]    ${assignee}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible      ${asset_SearchBar}     ${wait_time}
     click element      ${asset_SearchBar}
     Clear Element Text      ${asset_SearchBar}
     input text   ${asset_SearchBar}   ${assignee}
     sleep      ${search_sleep}
     wait until element is visible      //td[normalize-space()='1']     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     Wait Until Element Contains    //td[normalize-space()='${assignee}']        ${assignee}     ${wait_time}
     ${get_assignee} =    get text    ${fetch_assignee}
     log to console     ${get_assignee}
     should be equal    ${assignee}     ${get_assignee}


Click on the first row of the technology table
    wait until element is visible      ${fetch_assetID}     ${wait_time}
    wait until element is enabled      ${fetch_assetID}     ${wait_time}
    click element      ${fetch_assetID}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is not visible       ${shadow}          60

Click on edit button on product details page
    [Arguments]    ${option}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    Generic.click on the button link     ${option}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is not visible       ${shadow}          60

Click on the edit icon on the edit technology page
    wait until element is visible      ${editIcon}     ${wait_time}
    wait until element is enabled      ${editIcon}     ${wait_time}
    click element      ${editIcon}

Click on technology Acknowledgement pop up
    [Arguments]    ${option}
    Generic.click on the button     ${option}

Click on the specific tab
    [Arguments]    ${option}
    wait until element is visible     //ul[@id='mynewTab']//li//a[@href='#${option}']        ${wait_time}
    wait until element is enabled     //ul[@id='mynewTab']//li//a[@href='#${option}']        ${wait_time}
    click element   //ul[@id='mynewTab']//li//a[@href='#${option}']
#options: details, #partners, #location, #parent-components, #components, #messages, #history, #attachments, #inbox, #sent

Verify assetID is visible
    [Arguments]    ${option}
    wait until element is visible       //b[normalize-space()='Asset Id : ${option}']       ${wait_time}

Click on compose message button
    [Arguments]    ${option}
    Generic.click on the button     ${option}     #//button[normalize-space()='Compose Message']


Enter Asset id in compose message
    [Arguments]    ${option}
    wait until element is visible      //div[@class='edit-bill-container']//input[@id='AssetId']        ${wait_time}
    wait until element is enabled      //div[@class='edit-bill-container']//input[@id='AssetId']        ${wait_time}
    input text       //div[@class='edit-bill-container']//input[@id='AssetId']      ${option}

Click on TO of compose message
    wait until element is visible     css:.qa-To input      ${wait_time}
    wait until element is enabled     css:.qa-To input       ${wait_time}
    click element   css:.qa-To input

Select the first value of To dropdown of compose message
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Select compose message status
    [Arguments]    ${option4}
    wait until element is enabled       ${composeMessage_status}       ${wait_time}
    click element      ${composeMessage_status}
    Clear Element Text      ${composeMessage_status}
    input text      ${composeMessage_status}     ${option4}
    Generic.Select parameter    ${option4}

Enter subject of compose message
    [Arguments]    ${option}
    wait until element is visible     ${composeMessage_subject}       ${wait_time}
    wait until element is enabled     ${composeMessage_subject}       ${wait_time}
    input text     ${composeMessage_subject}         ${option}      ${wait_time}
    ${get_messageSubjectValue} =  Set Variable     ${option}
    set global variable    ${get_messageSubjectValue}

Enter message body of compose message
    [Arguments]    ${option}
    wait until element is visible     ${composeMessage_Details}       ${wait_time}
    wait until element is enabled     ${composeMessage_Details}       ${wait_time}
    input text     ${composeMessage_Details}      ${option}      ${wait_time}
    ${get_messageBodyValue} =  Set Variable     ${option}
    set global variable    ${get_messageBodyValue}

Click on the send button of compose message
    wait until element is visible    ${composeMessage_sendBTN}       ${wait_time}
    wait until element is enabled    ${composeMessage_sendBTN}       ${wait_time}
    click element   ${composeMessage_sendBTN}

Verify subject of recent added email
    [Arguments]    ${option}
    wait until element is visible         //label[normalize-space()='${option}']       ${wait_time}

Verify message body of recent added email
    [Arguments]    ${option}
    wait until element is visible         //p[normalize-space()='${option}']       ${wait_time}


Click on add location
    wait until element is visible       css:span[title='Add new location'] a        ${wait_time}
    wait until element is enabled       css:span[title='Add new location'] a        ${wait_time}
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
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     ${technology_address_Lineone}         ${wait_time}
    wait until element is enabled     ${technology_address_Lineone}         ${wait_time}
    click element      ${technology_address_Lineone}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${technology_address_Lineone}     Address_${generate_newaddress_one}
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Enter unique address_two of the location
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     ${technology_address_Linetwo}         ${wait_time}
    wait until element is enabled     ${technology_address_Linetwo}         ${wait_time}
    click element      ${technology_address_Linetwo}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_newaddress_one}=    Catenate    ${random_string}
    input text      ${technology_address_Linetwo}     Address_${generate_newaddress_one}
    log to console      ${generate_newaddress_one}
    set global variable    ${generate_newaddress_one}

Select city of location
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       css:.qa-City input      ${wait_time}
    wait until element is enabled   css:.qa-City input   ${wait_time}
    click element   css:.qa-City input
    Generic.Select parameter        ${address}

Select state of location
    [Arguments]    ${address}
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible       css:.qa-State input      ${wait_time}
    wait until element is enabled   css:.qa-State input   ${wait_time}
    click element   css:.qa-State input
    Generic.Select parameter        ${address}

Enter Zip_code
    [Arguments]     ${code}
    wait until element is visible      ${zip}   ${wait_time}
    wait until element is enabled     ${zip}   ${wait_time}
    click element    ${zip}
    input text  ${zip}    ${code}

Create unique assign to Business_email random
    [Arguments]    ${Fname}    ${domain}
    wait until element is visible       ${businessEmail}     ${wait_time}
    wait until element is enabled       ${businessEmail}     ${wait_time}
    click element   ${businessEmail}
    input text   ${businessEmail}   ${Fname}@${domain}.net
    ${generate_BusinessEmail}=    Catenate    ${Fname}@${Domain}.net
    log to console  ${Fname}@${Domain}.net
    set global variable    ${generate_BusinessEmail}

Create unique assign to employee_ID random
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     ${technology_employeeid}         ${wait_time}
    wait until element is enabled     ${technology_employeeid}         ${wait_time}
    click element      ${technology_employeeid}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_employeeid}=    Catenate    EmployeeID_${random_string}
    set global variable    ${generate_employeeid}
    input text      ${technology_employeeid}     ${generate_employeeid}
    log to console      ${generate_employeeid}
    set global variable    ${generate_employeeid}

Click on refresh location icon
    wait until element is visible       //b[normalize-space()='click here to refresh the location list']       ${wait_time}
    wait until element is enabled       //b[normalize-space()='click here to refresh the location list']       ${wait_time}
    click element       //b[normalize-space()='click here to refresh the location list']
    wait until element is visible       css:span[title='Add new location'] a       ${wait_time}

Enter unique location name random
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_location}=    Catenate    location_${random_string}
    Generic.Enter value into field      css:#locationName        ${generated_location}
    set global variable    ${generated_location}

Save the new added location
    [Arguments]     ${option}
    wait until element is visible       css:.qa-${option}-location       ${wait_time}
    wait until element is enabled       css:.qa-${option}-location       ${wait_time}
    click element       css:.qa-${option}-location
# option: cancel, save

Click on add department
    wait until element is visible       css:span[title='Add new department'] a        ${wait_time}
    wait until element is enabled       css:span[title='Add new department'] a        ${wait_time}
    click element       css:span[title='Add new department'] a

Create unique department name random
    wait until element is visible       ${add_tech_dept_name}        ${wait_time}
    wait until element is enabled       ${add_tech_dept_name}        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_DepartmentNumber}=    Catenate    DeptNo_${random_string}
    input text   ${add_tech_dept_name}   ${generated_DepartmentNumber}
    sleep       ${search_sleep}
    click element     css:div[role='option']
    log to console      ${generated_DepartmentNumber}
    set global variable    ${generated_DepartmentNumber}

Select department cost center
    [Arguments]    ${option}
    wait until element is visible       ${add_tech_dept_costCenter}        ${wait_time}
    wait until element is enabled       ${add_tech_dept_costCenter}        ${wait_time}
    input text    ${add_tech_dept_costCenter}   ${option}

Save the department
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-department-modal        ${wait_time}
    wait until element is enabled       css:.qa-${option}-department-modal        ${wait_time}
    click element        css:.qa-${option}-department-modal
#    wait until element is not visible       ${shadow}          60
# option: add, close

Click on add assign to
    wait until element is visible       css:span[title='Add new assignee'] a        ${wait_time}
    wait until element is enabled       css:span[title='Add new assignee'] a        ${wait_time}
    click element       css:span[title='Add new assignee'] a

Create unique assign to first name random
    wait until element is visible       css:#AssignedFirstName        ${wait_time}
    wait until element is enabled       css:#AssignedFirstName        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assignFname}=    Catenate    Fname_${random_string}
    input text  css:#AssignedFirstName   ${generated_assignFname}
    log to console       ${generated_assignFname}
    set global variable    ${generated_assignFname}

Create unique assign to last name random
    wait until element is visible       css:#AssignedLastName        ${wait_time}
    wait until element is enabled       css:#AssignedLastName        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assignLname}=    Catenate    Lname_${random_string}
    input text   css:#AssignedLastName   ${generated_assignLname}
    log to console      ${generated_assignLname}
    set global variable    ${generated_assignLname}

Save the assign to
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-assignee-modal        ${wait_time}
    wait until element is enabled       css:.qa-${option}-assignee-modal        ${wait_time}
    click element        css:.qa-${option}-assignee-modal
    wait until element is not visible        ${loaderIcon}         ${wait_time}
    wait until element is not visible       ${shadow}          60
# options: save, cancel

Select tab under technology details
    [Arguments]    ${option}
    wait until element is not visible       ${loaderIcon}         ${wait_time}
    wait until element is visible       css:a[href='#${option}']       ${wait_time}
    wait until element is enabled       css:a[href='#${option}']        ${wait_time}
    click element        css:a[href='#${option}']
    sleep   ${search_sleep}
    wait until element is not visible       ${shadow}          60

#options: details,partners,location,parent-components,components,messages,history,attachments

Click on assign partner button under technology details page
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Click on add new entry parent button under technology details page
    [Arguments]     ${option}
    wait until element is visible    //div[@id='parent-components']//button[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled    //div[@id='parent-components']//button[normalize-space()='${option}']      ${wait_time}
    click element      //div[@id='parent-components']//button[normalize-space()='${option}']
#options: Add New Entry, Export

Click on add new entry component button under technology details page
    [Arguments]     ${option}
    wait until element is visible    //div[@id='components']//button[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled    //div[@id='components']//button[normalize-space()='${option}']      ${wait_time}
    click element      //div[@id='components']//button[normalize-space()='${option}']

Select add new entry
    [Arguments]     ${option}
    Generic.click on the button     ${option}
#options: Existing Asset, New Asset

Click here to add support partner
    wait until element is not visible    cs:.qa-assign-support-partner .ng-spinner-loader      ${wait_time}
    click element       css:.qa-click-to-add-partner-support

Click here to add supplier partner
    wait until element is not visible    cs:.qa-assign-supplier-partner .ng-spinner-loader      ${wait_time}
    click element       css:.qa-click-to-add-partner-supplier

Click here to add support partner via technology form
    wait until element is not visible    cs:.qa-add-here-support      ${wait_time}
    click element       css:.qa-add-here-support

Click here to add supplier partner via technology form
    wait until element is not visible    cs:.qa-add-here-supplier      ${wait_time}
    click element       css:.qa-add-here-supplier

Click contact main save button
    wait until element is visible      ${main_Save}       ${wait_time}
    wait until element is enabled      ${main_Save}       ${wait_time}
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
    wait until element is visible    //tr[@class='ng-star-inserted']//td[@data-target='#historyViewPopUp'][normalize-space()='${option}']      ${wait_time}
    wait until element is enabled       //tr[@class='ng-star-inserted']//td[@data-target='#historyViewPopUp'][normalize-space()='${option}']      ${wait_time}

Confirm area changed with view under history tab
    [Arguments]     ${option}
    wait until element is visible       //td[normalize-space()='${option}']//following::a[normalize-space()='View']     ${wait_time}
    wait until element is enabled       //td[normalize-space()='${option}']//following::a[normalize-space()='View']     ${wait_time}
    click element   //td[normalize-space()='${option}']//following::a[normalize-space()='View']
    sleep       ${search_sleep}

Close the view history pop up
    wait until element is visible       ${histortTab_ViewPopUp}      ${wait_time}
    wait until element is enabled       ${histortTab_ViewPopUp}      ${wait_time}
    click element   ${histortTab_ViewPopUp}
    wait until element is not visible       ${histortTab_ViewPopUp}      ${wait_time}
    wait until element is not visible       ${shadow}          60
    sleep   ${search_sleep}


Submit the assign partner form
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Click on upload button under technology history tab
    wait until element is visible       ${attachmentTab_UploadBTN}     ${wait_time}
    wait until element is enabled       ${attachmentTab_UploadBTN}      ${wait_time}
    click element   ${attachmentTab_UploadBTN}

Upload File under technology attachments tab
    wait until element is visible       ${attachmentTab_UploadBTN}     ${wait_time}
    wait until element is enabled       ${attachmentTab_UploadBTN}      ${wait_time}
    Choose File    ${attachmentTab_UploadBTN}    C:\Users\Paramdeep\Downloads\one.pdf


Click the add here link on supplier to add new supplier
    wait until element is visible       css:.qa-add-here-supplier     ${wait_time}
    wait until element is enabled       css:.qa-add-here-supplier      ${wait_time}
    click element   css:.qa-add-here-supplier

Click the add here link on supplier to edit new supplier
    wait until element is visible       css:.theme-blue[routerlink='/dashboard/addpartner/3']    ${wait_time}
    wait until element is enabled       css:.theme-blue[routerlink='/dashboard/addpartner/3']     ${wait_time}
    click element   css:.theme-blue[routerlink='/dashboard/addpartner/3']

Click the add here link on support to add new support partner
    wait until element is visible       css:.qa-add-here-support     ${wait_time}
    wait until element is enabled       css:.qa-add-here-support      ${wait_time}
    click element   css:.qa-add-here-support

Click the add here link on support to edit new support
    wait until element is visible       css:.theme-blue[routerlink='/dashboard/addpartner/4']     ${wait_time}
    wait until element is enabled       css:.theme-blue[routerlink='/dashboard/addpartner/4']      ${wait_time}
    click element   css:.theme-blue[routerlink='/dashboard/addpartner/4']


Click on save product pop inside technology page
    sleep       ${search_sleep}
    wait until element is visible   css:div[class='modal-footer my-1'] button[type='submit']    ${wait_time}
    wait until element is enabled   css:div[class='modal-footer my-1'] button[type='submit']    ${wait_time}
    click element   css:div[class='modal-footer my-1'] button[type='submit']
#    wait until element is not visible       ${shadow}          60

Select product technology group via technology
    [Arguments]    ${option}
    wait until element is visible       css:nz-tree-select[formcontrolname=TechGroupId] input     ${wait_time}
    wait until element is enabled       css:nz-tree-select[formcontrolname=TechGroupId] input     ${wait_time}
    Mouse Over      css:nz-tree-select[formcontrolname=TechGroupId] input
    click element   css:nz-tree-select[formcontrolname=TechGroupId] input
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled      //span[normalize-space()='${option}']       ${wait_time}
    click element       //span[normalize-space()='${option}']

Select product technology type via technology
    [Arguments]    ${option}
    Generic.Scroll the page till    900
    wait until element is visible       ${select_technology_type_via link}     ${wait_time}
    wait until element is enabled       ${select_technology_type_via link}     ${wait_time}
    click element   ${select_technology_type_via link}
    Generic.Select parameter     ${option}

Add product description via technology
    wait until element is visible       ${ProductDescription_viaLink}     ${wait_time}
    wait until element is enabled       ${ProductDescription_viaLink}     ${wait_time}
    input text   ${ProductDescription_viaLink}   This is the description of new product added.


Add product feature via technology
    wait until element is visible       ${ProductFeatures_viaLink}     ${wait_time}
    wait until element is enabled       ${ProductFeatures_viaLink}     ${wait_time}
    input text   ${ProductFeatures_viaLink}   This is the features of new product added.

Renewal Date via technology
    wait until element is visible   css:#RenewalDate     ${wait_time}
    wait until element is enabled   css:#RenewalDate     ${wait_time}
    click element   css:#RenewalDate
    input text  css:#RenewalDate     03/26/2021

Input current Date
    ${current_date1}    Get Current Date    result_format=%m/%d/%Y
    Log To Console     ${current_date1}
    set global variable         ${current_date1}

Input future Date
    ${current_date}=    Get Current Date    result_format=%m/%d/%Y
    Log To Console      Current Date is: ${current_date}

    ${current_date_parts}=    Split String    ${current_date}    -
    ${current_date_without_time}=    Set Variable    ${current_date_parts[0]}

    ${future_date}=    Evaluate    datetime.datetime.strptime($current_date_without_time, "%m/%d/%Y") + datetime.timedelta(days=7)
    ${formatted_future_date}=    Convert Date    ${future_date}    result_format=%m/%d/%Y

    Log To Console      Future Date is: ${formatted_future_date}
    Set Global Variable    ${formatted_future_date}

Enter current or future date as renewal date
    [Arguments]     ${date}
    wait until element is visible   css:#RenewalDate     ${wait_time}
    wait until element is enabled   css:#RenewalDate     ${wait_time}
    Clear Element Text    css:#RenewalDate
    input text   css:#RenewalDate     ${date}
    Clear Element Text    css:#RenewalDate
    input text   css:#RenewalDate     ${date}

Click on action button of technology
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is visible   css:.qa-technology-list-actions      ${wait_time}
    wait until element is enabled   css:.qa-technology-list-actions      ${wait_time}
    click element   css:.qa-technology-list-actions

Choose add technology from action button of technology
    wait until element is visible   css:.qa-add-new-technology      ${wait_time}
    wait until element is enabled   css:.qa-add-new-technology      ${wait_time}
    click element   css:.qa-add-new-technology

Click on Bulk_edit under action button
    wait until element is visible       //a[@title="Bulk Edit"]         ${wait_time}
    wait until element is enabled       //a[@title="Bulk Edit"]         ${wait_time}
    click element       //a[@title="Bulk Edit"]

Click on Bulk_import under action button
    wait until element is visible       css:.add-bulk-member-qa     ${wait_time}
    wait until element is enabled        css:.add-bulk-member-qa     ${wait_time}
    click element         css:.add-bulk-member-qa

Click on Location tab of technology- list page
    wait until element is visible   css:#PrintQrButton   ${wait_time}
    wait until element is enabled   css:#PrintQrButton   ${wait_time}
    wait until element is visible   css:#location-tab   ${wait_time}
    click element   css:#location-tab

Get Value of Assignment Information Location_Department_AssginTo_IDFields
    [Arguments]     ${value}
    wait until element is visible   css:#${value}   ${wait_time}
    ${assign_loc_input_value} =    Get Value    css:#${value}
    Set Global Variable    ${assign_loc_input_value}
    Log To Console    ${assign_loc_input_value}

verify Text from Assignment Information
    [Arguments]     ${original}     ${compared}
    should be equal     ${original}     ${compared}

Verify parameter from past location table
    [Arguments]     ${option}
    wait until element is visible   //td[normalize-space()='${option}']        ${wait_time}

Click on current plan of subscription
    wait until element is visible   //button[normalize-space()='Current Plan']  ${wait_time}
    wait until element is enabled   //button[normalize-space()='Current Plan']  ${wait_time}
    click element   //button[normalize-space()='Current Plan']

Click on plan of subscription
    [Arguments]    ${option}
    wait until element is visible   //h4[normalize-space()='${option}']//parent::div//following-sibling::div//button  ${wait_time}
    wait until element is enabled   //h4[normalize-space()='${option}']//parent::div//following-sibling::div//button  ${wait_time}
    click element       //h4[normalize-space()='${option}']//parent::div//following-sibling::div//button

Select plan for subscription
    [Arguments]    ${option}
    wait until element is visible   //h4[normalize-space()='${option}']//parent::div//following-sibling::div[@class='price-value']//button  ${wait_time}
    wait until element is enabled   //h4[normalize-space()='${option}']//parent::div//following-sibling::div[@class='price-value']//button  ${wait_time}
    click element   //button[normalize-space()='Current Plan']

Click on pop up of available Inactive Asset
    [Arguments]     ${option}
    TRY
    wait until element is visible   css:.qa-available-inactive-assests-${option}   ${wait_time}
    wait until element is enabled   css:.qa-available-inactive-assests-${option}   ${wait_time}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    css:.qa-available-inactive-assests-${option}   ${wait_time}
    wait until element is not visible   ${loaderIcon}     ${wait_time}
    sleep       2
    click element   css:.qa-available-inactive-assests-${option}
    RETURN    ${status}
#    wait until element is not visible       ${shadow}          60
    EXCEPT
    Log    Count is less than the plan value
    END

Select option from exceed asset limit pop
    [Arguments]     ${option}
    wait until element is visible   css:.qa-asset-limit-exceede-${option}  ${wait_time}
    wait until element is enabled   css:.qa-asset-limit-exceede-${option}  ${wait_time}
    click element   css:.qa-asset-limit-exceede-${option}
    wait until element is not visible       ${shadow}          60


Click on removed assets option of technology filters
    wait until element is visible   css:.qa-removed-aasets-section  ${wait_time}
    wait until element is enabled   css:.qa-removed-aasets-section  ${wait_time}
    click element   css:.qa-removed-aasets-section

Click on asset limit exceeded pop up
    wait until element is visible   css:.qa-asset-limit-exceede-technology      ${wait_time}
    wait until element is enabled   css:.qa-asset-limit-exceede-technology      ${wait_time}
    click element   css:.qa-asset-limit-exceede-technology
    wait until element is not visible       ${shadow}          60

Click on proceed button of technology list page
    wait until element is visible   css:.qa-proceed-retore-asset-technology-list      ${wait_time}
    wait until element is enabled   css:.qa-proceed-retore-asset-technology-list      ${wait_time}
    click element   css:.qa-proceed-retore-asset-technology-list

Click on restore button of technology Details Page
    wait until element is visible   css:.qa-restore-assets      ${wait_time}
    wait until element is enabled   css:.qa-restore-assets      ${wait_time}
    click element   css:.qa-restore-assets
    wait until element is not visible   ${loaderIcon}     ${wait_time}
    wait until element is not visible       ${shadow}          60

Click on back to list of technology
    wait until element is visible   ${back_To_List_Link}    ${wait_time}
    wait until element is enabled   ${back_To_List_Link}    ${wait_time}
    click element   ${back_To_List_Link}


Select the check box option from asset wizard
    [Arguments]    ${option}
    wait until element is visible   //b[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //b[normalize-space()='${option}']    ${wait_time}
    click element   //b[normalize-space()='${option}']

Choose filter from Technology Page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //b[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //b[normalize-space()='${option}']    ${wait_time}
    click element   //b[normalize-space()='${option}']

Select checkbox from Agent Filters
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //label[normalize-space()='${option}']//span    ${wait_time}
    wait until element is enabled   //label[normalize-space()='${option}']//span    ${wait_time}
    click element   //label[normalize-space()='${option}']//span

Verify that Agent column should contain text
    [Arguments]     ${option}
    wait until element is visible       css:thead tr       ${wait_time}
    Wait Until Element Contains       css:.table-row    ${option}   ${wait_time}


Click on cross icon of product while editing technology
    wait until element is visible   css:.cross-product      ${wait_time}
    wait until element is enabled   css:.cross-product      ${wait_time}
    click element   css:.cross-product


Click on attachment tab
    wait until element is visible   css:#PrintQrButton   ${wait_time}
    wait until element is enabled   css:#PrintQrButton   ${wait_time}
    wait until element is visible   css:#attachments-tab   ${wait_time}
    sleep   ${search_sleep}
    click element   css:#attachments-tab
#    wait until element is visible   //label[normalize-space()='Upload File']        ${wait_time}
#    wait until element is enabled   //label[normalize-space()='Upload File']        ${wait_time}
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
    wait until element is visible     //p[contains(text(),'${format}')]//parent::div     ${wait_time}
    Mouse Over    //p[contains(text(),'${format}')]//parent::div
    wait until element is visible       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]    ${wait_time}
    wait until element is enabled       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]    ${wait_time}
    click element       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-preview-QA")]

Zoom the Image
    [Arguments]     ${option}
    wait until element is visible       css:.${option}-QA     ${wait_time}
    wait until element is enabled       css:.${option}-QA     ${wait_time}
    Click Element        css:.${option}-QA

Get and Verify the size of the image after zoom
    [Arguments]     ${zoom_type}
    Wait Until Element Is Visible       //img[@alt='Asset Image']       ${wait_time}
    Wait Until Element Is enabled       //img[@alt='Asset Image']       ${wait_time}
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
    Wait Until Element Is Visible    //a[normalize-space()='×']     ${wait_time}
    Wait Until Element Is Enabled    //a[normalize-space()='×']     ${wait_time}
    click element    //a[normalize-space()='×']

Remove the document by clicking on cross-icon
    [Arguments]     ${option}
    Wait Until Element Is Visible    //p[contains(text(),'${option}')]//parent::div//span    ${wait_time}
    Wait Until Element Is Visible    //p[contains(text(),'${option}')]//parent::div//span    ${wait_time}
    Click Element    //p[contains(text(),'${option}')]//parent::div//span

Download the file by clicking on download icon over file
    [Arguments]     ${format}
    wait until element is visible     //p[contains(text(),'${format}')]//parent::div//img    ${wait_time}
    Mouse Over    //p[contains(text(),'${format}')]//parent::div//img
    wait until element is visible       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]    ${wait_time}
    wait until element is enabled       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]   ${wait_time}
    click element       //p[contains(text(),'${format}')]//parent::div//i[contains(@class,"open-image-download-QA")]

click on bulk import under action button of technology
    wait until element is visible       css:.add-bulk-member-qa     ${wait_time}
    wait until element is enabled       css:.add-bulk-member-qa     ${wait_time}
    click element   css:.add-bulk-member-qa

Click on clone button on techonology details page
    [Arguments]    ${option}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    Generic.click on the button link     ${option}
    wait until element is not visible      ${loaderIcon}    ${wait_time}
    wait until element is not visible       ${shadow}          60


#Check current directory path
#    Log To Console    ${CURDIR}


Get Parent Directory Up To Root
    [Arguments]    ${path}
    ${parent_dir} =    Evaluate    os.path.dirname(os.path.dirname(os.path.abspath('${path}')))    os
    RETURN    ${parent_dir}


Click on advanced search button link under add technology
    wait until element is visible   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']       ${wait_time}
    wait until element is enabled   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']       ${wait_time}
    click element   css:div[class='row ng-star-inserted'] a[title='Click here to Advance search']
    wait until element is not visible      ${loaderIcon}    ${wait_time}


Click on the row of the table inside advanced search
    Execute JavaScript    document.querySelector('.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(3)').scrollIntoView(true);
    Click Element    css:.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(5) > td:nth-child(1)

Fetch the Brand Name from the brand field
    Wait Until Element Is Visible        //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]    ${wait_time}
    Wait Until Element Is Enabled        //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]    ${wait_time}
    ${brand_name} =    Get text     //input[@id='brandselect']//parent::div//preceding-sibling::div//span[2]
    Log to console   Brand Name: ${brand_name}
    set global variable     ${brand_name}

Click technology advanced brand input field
    wait until element is enabled       css:#advaceBrand        ${wait_time}
    click element    css:#advaceBrand

Select parameter from advanced brand dropdown list
    [Arguments]    ${option}
    Clear Element Text      css:#advaceBrand
    input text    css:#advaceBrand   ${option}
    Generic.Select parameter    ${option}

Click technology advanced technology type and group input field
    [Arguments]     ${option1}
    wait until element is enabled       css:#${option1}        ${wait_time}
    click element    css:#${option1}


Select parameter from advanced technology type dropdown list
    [Arguments]    ${option1}    ${option}
    Clear Element Text      css:#${option1}
    input text    css:#${option1}   ${option}
    Generic.Select parameter    ${option}

Fetch the technology type from the technology type field
    Wait Until Element Is Visible        //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]    ${wait_time}
    Wait Until Element Is Enabled        //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]    ${wait_time}
    ${Technology_type} =    Get text     //input[@id='selectTypeName']//parent::div//preceding-sibling::div//span[2]
    Log to console   Technology Type: ${Technology_type}
    set global variable     ${Technology_type}

Get text of technology group inside add technology
    wait until element is visible   css:.ant-select-selection-item   ${wait_time}
    wait until element is enabled   css:.ant-select-selection-item   ${wait_time}
    ${Technology_group} =    Get text    css:.ant-select-selection-item
    Set Global Variable    ${Technology_group}
    Log To Console    Technology Group: ${Technology_group}

Enter product in the product input field
    [Arguments]     ${product}
    wait until element is visible   //input[@formcontrolname='ProductContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='ProductContaining']     ${wait_time}
    click element   //input[@formcontrolname='ProductContaining']
    input text      //input[@formcontrolname='ProductContaining']     ${product}

Get text of product inside add technology
    wait until element is visible   //tbody//tr[1]//td[1]   ${wait_time}
    wait until element is enabled   //tbody//tr[1]//td[1]  ${wait_time}
    ${product} =    Get text    //tbody//tr[1]//td[1]
    Set Global Variable    ${product}
    Log To Console    Product: ${product}

Enter description in the description input field
    [Arguments]     ${description}
    wait until element is visible   //input[@formcontrolname='DescriptionContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='DescriptionContaining']     ${wait_time}
    click element   //input[@formcontrolname='DescriptionContaining']
    input text      //input[@formcontrolname='DescriptionContaining']     ${description}

Get text of description inside add technology
    wait until element is visible   //tbody//tr[1]//td[2]   ${wait_time}
    wait until element is enabled   //tbody//tr[1]//td[2]  ${wait_time}
    ${description} =    Get text    //tbody//tr[1]//td[2]
    Set Global Variable   ${description}
    Log To Console    Description: ${description}

Enter feature in the description input field
    [Arguments]     ${feature}
    wait until element is visible   //input[@formcontrolname='FeatureContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='FeatureContaining']     ${wait_time}
    click element   //input[@formcontrolname='FeatureContaining']
    input text      //input[@formcontrolname='FeatureContaining']     ${feature}

Get text of feature inside add technology
    wait until element is visible   //tbody//tr[1]//td[3]   ${wait_time}
    wait until element is enabled   //tbody//tr[1]//td[3]  ${wait_time}
    ${feature} =    Get text    //tbody//tr[1]//td[3]
    Set Global Variable  ${feature}
    Log To Console    Feature: ${feature}

Enter product in the product not containing input field
    [Arguments]     ${Product}
    wait until element is visible   css:input[formcontrolname='ProductNotContaining']     ${wait_time}
    wait until element is enabled   css:input[formcontrolname='ProductNotContaining']     ${wait_time}
    click element   css:input[formcontrolname='ProductNotContaining']
    input text      css:input[formcontrolname='ProductNotContaining']     ${Product}

Wait until advanced search table get load
    wait until element is visible       //div[@class='table-responsive table-scrollable table-column-common ng-star-inserted']      120

Search by Product Version
    [Arguments]    ${software_version}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       ${asset_SearchBar}       ${wait_time}
    Clear Element Text      ${asset_SearchBar}
    input text      ${asset_SearchBar}     ${software_version}
    sleep       ${search_sleep}

Verify that product version on technology details page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible       //input[@id='Product Version']      ${wait_time}
    ${value_product_version}        Get Value        //input[@id='Product Version']
    Log To Console    ${value_product_version}
    Should Be Equal    ${value_product_version}    ${result}

Click on the technology group row of the table inside advanced search
    Execute JavaScript    document.querySelector('.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(1)').scrollIntoView(true);
    Click Element    css:.bg-white.location-list-qa.ng-star-inserted > tr:nth-child(1) > td:nth-child(1)

Get And Verify The Count Of existing asset of parent
    ${element_count}=    Get Element Count    //tbody/tr/td/label/span
    Log to console      ${element_count}

    FOR    ${index}    IN RANGE    1    ${element_count + 1}
        Wait Until Element Is Visible   //tbody/tr[${index}]/td/label/span      ${wait_time}
        Wait Until Element Is enabled   //tbody/tr[${index}]/td/label/span      ${wait_time}
#       click element   //tbody/tr[${index}]/td/label/span
       Execute JavaScript    document.querySelector('tbody > tr:nth-child(${index}) > td > label > span').click();
    END

Click on the export button of parent tab under technology details page
   wait until element is visible   //div[@id='parent-components']//button[@id='dropdownMenuButton']     ${wait_time}
    wait until element is enabled   //div[@id='parent-components']//button[@id='dropdownMenuButton']     ${wait_time}
    sleep       ${search_sleep}
    click element   //div[@id='parent-components']//button[@id='dropdownMenuButton']

Download the selected extension file of parent under technology details
    [Arguments]    ${option}
    wait until element is visible   //div[@class='dropdown-menu show']//a[contains(text(),'${option}')]     ${wait_time}
    wait until element is enabled   //div[@class='dropdown-menu show']//a[contains(text(),'${option}')]     ${wait_time}
    click element   //div[@class='dropdown-menu show']//a[contains(text(),'${option}')]

Click on the export button of deatils tab under technology details page
    wait until element is visible   //div[@id='details']//button[@id='dropdownMenuButton']     ${wait_time}
    wait until element is enabled   //div[@id='details']//button[@id='dropdownMenuButton']     ${wait_time}
    sleep       ${search_sleep}
    click element   //div[@id='details']//button[@id='dropdownMenuButton']

Click on the export button of component tab under technology details page
    wait until element is visible   //div[@id='components']//button[@id='dropdownMenuButton']     ${wait_time}
    wait until element is enabled   //div[@id='components']//button[@id='dropdownMenuButton']     ${wait_time}
    sleep       ${search_sleep}
    click element   //div[@id='components']//button[@id='dropdownMenuButton']
    wait until element is not visible    ${loaderIcon}      ${wait_time}


Click button to proceed the asset restore
   wait until element is visible    css:.qa-proceed-retore-asset-technology-list     ${wait_time}
    wait until element is enabled   css:.qa-proceed-retore-asset-technology-list   ${wait_time}
    click element   css:.qa-proceed-retore-asset-technology-list

Click button to cancle the asset restoration
   wait until element is visible    css:.qa-cancel-asset-technology-list     ${wait_time}
    wait until element is enabled   css:.qa-cancel-asset-technology-list  ${wait_time}
    click element   css:.qa-cancel-asset-technology-list

#Enter input in the not containing productv field
#    [Arguments]     ${Product}
#    wait until element is visible   //input[@formcontrolname='ProductNotContaining']     ${wait_time}
#    wait until element is enabled   //input[@formcontrolname='ProductNotContaining']     ${wait_time}
#    click element   //input[@formcontrolname='ProductNotContaining']
#    input text      //input[@formcontrolname='ProductNotContaining']     ${Product}
#
#Enter input in the not containing description field
#    [Arguments]     ${Description_not_containing}
#    wait until element is visible   //input[@formcontrolname='DescriptionNotContaining']     ${wait_time}
#    wait until element is enabled   //input[@formcontrolname='DescriptionNotContaining']    ${wait_time}
#    click element   //input[@formcontrolname='DescriptionNotContaining']
#    input text      //input[@formcontrolname='DescriptionNotContaining']     ${Description_not_containing}
#
#Enter input in the not containing feature field
#    [Arguments]     ${Feature_not_containing}
#    wait until element is visible   //input[@formcontrolname='FeatureNotContaining']     ${wait_time}
#    wait until element is enabled   //input[@formcontrolname='FeatureNotContaining']    ${wait_time}
#    click element   //input[@formcontrolname='FeatureNotContaining']
#    input text     //input[@formcontrolname='FeatureNotContaining']     ${Feature_not_containing}

Enter input in the not containing product field
    [Arguments]     ${Product}
    wait until element is visible   //input[@formcontrolname='ProductNotContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='ProductNotContaining']     ${wait_time}
    click element   //input[@formcontrolname='ProductNotContaining']
    input text      //input[@formcontrolname='ProductNotContaining']     ${Product}

Enter input in the not containing description field
    [Arguments]     ${Description_not_containing}
    wait until element is visible   //input[@formcontrolname='DescriptionNotContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='DescriptionNotContaining']    ${wait_time}
    click element   //input[@formcontrolname='DescriptionNotContaining']
    input text      //input[@formcontrolname='DescriptionNotContaining']     ${Description_not_containing}

Enter input in the not containing feature field
    [Arguments]     ${Feature_not_containing}
    wait until element is visible   //input[@formcontrolname='FeatureNotContaining']     ${wait_time}
    wait until element is enabled   //input[@formcontrolname='FeatureNotContaining']    ${wait_time}
    click element   //input[@formcontrolname='FeatureNotContaining']
    input text     //input[@formcontrolname='FeatureNotContaining']     ${Feature_not_containing}

Click on the technology group row of the table inside advanced search of not conrtaining fields
    Execute JavaScript    document.querySelector('.bg-white.location-list-qa >tr:nth-child(3) >td:nth-child(2) >div').scrollIntoView(true);
    Click Element    css:.bg-white.location-list-qa >tr:nth-child(2) >td:nth-child(2) >div

Click on reset icon while adding technology
    wait until element is visible   css:.position-absolute.position-reset      ${wait_time}
    wait until element is enabled   css:.position-absolute.position-reset     ${wait_time}
    click element   css:.position-absolute.position-reset
    sleep   ${search_sleep}

Verify the invisibility of product after clicking on cross icon
    wait until element is not visible   //div[contains(@class,'full-width-field')]//label[normalize-space()='Product']//following-sibling::input[@title='ZZ123 - Zz - Zz']      ${wait_time}

Verify the invisibility of brand after clicking on reset icon
    wait until element is visible      //ng-select[contains(@class,'qa-brands')]//div//div//div[normalize-space()='Select or Search Brand']      ${wait_time}

Verify the invisibility of technology type after clicking on reset icon
    wait until element is not visible      //div[contains(@class,'full-width-field')]//ng-select[contains(@class,'qa-TechType')]//following-sibling::div//span[normalize-space()='Hardware']      ${wait_time}

Verify the visibility of assign to field
    wait until element is visible   //div[@class='full-width-field']//following-sibling::div//span[normalize-space()='John Abram']       ${wait_time}
    wait until element is enabled   //div[@class='full-width-field']//following-sibling::div//span[normalize-space()='John Abram']        ${wait_time}

Enter input in the cancellation notice period field
    [Arguments]     ${cancellation}
    wait until element is visible   css:#TECHDYNA_12     ${wait_time}
    wait until element is enabled   css:#TECHDYNA_12    ${wait_time}
    click element   css:#TECHDYNA_12
    clear element text      css:#TECHDYNA_12
    input text      css:#TECHDYNA_12     ${cancellation}

Verify the validation when entering negative value in cancellation notice period field
    wait until element is visible   //span[contains(text(),' Please enter natural numbers only.')]    ${wait_time}
    wait until element is enabled   //span[contains(text(),' Please enter natural numbers only.')]    ${wait_time}

Verify status is visible of added technology
    wait until element is visible   //td[normalize-space()='Active']    ${wait_time}

Get Inner Text of Brand under product information tab
   ${input_text}=    Execute JavaScript    return document.querySelector("input[id*='BrandName']").value
    Log To Console    Inner Text of Input Field: ${input_text}
    set global variable     ${input_text}
    should be equal    ${input_text}     ${generated_BrandName}

Wait until brand loder is invisible
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     wait until element is not visible   //input[@id='brandselect']//ancestor::ng-select[@id='BrandName']//following-sibling::div[contains(@class,'spinner-loader')]    ${wait_time}

Get inner text of description under product information
    ${textarea_value}=    Get Value    css=div[class*='welcome-main'] textarea#ProductDescription
    Log To Console    Value of Textarea: ${textarea_value}
    set global variable     ${textarea_value}
    should be equal    ${textarea_value}     This is the description of new product added.

Get Inner Text of Product under product information tab
   ${input_text}=    Execute JavaScript    return document.querySelector("input[id*='ProductId']").value
    Log To Console    Inner Text of Input Field: ${input_text}
    set global variable     ${input_text}
    should be equal    ${input_text}     ${generated_product}

Get inner text of feature under product information
    ${textarea_value}=    Get Value    css=div[class*='welcome-main'] textarea#ProductFeatures
    Log To Console    Value of Textarea: ${textarea_value}
    set global variable     ${textarea_value}
    should be equal    ${textarea_value}     This is the features of new product added.

Fetch the date from renewal date in add technology
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       ${renewal_date}     ${wait_time}
    ${fetch_renewal_date}=      Get value          ${renewal_date}
    log to console      ${fetch_renewal_date}
    set global variable     ${fetch_renewal_date}

Change contract end date
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}   ${wait_time}
    wait until element is visible       ${Contract_endDate}     ${Wait_time}
    clear element text      ${Contract_endDate}
    input text      ${Contract_endDate}         ${option}
    Press keys    ${Contract_endDate}   TAB

Compare Renewal date and contract end date in add technology
    [Arguments]     ${option1}      ${option2}
    should be equal    ${option1}          ${option2}

Verify Renewal date and contract end date are not equal
    [Arguments]     ${option1}      ${option2}
    should not be equal    ${option1}          ${option2}

Fetch contract end date from technology details page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       ${Contract_endDate}     ${wait_time}
    ${details_contract_date}=      Get value            ${Contract_endDate}
    log to console      ${details_contract_date}
    set global variable     ${details_contract_date}

Fetch renewal date from technology details page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       css:#renewalDate     ${wait_time}
    ${details_renewal_date}=      Get value           css:#renewalDate
    log to console      ${details_renewal_date}
    set global variable     ${details_renewal_date}

Compare Renewal date and contract end date on Technology details page
    should be equal     ${details_contract_date}        ${details_renewal_date}

Verify warning pop-up is visible when change contract end date
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       //div[@id='renewalDateWarning']//div[contains(@class,'modal-content')]     ${wait_time}
    wait until element is enabled       //div[@id='renewalDateWarning']//div[contains(@class,'modal-content')]     ${wait_time}

Verify pop-up is invisible
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is not visible       //div[@id='renewalDateWarning']//div[contains(@class,'modal-content')]     ${wait_time}

Close the warning contract date pop-up
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible     //div[@id='renewalDateWarning']//button[@class='close']     ${wait_time}
    wait until element is enabled     //div[@id='renewalDateWarning']//button[@class='close']     ${wait_time}
#    sleep       2
    click element       //div[@id='renewalDateWarning']//button[@class='close']

Select option from contract end date warning pop-up
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible     css:.qa-${option}-export     ${wait_time}
    wait until element is enabled     css:.qa-${option}-export     ${wait_time}
#    sleep       ${search_sleep}
    click element       css:.qa-${option}-export
# confirm, close

Search by hostname
    [Arguments]     ${name}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible       ${asset_SearchBar}       ${wait_time}
    Clear Element Text      ${asset_SearchBar}
    input text      ${asset_SearchBar}     ${name}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Select particular technology group via link while adding technology
    [Arguments]    ${option}
    wait until element is visible       css:nz-tree-select[formcontrolname=TechGroupId] input     ${wait_time}
    wait until element is enabled       css:nz-tree-select[formcontrolname=TechGroupId] input     ${wait_time}
    click element   css:nz-tree-select[formcontrolname=TechGroupId] input
    input text      css:nz-tree-select[formcontrolname=TechGroupId] input       ${option}
    wait until element is visible      //span[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled      //span[normalize-space()='${option}']       ${wait_time}
    click element       //span[normalize-space()='${option}']


Click on message tab of technology- list page
    wait until element is visible   css:#PrintQrButton   ${wait_time}
    wait until element is enabled   css:#PrintQrButton   ${wait_time}
    wait until element is visible   css:#messages-tab   ${wait_time}
    click element   css:#messages-tab

Enter input in the recipient list field under compose message via technology details
    [Arguments]     ${message}
    wait until element is visible      //input[@id='to']     ${wait_time}
    wait until element is visible      //input[@id='to']      ${wait_time}
    click element   //input[@id='to']
    input text      //input[@id='to']       ${message}
    wait until element is visible     //span[contains(@title,'${message}')]    ${wait_time}
    wait until element is visible      //span[contains(@title,'${message}')]      ${wait_time}
    click element       //span[contains(@title,'${message}')]

Get the text of the recent notification of added assets
    [Arguments]      ${option}
    wait until element is visible       css:#assetsAlert >div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)     ${wait_time}
    wait until element is enabled       css:#assetsAlert >div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)     ${wait_time}
    ${notification} =    get text    css:#assetsAlert >div>.notifications-container >ul>li:nth-child(1)>div:nth-child(1)
    set global variable     ${notification}
    log to console     ${notification}
    should be equal    ${notification}     ${option}

Click on the asset alert option under notifications
    wait until element is visible      //a[@id='assets-alert']     ${wait_time}
    wait until element is visible     //a[@id='assets-alert']     ${wait_time}
    click element   //a[@id='assets-alert']

Enter input in the message status field under compose message via technology detail
    [Arguments]     ${message_status}
    wait until element is visible      //input[@id='messageStatus']     ${wait_time}
    wait until element is visible      //input[@id='messageStatus']      ${wait_time}
    click element   //input[@id='messageStatus']
    input text     //input[@id='messageStatus']       ${message_status}
    wait until element is visible     //span[normalize-space()='${message_status}']    ${wait_time}
    wait until element is visible     //span[normalize-space()='${message_status}']      ${wait_time}
    click element       //span[normalize-space()='${message_status}']

Click on Print QR button
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible     css:#PrintQrButton      ${wait_time}
    wait until element is enabled     css:#PrintQrButton      ${wait_time}
    sleep       ${search_sleep}
    click element       css:#PrintQrButton

Select option by clicking on Print QR button
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Generic.click on the button link        ${option}

Confirm to download QR file
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible     //div[@id='downloadQrCode']//button[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled     //div[@id='downloadQrCode']//button[normalize-space()='${option}']      ${wait_time}
    sleep    ${search_sleep}
    click element       //div[@id='downloadQrCode']//button[normalize-space()='${option}']
    Wait Until Element Is Not Visible    ${shadow}        ${wait_time}

click on the three dots inside table of parent tab from tehnology details page
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible     //tbody//i      ${wait_time}
    wait until element is enabled     //tbody//i      ${wait_time}
    click element       //tbody//i

Select option from three-dots from technology details page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible     //a[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled     //a[normalize-space()='${option}']      ${wait_time}
    sleep       ${search_sleep}
    Mouse Over       //a[normalize-space()='${option}']

Select the format to download QR
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible     //li[@class='dropdown-item']//a[contains(text(),'${option}')]      ${wait_time}
    wait until element is enabled     //li[@class='dropdown-item']//a[contains(text(),'${option}')]      ${wait_time}
    click element       //li[@class='dropdown-item']//a[contains(text(),'${option}')]

Scroll the element into view
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible    //div[@id='components']//h6[normalize-space()='Hardware']      ${wait_time}
    wait until element is enabled    //div[@id='components']//h6[normalize-space()='Hardware']      ${wait_time}
    scroll element into view       //div[@id='components']//h6[normalize-space()='Hardware']

Click on the filters under technology page
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
    Wait until element is visible    //div[contains(@class,'technology position-relative')]//b[normalize-space()='${option}']      ${wait_time}
    wait until element is enabled    //div[contains(@class,'technology position-relative')]//b[normalize-space()='${option}']      ${wait_time}
    click element      //div[contains(@class,'technology position-relative')]//b[normalize-space()='${option}']

Click on the value under the filters of technology page
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
     Wait until element is visible    //div[contains(@class,'technology position-relative')]//label[normalize-space()='${option}']        ${wait_time}
     wait until element is enabled    //div[contains(@class,'technology position-relative')]//label[normalize-space()='${option}']      ${wait_time}
     click element      //div[contains(@class,'technology position-relative')]//label[normalize-space()='${option}']

Get the text of selected filter under technology
    [Arguments]     ${option}
    wait until element is visible      //div[contains(@class,'technology position-relative')]//label[normalize-space()='${option}']    ${wait_time}
    ${fetch_Name_of_selected_filter} =    get text    //div[contains(@class,'technology position-relative')]//label[normalize-space()='${option}']
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_filter}
    ${New_Name}=    Evaluate    '${original_string}'.strip()
    log to console    ${New_Name}
    set global variable    ${New_Name}

Click on the value under the tech typen filters of technology page
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
     Wait until element is visible   //div[contains(@class,'technology position-relative')]//following-sibling::div//label[normalize-space()='${option}']        ${wait_time}
     wait until element is enabled     //div[contains(@class,'technology position-relative')]//following-sibling::div//label[normalize-space()='${option}']      ${wait_time}
     click element       //div[contains(@class,'technology position-relative')]//following-sibling::div//label[normalize-space()='${option}']

Click on the tech type filter under technology
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
     Wait until element is visible   //div[contains(@class,'technology position-relative')]//following-sibling::div//b[normalize-space()='${option}']        ${wait_time}
     wait until element is enabled     //div[contains(@class,'technology position-relative')]//following-sibling::div//b[normalize-space()='${option}']      ${wait_time}
     click element       //div[contains(@class,'technology position-relative')]//following-sibling::div//b[normalize-space()='${option}']

Click on the value under filters for selecting random value
    [Arguments]     ${option}
     Wait Until Element Is Not Visible    ${loaderIcon}        ${wait_time}
     Wait until element is visible   (//div[contains(@class,'technology position-relative')]//following-sibling::div//label)[${option}]        ${wait_time}
     wait until element is enabled    (//div[contains(@class,'technology position-relative')]//following-sibling::div//label)[${option}]      ${wait_time}
     click element       (//div[contains(@class,'technology position-relative')]//following-sibling::div//label)[${option}]

Get the text of the value you selected under filter
    [Arguments]     ${option}
    wait until element is visible      (//div[contains(@class,'technology position-relative')]//following-sibling::div//label)[${option}]    ${wait_time}
    ${fetch_Name_of_selected_random_filter} =    get text    (//div[contains(@class,'technology position-relative')]//following-sibling::div//label)[${option}]
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_random_filter}
    ${random_Name}=    Evaluate    '${original_string}'.strip()
    log to console    ${random_Name}
    set global variable    ${random_Name}

Click on the product field under add technology
    [Arguments]        ${product}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input      ${wait_time}
    wait until element is enabled   //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input     ${wait_time}
    Clear Element Text    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input
    click element    //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input
    input text       //div[contains(@class,'full-width-field')]//label[normalize-space()="Product"]//following-sibling::input       ${product}
    Wait Until Element Is Visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]       ${wait_time}
    Wait Until Element Is not Visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]       ${wait_time}



Method 1
    [Arguments]    ${option}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //td[normalize-space()='${option}']   ${wait_time}
    Set Global Variable    ${status}
    RETURN    ${status}


Get new product
    [Arguments]         ${option}   ${option1}   ${option2}
    TRY
         wait until element is visible   //td[normalize-space()='${option}']   ${wait_time}
         Set Global Variable    ${status}   False
         TechnologyPage.Redirect to technology page
    EXCEPT
        Run Keyword If    ${status} == True
        ...    TechnologyPage.Skip case
        ...    ELSE  Run Keywords     TechnologyPage.Create the product     ${option}   ${option1}   ${option2}
        ...    AND    Return From Keyword
    END



Skip case
     log   Element is already there
     Generic.select the option from the side menu    Technology
     Generic.Verify your current page location contains      technology

Create the product
    [Arguments]         ${option}     ${option1}   ${option2}
    PartnersPage.Click here to add link of contract details
    DashboardPage.Create static product via link        ${option}
    DashboardPage.Add product brand name      QABrand555
    TechnologyPage.Add product description via technology
    TechnologyPage.Add product feature via technology
    TechnologyPage.Select product technology type via technology     ${option1}
    TechnologyPage.Select product technology group via technology   ${option2}
    TechnologyPage.Click on save product pop inside technology page
    Generic.Fetch alert message text and compare it with    Product created successfully
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Fetch the description from the technology details page
    wait until element is visible       //span[contains(@class,'description-container')]//b     ${wait_time}
    wait until element is enabled        //span[contains(@class,'description-container')]//b    ${wait_time}
    ${get_description} =    get text    //span[contains(@class,'description-container')]//b
    set global variable    ${get_description}
    log to console     ${get_description}

Redirect to technology page
    wait until element is visible     //span[contains(text(),'Back to Manage Technology')]     ${wait_time}
    wait until element is enabled      //span[contains(text(),'Back to Manage Technology')]     ${wait_time}
    click element    //span[contains(text(),'Back to Manage Technology')]

#Run Code Based On Element Visibility
#    ${is_visible}=    Run Keyword And Return Status    TechnologyPage.Click on pop up of available Inactive Asset   cancel
#
#    Run Keyword If    ${is_visible}    TechnologyPage.Section 1 Code
#    ...    ELSE    TechnologyPage.Section 2 Code
#
#Section 1 Code
#    Log To Console    section one run successfully
#
#Section 2 Code
#    Log To Console    section two run successfully