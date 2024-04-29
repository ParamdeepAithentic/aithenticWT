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

${Add_technology_product}       //div[contains(text(),'Select or Search Product')]//following-sibling::div//input
${Add_technology_brand}         css:#BrandName
${plus_icon}    (//i[@title='Add as an Asset'])[10]
${Discovery_Assets}     css:.left-text
${Existing_Assets}      css:.right-text

*** Keywords ***
Verify that agent is ready to get download
    wait until element is not visible     ${preparingAgent_text}      ${wait_time}
    wait until element is visible     ${AgentReady_text}      ${wait_time}

Choose options to install from download agent button
    [Arguments]    ${option}
    wait until element is visible      css:.qa-${option}-install     ${wait_time}
    wait until element is enabled      css:.qa-${option}-install     ${wait_time}
    click element       css:.qa-${option}-install
    wait until element is not visible   ${loaderIcon}   ${wait_time}

Select the agent type
    [Arguments]    ${option}
    wait until element is visible      //button[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled      //button[normalize-space()='${option}']     ${wait_time}
    click element       //button[normalize-space()='${option}']

Choose tab under Discovery Assets
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    wait until element is visible       css:.qa-${option}-tab       ${wait_time}
    wait until element is enabled       css:.qa-${option}-tab       ${wait_time}
    click element       css:.qa-${option}-tab
#option: network-discovery, agent-discovery

Click on search icon of discovery assets
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible       //i[@title='Search: Agent/Network - Discovered Assets']     ${wait_time}
    Wait Until Element Is enabled       //i[@title='Search: Agent/Network - Discovered Assets']     ${wait_time}
    Click Element    //i[@title='Search: Agent/Network - Discovered Assets']

Enter text to search discovery asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible    //input[@placeholder='Search OCS Discovered Assets']       ${wait_time}
    Wait Until Element Is enabled    //input[@placeholder='Search OCS Discovered Assets']       ${wait_time}
    Input Text    //input[@placeholder='Search OCS Discovered Assets']    ${option}
    Sleep    ${yop_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}

Enter text to search existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible    //input[@placeholder='Search Existing Assets']       ${wait_time}
    Wait Until Element Is enabled    //input[@placeholder='Search Existing Assets']       ${wait_time}
    Input Text    //input[@placeholder='Search Existing Assets']    ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}



Verify Searched discovery asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
#    Wait Until Element Is Visible    ${Discovery_Assets}        ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]        ${wait_time}
#    Element Should Contain   ${Discovery_Assets}   ${option}
    Element Should Contain   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]   ${option}

Verify searched existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Sleep    ${yop_sleep}
    Wait Until Element Is Visible   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    Element Should Contain   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${option}



Click on search icon of Existing assets
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible        //i[@title='Search: My Exiting Aithentic Assets']    ${wait_time}
    Wait Until Element Is Enabled        //i[@title='Search: My Exiting Aithentic Assets']    ${wait_time}
    Click Element    //i[@title='Search: My Exiting Aithentic Assets']

Select any Discovered asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        //div[contains(@class,"qa-assets-boxes-left")]/div[1]/div[1]        ${wait_time}
    Click Element    //div[contains(@class,"qa-assets-boxes-left")]/div[1]/div[1]
    Wait Until Element Is Not Visible    ${alert_Msg}       ${wait_time}

Select any existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //div[contains(@class,"qa-assets-boxes-right")]/div[1]/div[1]       ${wait_time}
    Click Element    //div[contains(@class,"qa-assets-boxes-right")]/div[1]/div[1]
    Wait Until Element Is Not Visible    ${alert_Msg}       ${wait_time}

Verify that line appears between selected assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Page Should Contain Element    //div[@title='Double click here to unmatch asset']       ${wait_time}

Verify that line does not appears between selected assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Sleep    ${yop_sleep}
    Page Should not Contain Element    //div[@title='Double click here to unmatch asset']       ${wait_time}

Click on Button inside Network Discovery Page
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Get Value of MAC-Address from technology details and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible    //input[@id='Mac Address']   ${wait_time}
    ${mac_address_value} =    Get Value    //input[@id='Mac Address']
    Set Global Variable    ${mac_address_value}
    Log To Console    MAC Address is: ${mac_address_value}
    Should Be Equal    ${mac_address_value}   ${text}
    Log To Console    Yes, MAC_Address are equal.

Get Value of Serial no. and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //input[@id='Serial Number']   ${wait_time}
    ${serial_no.} =    Get Value    //input[@id='Serial Number']
    Set Global Variable    ${serial_no.}
    Log To Console    Serial No. is: ${serial_no.}
    Should Be Equal    ${serial_no.}    ${text}
    Log To Console    Yes, Serial number are equal.


Get Value of Host-Name and compare it with
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   //input[@id='Computer/Host Name']   ${wait_time}
    ${host_value} =    Get Value    //input[@id='Computer/Host Name']
    Set Global Variable    ${host_value}
    Log To Console    Host Name is: ${host_value}
    Should Be Equal    ${host_value}    ${text}
    Log To Console    Yes, Host name are equal.

Edit the MAC_Address of Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_macaddress}=    Catenate    MAC_${random_string}
    Wait Until Element Is Visible    css:#DYNA_14   ${wait_time}
    Wait Until Element Is Visible    css:#DYNA_14   ${wait_time}
    Input Text   css:#DYNA_14     ${generated_macaddress}

Edit the Serial_No. of Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_serailnumber}=    Catenate    S_No_${random_string}
    Wait Until Element Is Visible    css:#DYNA_21   ${wait_time}
    Input Text   css:#DYNA_21     ${generated_serailnumber}

Edit The Host_Name of Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_hostname}=    Catenate    Host_${random_string}
    Wait Until Element Is Visible    css:#DYNA_24   ${wait_time}
    Input Text   css:#DYNA_24     ${generated_hostname}

Hover Existing Agent
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    ${Existing_Assets}     ${wait_time}
    Wait Until Element Is Enabled    css:.right-text     ${wait_time}
    Mouse Over    css:.right-text

Get text by hovering over existing assets of technology
    [Arguments]     ${text}
    Wait Until Element Is Visible   css:.right-text     ${wait_time}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_details}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_details}
    set global variable     ${hover_details}

Hover over searched Agent/Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   ${Discovery_Assets}     ${wait_time}
    Wait Until Element Is Enabled    ${Discovery_Assets}     ${wait_time}
    Mouse Over    ${Discovery_Assets}

Click on Searched Discovered asset
   Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#   Wait Until Element Is Visible    ${Discovery_Assets}     ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]     ${wait_time}
    Wait Until Element Is enabled    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]     ${wait_time}
#   Wait Until Element Is Enabled    ${Discovery_Assets}     ${wait_time}
   Click element    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]
   Sleep    ${search sleep}

Click on tab under dicovery_asset_detail page
    [Arguments]     ${option}
    Generic.click on the tab    ${option}

Choose Tab under Asset Discovery
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:#nav-agent-discovery-tab       ${wait_time}
    Click Element    css:#nav-${option}-tab

Click on Plus icon under table
#    Sleep    ${search_sleep}
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#    wait until element is visible    (//tbody)[1]        ${wait_time}
#    wait until element is enabled     (//tbody)[1]        ${wait_time}
#    Execute JavaScript  window.scrollBy(10000, 0)
    Wait Until Element Is Visible     ${plus_icon}         ${wait_time}
    wait until element is enabled     ${plus_icon}      ${wait_time}
    Click Element   ${plus_icon}

Choose option from brand on Add technology Page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    ${Add_technology_brand}      ${wait_time}
    Wait Until Element Is Enabled    ${Add_technology_brand}      ${wait_time}
    Click Element    ${Add_technology_brand}
#    Clear Element Text    ${Add_technology_brand}
    wait until element is visible     //div[contains (@id, '-0')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-0')]       ${wait_time}
    click element   //div[contains (@id, '-0')]

Clear the text of Product field
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'Select or Search Product')]//following-sibling::div//parent::div//following-sibling::span[@title='Clear all']       ${wait_time}
    Wait Until Element Is Enabled    //div[contains(text(),'Select or Search Product')]//following-sibling::div//parent::div//following-sibling::span[@title='Clear all']       ${wait_time}
    Click Element    //div[contains(text(),'Select or Search Product')]//following-sibling::div//parent::div//following-sibling::span[@title='Clear all']

Choose option from product on Add technology Page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#    Wait Until Element Is Visible    ${Add_technology_product}      ${wait_time}
#    Wait Until Element Is Enabled    ${Add_technology_product}      ${wait_time}
#    Click Element    ${Add_technology_product}
    wait until element is visible     (//tbody//tr)[1]       ${wait_time}
    wait until element is enabled     (//tbody//tr)[1]       ${wait_time}
    click element   (//tbody//tr)[1]
    Sleep    ${yop_sleep}

Enter The Asset_id in Add Technology Page
    wait until element is not visible       ${loaderIcon}        ${wait_time}
    wait until element is visible       //input[@formcontrolname="AssetId"]        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssetID}=    Catenate    AssetID_${random_string}
    input text   //input[@formcontrolname="AssetId"]       ${generated_AssetID}
    log to console      ${generated_AssetID}
    Set Global Variable   ${generated_AssetID}

#Get MAC_Address by hovering over discovered assets
#    [Arguments]     ${text}
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#    Wait Until Element Is Visible   ${Discovery_Assets}      ${wait_time}
#    Wait Until Element Is Enabled   ${Discovery_Assets}      ${wait_time}
#    sleep       ${search_sleep}
#    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
#    ${parts}    Split String    ${hover_text}    ${text}
#    ${hover_MAC_address}    Get Substring    ${parts[1]}    1
#    Log to console      ${hover_MAC_address}
#    set global variable     ${hover_MAC_address}

Get Serial number by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   ${Discovery_Assets}      ${wait_time}
    Wait Until Element Is Enabled   ${Discovery_Assets}      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_serial_number}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_serial_number}
    set global variable     ${hover_serial_number}

Get Tagname by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   ${Discovery_Assets}      ${wait_time}
    Wait Until Element Is Enabled   ${Discovery_Assets}      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_tagname}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_tagname}
    set global variable     ${hover_tagname}

#Get Host name by hovering over discovered assets
#    [Arguments]     ${text}
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#    Wait Until Element Is Visible   ${Discovery_Assets}      ${wait_time}
#    Wait Until Element Is Enabled   ${Discovery_Assets}      ${wait_time}
#    sleep       ${search_sleep}
#    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
#    ${parts}    Split String    ${hover_text}    ${text}
#    ${hover_host name}    Get Substring    ${parts[1]}    1
#    Log to console      ${hover_host name}
#    set global variable     ${hover_host name}

Get value of Tag_name from Agent discovery
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//tbody//span)[1]         ${wait_time}
    Wait Until Element Is enabled    (//tbody//span)[1]         ${wait_time}
    ${text}=      Get Text    (//tbody//span)[1]
    ${tag_parts}    Split String    ${text}    ${option}
    ${asset_details}    Get Substring    ${tag_parts[1]}    0
    Log To Console    Tag_name:${asset_details}
    Set global variable     ${asset_details}

click on filter icon of discovered assets
    wait until element is visible  css:i[title='Filter: Agent/Network - Discovered Assets']    ${wait_time}
    wait until element is enabled   css:i[title='Filter: Agent/Network - Discovered Assets']    ${wait_time}
    click element   css:i[title='Filter: Agent/Network - Discovered Assets']

Choose filters for discovered asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    wait until element is visible   //ng-select[@placeholder='${option}']//input[@type='text']
    wait until element is enabled   //ng-select[@placeholder='${option}']//input[@type='text']
    click element   //ng-select[@placeholder='${option}']//input[@type='text']

Select brand_macaddres_agent from dropdown of discovered asset filter
    [Arguments]     ${number}
    wait until element is visible     //div[contains (@id, '-${number}')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-${number}')]       ${wait_time}
    click element   //div[contains (@id, '-${number}')]

Get text by hovering over assets
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   css:.left-text      ${wait_time}
    ${text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li
    ${parts}    Split String    ${text}    ${option}
    ${substring}    Get Substring    ${parts[1]}    1
    Log to console      ${substring}
    set global variable     ${substring}

Hover over searched Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   ${search_sleep}
    Wait Until Element Is Visible    css:.left-text     ${wait_time}
    Wait Until Element Is Enabled    css:.left-text     ${wait_time}
    Mouse Over    css:.left-text
    Execute JavaScript    var element = document.querySelector('.left-text'); var event = new MouseEvent('mouseover', { bubbles: true }); element.dispatchEvent(event);

Get text of selected brand, mac address and agent of discovered assets
    [Arguments]     ${number}
    Wait Until Element Is Visible  //div[contains (@id, -'${number}')]       ${wait_time}
    ${selected_brand}=        Get Text    //div[contains (@id, -'${number}')]
    Log to console      ${selected_brand}
    set global variable     ${selected_brand}

verify Text by hovering over assets
    [Arguments]     ${original}     ${compared}
    should be equal     ${original}     ${compared}

Click on clear filter button link of discovered assets
    [Arguments]     ${option}
    Generic.Select parameter    ${option}

click on filter icon of existing assets
    wait until element is visible  css:i[title='Filter: My Exiting Aithentic Assets']    ${wait_time}
    wait until element is enabled   css:i[title='Filter: My Exiting Aithentic Assets']    ${wait_time}
    click element   css:i[title='Filter: My Exiting Aithentic Assets']

Hover over searched existing Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   2
    Wait Until Element Is Visible    css:.right-text     ${wait_time}
    Wait Until Element Is Enabled    css:.right-text     ${wait_time}
    Mouse Over    css:.right-text
    Execute JavaScript    var element = document.querySelector('.right-text'); var event = new MouseEvent('mouseover', { bubbles: true }); element.dispatchEvent(event);

Get text by hovering over existing assets
    [Arguments]     ${option}
    Wait Until Element Is Visible   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    ${text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li
    ${parts}    Split String    ${text}    ${option}
    ${substring1}    Get Substring    ${parts[1]}    1
    Log to console      ${substring1}
    set global variable     ${substring1}

click on the right text asset result of existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible  (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    wait until element is enabled  (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]    ${wait_time}
    click element   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]
    
Click on save button of Add Technology Page
    Sleep    ${search_sleep}
    wait until element is visible  //button[@class='btn button-green']    ${wait_time}
    wait until element is enabled  //button[@class='btn button-green']     ${wait_time}
    click element   //button[@class='btn button-green']
#    Wait Until Element Is not Visible    ${loaderIcon}      ${wait_time}

Verify Page should contain Element
    [Arguments]     ${element}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Page Should Contain Element    css:#${element}

Click on Discovery_info tab on Technology details Page
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:#discovery-info-tab        ${wait_time}
    Wait Until Element Is Enabled    css:#discovery-info-tab    ${wait_time}
    Click Element    css:#discovery-info-tab


Verify Discovery_info contains following tab
    [Arguments]     ${tab}
    Wait Until Element Is Not Visible    ${loaderIcon}    ${wait_time}
    Wait Until Element Is Visible    css:#${tab}      ${wait_time}
    Wait Until Element Is Enabled   css:#${tab}        ${wait_time}
    Click Element    css:#${tab}

Wait for the invisiblity of alert msg
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}        ${wait_time}
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}
    
Mark check-box of Agent/Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'left-text')]//following-sibling::div//span)[2]        ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,'left-text')]//following-sibling::div//span)[2]      ${wait_time}
    Click Element    (//div[contains(@class,'left-text')]//following-sibling::div//span)[2]

Click on three-dots inside table of add assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.table .three-dots        ${wait_time}
    Wait Until Element Is Enabled    css:.table .three-dots        ${wait_time}
    Click Element    css:.table .three-dots

Select option inside three-dots
    [Arguments]     ${options}
    Generic.click on the button link    ${options}

Hover Over Add component button and verify text 
    [Arguments]     ${option}
    Wait Until Element Is Visible    //div[@id='software']//button[normalize-space()='Add as a Component']      ${wait_time}
    Wait Until Element Is Enabled    //div[@id='software']//button[normalize-space()='Add as a Component']      ${wait_time}
#    Scroll Element Into View    //div[@id='software']//button[normalize-space()='Add as a Component']
    Mouse Over    //div[@id='software']//button[normalize-space()='Add as a Component']
    ${text}=    Get Element attribute       //div[@id='software']//button[normalize-space()='Add as a Component']        title
    Should Be Equal    ${text}   ${option}
    
Click on plus icon of any component
    Wait Until Element Is Visible    (//div[@id='software']//tbody//i)[1]       ${wait_time}
    Wait Until Element Is Enabled    (//div[@id='software']//tbody//i)[1]       ${wait_time}
    Click Element    (//div[@id='software']//tbody//i)[1]

Verify Software tab Should contain Element
    Wait Until Element Is Visible       css:.fa-check-circle        ${wait_time}
    Page Should Contain Element         css:.fa-check-circle

Create Asset_id for software component
    wait until element is visible       //input[@formcontrolname="AssetId"]        ${wait_time}
    Wait Until Element Is Enabled      //input[@formcontrolname="AssetId"]        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${component_AssetID}=    Catenate    Component_Asset_${random_string}
    input text   //input[@formcontrolname="AssetId"]       ${component_AssetID}
    log to console      Componenet_Asset_id:${component_AssetID}
    Set Global Variable   ${component_AssetID}
    
Fetch text from Agent/Discovered assets column and compare it with
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:.qa-assets-boxes-left      ${wait_time}
    Wait Until Element Is Enabled    css:.qa-assets-boxes-left  ${wait_time}
    ${fetch_lefttext}=  Get Text    css:.qa-assets-boxes-left
    Log To Console    ${fetch_lefttext}
    Set Global Variable    ${fetch_lefttext}
    Should be equal   ${fetch_lefttext}     ${option}

Fetch text from Existing assets column and compare it with
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:.qa-assets-boxes-right     ${wait_time}
    Wait Until Element Is Enabled    css:.qa-assets-boxes-right  ${wait_time}
    ${fetch_righttext}=  Get Text    css:.qa-assets-boxes-right
    Log To Console    ${fetch_righttext}
    Set Global Variable    ${fetch_righttext}
    Should be equal   ${fetch_righttext}     ${option}

Fetch text from Agent Discovery tab and compare it with
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:.count-section h4     ${wait_time}
    Wait Until Element Is Enabled    css:.count-section h4     ${wait_time}
    ${fetch_agenttext}=  Get Text    css:.count-section h4
    Log To Console    ${fetch_agenttext}
    Set Global Variable    ${fetch_agenttext}
    Should be equal   ${fetch_agenttext}     ${option}

click on the value of IP discovered devices of inside table
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[7]   ${wait_time}
    wait until element is enabled   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[7]   ${wait_time}
    click element   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[7]

Fetch the Tagname from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    wait until element is enabled   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    ${IP_tagname}=      Get text        //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[2]
    Log To Console    ${IP_tagname}
    Set Global Variable   ${IP_tagname}


Fetch the Mac_address from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    wait until element is enabled   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    ${IP_IPaddress}=      Get text        //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[4]
    Log To Console    ${IP_IPaddress}
    Set Global Variable   ${IP_IPaddress}

Fetch the IP address tagname from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    wait until element is enabled   //h5[normalize-space()='${agentDiscovery_TagName}']     ${wait_time}
    ${IP_macaddress}=      Get text        //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[5]
    Log To Console    ${IP_macaddress}
    Set Global Variable   ${IP_macaddress}

Search with MAC address and IP Address on the search bar of Discovered Asset List
    [Arguments]     ${MAC_Address}
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible       css:thead tr       ${wait_time}
    wait until element is visible   css:input[placeholder='Search by Brand or Name or Description or Asset ID']     ${wait_time}
    wait until element is enabled   css:input[placeholder='Search by Brand or Name or Description or Asset ID']     ${wait_time}
    input text  css:input[placeholder='Search by Brand or Name or Description or Asset ID']     ${MAC_Address}
    sleep       ${search_sleep}
    wait until element is visible       css:thead tr       ${wait_time}

Enter input in the brand field of advanced search of discovered asset
    [Arguments]     ${option}
    wait until element is visible  css:.modal-body .qa-brands      ${wait_time}
    wait until element is enabled       css:.modal-body .qa-brands     ${wait_time}
    click element       css:.modal-body .qa-brands
#    Clear Element Text      css:.modal-body .qa-brands
    input text      css:.modal-body .qa-brands input       ${option}
    Generic.Select parameter    ${option}

Click on the table inside advanced search of discovered asset for brand
    wait until element is visible    (//div[contains(text(),'Lenovo')])[1]     ${wait_time}
    wait until element is enabled  (//div[contains(text(),'Lenovo')])[1]     ${wait_time}
    click element   (//div[contains(text(),'Lenovo')])[1]

Fetch the Brand Name from the brand field of discovered asset
    Wait Until Element Is Visible        //div[@class='full-width-field']//ng-select[@id='BrandName']    timeout=${wait_time}s
    Wait Until Element Is Enabled        //div[@class='full-width-field']//ng-select[@id='BrandName']    timeout=${wait_time}s
    ${brand_name} =    Get text     //div[@class='full-width-field']//ng-select[@id='BrandName']
    Log to console   Brand Name: ${brand_name}
    set global variable     ${brand_name}

Enter and select technology type in advance search of discovered search
    wait until element is visible      css:#advaceType     ${wait_time}
    wait until element is enabled       css:#advaceType     ${wait_time}
    click element   css:#advaceType
    input text      css:#advaceType     Maintenance
    Press Keys      css:#advaceType     ENTER

Click on the table inside advanced search of discovered asset for technology group
    wait until element is visible    //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td     ${wait_time}
    wait until element is enabled   //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td     ${wait_time}
    click element    //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td

Click on the table inside advanced search of discovered asset for technology type
    wait until element is visible    (//div[contains(text(),'Extended service')])[1]     ${wait_time}
    wait until element is enabled   (//div[contains(text(),'Extended service')])[1]     ${wait_time}
    click element    (//div[contains(text(),'Extended service')])[1]


Enter input in the technology group field of advanced search of discovered asset
    wait until element is visible  css:.modal-body .qa-group      ${wait_time}
    wait until element is enabled       css:.modal-body .qa-group     ${wait_time}
    click element       css:.modal-body .qa-group
    input text      css:.modal-body .qa-group input       Applications
    sleep   ${search_sleep}
    Wait Until Element Is Visible    css:.modal-body .qa-group input    ${wait_time}
    Press Keys  css:.modal-body .qa-group input     ENTER
Fetch the technology type from the technology type field of component of discovered asset
    Wait Until Element Is Visible       css:.qa-tech-type     ${wait_time}
    Wait Until Element Is Enabled        css:.qa-tech-type    ${wait_time}
    ${technology_type} =    Get text   css:.qa-tech-type
    Log to console   Technology Type: ${technology_type}
    set global variable     ${technology_type}

Click on Refresh Icon of discovered asset lists
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:i[title='Clear search filters']        ${wait_time}
    Wait Until Element Is Enabled    css:i[title='Clear search filters']    ${wait_time}
    Click Element    css:i[title='Clear search filters']

Click on Go to Agent Discovery Page
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    Wait Until Element Is Visible    css:span[class='back']        ${wait_time}
    Wait Until Element Is Enabled    css:span[class='back']    ${wait_time}
    Click Element    css:span[class='back']

Click on the down arrow icon of discovered asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible   (//div[contains(@class,'left-text')]//following-sibling::div//img)[1]       ${wait_time}
    wait until element is enabled   (//div[contains(@class,'left-text')]//following-sibling::div//img)[1]       ${wait_time}
    click element      (//div[contains(@class,'left-text')]//following-sibling::div//img)[1]

Mouse Hover over searched Discovered Assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]     ${wait_time}
    Wait Until Element Is Enabled    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]     ${wait_time}
    Mouse Over    //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]

Get MAC_Address by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]      ${wait_time}
    Wait Until Element Is Enabled   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_address}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_MAC_address}
    set global variable     ${hover_MAC_address}

Get Host name by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]      ${wait_time}
    Wait Until Element Is Enabled   //div[contains(text(),'MSI')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_host name}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_host name}
    set global variable     ${hover_host name}

Click on newly discovered tab under network discovery
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is visible    css:.qa-newly-discovered-tab     ${wait_time}
    Wait Until Element Is enabled    css:.qa-newly-discovered-tab     ${wait_time}
    click element    css:.qa-newly-discovered-tab


Mouse Hover over searched existing assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over    (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]

Click on the down arrow icon of existing assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible  (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]       ${wait_time}
    wait until element is enabled    (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]       ${wait_time}
    click element     (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]

Enter input in the brand field of existing asset
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    Wait Until Element Is enabled    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    click element    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]
    input text    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]       ${option}
    Press Keys      (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]     ENTER

Mouse Hover over searched IP Assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   css:.box .left-text     ${wait_time}
    Wait Until Element Is Enabled    css:.box .left-text     ${wait_time}
    Mouse Over    css:.box .left-text

Get MAC_Address by hovering over IP discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   css:.box .left-text      ${wait_time}
    Wait Until Element Is Enabled   css:.box .left-text      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_address}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_MAC_address}
    set global variable     ${hover_MAC_address}

Fetch the Brandname from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   (//table[contains(@class,'table-hover')])[2]    ${wait_time}
    wait until element is enabled   (//table[contains(@class,'table-hover')])[2]     ${wait_time}
    ${Brand_name}=      Get text        (//tr[@class='table-row ng-star-inserted']//td)[2]
    Log To Console    ${Brand_name}
    Set Global Variable   ${Brand_name}


Fetch the brand name in software tab
    Fetch the Brandname from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='software']//tbody//td)[2]    ${wait_time}
    wait until element is enabled   (//div[@id='software']//tbody//td)[2]     ${wait_time}
    ${Brand}=      Get text        (//div[@id='software']//tbody//td)[2]
    Log To Console    ${Brand}
    Set Global Variable   ${Brand}

Fetch the product in software tab
    Fetch the Brandname from agent discovery page
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   (//div[@id='software']//tbody//td)[3]    ${wait_time}
    wait until element is enabled   (//div[@id='software']//tbody//td)[3]     ${wait_time}
    ${Product}=      Get text        (//div[@id='software']//tbody//td)[3]
    Log To Console    ${Product}
    Set Global Variable   ${Product}
