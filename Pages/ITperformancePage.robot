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
${aging_analytics_tablelocator}    (//h4[normalize-space()='Critical Aged Assets']//following::tr)[2]//td




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
    sleep       3

Skip Action
    Log    Skipping action as the element value is 0

Get and verify the count of aging analytics table
    ${element_count}=    Get Element Count    ${aging_analytics_tablelocator}
    log to console      ${element_count}
    FOR    ${index}    IN RANGE    5    ${element_count + 1}
        ${element}=    Get Text    (//h4[normalize-space()='Critical Aged Assets']//following::tr)[2]//td[${index}]
        Log    Element ${index}: ${element}
        ${element_as_number}=   Convert To Integer   ${element}
        log  converted Test:${element_as_number}
        Run Keyword If    ${element_as_number} == 0    Skip Action
        ...    ELSE IF    ${element_as_number} > 0
        ...   Run Keywords      Click Element    (//h4[normalize-space()='Critical Aged Assets']//following::tr)[2]//td[${index}]     AND       sleep   10s
        ...   Run Keywords     AND    Click Element    css:span[class='back']  AND  Sleep    10s
        ...    ELSE    Log    Custom action for element ${index} with value ${element}
    END



Click on aging analytics tab
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${AgingReport}       60
    wait until element is enabled   ${AgingReport}       60
    click element   ${AgingReport}

Click on tab under aging analytics
    [Arguments]     ${tab}
    wait until element is visible   css:#${tab}-tab   60
    wait until element is enabled   css:#${tab}-tab   60
    sleep   2
    click element   css:#${tab}-tab
    Wait Until Element Is Not Visible    ${loaderIcon}      60




