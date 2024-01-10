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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.
Resource        ../Pages/Admin_PanelPage.robot

*** Variables ***
${billing_details_arrow}     css:.fa.fa-chevron-right.ng-star-inserted
${billing_add_new_card}     css:.qa-add-new-card-bank
${ach_account_number}     css:#accountNumber
${ach_routing_number}     css:#routingNumber
${ach_name}     css:#name


${billing_future_trans_line}     css:.qa-future
${billing_trash_icon}     css:.fa-trash-alt

${otp_mail_content}     //div[@id='mailctn']/div/div/p[1]

*** Keywords ***

Get and verify text from current Plan
    wait until element is visible           css:.rounded-right h4       60
    ${text}=        get text        css:.rounded-right h4
    Log To Console    ${text}
    Set Global Variable    ${text}

Choose option from side menu of Admin_panel
    [Arguments]     ${option}
    Generic.Select parameter        ${option}

Select option under side menu
    [Arguments]     ${option}
    Generic.click on the tab    ${option}

Get Admin OTP acess from email
    [Arguments]    ${text}
    wait until element is visible   ${otp_mail_content}      60
    ${mailContent}=     get text   ${otp_mail_content}
    ${parts}    Split String    ${mailContent}    ${text}
    ${passcode}    Get Substring    ${parts[1]}    2    8
    Log    The passcode is: ${passcode}
    Log to console  The OTP is:${passcode}
    set global variable    ${passcode}

Search the end user under subscribed companies
    [Arguments]     ${option}
    wait until element is visible       css:#search     60
    clear element text
    Input text      css:#search         ${option}

Click on the three_dots of the table
    wait until element is visible       css:fa-ellipsis-h       60
    click element           css:fa-ellipsis-h

Choose option by clicking on three_dots
    [Arguments]     ${option}
    Generic.click on the tab        ${option}







