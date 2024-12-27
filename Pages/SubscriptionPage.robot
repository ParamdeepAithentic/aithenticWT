*** Settings ***
Documentation   Contains all keyword of Subscription page
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
${subscription_country}     css:#subscription-country ng-select input
${subscription_state}     css:#subscription-state-city ng-select.qa-State input
${subscription_city}      css:#subscription-state-city ng-select.qa-City input
${address1}     css:input[formcontrolname='StreetAddress1']
${address2}     css:input[formcontrolname='StreetAddress2']
${zip}     css:input[formcontrolname='Zip']
${subscription_fname}     css:#firstName

${department}     css:#subscription-department ng-select input
${position}     css:#position
${save_manufacturer_BTN}     css:button[type='submit']
${add_dept_link}     css:span[title='Add new department']

${alert_Msg}     css:.msg.d-inline-flex
${cross_alertMsg}   css:.close.position-absolute.text-white
${loaderIcon}     //div[@role='status']


${select_subscription_type}     (//button[@type='button'][normalize-space()='Select'])[2]
${plan_price}   css:.price-total-plan.ng-star-inserted
${moveNext}      //button[normalize-space()='Next']


${same_address_chkbox}     //label[normalize-space()='Billing address same as company address']

${payment_country}     css:#country
${payment_address1}     css:#AddressLine1
${payment_address2}     css:#AddressLine2
${payment_state}     css:.qa-State input
${payment_city}     css:#city
${payment_zipcode}     css:#ZipCode


${cardNumber}     css:input[placeholder='Card number']
${CardNumber_locator}       css:input[name='cardnumber']
${cardUserName}     //label[normalize-space()='Name on card']/following-sibling::input
${accountNumber}     css:#accountNumber
${routingNumber}     css:#routingNumber
${accountType}     css:#accountType
${accountHolderName}     css:#name


${payment_chk1}     css:div[class='terms-plan'] div:nth-child(1) label:nth-child(1)
${payment_chk2}     css:div[class='terms-plan'] div:nth-child(2) label:nth-child(1)
#${payment_chk1}     //label[contains(text(),'m authorized to conduct this transaction for my company ')]
#${payment_chk2}     //label[contains(text(),'I acknowledge I am entering into a')]

${payment_completeProcessBTN}     css:button[type='submit']
#${payment_completeProcessBTN}     //div[contains(@class,'float-left')]//button[normalize-space()='Complete Process testt']

#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March



*** Keywords ***
Select country of manufacturer profile
    [Arguments]    ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Generic.Enter value into field      ${subscription_country}     ${option1}
    Generic.Select parameter    ${option1}

Select state of manufacturer profile
    [Arguments]    ${option1}
    Generic.Enter value into field      ${subscription_state}     ${option1}
    Generic.Select parameter    ${option1}

Select city of manufacturer profile
    [Arguments]    ${option1}
    Generic.Enter value into field      ${subscription_city}     ${option1}
    Generic.Select parameter    ${option1}

Input text into manufacturer address one
    [Arguments]    ${option}
    Generic.Enter value into field      ${address1}     ${option}

Input text into manufacturer address two
    [Arguments]    ${option}
    Generic.Enter value into field      ${address2}     ${option}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Input text into manufacturer zip code
    [Arguments]    ${option}
    Generic.Enter value into field      ${zip}     ${option}

Select department of manufacturer profile
    [Arguments]    ${option1}
    Generic.Enter value into field      ${department}     ${option1}
    Generic.Select parameter    ${option1}

Input text into manufacturer position/title
    [Arguments]    ${option1}
    Generic.Enter value into field      ${position}     ${option1}

Save the manufacturer profile
    wait until element is visible       ${save_manufacturer_BTN}       ${wait_time}
    wait until element is enabled       ${save_manufacturer_BTN}       ${wait_time}
    click element        ${save_manufacturer_BTN}

Select plan of subscription
    wait until element is not visible      ${loaderIcon}        ${wait_time}
    wait until element is visible       ${select_subscription_type}       ${wait_time}
    wait until element is enabled       ${select_subscription_type}       ${wait_time}
    click element        ${select_subscription_type}

Select and move next with subscription
    wait until element is visible       ${plan_price}       ${wait_time}
    wait until element is enabled       ${moveNext}       ${wait_time}
    click element        ${moveNext}

Click on same billing address checkbox
    wait until element is visible       ${same_address_chkbox}       ${wait_time}
    wait until element is enabled       ${same_address_chkbox}       ${wait_time}
    sleep   ${search_sleep}
    click element        ${same_address_chkbox}
    sleep   ${search_sleep}
    click element        ${same_address_chkbox}
    sleep   ${search_sleep}
    click element        ${same_address_chkbox}
    sleep   ${search_sleep}

#    sleep   2

Enter cardnumber
    [Arguments]    ${option1}
    Generic.Enter value into field      ${cardNumber}     ${option1}

Enter card user name
    [Arguments]    ${option1}
    Generic.Enter value into field      ${cardUserName}     ${option1}

Check the authorization checkbox
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep       ${search_sleep}
    click element        ${payment_chk1}

Check the acknowledgement checkbox
    click element        ${payment_chk2}
    sleep       ${search_sleep}

Switch to card iframe
    Select Frame   css:iframe[title='Secure card payment input frame']

Click on complete process button
    wait until element is visible       ${payment_completeProcessBTN}       ${wait_time}
    wait until element is enabled       ${payment_completeProcessBTN}       ${wait_time}
    click element        ${payment_completeProcessBTN}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          60

Select the another plan
    wait until element is visible       css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)       ${wait_time}
    wait until element is enabled       css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)       ${wait_time}
    click element        css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)

Select if you want to change plan or asset
    [Arguments]    ${option1}
    wait until element is visible       //button[normalize-space()='${option1}']       ${wait_time}
    wait until element is enabled       //button[normalize-space()='${option1}']       ${wait_time}
    click element        //button[normalize-space()='${option1}']
    wait until element is not visible       ${shadow}          60

Select different plan
    wait until element is visible       (//button[@type='button'][normalize-space()='Select'])[2]       ${wait_time}
    wait until element is enabled       (//button[@type='button'][normalize-space()='Select'])[2]       ${wait_time}
    click element       (//button[@type='button'][normalize-space()='Select'])[2]
    wait until element is not visible       ${shadow}          60

Set asset range to
    [Arguments]     ${option1}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    wait until element is visible       //div[normalize-space()='${option1}']       ${wait_time}
    wait until element is enabled       //div[normalize-space()='${option1}']       ${wait_time}
    click element       //div[normalize-space()='${option1}']

Update the asset range
    [Arguments]     ${option1}
    Generic.click on the button     ${option1}

Select card type university
    wait until element is visible       css:span .fa-university       ${wait_time}
    wait until element is enabled       css:span .fa-university       ${wait_time}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element       css:span .fa-university

#span .fa-credit-card

Enter card account number
    [Arguments]    ${option1}
    Generic.Enter value into field      ${accountNumber}     ${option1}

Enter card routing number
    [Arguments]    ${option1}
    Generic.Enter value into field      ${routingNumber}     ${option1}

Click account type
    wait until element is visible       ${accountType}       ${wait_time}
    wait until element is enabled       ${accountType}        ${wait_time}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element      ${accountType}

Select account type
    [Arguments]    ${option1}
    wait until element is visible      //option[normalize-space()='${option1}']        ${wait_time}
    wait until element is enabled      //option[normalize-space()='${option1}']         ${wait_time}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element      //option[normalize-space()=' ${option1}']
#Company, Individual
Enter account holder name
    [Arguments]    ${option1}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Generic.Enter value into field     ${accountHolderName}     ${option1}

Select the payment method
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-way-options-${option1}        ${wait_time}
    wait until element is enabled      css:.qa-payment-way-options-${option1}          ${wait_time}
    click element      css:.qa-payment-way-options-${option1}


Select the account for payment
    wait until element is visible      css:.check-mark.pointer        ${wait_time}
    wait until element is enabled      css:.check-mark.pointer          ${wait_time}
    click element      css:.check-mark.pointer

Proceed the payment
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-method-${option1}        ${wait_time}
    wait until element is enabled      css:.qa-payment-method-${option1}          ${wait_time}
    click element      css:.qa-payment-method-${option1}
    wait until element is not visible      ${loaderIcon}        ${wait_time}

Update the payment of changed plan
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-update-${option1}        ${wait_time}
    wait until element is enabled      css:.qa-payment-update-${option1}          ${wait_time}
    click element      css:.qa-payment-update-${option1}

Click on the three dots of subscription connector
    [Arguments]     ${option}
    wait until element is visible  //td[normalize-space()='${option}']//parent::tr//td//button//i    ${wait_time}
    wait until element is enabled  //td[normalize-space()='${option}']//parent::tr//td//button//i  ${wait_time}
    click element  //td[normalize-space()='${option}']//parent::tr//td//button//i
    sleep   ${search_sleep}
    wait until element is not visible       ${shadow}          60

Click on option under three dots of subscription connector
    [Arguments]     ${option1}       ${option2}
    wait until element is visible  //td[normalize-space()='${option1}']//parent::tr//td//button//i//parent::button//following-sibling::div//a[normalize-space()='${option2}']     ${wait_time}
    wait until element is enabled   //td[normalize-space()='${option1}']//parent::tr//td//button//i//parent::button//following-sibling::div//a[normalize-space()='${option2}']    ${wait_time}
    click element   //td[normalize-space()='${option1}']//parent::tr//td//button//i//parent::button//following-sibling::div//a[normalize-space()='${option2}']
    sleep  ${search_sleep}

Fetch text of delete under table of subscription connector
    [Arguments]     ${option1}      ${option}
    wait until element is visible    //td[normalize-space()='${option1}']//parent::tr//td//span        ${wait_time}
    ${value} =    get text    //td[normalize-space()='${option1}']//parent::tr//td//span
    log to console     ${value}
    should be equal    ${value}    ${option}
    Wait Until Element Is Not Visible     ${value}        ${wait_time}

Fetch alert message text of subscription connector and compare it with
    wait until element is visible    css:.toast-body       ${wait_time}
    ${alert_Msg2} =    get text    css:.toast-body
    log to console     ${alert_Msg2}
    set global variable     ${alert_Msg2}
    Run Keyword If    '${alert_Msg2}' == 'Your scheduler is now running. This process can take up to several minutes. Please check back.'     Log to console    ${alert_Msg2}
    ...    ELSE    Log to console   ${alert_Msg2}
    Wait Until Element Is Not Visible    ${alert_Msg2}        ${wait_time}

Get the value of fields under view details of subscription connector
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='viewDetails']//input)[${option1}]   ${wait_time}
    ${value} =    get value    (//div[@id='viewDetails']//input)[${option1}]
    log to console     ${value}
    should be equal    ${value}         ${option2}

Enter input in the input field of frequency under create scheduler
    [Arguments]     ${option}
    wait until element is visible  //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    wait until element is enabled   //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    click element   //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerFrequency']
    Generic.Select parameter    ${option}

Enter input in the input field of time under create scheduler
    [Arguments]     ${option}
    wait until element is visible  //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    input text  //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']     ${option}

click on the cross icon of create scheduler
    [Arguments]     ${option}
    wait until element is visible   (//div[@id='editScheduler']//span[@title='Clear all'])[${option}]    ${wait_time}
    wait until element is enabled   (//div[@id='editScheduler']//span[@title='Clear all'])[${option}]     ${wait_time}
    click element   (//div[@id='editScheduler']//span[@title='Clear all'])[${option}]

Enter input in the input field of day under create scheduler
    [Arguments]     ${option}
    wait until element is visible  //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    wait until element is enabled   //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    click element   //div[@id='editScheduler']//ng-select[@formcontrolname='schedulerDay']
    Generic.Select parameter    ${option}

Enter input in the input field of date under create scheduler
    [Arguments]     ${option}
    wait until element is visible  //div[@id='editScheduler']//input[@formcontrolname='Date']    ${wait_time}
    wait until element is enabled   //div[@id='editScheduler']//input[@formcontrolname='Date']    ${wait_time}
    click element   //div[@id='editScheduler']//input[@formcontrolname='Date']
    input text      //div[@id='editScheduler']//input[@formcontrolname='Date']      ${option}

Click on the activate option under subscription connector table
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='Activate']      ${wait_time}
    wait until element is enabled   //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='Activate']      ${wait_time}
    click element   //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='Activate']

Click on the suspend my account button link under billing details
    wait until element is visible   //div[@class='row'][1]//span[contains(text(),'Suspend My Account')]     ${wait_time}
    wait until element is enabled   //div[@class='row'][1]//span[contains(text(),'Suspend My Account')]     ${wait_time}
    click element   //div[@class='row'][1]//span[contains(text(),'Suspend My Account')]
    wait until element is not visible       ${loaderIcon}    ${wait_time}


Enter input in the start date field of billing details
    Generic.Enter current date       css:#startDate

Enter input in the end date field of billing details
    [Arguments]     ${option}
    wait until element is visible   css:#endDate      ${wait_time}
    wait until element is enabled   css:#endDate      ${wait_time}
    click element   css:#endDate
    input text      css:#endDate      ${option}
    Press Keys      css:#endDate       ENTER

Enter input in the description field of billing details
    wait until element is visible   css:#description      ${wait_time}
    wait until element is enabled   css:#description      ${wait_time}
    click element   css:#description
    input text      css:#description     Testing

Visible the disable activate button link after suspending account
    wait until element is visible    //td[normalize-space()='Google']//parent::tr//td[normalize-space()='-']     ${wait_time}

Click on the Unsuspend my account button link under billing details
    wait until element is visible   //div[@class='row'][1]//span[contains(text(),'Unsuspend My Account')]     ${wait_time}
    wait until element is enabled   //div[@class='row'][1]//span[contains(text(),'Unsuspend My Account')]     ${wait_time}
    click element   //div[@class='row'][1]//span[contains(text(),'Unsuspend My Account')]
    wait until element is not visible       ${loaderIcon}    ${wait_time}


click on the checkboxes under unsuspend my account button link
    wait until element is visible   //label[contains(text(),"I'm authorized to conduct such transaction for my ")]    ${wait_time}
    wait until element is enabled   //label[contains(text(),"I'm authorized to conduct such transaction for my ")]    ${wait_time}
    click element   //label[contains(text(),"I'm authorized to conduct such transaction for my ")]
    wait until element is visible   //label[normalize-space()='I acknoledge I am restoring my aithentic account.']    ${wait_time}
    wait until element is enabled   //label[normalize-space()='I acknoledge I am restoring my aithentic account.']    ${wait_time}
    click element   //label[normalize-space()='I acknoledge I am restoring my aithentic account.']
    wait until element is not visible       ${loaderIcon}    ${wait_time}


click on the confirm button of unsuspend pop up
    wait until element is visible   //button[@type='submit'][normalize-space()='Confirm']       ${wait_time}
    wait until element is enabled   //button[@type='submit'][normalize-space()='Confirm']       ${wait_time}
    click element   //button[@type='submit'][normalize-space()='Confirm']
  #  wait until element is not visible       ${loaderIcon}    ${wait_time}
#    wait until element is not visible       ${shadow}          60


Choose tab under subscription page after clicking on view_result
    Wait Until Element Is Not Visible    ${loaderIcon}     ${wait_time}
    wait until element is visible   //a[@id='default-tab']       ${wait_time}
    wait until element is enabled   //a[@id='default-tab']       ${wait_time}
    click element   //a[@id='default-tab']

Fetch and compare the Brand from the table
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_azurebrandName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_azurebrandName}
    log to console     Azure_Brand_Name=${fetch_azurebrandName}
    should be equal     ${option}       ${fetch_azurebrandName}

Click on option under three dots of Microsoft coorporation
    [Arguments]     ${option}
    wait until element is visible  (//div[contains(@class,'dropdown-menu')])[3]//a[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled   (//div[contains(@class,'dropdown-menu')])[3]//a[normalize-space()='${option}']    ${wait_time}
    click element   (//div[contains(@class,'dropdown-menu')])[3]//a[normalize-space()='${option}']
    sleep  ${search_sleep}

click on the connector tab under technoogy settings
    wait until element is visible    //ul[@id='myTab']//a[normalize-space()='Connectors']   ${wait_time}
    wait until element is enabled   //ul[@id='myTab']//a[normalize-space()='Connectors']  ${wait_time}
    click element    //ul[@id='myTab']//a[normalize-space()='Connectors']


Click on the service now tab under discovery assets
    wait until element is visible  css:#service-now-first-parent-tab     ${wait_time}
    wait until element is enabled   css:#service-now-first-parent-tab    ${wait_time}
    click element   css:#service-now-first-parent-tab
    sleep  ${search_sleep}

Click on the action button of service now under discovery assets
    wait until element is visible  //button[@id='servicenow-list-actions']    ${wait_time}
    wait until element is enabled  //button[@id='servicenow-list-actions']  ${wait_time}
    click element  //button[@id='servicenow-list-actions']
    sleep   ${search_sleep}
#    wait until element is not visible       ${shadow}          60

Input future Date
    ${current_date}=    Get Current Date    result_format=%m/%d/%Y
    Log To Console      Current Date is: ${current_date}

    ${current_date_parts}=    Split String    ${current_date}    -
    ${current_date_without_time}=    Set Variable    ${current_date_parts[0]}

    ${future_date}=    Evaluate    datetime.datetime.strptime($current_date_without_time, "%m/%d/%Y") + datetime.timedelta(days=30)
    ${formatted_future_date}=    Convert Date    ${future_date}    result_format=%m/%d/%Y

    Log To Console      Future Date is: ${formatted_future_date}
    Set Global Variable    ${formatted_future_date}



My Failure Handling
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    SubscriptionPage.Click on the Unsuspend my account button link under billing details
    SubscriptionPage.click on the checkboxes under unsuspend my account button link
    SubscriptionPage.click on the confirm button of unsuspend pop up
    Generic.Fetch alert message text and compare it with        Payment Successful
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your curren t page location contains      personal-profile
    Generic.Select parameter    Technology
    Generic.Verify your current page location contains      technology-settings
    Generic.click on the tab    Connectors
    SubscriptionPage.Click on the activate option under subscription connector table
    Generic.Fetch alert message text and compare it with        Status Updated

Verify the visibility of no records under view details under sentinel one
     wait until element is visible   //span[normalize-space()='No Records']    ${wait_time}
     wait until element is enabled   //span[normalize-space()='No Records']  ${wait_time}

Click on the create button link of service now under subscription connector
    [Arguments]     ${option}       ${option1}
    wait until element is visible  //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='${option1}']    ${wait_time}
    wait until element is enabled  //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='${option1}']  ${wait_time}
    click element  //td[normalize-space()='${option}']//parent::tr//td[normalize-space()='${option1}']
    sleep   ${search_sleep}

Enter input in the url end point field of service now
    [Arguments]     ${option}
    wait until element is visible  css:#urlEndPoint    ${wait_time}
    wait until element is enabled  css:#urlEndPoint      ${wait_time}
    click element  css:#urlEndPoint
    input text      css:#urlEndPoint        ${option}

Enter input in the username field of service now
    [Arguments]     ${option}
    wait until element is visible  css:#username    ${wait_time}
    wait until element is enabled  css:#username      ${wait_time}
    click element  css:#username
    input text      css:#username       ${option}

Enter input in the password field of service now
    [Arguments]     ${option}
    wait until element is visible  css:#password_sn    ${wait_time}
    wait until element is enabled  css:#password_sn      ${wait_time}
    click element  css:#password_sn
    input text      css:#password_sn       ${option}

Enter input in the client id field of service now
    [Arguments]     ${option}
    wait until element is visible  css:#clientId    ${wait_time}
    wait until element is enabled  css:#clientId      ${wait_time}
    click element  css:#clientId
    input text      css:#clientId        ${option}

Enter input in the secret key field of service now
    [Arguments]     ${option}
    wait until element is visible  css:#clientSecret    ${wait_time}
    wait until element is enabled  css:#clientSecret     ${wait_time}
    click element  css:#clientSecret
    input text      css:#clientSecret        ${option}

Click on cross icon of details under service now
    wait until element is visible  //div[@id='viewDetails']//span[normalize-space()='×']    ${wait_time}
    wait until element is enabled  //div[@id='viewDetails']//span[normalize-space()='×']     ${wait_time}
    click element    //div[@id='viewDetails']//span[normalize-space()='×']
    sleep   ${search_sleep}

Fetch and compare the product from the table
#    [Arguments]    ${option}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}
    ${fetch_azureproductName} =    get text    (//tbody[contains(@class,'member-table-qa')]//tr//td)[3]
    set global variable    ${fetch_azureproductName}
    log to console     Azure_Product_Name=${fetch_azureproductName}
#    should be equal     ${option}      ${fetch_azureproductName}

Enter input in the input field of frequency under asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    click element   //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerFrequency']
    Generic.Select parameter    ${option}

Enter input in the input field of day asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    wait until element is enabled  //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    click element   //div[@id='openEditSchedulerServicenow']//ng-select[@formcontrolname='schedulerDay']
    Generic.Select parameter    ${option}

Enter input in the start date field of service now under asset discovery
    Generic.Enter current date       //div[@id='openEditSchedulerServicenow']//input[@formcontrolname='schedulerDate']

click on the cross icon of service now under asset discovery
    [Arguments]     ${option}
    wait until element is visible   (//div[@id='openEditSchedulerServicenow']//span[@title='Clear all'])[${option}]    ${wait_time}
    wait until element is enabled   (//div[@id='openEditSchedulerServicenow']//span[@title='Clear all'])[${option}]     ${wait_time}
    click element   (//div[@id='openEditSchedulerServicenow']//span[@title='Clear all'])[${option}]

click on the cross icon of delete pop up under asset discovery
    wait until element is visible   //div[@id='deleteServicenowlConnector']//span[normalize-space()='×']    ${wait_time}
    wait until element is enabled   //div[@id='deleteServicenowlConnector']//span[normalize-space()='×']     ${wait_time}
    click element   //div[@id='deleteServicenowlConnector']//span[normalize-space()='×']
    sleep   ${search_sleep}
    wait until element is not visible       ${shadow}          60


Choose the tab under Subscription page
    [Arguments]         ${option}
    wait until element is not visible   ${loaderIcon}     ${wait_time}
    wait until element is visible       (//div[@id='dashboardCharts']//child::a)[${option}]       ${wait_time}
    wait until element is enabled       (//div[@id='dashboardCharts']//child::a)[${option}]       ${wait_time}
    click element        (//div[@id='dashboardCharts']//child::a)[${option}]

Verify that page contains correct details
    [Arguments]         ${option}
    wait until element is not visible   ${loaderIcon}     ${wait_time}
    wait until element is visible       //td[normalize-space()='${opiton}']      ${wait_time}
    Page should contain element         //td[normalize-space()='${option}']

Click on the row of the subscription overview table
    wait until element is not visible   ${loaderIcon}     ${wait_time}
    wait until element is visible       //td[normalize-space()='${opiton}']      ${wait_time}
    Page should contain element         //td[normalize-space()='${option}']

Click on the options under action button of service now under discovery assets
    [Arguments]     ${option}
    wait until element is visible   //div[contains(@id,'service-now')]//a[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'service-now')]//a[normalize-space()='${option}']     ${wait_time}
    click element   //div[contains(@id,'service-now')]//a[normalize-space()='${option}']
    sleep   ${search_sleep}

Click on the jamff tab under asset discovery
    wait until element is visible   //a[@id='jamf-first-parent-tab']    ${wait_time}
    wait until element is enabled   //a[@id='jamf-first-parent-tab']     ${wait_time}
    click element   //a[@id='jamf-first-parent-tab']

Click on the sentinel one tab under asset discovery
    wait until element is visible   //a[@id='sentinelone-first-parent-tab']   ${wait_time}
    wait until element is enabled   //a[@id='sentinelone-first-parent-tab']     ${wait_time}
    click element   //a[@id='sentinelone-first-parent-tab']

Click on the connectors button link under technology settings page
   wait until element is visible   //ul[@id='myTab']//a[normalize-space()='Connectors']         ${wait_time}
    wait until element is enabled    //ul[@id='myTab']//a[normalize-space()='Connectors']          ${wait_time}
    click element          //ul[@id='myTab']//a[normalize-space()='Connectors']

Select the time from the timepicker
    [Arguments]     ${option}
    wait until element is visible  //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    click element       //div[@id='editScheduler']//input[@formcontrolname='schedulerTime']
    wait until element is visible  //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    click element       //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']

Click on the ok button after selecting the time
    Wait Until Element Is Not Visible    ${loaderIcon}     ${wait_time}
    wait until element is visible   //button[contains(@class,'timepicker-button')]//span[normalize-space()='Ok']      ${wait_time}
    wait until element is enabled   //button[contains(@class,'timepicker-button')]//span[normalize-space()='Ok']      ${wait_time}
    click element   //button[contains(@class,'timepicker-button')]//span[normalize-space()='Ok']
    sleep       ${search_sleep}

Fetch text of status under the table of subscription connector
    [Arguments]     ${option1}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']          ${wait_time}
    wait until element is enabled      //tbody//tr//td[normalize-space()='1']         ${wait_time}
    wait until element is visible    //td[normalize-space()='${option1}']//parent::tr//td[normalize-space()='Completed']     300
    wait until element is enabled    //td[normalize-space()='${option1}']//parent::tr//td[normalize-space()='Completed']     300
    ${value} =    get text    //td[normalize-space()='${option1}']//parent::tr//td[normalize-space()='Completed']
    log      ${value}
    should be equal    ${value}    Completed
    Wait Until Element Is Not Visible     ${value}        ${wait_time}

Enter input in the token field of sentinelone
    [Arguments]     ${option}
    wait until element is visible  css:#apiToken    ${wait_time}
    wait until element is enabled  css:#apiToken      ${wait_time}
    click element  css:#apiToken
    input text      css:#apiToken       ${option}

Click on the tenable tab under asset discovery
    wait until element is visible     //a[@id='tenable-first-parent-tab']       ${wait_time}
    wait until element is enabled     //a[@id='tenable-first-parent-tab']         ${wait_time}
    click element   //a[@id='tenable-first-parent-tab']

Enter input in the access key of tenable account
    [Arguments]     ${option}
    wait until element is visible  css:#accessKey    ${wait_time}
    wait until element is enabled  css:#accessKey     ${wait_time}
    click element  css:#accessKey
    input text      css:#accessKey        ${option}


Click on the action button of tenable under discovery assets
    wait until element is visible  //button[@id='tenable-list-actions']    ${wait_time}
    wait until element is enabled  //button[@id='tenable-list-actions']  ${wait_time}
    click element  //button[@id='tenable-list-actions']
    sleep   ${search_sleep}

Click on the options under action button of tenable under discovery assets
    [Arguments]     ${option}
    wait until element is visible   //div[contains(@id,'tenable-first')]//a[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'tenable-first')]//a[normalize-space()='${option}']     ${wait_time}
    click element   //div[contains(@id,'tenable-first')]//a[normalize-space()='${option}']
    sleep   ${search_sleep}

click on the cross icon of tenable under asset discovery
    [Arguments]     ${option}
    wait until element is visible   (//div[@id='openEditSchedulerTenable']//span[@title='Clear all'])[${option}]    ${wait_time}
    wait until element is enabled   (//div[@id='openEditSchedulerTenable']//span[@title='Clear all'])[${option}]     ${wait_time}
    click element   (//div[@id='openEditSchedulerTenable']//span[@title='Clear all'])[${option}]

Enter input in the input field of frequency under asset discovery under tenable
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    click element   //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerFrequency']
    Generic.Select parameter    ${option}

Enter input in the input field of day asset discovery under tenable
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    wait until element is enabled  //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    click element   //div[@id='openEditSchedulerTenable']//ng-select[@formcontrolname='schedulerDay']
    Generic.Select parameter    ${option}

Enter input in the start date field of service now under asset discovery under tenable
    Generic.Enter current date       //div[@id='openEditSchedulerTenable']//input[@formcontrolname='schedulerDate']

Select the time from the timepicker of tenable under asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTenable']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerTenable']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='openEditSchedulerTenable']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    click element       //div[@id='openEditSchedulerTenable']//input[@formcontrolname='schedulerTime']

Click on the tanium tab under asset discovery
    wait until element is visible   //a[@id='tanium-first-parent-tab']   ${wait_time}
    wait until element is enabled   //a[@id='tanium-first-parent-tab']     ${wait_time}
    click element   //a[@id='tanium-first-parent-tab']

Click on the action button of tanium under discovery assets
    wait until element is visible  //button[@id='tanium-list-actions']    ${wait_time}
    wait until element is enabled  //button[@id='tanium-list-actions']  ${wait_time}
    click element  //button[@id='tanium-list-actions']
    sleep   ${search_sleep}

Click on the options under action button of tanium under discovery assets
    [Arguments]     ${option}
    wait until element is visible   //div[contains(@id,'tanium')]//a[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'tanium')]//a[normalize-space()='${option}']     ${wait_time}
    click element   //div[contains(@id,'tanium')]//a[normalize-space()='${option}']
    sleep   ${search_sleep}

click on the cross icon of tanium under asset discovery
    [Arguments]     ${option}
    wait until element is visible   (//div[@id='openEditSchedulerTanium']//span[@title='Clear all'])[${option}]    ${wait_time}
    wait until element is enabled   (//div[@id='openEditSchedulerTanium']//span[@title='Clear all'])[${option}]     ${wait_time}
    click element   (//div[@id='openEditSchedulerTanium']//span[@title='Clear all'])[${option}]

Enter input in the input field of frequency under asset discovery under tanium
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    click element   //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerFrequency']
    Generic.Select parameter    ${option}

Enter input in the input field of day asset discovery under tanium
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    wait until element is enabled  //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    click element   //div[@id='openEditSchedulerTanium']//ng-select[@formcontrolname='schedulerDay']
    Generic.Select parameter    ${option}

Enter input in the start date field of service now under asset discovery under tanium
    Generic.Enter current date       //div[@id='openEditSchedulerTanium']//input[@formcontrolname='schedulerDate']

Select the time from the timepicker of tanium under asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerTanium']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerTanium']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='openEditSchedulerTanium']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    click element       //div[@id='openEditSchedulerTanium']//input[@formcontrolname='schedulerTime']
    wait until element is visible  //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled   //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']    ${wait_time}
    click element      //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option}']

click on the yes option of delete pop up under asset discovery tenable
    wait until element is visible  //div[contains(@id,'deleteTenableConnector')]//button[normalize-space()='Yes']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'deleteTenableConnector')]//button[normalize-space()='Yes']    ${wait_time}
    click element   //div[contains(@id,'deleteTenableConnector')]//button[normalize-space()='Yes']

Get the value of fields under view details of subscription of tenable tab under asset discovery
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='TenableDetails']//input)[${option1}]   ${wait_time}
    ${value} =    get value    (//div[@id='TenableDetails']//input)[${option1}]

click on the yes option of delete pop up under asset discovery tanium
    wait until element is visible  //div[contains(@id,'deleteTaniumConnector')]//button[normalize-space()='Yes']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'deleteTaniumConnector')]//button[normalize-space()='Yes']    ${wait_time}
    click element   //div[contains(@id,'deleteTaniumConnector')]//button[normalize-space()='Yes']

Get the value of fields under view details of subscription of tanium tab under asset discovery
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='TaniumDetails']//input)[${option1}]   ${wait_time}
    ${value} =    get value    (//div[@id='TaniumDetails']//input)[${option1}]
    log to console     ${value}
    should be equal    ${value}         ${option2}


Click on the crowd strike tab under asset discovery
    wait until element is visible   //a[@id='crowdstrike-first-parent-tab']    ${wait_time}
    wait until element is enabled   //a[@id='crowdstrike-first-parent-tab']     ${wait_time}
    click element   //a[@id='crowdstrike-first-parent-tab']

Click on the action button of crowd strike under discovery assets
    wait until element is visible  //button[@id='crowdstrike-list-actions']    ${wait_time}
    wait until element is enabled     //button[@id='crowdstrike-list-actions']      ${wait_time}
    click element  //button[@id='crowdstrike-list-actions']
    sleep   ${search_sleep}

Click on the options under action button of crowdstrike under discovery assets
    [Arguments]     ${option}
    wait until element is visible   //div[contains(@id,'crowdstrike-first')]//a[normalize-space()='${option}']    ${wait_time}
    wait until element is enabled  //div[contains(@id,'crowdstrike-first')]//a[normalize-space()='${option}']     ${wait_time}
    click element   //div[contains(@id,'crowdstrike-first')]//a[normalize-space()='${option}']
    sleep   ${search_sleep}

click on the cross icon of crowdstrike under asset discovery
    [Arguments]     ${option}
    wait until element is visible   (//div[@id='openEditSchedulerCrowdstrike']//span[@title='Clear all'])[${option}]    ${wait_time}
    wait until element is enabled   (//div[@id='openEditSchedulerCrowdstrike']//span[@title='Clear all'])[${option}]     ${wait_time}
    click element   (//div[@id='openEditSchedulerCrowdstrike']//span[@title='Clear all'])[${option}]

Click on the newly discovered tab under crowd strike
    wait until element is visible   //a[@id='new-dicovered-crowdstrike']    ${wait_time}
    wait until element is enabled   //a[@id='new-dicovered-crowdstrike']     ${wait_time}
    click element  //a[@id='new-dicovered-crowdstrike']

Enter input in the input field of frequency of crowd strike under asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerFrequency']    ${wait_time}
    click element   //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerFrequency']
    Generic.Select parameter    ${option}

Enter input in the input field of day of crowd strike asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    wait until element is enabled  //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerDay']    ${wait_time}
    click element   //div[@id='openEditSchedulerCrowdstrike']//ng-select[@formcontrolname='schedulerDay']
    Generic.Select parameter    ${option}

Enter input in the start date field of crowd strike under asset discovery
    Generic.Enter current date      //div[@id='openEditSchedulerCrowdstrike']//input[@formcontrolname='schedulerDate']

Select the time from the timepicker under asset dicovery
    [Arguments]     ${option}     ${option1}
    wait until element is visible  //div[@id='${option}']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='${option}']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='${option}']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    click element       //div[@id='${option}']//input[@formcontrolname='schedulerTime']
    wait until element is visible  //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option1}']    ${wait_time}
    wait until element is enabled   //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option1}']    ${wait_time}
    click element       //div[contains(@class,'clock-face')]//following-sibling::div//span[normalize-space()='${option1}']

click on the yes button of delete pop up under asset discovery
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is visible      //div[contains(@id,'deleteCSConnector')]//button[normalize-space()='Yes']          ${wait_time}
    wait until element is enabled      //div[contains(@id,'deleteCSConnector')]//button[normalize-space()='Yes']          ${wait_time}
    sleep   ${search_sleep}
    click element       //div[contains(@id,'deleteCSConnector')]//button[normalize-space()='Yes']
    sleep   ${search_sleep}

Get the value of fields under view details of subscription connector under asset discovery
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='CrowdStrikeDetails']//input)[${option1}]   ${wait_time}
    ${value} =    get value    (//div[@id='CrowdStrikeDetails']//input)[${option1}]
    log to console     ${value}
    should be equal    ${value}         ${option2}

Hover over row of under M365 tab
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible       (//div[contains(@class,'qa-subscription-list-one-container')]//tr)[2]       ${wait_time}
    Mouse Over          (//div[contains(@class,'qa-subscription-list-one-container')]//tr)[2]

Fetch the Asset_Id from subcription overview table
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is not visible   (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]    ${wait_time}
    wait until element is visible     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[3]           ${wait_time}
    wait until element is enabled     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[3]          ${wait_time}
#    ${subscriptionOverview_AssetID}=        Execute JavaScript    return document.querySelector('table:nth-of-type(2) tbody tr:nth-child(1) td:nth-child(3)').textContent;
    ${subscriptionOverview_AssetID}=  get text      //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[3]
    log         ${subscriptionOverview_AssetID}
    set global variable     ${subscriptionOverview_AssetID}
    click element   //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[3]


Fetch the Product_name from subcription overview table
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is not visible   (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]    ${wait_time}
    wait until element is visible     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[2]           ${wait_time}
    wait until element is enabled     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[2]          ${wait_time}
    ${subscriptionOverview_ProductName}=        get text    //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[2]
    log         ${subscriptionOverview_ProductName}
    set global variable     ${subscriptionOverview_ProductName}

Click on the tab under Uasge Analytics
    [Arguments]   ${option}
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is visible     //a[@id='default-tab']//img[contains(@src,'${option}')]          60
    wait until element is enabled    //a[@id='default-tab']//img[contains(@src,'${option}')]          60
    Click element       //a[@id='default-tab']//img[contains(@src,'${option}')]

Wait for the subscrition overview table to load
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is visible      //p[normalize-space()='Subscription Overview']//parent::div//tbody        ${wait_time}
    wait until element is enabled      //p[normalize-space()='Subscription Overview']//parent::div//tbody          ${wait_time}

Wait for the visiblity of product
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is not visible   (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]    ${wait_time}
    wait until element is visible     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[1]         ${wait_time}
    wait until element is enabled     //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[1]      ${wait_time}
    ${product_name}=    get text    //p[normalize-space()='Subscription Overview']//parent::div//tbody//tr[1]//td[1]
    log     ${product_name}
    set global variable    ${product_name}

Compare the Product name
    [Arguments]     ${option1}     ${option2}
    Should be equal     ${option1}     ${option2}

Fetch the all validation message on subscription payment page
   wait until element is visible   //span[contains(@class,'invalidInput')]       ${wait_time}
   @{expectedList} =    Create List       Please Select Country        Please enter Address Line 1            Please Choose State          Please Select City          Please enter Zip Code         Please check authorized Transaction box          Please check aithentic Contract box
   ${elements} =  Get WebElements     //span[contains(@class,'invalidInput')]
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      log to console    ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   lists should be equal    ${expectedList}    ${actualList}

Verify that Subscription Info tab is visible
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is visible   css:#cve-tab        ${wait_time}
    wait until element is enabled   css:#cve-tab    ${wait_time}

Verify subscription info tab is not visible
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    Page Should Not Contain Element   css:#cve-tab        ${wait_time}

Select the time from the timepicker of service now under asset discovery
    [Arguments]     ${option}
    wait until element is visible  //div[@id='openEditSchedulerServicenow']//input[@formcontrolname='schedulerTime']    ${wait_time}
    wait until element is enabled   //div[@id='openEditSchedulerServicenow']//input[@formcontrolname='schedulerTime']    ${wait_time}
    clear element text  //div[@id='openEditSchedulerServicenow']//input[@formcontrolname='schedulerTime']
    sleep    ${search_sleep}
    click element       //div[@id='openEditSchedulerServicenow']//input[@formcontrolname='schedulerTime']

Get the value of fields under view details of subscription connector service now under asset discovery
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='SNowDetails']//input)[${option1}]   ${wait_time}
    ${value} =    get value    (//div[@id='SNowDetails']//input)[${option1}]
    log to console     ${value}
    should be equal    ${value}         ${option2}

click on the yes option of delete pop up under asset discovery service now
    wait until element is visible  //div[contains(@id,'deleteServicenowlConnector')]//button[normalize-space()='Yes']    ${wait_time}
    wait until element is enabled   //div[contains(@id,'deleteServicenowlConnector')]//button[normalize-space()='Yes']    ${wait_time}
    click element   //div[contains(@id,'deleteServicenowlConnector')]//button[normalize-space()='Yes']

Click on the pop up of would you like to download the agent
   TRY
       wait until element is not visible   ${loaderIcon}          ${wait_time}
       wait until element is visible      //button[normalize-space()='No, thanks']          ${wait_time}
       wait until element is enabled      //button[normalize-space()='No, thanks']          ${wait_time}
       sleep   ${search_sleep}
       click element       //button[normalize-space()='No, thanks']
       sleep   ${search_sleep}
   EXCEPT      #ElementNotVisibleException#
        Log    No pop up is coming
    END