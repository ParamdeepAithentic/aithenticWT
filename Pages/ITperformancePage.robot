*** Settings ***
Documentation     Verify the login page test
Library          SeleniumLibrary
Library    String
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


*** Variables ***
${canclePreviewPopUp}     //span[@data-dismiss='modal']//i
${perparing label2}     //label[text()='Preparing your file....']
${download_file_icon}        //a[@class='mr-1']
${okay_thanks_container}    css:div[id='exportSuccess'] div[class='modal-content my-0 mx-auto']
${PreviewBTN}     //button[normalize-space()='Preview']
${Preview_Brand_Report}     //div[@class='dropdown-menu show']//a[@class='dropdown-item location-edit-qa'][normalize-space()='Brand Report']
${Export_Brand_Report}     //div[@class='dropdown-menu pull-right show']//a[@class='dropdown-item location-edit-qa'][normalize-space()='Brand Report']
${ExportBTN}     //button[@id='exportDropdownMenuButton']



${ssplTab}     css:#supplier-support-partner-location-tab
${ssplList}     css:#sspslReport ul a
${download_ssplSheet}     css:#sspslReport i

${brandReport_Tab}     css:#brand-reports-tab
${brandReport_List}     css:#brandReports ul a
${download_brandReportSheet}     css:#brandReports i

${assetReport_Tab}     css:#asset-reports-tab
${assetReport_List}     css:#AssetReports ul a
${download_assetReportSheet}     css:#AssetReports i

${download_allFiles}     css:.download-all-btn a


${loaderIcon}     //div[@role='status']




*** Keywords ***
Verify sheet is downloaded
    [Arguments]    ${option}
    wait until element is enabled       css:div[id='${option}'] a[title='Download the file']    60
#sspslReport,brandReports,AssetReports

Verify all tabs of supplier_partner_location and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${ssplTab}       60
    click element   ${ssplTab}
    wait until element is visible  ${ssplList}       60
    ${elements} =    Get WebElements    ${ssplList}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60

    END
    wait until element is visible  ${download_ssplSheet}       60
    click element   ${download_ssplSheet}


Verify all tabs of brand report and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${brandReport_Tab}       60
    click element   ${brandReport_Tab}
    wait until element is visible  ${brandReport_List}       60
    ${elements} =    Get WebElements    ${brandReport_List}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60
    END
    wait until element is visible  ${download_brandReportSheet}       60
    click element   ${download_brandReportSheet}


Verify all tabs of asset report and download sheet
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${assetReport_Tab}       60
    click element   ${assetReport_Tab}
    wait until element is visible  ${assetReport_List}       60
    ${elements} =    Get WebElements    ${assetReport_List}
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loaderIcon}      60
    END
    wait until element is visible  ${download_assetReportSheet}       60
    click element   ${download_assetReportSheet}


Click on download all button
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible  ${download_allFiles}       60
    wait until element is enabled  ${download_allFiles}       60
    click element   ${download_allFiles}
    sleep       3




#
##-----------------------------------------------------------------------------------------------------------------------
#select the option from the drawer
#    [Arguments]     ${option}
#    wait until element is visible    //span[normalize-space()='${option}']      60
#    click element    //span[normalize-space()='${option}']
##    wait until location contains    ${verifyOption}     timeout=50s
#
#Select preview file type
#    [Arguments]     ${option}
#    wait until element is visible       //div[@aria-labelledby='previewDropdownMenuButton']/a[text()='${option}']       60
#    click element       //div[@aria-labelledby='previewDropdownMenuButton']/a[text()='${option}']
#
#Select export file type
#    [Arguments]     ${option}
#    wait until element is visible       //div[@aria-labelledby='exportDropdownMenuButton']/a[text()='${option}']       60
#    click element       //div[@aria-labelledby='exportDropdownMenuButton']/a[text()='${option}']
#
#
#Click on the button
#    [Arguments]     ${BTNoption}
#    wait until element is visible    //button[normalize-space()='${BTNoption}']     60
#    click button    ${BTNoption}
#
#Download the sheet after Preview
#    wait until element is visible    ${perparing label2}        60
#    ITperformancePage.Click on the button   Download
#    sleep   5
#
#Verify Export file
#    wait until element is visible  ${okay_thanks_container}        60
#    click on the button    Okay, Thanks!
#    wait until element is visible    ${download_file_icon}      60
#    click element    ${download_file_icon}
#    sleep       5
#
#
#
#Close the Preview section
#    wait until element is visible  ${PreviewBTN}
#    click element   ${PreviewBTN}
#    wait until element is visible   ${Preview_Brand_Report}
#    click element    ${Preview_Brand_Report}
#    wait until element is visible  ${canclePreviewPopUp}
#    mouse over    ${canclePreviewPopUp}
#    click element    ${canclePreviewPopUp}
#    sleep       3
#
##-----------------------------------------------------------------------------------------------------------------------




