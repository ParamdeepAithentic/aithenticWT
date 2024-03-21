*** Settings ***
Documentation   Contains all keyword of ITperformance page
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot


*** Variables ***
${canclePreviewPopUp}     //span[@data-dismiss='modal']//i
${perparing label2}     //label[text()='Preparing your file....']
${download_file_icon}        //a[@class='mr-1']
${okay_thanks_container}    css:div[id='exportSuccess'] div[class='modal-content my-0 mx-auto']
${PreviewBTN}     //button[normalize-space()='Preview']
${Preview_Brand_Report}     //div[@class='dropdown-menu show']//a[@class='dropdown-item location-edit-qa'][normalize-space()='Brand Report']
${Export_Brand_Report}     //div[@class='dropdown-menu pull-right show']//a[@class='dropdown-item location-edit-qa'][normalize-space()='Brand Report']
${ExportBTN}     //button[@id='exportDropdownMenuButton']



${forcastReport}     css:#spend-forecast-reports-tab
${forcastList}     css:#SpendForecastsReports ul a
${download_forcastReport}     css:#SpendForecastsReports i

${AgingReport}     css:#aging-analytics-tab
${AgingList}     css:#AgingAnalyticsReports ul a
${download_AgingReport}     css:#AgingAnalyticsReports i

${partnerInvestmentReport}     css:#investments-partners-tab
${partnerInvestmentList}     css:#sspslReport ul a
${download_partnerInvestmentReport}     css:#sspslReport i

${download_allFiles}     css:.download-all-btn a


${loaderIcon}     //div[@role='status']
${aging_analytics_tablelocator}    (//h4[normalize-space()='Critical Aged Assets']//following::tr)[3]//td

${EMPTY}



*** Keywords ***
Verify sheet is downloaded
    [Arguments]    ${option}
    wait until element is enabled       css:div[id='${option}'] a[title='Download the file']    60
#sspslReport,brandReports,AssetReports

Verify all tabs of supplier_partner_location and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${forcastReport}       60
    click element   ${forcastReport}
    wait until element is visible  ${forcastList}       60
    ${elements} =    Get WebElements    ${forcastList}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60

    END
    wait until element is visible  ${download_forcastReport}       60
    click element   ${download_forcastReport}

Verify all tabs of brand report and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${AgingReport}       60
    click element   ${AgingReport}
    wait until element is visible  ${AgingList}       60
    ${elements} =    Get WebElements    ${AgingList}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60
    END
    wait until element is visible  ${download_AgingReport}       60
    click element   ${download_AgingReport}


Verify all tabs of asset report and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${partnerInvestmentReport}       60
    click element   ${partnerInvestmentReport}
    wait until element is visible  ${partnerInvestmentList}       60
    ${elements} =    Get WebElements    ${partnerInvestmentList}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60
    END
    wait until element is visible  ${download_partnerInvestmentReport}       60
    click element   ${download_partnerInvestmentReport}

Click on download all button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${download_allFiles}       90
    wait until element is enabled  ${download_allFiles}       90
    click element   ${download_allFiles}
    sleep       ${search_sleep}

Skip Action
    Log    Skipping action as the element value is 0

Empty Action
    Log    Skipping empty action as the element value is null


Get and verify the count of aging analytics table
    [Arguments]     ${option}       ${tab_count}
    ${element_count}=    Get Element Count    (//h4[normalize-space()='${tab_count}']//following::tr)[2]//td
    Log      ${element_count}
    FOR    ${index}    IN RANGE    5    ${element_count + 1}
        Wait Until Element Is Visible   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        Wait Until Element Is Enabled   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        ${element}=    Get Text    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]
        Log    Element ${index}: ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]     AND       sleep   ${yop_sleep}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END


Remove Special Characters
    [Arguments]    ${input_string}
    ${pattern}=    Set Variable    [^a-zA-Z0-9\s]
    ${cleaned_string}=    Replace String Using Regexp    ${input_string}    ${pattern}    ${EMPTY}
    RETURN    ${cleaned_string}

Click on tabs under it perfomance
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible   css:.qa-${option}-tab      60
    wait until element is enabled   css:.qa-${option}-tab      60
    click element   css:.qa-${option}-tab
    sleep   ${search_sleep}


Click on data quality button link under it perfomance
    [Arguments]     ${option}
    wait until element is visible   css:.qa-data-quality-${option} h4   60
    wait until element is enabled   css:.qa-data-quality-${option} h4     60
    sleep   ${search_sleep}
    click element   css:.qa-data-quality-${option} h4


Click on aging analytics tab
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${AgingReport}       60
    wait until element is enabled   ${AgingReport}       60
    click element   ${AgingReport}

Click on tab under aging analytics
    [Arguments]     ${tab}
    wait until element is visible   css:#${tab}-tab   60
    wait until element is enabled   css:#${tab}-tab   60
    sleep   ${search_sleep}
    click element   css:#${tab}-tab
    Wait Until Element Is Not Visible    ${loaderIcon}      60

click on fiscal year forecast
    wait until element is visible   css:#totalitassetsspendfy-tab   60
    wait until element is enabled   css:#totalitassetsspendfy-tab   60
    click element   css:#totalitassetsspendfy-tab
    wait until element is not visible   ${loaderIcon}       60

Click on refresh icon of technolofy it performance page
    wait until element is visible   css:.reset-search-qa    60
    wait until element is enabled   css:.reset-search-qa    60
    click element   css:.reset-search-qa
    wait until element is not visible   ${loaderIcon}       60
    Generic.Wait until table get load

Click on current and previous year tab under spend forecast
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible   css:#totalitassetsspendfyq-tab      60
    wait until element is enabled   css:#totalitassetsspendfyq-tab      60
    click element   css:#totalitassetsspendfyq-tab

Click on five year forecast tab under spend forecast
    wait until element is not visible   ${loaderIcon}       60
    wait until element is visible   css:#technologyspendforecast-tab      60
    wait until element is enabled   css:#technologyspendforecast-tab      60
    click element   css:#technologyspendforecast-tab

Click on data quality button link under investments by partner tab
    [Arguments]     ${option}
    wait until element is visible   css:.qa-data-quality-partner-${option} h4   60
    wait until element is enabled   css:.qa-data-quality-partner-${option} h4     60
    sleep   ${search_sleep}
    click element   css:.qa-data-quality-partner-${option} h4


Click on tabs under investment by partner tab
    [Arguments]     ${tab}
    wait until element is visible   css:#${tab}-tab    60
    wait until element is enabled   css:#${tab}-tab    60
    click element   css:#${tab}-tab
    wait until element is not visible    ${loaderIcon}       60

Search by brand, asset id , product and assignee
    [Arguments]    ${AssetID}
    wait until element is visible       css:input[placeholder='Search by Brand, Product, Asset ID and Assignee']       60
    Clear Element Text      css:input[placeholder='Search by Brand, Product, Asset ID and Assignee']
    input text      css:input[placeholder='Search by Brand, Product, Asset ID and Assignee']     ${AssetID}
    sleep       ${search_sleep}

Get And Verify The Count Of Data Quality Under Tabs
    [Arguments]     ${option}       ${tab_count}
    ${element_count}=    Get Element Count    //div[@id="${tab_count}"]//tbody//tr//td[2]
    Log      ${element_count}
    FOR    ${index}    IN RANGE    1    ${element_count + 1}
        Wait Until Element Is Visible   //div[@id="${option}"]//tbody//tr[${index}]//td[2]       60
        Wait Until Element Is Enabled   //div[@id="${option}"]//tbody//tr[${index}]//td[2]        60
        ${element}=    Get Text    //div[@id="${option}"]//tbody//tr[${index}]//td[2]
        Log    Element ${index}: ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    //div[@id="${option}"]//tbody//tr[${index}]//td[2]      AND       sleep   ${yop_sleep}        AND       ITperformancePage.Fetch and compare the total count  ${element_as_number}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END

Fetch and compare the total count
    [Arguments]  ${value}
    wait until element is enabled       ${Totalcount_field}      60
    wait until element is visible   ${Totalcount_field}      60
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_count}    Get Substring    ${parts[1]}    3
    ${number}=   Convert To Integer   ${total_count}
    Log to console  Total count is :${total_count}
    set global variable    ${total_count}
    should be equal    ${number}     ${value}


Get And Verify The Count Of Data Quality Under Investment by partner tab
    [Arguments]     ${option}       ${tab_count}
    ${element_count}=    Get Element Count    //div[@id="${tab_count}"]//tbody//tr//td[2]
    Log      ${element_count}
    FOR    ${index}    IN RANGE    1    ${element_count}
        Wait Until Element Is Visible   //div[@id="${option}"]//tbody//tr[${index}]//td[2]       60
        Wait Until Element Is Enabled   //div[@id="${option}"]//tbody//tr[${index}]//td[2]        60
        ${element}=    Get Text    //div[@id="${option}"]//tbody//tr[${index}]//td[2]
        Log    Element ${index}: ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    //div[@id="${option}"]//tbody//tr[${index}]//td[2]      AND       sleep   ${yop_sleep}        AND       ITperformancePage.Fetch and compare the total count  ${element_as_number}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END

Get and verify the count of table of investment by partner
    [Arguments]     ${option}       ${tab_count}
    ${element_count}=    Get Element Count    (//h4[normalize-space()='${tab_count}']//following::tr)[2]//td
    Log      ${element_count}
    FOR    ${index}    IN RANGE    4    ${element_count + 1}
        Wait Until Element Is Visible   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        Wait Until Element Is Enabled   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        ${element}=    Get Text    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]
        Log    Element ${index}: ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]     AND       sleep   ${yop_sleep}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END


Get and verify the count of table of brand spend by supplier and supplier spend my location of investment by partner
    [Arguments]     ${option}       ${tab_count}
    ${element_count}=    Get Element Count    (//h4[normalize-space()='${tab_count}']//following::tr)[2]//td
    Log      ${element_count}
    FOR    ${index}    IN RANGE    5    ${element_count + 1}
        Wait Until Element Is Visible   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        Wait Until Element Is Enabled   (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]       60
        ${element}=    Get Text    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]
        Log    Element ${index}: ${element}
        Run Keyword If    '${element}' == '${EMPTY}'    Run Keywords    Empty Action   AND     Continue For Loop
        ${element}=    Remove Special Characters    ${element}
        Log     Element after removing special characters: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  Converted Text: ${element_as_number}
        Run Keyword If    ${element_as_number} == 0
        ...    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...    Run Keywords      Click Element    (//h4[normalize-space()='${option}']//following::tr)[2]//td[${index}]     AND       sleep   ${yop_sleep}
        ...    AND    Click Element    css:span[class='back']  AND  Sleep    ${yop_sleep}
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END