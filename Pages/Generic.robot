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

${SheetLocationAndName}   LoadTimeSheet.xlsx
${SheetTabName}     Load_Time_tracking

${alert_Msg}     css:.msg.d-inline-flex

${cross_alertMsg}   css:.close.position-absolute.text-white
${loaderIcon}     //div[@role='status']
${shadow}       //div[@aria-modal='true']
${yop_email_searchBar}     css:#login
${yop_email_searchBtn}      css:button[title='Check Inbox @yopmail.com']
${click_Country}     css:#country
#${click_countryTag}     css:.iti__selected-flag.dropdown-toggle
${click_countryTag}     css:.iti__arrow
${contact_Country_search}     css:#country-search-box
${phone}     css:#phone


${wait_time}       60

${yop_sleep}       10


${search_sleep}       1


${CASE}       uat   #qa , uat , pre-prod



#  Load_Time_tracking  Dropdown_LoadTime    Table_Load_Time    Search_Load_Time    UAT 15March

*** Keywords ***
Simulate Switch Case
    Run Keyword If    '${CASE}' == 'qa'    Set QA Variables
    ...    ELSE IF    '${CASE}' == 'uat'   Set UAT Variables
    ...    ELSE IF    '${CASE}' == 'pre-prod'    Set Pre-Prod Variables
    ...    ELSE    Set Default Variables

Set QA Variables
    Set Suite Variable    ${url}    https://qa-app.aithentic.com/
    Set Suite Variable    ${valid_password}            Paramdeep@112           #UAT user        Test@123
#    Set Suite Variable    ${valid_password}           Test@123
    Set Suite Variable    ${apiURL}    https://qa-api.aithentic.com/api/v1
    Set Suite Variable    ${agentDiscovery_TagName}    Tag Name - johnsoftwaresolutions-1192-4         #qa
    Set Suite Variable    ${IP_Discovered_devices}    Tag Name - johnsoftwaresolutions-1192-4
    Set Suite Variable    ${agentDiscovery_OnlyTagName}     johnsoftwaresolutions-1192-4
    Set Suite Variable    ${admin_url}        https://qa-admin.aithentic.com/
    Set Suite Variable    ${admin_name}        aithentic@yopmail.com
    Set Suite Variable    ${admin_password}       Admin@123
    Set Suite Variable    ${browser_name}         firefox
    Set Suite Variable    ${email}          deepparam112@mail-mario.fr.nf
#    Set Suite Variable    ${email}           testqa29j@mailinator.com
    Set Suite Variable    ${discovered_asset_brand}                 MSI
    Set Suite Variable    ${existing_mac}                       D8:CB:8A:CA:6A:39
    Set Suite Variable    ${discovered_existing_brand}          QABrand555
    Set Suite Variable    ${discovered_existing_product}        QAHardwareProduct
    Set Suite Variable    ${discovered_existing_department}    Customer Support
    Set Suite Variable    ${discovered_IP}   192.168.18.23
    Set Suite Variable    ${discovery_asset_list_brand}       Apple, Inc.
    Set Suite Variable    ${Team_member_location}       United States - Main Office - 21 - 2
    Set Suite Variable    ${Technology_group}      Communication
    Set Suite Variable    ${Technology_group1}      DVD / TV Combos


Set UAT Variables
    Set Suite Variable    ${url}        https://uat-app.aithentic.com/
    Set Suite Variable    ${valid_password}         Paramdeep@112      #  Test@123                   #UAT user
    Set Suite Variable    ${apiURL}    https://uat-api.aithentic.com/api/v1
    Set Suite Variable    ${agentDiscovery_TagName}    Tag Name - johnsoftwaresolutions-1428-4        #uat
    Set Suite Variable    ${IP_Discovered_devices}    Tag Name - johnsoftwaresolutions-1428-10        #uat
    Set Suite Variable    ${agentDiscovery_OnlyTagName}         johnsoftwaresolutions-1428-4
    Set Suite Variable    ${admin_url}        https://uat-admin.aithentic.com/
    Set Suite Variable    ${admin_name}        aithentic@yopmail.com
    Set Suite Variable    ${admin_password}       Admin@123
    Set Suite Variable    ${browser_name}         firefox

    Set Suite Variable    ${email}          deepparam112@mail-mario.fr.nf
#    Set Suite Variable    ${email}           testqa29j@mailinator.com

    Set Suite Variable    ${discovered_asset_brand}                 Apple Inc
    Set Suite Variable    ${existing_mac}                       98:5a:eb:cb:c8:ed
    Set Suite Variable    ${discovered_existing_brand}              Apple Inc.
    Set Suite Variable    ${discovered_existing_brand1}              QABrand555
    Set Suite Variable    ${discovered_existing_product}            Macmini9,1
    Set Suite Variable    ${discovered_existing_department}        Quality Assurance
    Set Suite Variable    ${discovered_IP}    192.168.29.176
    Set Suite Variable    ${discovery_asset_list_brand}     Samsung Electronics Co.,Ltd
    Set Suite Variable    ${existing_mac}                       DC:21:5C:9C:3E:57
    Set Suite Variable    ${Team_member_location}        Colombia - Twinhead123 - 56 - 21
    Set Suite Variable    ${Technology_group}      Accessories
    Set Suite Variable    ${Technology_group1}     CRT TVs


Set Pre-Prod Variables
    Set Suite Variable    ${url}    https://pre-prod-app.aithentic.com/
    Set Suite Variable    ${valid_password}     Paramdeep@112         # Test@123     #pre prod
    Set Suite Variable    ${apiURL}    https://pre-prod-api.aithentic.com/api/v1
    Set Suite Variable    ${browser_name}         firefox
    Set Suite Variable    ${email}                deepparam112@mail-mario.fr.nf  # testqa29j@mailinator.com
    Set Suite Variable    ${discovered_asset_brand}                ECS
    Set Suite Variable    ${existing_mac}                       b8:ae:ed:bc:1c:35
    Set Suite Variable    ${discovered_existing_brand}          QABrand555
    Set Suite Variable    ${discovered_existing_product}        Product_00337612322
    Set Suite Variable    ${discovered_existing_department}    Operations
    Set Suite Variable    ${discovered_IP}   192.168.18.86
    Set Suite Variable    ${discovery_asset_list_brand}       Apple, Inc.
    Set Suite Variable    ${Team_member_location}       United States - Building23 - 4 - 8
    Set Suite Variable    ${Technology_group}      Applications
    Set Suite Variable    ${Technology_group1}      Applications

Set Research Variables
    Set Suite Variable    ${url}    https://research-app.aithentic.com/
    Set Suite Variable    ${valid_password}    Test@123       #QA User
    Set Suite Variable    ${apiURL}    https://research-api.aithentic.com/api/v1
    Set Suite Variable    ${agentDiscovery_TagName}    Tag Name - johnsoftwaresolutions-1192-4         #qa
    Set Suite Variable    ${IP_Discovered_devices}    Tag Name - johnsoftwaresolutions-1192-4
    Set Suite Variable    ${agentDiscovery_OnlyTagName}     johnsoftwaresolutions-1192-4
    Set Suite Variable    ${admin_url}        https://research-admin.aithentic.com/
    Set Suite Variable    ${admin_name}        aithentic@yopmail.com
    Set Suite Variable    ${admin_password}       Admin@123
    Set Suite Variable    ${browser_name}         firefox
    Set Suite Variable    ${email}                 testqa29j@mailinator.com
    Set Suite Variable    ${discovered_asset_brand}                 MSI
    Set Suite Variable    ${existing_mac}                       D8:CB:8A:CA:6A:39
    Set Suite Variable    ${discovered_existing_brand}          QABrand555
    Set Suite Variable    ${discovered_existing_product}        QAHardwareProduct
    Set Suite Variable    ${discovered_existing_department}    Customer Support
    Set Suite Variable    ${discovered_IP}   192.168.18.23
    Set Suite Variable    ${discovery_asset_list_brand}       Apple, Inc.


Set Default Variables
    Set Suite Variable    ${url}    https://uat-app.aithentic.com/
    Set Suite Variable    ${valid_password}    Test@123     #UAT user
    Set Suite Variable    ${apiURL}    https://uat-api.aithentic.com/api/v1
    Set Suite Variable    ${agentDiscovery_TagName}    Tag Name - johnsoftwaresolutions-1428-4        #uat
    Set Suite Variable    ${admin_url}        https://uat-admin.aithentic.com/
    Set Suite Variable    ${admin_name}        aithentic@yopmail.com
    Set Suite Variable    ${admin_password}       Admin@123
    Set Suite Variable    ${browser_name}         headlessfirefox
    Set Suite Variable    ${email}                 testqa29j@mailinator.com
    Set Suite Variable    ${discovered_asset_brand}                 Apple Inc
    Set Suite Variable    ${discovered_existing_brand}              Apple Inc.
    Set Suite Variable    ${discovered_existing_product}            Macmini9,1
    Set Suite Variable    ${discovered_existing_department}        Quality Assurance
    Set Suite Variable    ${discovered_IP}    00:17:61:10:C6:A1
    Set Suite Variable    ${discovery_asset_list_brand}     AKKA Germany GmbH


Fix the column number
    ${pageHeading}=   Catenate    2
    set global variable    ${pageHeading}
#    log to console  my column no is:${pageHeading}

Fix the row number
    ${pageTime}=   Catenate    3
    set global variable    ${pageTime}
#    log to console  my column no is:${pageTime}

Fix the column number for new user in sorting
    ${newUserpageTime}=   Catenate    4
    set global variable    ${newUserpageTime}
#    log to console  my column no is:${pageTime}

Fetch Current Date
    ${current_date}=    Get Current Date    result_format=%m/%d/%Y
    Log to console   Current Date: ${current_date}
    set global variable    ${current_date}
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

Calculate Running time for sorting
    [Arguments]   ${RowNum_forText}   ${ColumnNum_forText}   ${module_name}     ${RowNum}   ${ColumnNum}      ${TimeTakenToLoginPage}   ${SheetTabName}
    Close All Excel Documents
    Open Excel Document  ${SheetLocationAndName}   doc_id=1
    Write Excel Cell     ${RowNum_forText}   ${ColumnNum_forText}   ${module_name}     ${SheetTabName}
    Write Excel Cell     ${RowNum}   ${ColumnNum}   ${TimeTakenToLoginPage}     ${SheetTabName}
    Save Excel Document     ${SheetLocationAndName}
    Close All Excel Documents

click on the tab
    [Arguments]    ${option}
    wait until element is visible    //a[normalize-space()='${option}']          ${wait_time}
    wait until element is enabled    //a[normalize-space()='${option}']          ${wait_time}
    click element          //a[normalize-space()='${option}']

click on the button
    [Arguments]    ${option}
    wait until element is not visible   ${loaderIcon}          ${wait_time}
    wait until element is visible      //button[normalize-space()='${option}']          ${wait_time}
    wait until element is enabled      //button[normalize-space()='${option}']          ${wait_time}
    sleep   ${search_sleep}
    click element       //button[normalize-space()='${option}']
    sleep   ${search_sleep}


click on the button link
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        //a[normalize-space()='${option}']        ${wait_time}
    wait until element is enabled      //a[normalize-space()='${option}']          ${wait_time}
    click element       //a[normalize-space()='${option}']
    sleep       ${search_sleep}


open the browser with the url
    Generic.Fix the column number
    Generic.Fix the row number
    Generic.Fix the column number for new user in sorting
    Simulate Switch Case
    open browser    ${url}      ${browser_name}     #executable_path=E:/Aithentic/TestPage/resources
    wait until element is visible    //a[normalize-space()='Login']          60
    wait until element is enabled    //a[normalize-space()='Login']          60
    Maximize Browser Window

Get Current Date and Time
    Generic.Fix the column number
    Generic.Fix the row number
    Generic.Fix the column number for new user in sorting

    ${current_date}=    Evaluate    datetime.datetime.now().strftime("%Y-%m-%d")
    ${current_time}=    Evaluate    datetime.datetime.now().strftime("%H:%M:%S")
    ${current_Date_Time}=    Catenate  ${current_date}_${current_time}

Close Browser session
    close browser


select the option from the side menu
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //li[@title='${option}']          ${wait_time}
    wait until element is enabled    //li[@title='${option}']          ${wait_time}
    click element       //li[@title='${option}']
#    wait until location contains    ${verifyOption}     timeout=50s

Verify your current page location contains
    [Arguments]    ${verifyOption}
    Wait Until Element Is Not Visible    ${loaderIcon}    ${wait_time}
    wait until location contains    ${verifyOption}     ${wait_time}
    wait until element is not visible   ${loaderIcon}          ${wait_time}                 # Remove later

Verify your current page contains this text
    [Arguments]    ${verifyOption}
    wait until page contains    ${verifyOption}     ${wait_time}

Get Current Time in Milliseconds
    ${time_in_milliseconds}=    Evaluate    int(time.time() * 1000)
    RETURN    ${time_in_milliseconds}

Fetch alert message text and compare it with
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}          ${wait_time}
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}
    Wait Until Element Is Not Visible    ${alert_Msg}          ${wait_time}

Fetch alert message text and compare it with containing text
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}          ${wait_time}
    Element should contain          ${alert_Msg}       ${option}
    Wait Until Element Is Not Visible    ${alert_Msg}          ${wait_time}

Verify alertify is visible
       wait until element is visible    ${alert_Msg}          ${wait_time}

Verify alert message of add team member of compose message
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}          ${wait_time}
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}

Cross the text message alert
    wait until element is enabled    ${cross_alertMsg}          ${wait_time}
    click element       ${cross_alertMsg}

Select span parameter
    [Arguments]    ${address}
    Wait Until Element Is Not Visible    ${loaderIcon}   ${wait_time}
    wait until element is visible     //div[contains(@class,'dropdown-panel')]//span[normalize-space()='${address}']        ${wait_time}
    wait until element is enabled       //div[contains(@class,'dropdown-panel')]//span[normalize-space()='${address}']          ${wait_time}
    click element      //div[contains(@class,'dropdown-panel')]//span[normalize-space()='${address}']

Select parameter
    [Arguments]    ${address}
    Wait Until Element Is Not Visible    ${loaderIcon}   ${wait_time}
    wait until element is visible     //span[normalize-space()='${address}']        ${wait_time}
    wait until element is enabled       //span[normalize-space()='${address}']          ${wait_time}
    click element      //span[normalize-space()='${address}']

Click first index of dropdown
    [Arguments]    ${option}
    wait until element is visible     //div[contains (@id, '-0')]//span[normalize-space()='${option}']       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]//span[normalize-space()='${option}']       ${wait_time}
    click element        //div[contains (@id, '-0')]//span[normalize-space()='${option}']

Click on the profile name
    wait until element is not visible      ${loaderIcon}          ${wait_time}
    wait until element is visible       ${profileName}          ${wait_time}
    wait until element is enabled       ${profileName}          ${wait_time}
    wait until element is not visible      ${loaderIcon}          ${wait_time}          # Remove later
    click element       ${profileName}

###############################################################################################
Select subscription option from profile list
#    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}          ${wait_time}
    wait until element is visible    css:.qa-subscription-dropdown          ${wait_time}
    wait until element is enabled    css:.qa-subscription-dropdown           ${wait_time}
    wait until element is not visible      ${loaderIcon}          ${wait_time}                  # Remove later
#    click element    css:.qa-subscription-dropdown
    Execute JavaScript    document.querySelector('.qa-subscription-dropdown').click();

Select logout option from profile list
#    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}          ${wait_time}
    wait until element is visible    //li[contains(@class,'qa-logout-dropdown')]//a         ${wait_time}
    wait until element is enabled    //li[contains(@class,'qa-logout-dropdown')]//a          ${wait_time}
    wait until element is not visible      ${loaderIcon}          ${wait_time}                  # Remove later
    click element    //li[contains(@class,'qa-logout-dropdown')]//a


Select option from profile list
     [Arguments]     ${option}
     wait until element is not visible      ${loaderIcon}          ${wait_time}
     wait until element is visible    css:.qa-${option} li      ${wait_time}
     wait until element is enabled    css:.qa-${option} li      ${wait_time}
     wait until element is not visible      ${loaderIcon}          ${wait_time}                 # Remove later
     click element    css:.qa-${option} li


Select simple option from profile list
    [Arguments]     ${option}
    wait until element is not visible      ${loaderIcon}          ${wait_time}
    wait until element is visible    //a[normalize-space()='${option}']         ${wait_time}
    wait until element is enabled    //a[normalize-space()='${option}']         ${wait_time}
    wait until element is not visible      ${loaderIcon}          ${wait_time}                  # Remove later
    click element    //a[normalize-space()='${option}']
    sleep   ${search_sleep}

###############################################################################################

Enter current date
    [Arguments]    ${option}
    Wait Until Element Is Enabled     ${option}      ${wait_time}
    click element       ${option}
    Clear Element Text      ${option}
    ${curentDate}=    Generic.Fetch Current Date
    input text  ${option}    ${curentDate}
#    click element       ${option}

Enter self date
    [Arguments]    ${option}    ${date}
    Wait Until Element Is Enabled     ${option}          ${wait_time}
    click element       ${option}
    Clear Element Text      ${option}
    input text  ${option}    ${date}

Enter value into field
    [Arguments]    ${field}     ${data}
    wait until element is visible       ${field}          ${wait_time}
    Wait Until Element Is Enabled     ${field}     ${wait_time}
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
    wait until element is visible       ${yop_email_searchBar}          ${wait_time}
    Wait Until Element Is Enabled     ${yop_email_searchBar}     ${wait_time}
    click element   ${yop_email_searchBar}
    Clear Element Text      ${yop_email_searchBar}
    input text      ${yop_email_searchBar}     ${data}
    click element   ${yop_email_searchBtn}

Switch to iframe by ID
    [Arguments]    ${frameName}
    Select Frame    //iframe[@id='${frameName}']

Refresh the existing page
    Wait Until Page Contains Element    css:body    ${wait_time}
    Reload Page
    sleep       ${yop_sleep}

Enter phone number
    [Arguments]    ${country}   ${code}     ${phoneNo}
    click element   ${click_countryTag}
    wait until element is visible   ${contact_Country_search}          ${wait_time}
    wait until element is enabled   ${contact_Country_search}          ${wait_time}
    click element   ${contact_Country_search}
    input text  ${contact_Country_search}   ${country}
    Generic.Select parameter      ${code}
    input text     ${phone}     ${phoneNo}
    Press Keys    ${phone}      ENTER
#    click element   ${click_countryTag}
#    Click element   css:#phone
#    wait until element is not visible       //span[normalize-space()='Please enter a valid Mobile Number']     ${wait_time}



Scroll the page till
    [Arguments]    ${option}
    Execute javascript      window.scrollTo(0,${option})
    wait until element is not visible       ${loaderIcon}       ${wait_time}

Verify pop-up is visible after clicking on i-icon
    wait until element is visible       css:.popover-body div.iIcon-centent-section       ${wait_time}
    log to console      Yes, pop-up is visible for i-icon

Scroll Window To End
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

Wait until table get load
    wait until element is visible       //tbody//tr//td[normalize-space()='1']          ${wait_time}
    wait until element is enabled      //tbody//tr//td[normalize-space()='1']          ${wait_time}

Wait until table get load for filters
    TRY
         wait until element is visible       //tbody//tr//td[normalize-space()='1']          ${wait_time}
         wait until element is enabled      //tbody//tr//td[normalize-space()='1']          ${wait_time}
    EXCEPT
        wait until element is visible       //span[normalize-space()='No Records']          ${yop_sleep}
        wait until element is enabled      //span[normalize-space()='No Records']           ${yop_sleep}
    FINALLY
        Log    Table got the issue while loading or there is no data
    END

Fetch log_out alert message
    sleep      2
    Wait Until Element Is Not Visible    ${alert_Msg}          ${wait_time}


Click keyboard button
    [Arguments]     ${locator}      ${button}
    Press keys      ${locator}      ${button}

wait for the shadow to get hide from the current screen
    wait until element is not visible       ${shadow}          60

Update settings for Asset_ID, employee_id and location
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox      yes
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    sleep   ${search_sleep}
    DashboardPage.Select the asset ID checkbox      no
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-dropdown
#    Generic.Verify your current page location contains      subscription
#    SubscriptionPage.Select if you want to change plan or asset    Change Plan
#    TechnologyPage.Select plan for subscription     Premium
#    Generic.Scroll the page till    200
#    SubscriptionPage.Set asset range to     1000
#    SubscriptionPage.Update the payment of changed plan     proceed
#    TechnologyPage.Click on pop up of available Inactive Asset   cancel
#    SubscriptionPage.Select the payment method    ach
#    SubscriptionPage.Select the account for payment
#    SubscriptionPage.Proceed the payment     proceed
#    Generic.Fetch alert message text and compare it with      Payment Successful
    sleep       ${yop_sleep}
    close browser
#    Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F
#    Run Process    cmd.exe    /C    taskkill /IM chrome.exe /F
#    Run Process    cmd.exe    /C    taskkill /IM skype.exe /F
#    Run Process    cmd.exe    /C    taskkill /IM msedge.exe /F

Click on the reset filters link
    Generic.click on the button link        reset filters


Wait for table skelton to get disable
     wait until element is not visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]          ${wait_time}

Wait for the spinner to get disable
    wait until element is not visible    cs:.qa-assign-support-partner .ng-spinner-loader      ${wait_time}

Set asset ID settings
    TRY
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox      yes
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    sleep   ${search_sleep}
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    EXCEPT
        Log    Alert is not visible check settings update
    END

Fetch And Verify error toast messages
    [Arguments]         ${option}
    Wait Until Element Is Visible   css:.toast-error .d-inline-flex    ${wait_time}
    ${alert_text}=    Get Text   css:.toast-error .d-inline-flex
    log to console     ${alert_text}
    Should Contain    ${alert_text}    ${option}
    Wait Until Element Is Not Visible    (//span[contains(@class,'msg d-inline')])[2]    ${wait_time}

Wait the billing image loader to get hide
   Wait Until Element Is Not Visible     //*[contains(text(),'do not refresh the page or leave the browser')]       120