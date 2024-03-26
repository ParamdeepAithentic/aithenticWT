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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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

#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March



*** Keywords ***
Select country of manufacturer profile
    [Arguments]    ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
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
    wait until element is visible       ${save_manufacturer_BTN}       60
    wait until element is enabled       ${save_manufacturer_BTN}       60
    click element        ${save_manufacturer_BTN}

Select plan of subscription
    wait until element is not visible      ${loaderIcon}        60
    wait until element is visible       ${select_subscription_type}       60
    wait until element is enabled       ${select_subscription_type}       60
    click element        ${select_subscription_type}

Select and move next with subscription
    wait until element is visible       ${plan_price}       60
    wait until element is enabled       ${moveNext}       60
    click element        ${moveNext}

Click on same billing address checkbox
    wait until element is visible       ${same_address_chkbox}       60
    wait until element is enabled       ${same_address_chkbox}       60
    click element        ${same_address_chkbox}
    click element        ${same_address_chkbox}
    click element        ${same_address_chkbox}

#    sleep   2

Enter cardnumber
    [Arguments]    ${option1}
    Generic.Enter value into field      ${cardNumber}     ${option1}

Enter card user name
    [Arguments]    ${option1}
    Generic.Enter value into field      ${cardUserName}     ${option1}

Check the authorization checkbox
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element        ${payment_chk1}

Check the acknowledgement checkbox
    click element        ${payment_chk2}

Switch to card iframe
    Select Frame   css:iframe[title='Secure card payment input frame']

Click on complete process button
    wait until element is visible       ${payment_completeProcessBTN}       60
    wait until element is enabled       ${payment_completeProcessBTN}       60
    click element        ${payment_completeProcessBTN}
    Wait Until Element Is Not Visible    ${loaderIcon}      120

Select the another plan
    wait until element is visible       css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)       60
    wait until element is enabled       css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)       60
    click element        css:div[class='row justify-content-center'] div:nth-child(1) div:nth-child(1) div:nth-child(2)

Select if you want to change plan or asset
    [Arguments]    ${option1}
    wait until element is visible       //button[normalize-space()='${option1}']       60
    wait until element is enabled       //button[normalize-space()='${option1}']       60
    click element        //button[normalize-space()='${option1}']

Select different plan
    wait until element is visible       (//button[@type='button'][normalize-space()='Select'])[2]       60
    wait until element is enabled       (//button[@type='button'][normalize-space()='Select'])[2]       60
    click element       (//button[@type='button'][normalize-space()='Select'])[2]

Set asset range to
    [Arguments]     ${option1}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    wait until element is visible       //div[normalize-space()='${option1}']       60
    wait until element is enabled       //div[normalize-space()='${option1}']       60
    click element       //div[normalize-space()='${option1}']

Update the asset range
    [Arguments]     ${option1}
    Generic.click on the button     ${option1}

Select card type university
    wait until element is visible       css:span .fa-university       60
    wait until element is enabled       css:span .fa-university       60
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
    wait until element is visible       ${accountType}       60
    wait until element is enabled       ${accountType}        60
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element      ${accountType}

Select account type
    [Arguments]    ${option1}
    wait until element is visible      //option[normalize-space()='${option1}']        60
    wait until element is enabled      //option[normalize-space()='${option1}']         60
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    click element      //option[normalize-space()=' ${option1}']
#Company, Individual
Enter account holder name
    [Arguments]    ${option1}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Generic.Enter value into field     ${accountHolderName}     ${option1}

Select the payment method
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-way-options-${option1}        60
    wait until element is enabled      css:.qa-payment-way-options-${option1}          60
    click element      css:.qa-payment-way-options-${option1}


Select the account for payment
    wait until element is visible      css:.check-mark.pointer        60
    wait until element is enabled      css:.check-mark.pointer          60
    click element      css:.check-mark.pointer

Proceed the payment
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-method-${option1}        60
    wait until element is enabled      css:.qa-payment-method-${option1}          60
    click element      css:.qa-payment-method-${option1}

Update the payment of changed plan
    [Arguments]    ${option1}
    wait until element is visible      css:.qa-payment-update-${option1}        60
    wait until element is enabled      css:.qa-payment-update-${option1}          60
    click element      css:.qa-payment-update-${option1}













