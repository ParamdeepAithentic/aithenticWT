*** Settings ***
Documentation   Contains all keyword of  OCS page
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
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/UnselectAssetAPI.robot


*** Variables ***
${preparingAgent_text}     //div[@id='downloadAgentOCSFile']//p[contains(text(),'File is preparing, please wait....')]
${AgentReady_text}     //p[contains(text(),'File is ready, please download')]

*** Keywords ***
Verify that agent is ready to get download
    wait until element is not visible     ${preparingAgent_text}      60
    wait until element is visible     ${AgentReady_text}      60

Would you like to download agent
    [Arguments]    ${option}
    wait until element is visible      //button[normalize-space()='${option}']     60
    wait until element is enabled      //button[normalize-space()='${option}']     60
    click element       //button[normalize-space()='${option}']
    wait until element is not visible   ${loaderIcon}   60

Select the agent type
    [Arguments]    ${option}
    wait until element is visible      //button[normalize-space()='${option}']     60
    wait until element is enabled      //button[normalize-space()='${option}']     60
    click element       //button[normalize-space()='${option}']

Choose tab under Discovery Assets
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    wait until element is visible       css:.qa-${option}-tab       60
    click element       css:.qa-${option}-tab
#option: network-discovery, agent-discovery

Click on search icon of discovery assets
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible       //i[@title='Search: Agent/Network - Discovered Assets']     60
    Wait Until Element Is enabled       //i[@title='Search: Agent/Network - Discovered Assets']     60
    Click Element    //i[@title='Search: Agent/Network - Discovered Assets']

Enter text to search discovery asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible    //input[@placeholder='Search OCS Discovered Assets']       60
    Wait Until Element Is enabled    //input[@placeholder='Search OCS Discovered Assets']       60
    Input Text    //input[@placeholder='Search OCS Discovered Assets']    ${option}

Enter text to search existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible    //input[@placeholder='Search Existing Assets']       60
    Wait Until Element Is enabled    //input[@placeholder='Search Existing Assets']       60
    Input Text    //input[@placeholder='Search Existing Assets']    ${option}

Verify Searched discovery asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible    css:.left-text
    Element Should Contain    css:.left-text    ${option}

Verify searched existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    Sleep    ${yop_sleep}
    Wait Until Element Is Visible    css:.right-text
    Element Should Contain    css:.right-text    ${option}


Click on search icon of Existing assets
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible        //i[@title='Search: My Exiting Aithentic Assets']    60
    Wait Until Element Is Enabled        //i[@title='Search: My Exiting Aithentic Assets']    60
    Click Element    //i[@title='Search: My Exiting Aithentic Assets']

Select any Discovered asset
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible        //div[contains(@class,"qa-assets-boxes-left")]/div[1]/div[1]        60
    Click Element    //div[contains(@class,"qa-assets-boxes-left")]/div[1]/div[1]
    Wait Until Element Is Not Visible    ${alert_Msg}       60

Select any existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible       //div[contains(@class,"qa-assets-boxes-right")]/div[1]/div[1]       60
    Click Element    //div[contains(@class,"qa-assets-boxes-right")]/div[1]/div[1]
    Wait Until Element Is Not Visible    ${alert_Msg}       60

Verify that line appears between selected assets
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Page Should Contain Element    //div[@title='Double click here to unmatch asset']       60

Verify that line does not appears between selected assets
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Sleep    ${yop_sleep}
    Page Should not Contain Element    //div[@title='Double click here to unmatch asset']       60

Click on Confirm Button
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Get Value of MAC-Address from technology details and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible    //input[@id='Mac Address']   60
    ${mac_address_value} =    Get Value    //input[@id='Mac Address']
    Set Global Variable    ${mac_address_value}
    Log To Console    MAC Address is: ${mac_address_value}
    Should Be Equal    ${mac_address_value}   ${text}
    Log To Console    Yes, MAC_Address are equal.

Get Value of Serial no. and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //input[@id='Serial Number']   60
    ${serial_no.} =    Get Value    //input[@id='Serial Number']
    Set Global Variable    ${serial_no.}
    Log To Console    Serial No. is: ${serial_no.}
    Should Be Equal    ${serial_no.}    ${text}
    Log To Console    Yes, Serial number are equal.


Get Value of Host-Name and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible   //input[@id='Computer/Host Name']   60
    ${host_value} =    Get Value    //input[@id='Computer/Host Name']
    Set Global Variable    ${host_value}
    Log To Console    Host Name is: ${host_value}
    Should Be Equal    ${host_value}    ${text}
    Log To Console    Yes, Host name are equal.

Edit the MAC_Address of Asset
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_macaddress}=    Catenate    MAC_${random_string}
    Wait Until Element Is Visible    css:#DYNA_14   60
    Wait Until Element Is Visible    css:#DYNA_14   60
    Input Text   css:#DYNA_14     ${generated_macaddress}

Edit the Serial_No. of Asset
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_serailnumber}=    Catenate    S_No_${random_string}
    Wait Until Element Is Visible    css:#DYNA_21   60
    Input Text   css:#DYNA_21     ${generated_serailnumber}

Edit The Host_Name of Asset
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_hostname}=    Catenate    Host_${random_string}
    Wait Until Element Is Visible    css:#DYNA_24   60
    Input Text   css:#DYNA_24     ${generated_hostname}

Hover Existing Agent
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:.right-text     60
    Wait Until Element Is Enabled    css:.right-text     60
    Mouse Over    css:.right-text

Get text by hovering over existing assets
    [Arguments]     ${text}
    Wait Until Element Is Visible   css:.right-text     60
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_details}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_details}
    set global variable     ${hover_details}

Hover over searched Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:.left-text     60
    Wait Until Element Is Enabled    css:.left-text     60
    Mouse Over    css:.left-text

Click on Searched Discovered asset
   Wait Until Element Is Not Visible    ${loaderIcon}      60
   Wait Until Element Is Visible    css:.left-text     60
   Wait Until Element Is Enabled    css:.left-text     60
   Click element    css:.left-text

Click on tab under dicovery_asset_detail page
    [Arguments]     ${option}
    Generic.click on the tab    ${option}

Choose Tab under Asset Discovery
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:#nav-agent-discovery-tab       60
    Click Element    css:#nav-${option}-tab

Click on Plus icon under table
#    Sleep    ${search_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    wait until element is visible    //h5[normalize-space()='Tag Name - chirag_infotech-1162-2']//parent::div//div//table//td        60
    wait until element is enabled     //h5[normalize-space()='Tag Name - chirag_infotech-1162-2']//parent::div//div//table//td         60
    Execute JavaScript  window.scrollBy(10000, 0)
    Wait Until Element Is Visible     //h5[normalize-space()='Tag Name - chirag_infotech-1162-2']//parent::div//div//table//td//i         60
    wait until element is enabled     //h5[normalize-space()='Tag Name - chirag_infotech-1162-2']//parent::div//div//table//td//i      60
    Click Element   //h5[normalize-space()='Tag Name - chirag_infotech-1162-2']//parent::div//div//table//td//i

Choose option from brand on Add technology Page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:#BrandName     60
    Wait Until Element Is Enabled    css:#BrandName     60
    Click Element    css:#BrandName
    Generic.Select parameter    ${option}

Choose option from product on Add technology Page
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    //div[contains(text(),'Select or Search Product')]     60
    Wait Until Element Is Enabled    //div[contains(text(),'Select or Search Product')]     60
    Click Element    //div[contains(text(),'Select or Search Product')]
    wait until element is visible     //div[contains (@id, '-0')]       60
    wait until element is enabled     //div[contains (@id, '-0')]       60
    click element   //div[contains (@id, '-0')]

Get MAC_Address by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible   css:.left-text      60
    Wait Until Element Is Enabled   css:.left-text      60
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_address}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_MAC_address}
    set global variable     ${hover_MAC_address}

Get Serial number by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible   css:.left-text      60
    Wait Until Element Is Enabled   css:.left-text      60
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_serial_number}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_serial_number}
    set global variable     ${hover_serial_number}

Get Host name by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible   css:.left-text      60
    Wait Until Element Is Enabled   css:.left-text      60
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_host name}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_host name}
    set global variable     ${hover_host name}

Get value of Tag_name from Agent discovery
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    (//tbody//span)[1]         60
    Wait Until Element Is enabled    (//tbody//span)[1]         60
    ${text}=      Get Text    (//tbody//span)[1]
    ${parts}    Split String    ${text}    ${option}
    ${asset_details}    Get Substring    ${parts[1]}    0
    Log To Console    Tag_name:${asset_details}
    Set global variable     ${asset_details}


