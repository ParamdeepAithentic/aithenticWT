*** Settings ***
Documentation   A resource file with reusable keywords and variables.
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

${url}                 https://uat-app.aithentic.com/
#${url}                  https://qa-app.aithentic.com/
${apiURL}              https://uat-api.aithentic.com/api/v1
#${apiURL}               https://qa-api.aithentic.com/api/v1
${valid_password}        Test!@5897     #UAT user
#${valid_password}         Test@123       #QA User

${admin_url}        https://uat-admin.aithentic.com/
#${admin_url}        https://qa-admin.aithentic.com/
#
#${agentDiscovery_TagName}       Tag Name - johnsoftwaresolutions-1192-1         #qa
${agentDiscovery_TagName}        Tag Name - johnsoftwaresolutions-1428-3        #uat

${admin_name}        aithentic@yopmail.com
${admin_password}       Admin@123




${browser_name}          firefox

${email}                 testqa29j@mailinator.com       #UAT user

${SheetLocationAndName}   LoadTimeSheet.xlsx
${SheetTabName}     Load_Time_tracking

${alert_Msg}     css:.msg.d-inline-flex
${cross_alertMsg}   css:.close.position-absolute.text-white
${loaderIcon}     //div[@role='status']
${yop_email_searchBar}     css:#login
${yop_email_searchBtn}      css:button[title='Check Inbox @yopmail.com']
${click_Country}     css:#country
${click_countryTag}     css:.iti__selected-flag.dropdown-toggle
${contact_Country_search}     css:#country-search-box
${phone}     css:#phone

${yop_sleep}       10
${search_sleep}       1
#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March

*** Keywords ***
Fix the column number
    ${pageHeading}=   Catenate    2
    set global variable    ${pageHeading}
#    log to console  my column no is:${pageHeading}

Fix the row number
    ${pageTime}=   Catenate    3
    set global variable    ${pageTime}
#    log to console  my column no is:${pageTime}


Fetch Current Date
    ${current_date}=    Get Current Date    result_format=%m/%d/%Y
    Log to console   Current Date: ${current_date}
    RETURN    ${current_date}

Fetch Current Time
    ${current_time}=    Get Current Date    result_format=%H:%M:%S
    Log to console  Current Time: ${current_time}
    RETURN    ${current_time}

Calculate Running time
    [Arguments]   ${RowNum_forText}   ${ColumnNum_forText}   ${module_name}     ${RowNum}   ${ColumnNum}      ${TimeTakenToLoginPage}   ${SheetTabName}
    Close All Excel Documents
    Open Excel Document  ${SheetLocationAndName}   doc_id=1
    Write Excel Cell     ${RowNum_forText}   ${ColumnNum_forText}   ${module_name}     ${SheetTabName}
    Write Excel Cell     ${RowNum}   ${ColumnNum}   ${TimeTakenToLoginPage}     ${SheetTabName}
    Save Excel Document     ${SheetLocationAndName}
    Close All Excel Documents

click on the tab
    [Arguments]    ${option}
    wait until element is visible    //a[normalize-space()='${option}']     60
    wait until element is enabled    //a[normalize-space()='${option}']     60
    click link          //a[normalize-space()='${option}']

click on the button
    [Arguments]    ${option}
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible      //button[normalize-space()='${option}']     60
    wait until element is enabled      //button[normalize-space()='${option}']     60
    click element       //button[normalize-space()='${option}']
    sleep   ${search_sleep}

click on the button link
    [Arguments]    ${option}
    wait until element is visible        //a[normalize-space()='${option}']         60
    wait until element is enabled      //a[normalize-space()='${option}']     60
    click element       //a[normalize-space()='${option}']

open the browser with the url
    Generic.Fix the column number
    Generic.Fix the row number

    ${StartTime1} =     Get Current Time in Milliseconds
    open browser    ${url}      ${browser_name}     #executable_path=E:/Aithentic/TestPage/resources
    wait until element is visible    //a[normalize-space()='Login']     60
    wait until element is enabled    //a[normalize-space()='Login']     60
    Maximize Browser Window
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Log to console   Current Time in Milliseconds: ${ActualTime}
    Calculate Running time  2  ${pageHeading}   Generic - open the browser with the url     2    ${pageTime}     ${ActualTime}    Load_Time_tracking

Get Current Date and Time
    Generic.Fix the column number
    Generic.Fix the row number

    ${current_date}=    Evaluate    datetime.datetime.now().strftime("%Y-%m-%d")
    ${current_time}=    Evaluate    datetime.datetime.now().strftime("%H:%M:%S")
    ${current_Date_Time}=    Catenate  ${current_date}_${current_time}
    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    Load_Time_tracking
#    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    TechnologyPage_Time
#    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    DashboardPage_Time
#    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    PatnersPage_Time
#    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    ContractPage_Time
#    Calculate Running time  1  ${pageHeading}   Generic - Module name      1    ${pageTime}     ${current_Date_Time}    MessagePage_Time

Close Browser session
    close browser

select the option from the side menu
    [Arguments]     ${option}
    wait until element is visible    //li[@title='${option}']      60
    wait until element is enabled    //li[@title='${option}']      60
    click element       //li[@title='${option}']
#    wait until location contains    ${verifyOption}     timeout=50s

Verify your current page location contains
    [Arguments]    ${verifyOption}
    wait until location contains    ${verifyOption}     60

Verify your current page contains this text
    [Arguments]    ${verifyOption}
    wait until page contains    ${verifyOption}     60

Get Current Time in Milliseconds
    ${time_in_milliseconds}=    Evaluate    int(time.time() * 1000)
    RETURN    ${time_in_milliseconds}

Fetch alert message text and compare it with
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}        60
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}
    Wait Until Element Is Not Visible    ${alert_Msg}        60

Verify alertify is visible
       wait until element is visible    ${alert_Msg}        60

Verify alert message of add team member of compose message
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}        60
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}

Cross the text message alert
    wait until element is enabled    ${cross_alertMsg}        60
    click element       ${cross_alertMsg}

Select parameter
    [Arguments]    ${address}
    wait until element is visible     //span[normalize-space()='${address}']        60
    wait until element is enabled       //span[normalize-space()='${address}']      60
    click element      //span[normalize-space()='${address}']

Click on the profile name
    wait until element is not visible      ${loaderIcon}        60
    wait until element is visible       ${profileName}       60
    wait until element is enabled       ${profileName}       60
    click element       ${profileName}

###############################################################################################
Select other option from profile list
     [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}        60
    wait until element is visible    //a[normalize-space()='${option}']      60
    wait until element is enabled    //a[normalize-space()='${option}']      60
    click element    //a[normalize-space()='${option}']

Select option from profile list
     [Arguments]     ${option}
     wait until element is not visible      ${loaderIcon}       60
     wait until element is visible    css:.qa-${option} li      60
     wait until element is enabled    css:.qa-${option} li      60
     click element    css:.qa-${option} li

###############################################################################################

Enter current date
    [Arguments]    ${option}
    Wait Until Element Is Enabled     ${option}      60
    click element       ${option}
    Clear Element Text      ${option}
    ${curentDate}=    Generic.Fetch Current Date
    input text  ${option}    ${curentDate}

Enter self date
    [Arguments]    ${option}    ${date}
    Wait Until Element Is Enabled     ${option}        60
    click element       ${option}
    Clear Element Text      ${option}
    input text  ${option}    ${date}

Enter value into field
    [Arguments]    ${field}     ${data}
    wait until element is visible       ${field}       60
    Wait Until Element Is Enabled     ${field}     60
#    click element       ${field}
    Clear Element Text      ${field}
    input text      ${field}     ${data}

Open new window
    [Arguments]    ${url}
    Execute JavaScript    window.open('about:blank','_blank')
    Switch Window    NEW    # Switch to the new tab
    Go To    https://www.${url}.com

Search yopmail emails for
    [Arguments]   ${data}
    sleep       3
    wait until element is visible       ${yop_email_searchBar}       60
    Wait Until Element Is Enabled     ${yop_email_searchBar}     60
    click element   ${yop_email_searchBar}
    Clear Element Text      ${yop_email_searchBar}
    input text      ${yop_email_searchBar}     ${data}
    click element   ${yop_email_searchBtn}

Switch to iframe by ID
    [Arguments]    ${frameName}
    Select Frame    //iframe[@id='${frameName}']

Refresh the existing page
    Wait Until Page Contains Element    css:body    60
    Reload Page
    sleep       ${yop_sleep}

Enter phone number
    [Arguments]    ${country}   ${code}     ${phoneNo}
    click element   ${click_countryTag}
    wait until element is visible   ${contact_Country_search}       60
    wait until element is enabled   ${contact_Country_search}       60
    click element   ${contact_Country_search}
    input text  ${contact_Country_search}   ${country}
    Generic.Select parameter      ${code}
    input text     ${phone}     ${phoneNo}
    Sleep    3

Scroll the page till
    [Arguments]    ${option}
    Execute javascript      window.scrollTo(0,${option})

Verify pop-up is visible after clicking on i-icon
    wait until element is visible       css:.popover-content        60
    log to console      Yes, pop-up is visible for i-icon

Scroll Window To End
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

Wait until table get load
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     60
    wait until element is enabled      //tbody//tr//td[normalize-space()='1']      60

Fetch log_out alert message
    sleep      2
    Wait Until Element Is Not Visible    ${alert_Msg}        60

Click keyboard button
    [Arguments]     ${locator}      ${button}
    Press keys      ${locator}      ${button}

Update settings for Asset_ID, employee_id and location
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    close browser