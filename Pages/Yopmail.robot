*** Settings ***
Documentation     Contains all keyword of yopmail page
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
${user_name}             rahulshettyacademy
${invalid_password}      123445
${url}                   https://uat-app.aithentic.com/
${browser_name}          Firefox
${email}                 testqa29j@mailinator.com
${valid_password}        Test!@7094
${SheetLocationAndName}   LoadTimeSheet.xlsx
${SheetTabName}     Load_Time_tracking


${alert_Msg}     //span[@class='msg d-inline-flex ng-star-inserted']

${yop_email_searchBar}     css:#login
${yop_email_searchBtn}      css:button[title='Check Inbox @yopmail.com']

#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March

#${firstEmail}     (//button[@class='lm'])[1]

${email_btn}     css:button[type='button']

${loaderIcon}     //div[@role='status']

${refresh}     css#refresh

${otp_mail_content}     //div[@id='mailctn']/div/div/p[1]

*** Keywords ***

#Click on first email of yopmail
#    wait until element is visible   ${firstEmail}      60
#    wait until element is enabled   ${firstEmail}      60
#    click element       ${firstEmail}

Click on email of yopmail
    [Arguments]    ${email}
    wait until element is visible   //div[normalize-space()='${email}']      60
    wait until element is enabled   //div[normalize-space()='${email}']      60
    click element       //div[normalize-space()='${email}']

Click on sign In button in yopmail email
    wait until element is visible   ${email_btn}       60
    wait until element is enabled    ${email_btn}       60
    click element       ${email_btn}
#    wait until element is not visible    ${loaderIcon}       60

Click on verify button in yopmail email
    wait until element is visible   ${email_btn}       60
    wait until element is enabled    ${email_btn}       60
    click element       ${email_btn}

Refresh the email
    wait until element is visible   ${refresh}      60
    wait until element is enabled   ${refresh}      60
    click element       ${refresh}


Get verification OTP from email
    [Arguments]    ${text}
    wait until element is visible   ${otp_mail_content}      60
    ${mailContent}=     get text   ${otp_mail_content}

    ${parts}    Split String    ${mailContent}    ${text}

    ${passcode}    Get Substring    ${parts[1]}    1    7

    Log    The passcode is: ${passcode}
    Log to console  The passcode is:${passcode}

    set global variable    ${passcode}