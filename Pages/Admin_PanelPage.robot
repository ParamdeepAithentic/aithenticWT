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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot
Resource        ../Pages/Admin_PanelPage.robot

*** Variables ***
${billing_details_arrow}     css:.d-block span i
${billing_add_new_card}     css:.qa-add-new-card-bank
${ach_account_number}     css:#accountNumber
${ach_routing_number}     css:#routingNumber
${ach_name}     css:#name

${billing_future_trans_line}     css:.qa-future
${billing_trash_icon}     css:.fa-trash-alt

${otp_mail_content}     //div[@id='mailctn']/div/div/p[1]
${admin_loader}     css:.waitMe_text

${table}        css:#subscribed_companies
${admin_alert_msg}      css:.toast-message

*** Keywords ***

Fetch text from current Plan
    wait until element is visible           css:.rounded-right h4       60
    wait until element is enabled           css:.rounded-right h4       60
    Sleep    ${yop_sleep}
    ${text}=        get text        css:.rounded-right h4
    Log To Console    ${text}
    Set Global Variable    ${text}

Verify text from current plan after changing subscription
    [Arguments]      ${option}
    wait until element is visible       css:.rounded-right h4
    wait until element is enabled       css:.rounded-right h4
    should be equal        ${text}     ${option}

Choose option from side menu of Admin_panel
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    Generic.Select parameter        ${option}

Select option under side menu
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    Generic.click on the tab    ${option}

Get Admin OTP acess from email
    [Arguments]    ${text}
    wait until element is visible   ${otp_mail_content}      60
    wait until element is enabled   ${otp_mail_content}      60
    ${mailContent}=     get text   ${otp_mail_content}
    ${parts}    Split String    ${mailContent}    ${text}
    ${passcode}    Get Substring    ${parts[1]}    2    8
    Log to console  The OTP is:${passcode}
    set global variable    ${passcode}
    wait until element is not visible       ${admin_loader}              60

Search the end user under subscribed companies
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    wait until element is visible       css:#search     60
    wait until element is enabled       css:#search     60
    clear element text      css:#search
    Input text      css:#search         ${option}
    wait until element is not visible       ${admin_loader}              60

Click on the three_dots of the table
    wait until element is not visible       ${admin_loader}              60
    wait until element is visible       css:.fa-ellipsis-h       60
    wait until element is enabled       css:.fa-ellipsis-h       60
    click element           css:.fa-ellipsis-h

Choose option by clicking on three_dots
    [Arguments]     ${option}
    Generic.click on the tab        ${option}
#option: View Company, Change Commercial Plan

Scroll table horizontaly
    Sleep    ${search_sleep}
    wait until element is visible       ${table}        60
    wait until element is enabled       ${table}        60
    Execute JavaScript  window.scrollBy(10000, 0)

scroll table vertically
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    wait until element is visible       css:.fa-ellipsis-h              60
    wait until element is enabled       css:.fa-ellipsis-h              60
    scroll element into view        //a[normalize-space()='${option}']

Change the plan from Plan Name field
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    wait until element is visible       css:#planName       60
    wait until element is enabled       css:#planName       60
    click element       css:#planName
    Select From List by Label       css:#planName       ${option}

Click on the button inside assign commercial plan modal
    [Arguments]         ${option}
    wait until element is not visible       ${admin_loader}              60
    Generic.click on the button     ${option}
#option: Close, Confirm

Get alert message and compare it with
    [Arguments]     ${option}
    wait until element is not visible       ${admin_loader}              60
    wait until element is visible       ${admin_alert_msg}      60
    wait until element is enabled       ${admin_alert_msg}      60
    ${get_alertMsg} =    get text    ${admin_alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}
    Wait Until Element Is Not Visible    ${admin_alert_msg}        60

Open Admin panel
    Execute JavaScript    window.open('about:blank','_blank')
    Switch Window    NEW    # Switch to the new tab
    Go To       ${admin_url}

Select option from profile list
    wait until element is visible       css:.qa-subscription-dropdown       60
    wait until element is enabled       css:.qa-subscription-dropdown       60
    click element       css:.qa-subscription-dropdown

click on confirm button to change plan
    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}        60
    wait until element is visible       //button[@type='button'][normalize-space()='${option}']   60
    wait until element is enabled       //button[@type='button'][normalize-space()='${option}']   60
    click element       //button[@type='button'][normalize-space()='${option}']