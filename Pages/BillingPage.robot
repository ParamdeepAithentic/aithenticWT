*** Settings ***
Documentation     Contains all keyword of Two Factor Authentication page
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
${billing_details_arrow}     css:.d-block span i
${billing_add_new_card}     css:.qa-add-new-card-bank
${ach_account_number}     css:#accountNumber
${ach_routing_number}     css:#routingNumber
${ach_name}     css:#name


${billing_future_trans_line}     css:.qa-future
${billing_trash_icon}     css:.fa-trash-alt


*** Keywords ***
Click on the arrow of billing details
    Wait Until Element Is Visible       ${billing_details_arrow}    ${wait_time}
    Wait Until Element Is Enabled       ${billing_details_arrow}     ${wait_time}
    click element       ${billing_details_arrow}

Click on add new card/bank
    Wait Until Element Is Visible       ${billing_add_new_card}     ${wait_time}
    Wait Until Element Is Enabled       ${billing_add_new_card}      ${wait_time}
    click element      ${billing_add_new_card}

Select the billing payment type
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.fa-${option}    ${wait_time}
    Wait Until Element Is Enabled       css:.fa-${option}     ${wait_time}
    click element       css:.fa-${option}
#options: credit-card, university

Enter billing account number
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_account_number}       ${option}

Enter billing routing number
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_routing_number}        ${option}

Enter billing account type
    [Arguments]    ${option}
    Generic.Enter value into field  ${ach_name}       ${option}

Save the billing payment form
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.qa-payment-form-${option}    ${wait_time}
    Wait Until Element Is Enabled       css:.qa-payment-form-${option}     ${wait_time}
    click element       css:.qa-payment-form-${option}
#options: save, cancel

Save the status of set as primary account
    [Arguments]    ${option}
    sleep       ${search_sleep}
    Wait Until Element Is Visible       css:.qa-${option}-cancel-make-card-primary    ${wait_time}
    Wait Until Element Is Enabled       css:.qa-${option}-cancel-make-card-primary    ${wait_time}
    click element       css:.qa-${option}-cancel-make-card-primary
#options: cancel,confirm

Confirm if you want to delect account
    [Arguments]    ${option}
    sleep       ${search_sleep}
    Wait Until Element Is Visible       css:.qa-${option}-cancel-make-card-primary    ${wait_time}
    Wait Until Element Is Enabled       css:.qa-${option}-cancel-make-card-primary     ${wait_time}
    click element       css:.qa-${option}-cancel-make-card-primary
#options: cancel,confirm

Close the billing payment options module
    Wait Until Element Is Visible       css:div[id='updateCard'] button[aria-label='Close'] span    ${wait_time}
    Wait Until Element Is Enabled       css:div[id='updateCard'] button[aria-label='Close'] span     ${wait_time}
    click element       css:div[id='updateCard'] button[aria-label='Close'] span
    wait until element is not visible       ${shadow}          ${wait_time}


Click on future transaction link
    Wait Until Element Is Visible       ${billing_future_trans_line}   ${wait_time}
    Wait Until Element Is Enabled       ${billing_future_trans_line}     ${wait_time}
    click element      ${billing_future_trans_line}

Click on billing trash to remove card
    Wait Until Element Is Visible       ${billing_trash_icon}   ${wait_time}
    Wait Until Element Is Enabled       ${billing_trash_icon}    ${wait_time}
    click element      ${billing_trash_icon}

Click on the invoice history tab under billing
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     css:#history   ${wait_time}
    wait until element is enabled      css:#history    ${wait_time}
    click element    css:#history
    wait until element is not visible       ${loaderIcon}    ${wait_time}

Click on the pdf option under the table of invoice
    wait until element is visible     //tbody//tr[1]//td[3]   ${wait_time}
    wait until element is enabled      //tbody//tr[1]//td[3]    ${wait_time}
    click element    //tbody//tr[1]//td[3]
#    wait until element is not visible       ${loaderIcon}    ${wait_time}

Enter input in address line1 under billing
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible       css:#addressLine1     ${wait_time}
    wait until element is enabled       css:#addressLine1      ${wait_time}
    click element   css:#addressLine1
    clear element text   css:#addressLine1
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_address_one_billing}=    Catenate    ${random_string}
    input text      css:#addressLine1      Address_${generate_address_one_billing}
    log to console      ${generate_address_one_billing}
    set global variable   ${generate_address_one_billing}

Enter input in address line2 under billing
    wait until element is visible       css:#addressLine2     ${wait_time}
    wait until element is enabled       css:#addressLine2      ${wait_time}
    click element   css:#addressLine2
    clear element text   css:#addressLine2
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_address_two_billing}=    Catenate    ${random_string}
    input text      css:#addressLine2      Address_${generate_address_two_billing}
    log to console      ${generate_address_two_billing}
    set global variable   ${generate_address_two_billing}

Select billing country under billing tab
    [Arguments]    ${country}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible       css:#billing-country        ${wait_time}
    wait until element is enabled       css:#billing-country          ${wait_time}
    click element   css:#billing-country
    Clear element text      css:#billing-country
    input text   css:#billing-country     ${country}
    Generic.Select parameter    ${country}

Select billing state under billing tab
    [Arguments]    ${state}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible       css:#billing-state        ${wait_time}
    wait until element is enabled       css:#billing-state          ${wait_time}
    click element   css:#billing-state
    input text   css:#billing-state     ${state}
    Generic.Select parameter    ${state}

Select billing city under billing tab
    [Arguments]    ${city}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible       css:#billing-city        ${wait_time}
    wait until element is enabled       css:#billing-city          ${wait_time}
    click element   css:#billing-city
    input text   css:#billing-city     ${city}
    wait until element is visible       //span[@title='${city}']        ${wait_time}
    wait until element is enabled       //span[@title='${city}']          ${wait_time}
    click element       //span[@title='${city}']

Add new zip code of billing
    [Arguments]     ${code}
    wait until element is not visible       ${loaderIcon}    ${wait_time}
    wait until element is visible     css:#zipCode   ${wait_time}
    wait until element is enabled      css:#zipCode    ${wait_time}
    clear element text      css:#zipCode
    click element    css:#zipCode
    input text   css:#zipCode    ${code}

Get the value of team member under billing
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //div[normalize-space()='Team Members']//following-sibling::div//h4   ${wait_time}
    ${Team_member_billing_string} =    Get text   //div[normalize-space()='Team Members']//following-sibling::div//h4
    ${tam_member_billing_int}=   Convert To Integer   ${Team_member_billing_string}
    Log To Console    Total count is : ${tam_member_billing_int}
    Set Global Variable     ${tam_member_billing_int}

Get the value of manage subscription under billing
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //div[normalize-space()='Current Plan']//following-sibling::div//h4   ${wait_time}
    ${subscription_plan} =    Get text   //div[normalize-space()='Current Plan']//following-sibling::div//h4
    Log To Console    Current Plan is : ${subscription_plan}
    Set Global Variable     ${subscription_plan}

Get the value of manage subscription under subscription page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //div[contains(@class,'active-plan')]//h4   ${wait_time}
    ${plan_name} =    Get text   //div[contains(@class,'active-plan')]//h4
    Log To Console    Current Plan is : ${plan_name}
    Set Global Variable     ${plan_name}