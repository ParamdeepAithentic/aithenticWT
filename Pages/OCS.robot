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
${preparingAgent_text}     //div[@id='downloadAgentOCSFile']//p[contains(text(),'File is preparing, please wait....')]
${AgentReady_text}     //p[contains(text(),'File is ready, please download')]

${Add_technology_product}       //div[contains(text(),'Select or Search Product')]//following-sibling::div//input
${Add_technology_brand}         css:#BrandName
${plus_icon}    (//i[@title='Add as an Asset'])[1]
${Discovery_Assets}     css:.left-text span
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
    wait until element is not visible       ${shadow}          60

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
    Wait Until Element Is Visible    css:#aad-searchbar       ${wait_time}
    Wait Until Element Is enabled    css:#aad-searchbar       ${wait_time}
    Input Text     css:#aad-searchbar    ${option}
    Sleep    ${yop_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}
    wait until element is not visible       ${shadow}          60

Enter text to search existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible    css:#searchbar-existingAssets       ${wait_time}
    Wait Until Element Is enabled    css:#searchbar-existingAssets       ${wait_time}
    Input Text   css:#searchbar-existingAssets    ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    wait until element is not visible       ${shadow}          60

Verify Searched discovery asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
#    Wait Until Element Is Visible    ${Discovery_Assets}        ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'Private')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]        ${wait_time}
#    Element Should Contain   ${Discovery_Assets}   ${option}
#    Element Should Contain   //div[contains(text(),'Apple Inc')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]   ${option}
    Element should contain  //div[contains(text(),'Private')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')]    ${option}

Verify searched existing asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Sleep    ${search_sleep}
    Wait Until Element Is Visible   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    Element Should Contain   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${option}


Click on search icon of Existing assets
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    Wait Until Element Is Visible        //i[@title='Search: My Exiting Aithentic Assets']    ${wait_time}
    Wait Until Element Is Enabled        //i[@title='Search: My Exiting Aithentic Assets']    ${wait_time}
    Click Element    //i[@title='Search: My Exiting Aithentic Assets']

Select any Discovered asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible        (//div[contains(@class,'box')]//div[contains(@class,'circle')])[1]        ${wait_time}
    Click Element    (//div[contains(@class,'box')]//div[contains(@class,'circle')])[1]
    Wait Until Element Is Not Visible    ${alert_Msg}       ${wait_time}

Select any existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       (//div[contains(@class,'qa-column-boxes-right')]//div[contains(@class,'accordion-child-container')]//div[contains(@class,'circle')])[1]       ${wait_time}
    Click Element    (//div[contains(@class,'qa-column-boxes-right')]//div[contains(@class,'accordion-child-container')]//div[contains(@class,'circle')])[1]
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
    Wait Until Element Is enabled    css:#DYNA_14   ${wait_time}
    Input Text   css:#DYNA_14     ${generated_macaddress}

Edit the Serial_No. of Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_serailnumber}=    Catenate    S_No_${random_string}
    Wait Until Element Is Visible    css:#DYNA_21   ${wait_time}
    Wait Until Element Is enabled    css:#DYNA_21  ${wait_time}
    Input Text   css:#DYNA_21     ${generated_serailnumber}

Edit The Host_Name of Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_hostname}=    Catenate    Host_${random_string}
    Wait Until Element Is Visible    css:#DYNA_24   ${wait_time}
    Wait Until Element Is enabled    css:#DYNA_24   ${wait_time}
    Input Text   css:#DYNA_24     ${generated_hostname}

Hover Existing Agent
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    ${Existing_Assets}     ${wait_time}
    Wait Until Element Is Enabled    css:.right-text     ${wait_time}
    Mouse Over    css:.right-text

Get text by hovering over existing assets of technology
    [Arguments]     ${option}
    Wait Until Element Is Visible   //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li    ${wait_time}
    Wait Until Element Is enabled   //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li     ${wait_time}
    ${text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li
    ${parts}    Split String    ${text}    ${option}
    ${substring1}    Get Substring    ${parts[1]}    1
    Log to console      ${substring1}
    set global variable     ${substring1}

Hover over searched Agent/Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   ${Discovery_Assets}     ${wait_time}
    Wait Until Element Is Enabled    ${Discovery_Assets}     ${wait_time}
    Mouse Over    ${Discovery_Assets}

Click on Searched Discovered asset
   Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
#   Wait Until Element Is Visible    ${Discovery_Assets}     ${wait_time}
    Wait Until Element Is Visible    //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]     ${wait_time}
    Wait Until Element Is enabled    //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]     ${wait_time}
#   Wait Until Element Is Enabled    ${Discovery_Assets}     ${wait_time}
   Click element    //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]

   Sleep    ${search sleep}
   wait until element is not visible       ${shadow}          60

Click on tab under dicovery_asset_detail page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Generic.click on the tab    ${option}

Choose Tab under Asset Discovery
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:#nav-agent-discovery-tab       ${wait_time}
    Wait Until Element Is enabled    css:#nav-agent-discovery-tab       ${wait_time}
    Click Element    css:#nav-${option}-tab

Click on Plus icon under table
    Wait Until Element Is Visible     (//table[contains(@class,'table')]//thead//following-sibling::tbody//tr//td//i)[6]         ${wait_time}
    wait until element is enabled     (//table[contains(@class,'table')]//thead//following-sibling::tbody//tr//td//i)[6]      ${wait_time}
    Click Element   (//table[contains(@class,'table')]//thead//following-sibling::tbody//tr//td//i)[6]

Click on plus icon under table of agent discovery
    Wait Until Element Is Visible     //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//td[normalize-space()='View']//following-sibling::td//i         ${wait_time}
    wait until element is enabled     //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//td[normalize-space()='View']//following-sibling::td//i      ${wait_time}
    Click Element   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//td[normalize-space()='View']//following-sibling::td//i

Choose option from brand on Add technology Page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    ${Add_technology_brand}      ${wait_time}
    Wait Until Element Is Enabled    ${Add_technology_brand}      ${wait_time}
    Click Element    ${Add_technology_brand}
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
    wait until element is visible     (//tbody//tr)[1]       ${wait_time}
    wait until element is enabled     (//tbody//tr)[1]       ${wait_time}
    click element   (//tbody//tr)[1]
    Sleep    ${yop_sleep}
    wait until element is not visible       ${shadow}          60

Enter The Asset_id in Add Technology Page
    wait until element is not visible       ${loaderIcon}        ${wait_time}
    wait until element is visible       //input[@formcontrolname="AssetId"]        ${wait_time}
    wait until element is enabled       //input[@formcontrolname="AssetId"]        ${wait_time}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_AssetID}=    Catenate    AssetID_${random_string}
    input text   //input[@formcontrolname="AssetId"]       ${generated_AssetID}
    log to console      ${generated_AssetID}
    Set Global Variable   ${generated_AssetID}


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
    Wait Until Element Is Visible   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}
    Wait Until Element Is Enabled   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}

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
#    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//tbody//span)[1]         ${wait_time}
    Wait Until Element Is enabled    (//tbody//span)[1]         ${wait_time}
    ${full_tagname}=      Get Text    (//tbody//span)[1]
    set global variable     ${full_tagname}
#    ${tag_parts}    Split String    ${full_tagname}    #${option}
#    ${asset_details}    Get Substring    ${tag_parts[1]}    0
#    Log To Console    Tag_name:${asset_details}
#    Set global variable     ${asset_details}

click on filter icon of discovered assets
    wait until element is visible  css:i[title='Filter: Agent/Network - Discovered Assets']    ${wait_time}
    wait until element is enabled   css:i[title='Filter: Agent/Network - Discovered Assets']    ${wait_time}
    click element   css:i[title='Filter: Agent/Network - Discovered Assets']

Choose filters for discovered asset
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    wait until element is visible       //*[@placeholder='${option1}']        ${wait_time}
    wait until element is enabled       //*[@placeholder='${option1}']        ${wait_time}
    Click element   //*[@placeholder='${option1}']
    Clear Element Text      //ng-select[@placeholder='${option1}']//input[@type='text']
    input text      //ng-select[@placeholder='${option1}']//input[@type='text']         ${option2}
    wait until element is visible   //*[@placeholder='${option1}']//input[@type='text']//following::span[normalize-space()='${option2}']        ${wait_time}
    wait until element is enabled   //*[@placeholder='${option1}']//input[@type='text']//following::span[normalize-space()='${option2}']        ${wait_time}
    click element   //*[@placeholder='${option1}']//input[@type='text']//following::span[normalize-space()='${option2}']


Select brand_macaddres_agent from dropdown of discovered asset filter
    [Arguments]     ${number}
    wait until element is visible     //div[contains (@id, '-${number}')]       ${wait_time}
    wait until element is enabled     //div[contains (@id, '-${number}')]       ${wait_time}
    click element   //div[contains (@id, '-${number}')]

Get text by hovering over assets
    [Arguments]     ${option}
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   css:.left-text span      ${wait_time}
    Wait Until Element Is enabled   css:.left-text span      ${wait_time}
    ${text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li
    ${parts}    Split String    ${text}    ${option}
    ${substring}    Get Substring    ${parts[1]}    1
    Log to console      ${substring}
    set global variable     ${substring}

Hover over searched Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    sleep   ${search_sleep}
    Wait Until Element Is Visible    css:.left-text span     ${wait_time}
    Wait Until Element Is Enabled    css:.left-text span     ${wait_time}
    Mouse Over    css:.left-text span
    Execute JavaScript    var element = document.querySelector('.left-text span'); var event = new MouseEvent('mouseover', { bubbles: true }); element.dispatchEvent(event);

Get text of selected brand, mac address and agent of discovered assets
    [Arguments]     ${number}
    Wait Until Element Is Visible  //div[contains (@id, -'${number}')]       ${wait_time}
    Wait Until Element Is enabled  //div[contains (@id, -'${number}')]       ${wait_time}
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
#    Wait Until Element Is Visible   (//div[contains(text(),'QABrand555')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    Wait Until Element Is enabled   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    ${text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${option}')]//ancestor::li
    ${parts}    Split String    ${text}    ${option}
    ${substring1}    Get Substring    ${parts[1]}    1
    Log to console      ${substring1}
    set global variable     ${substring1}

click on the right text asset result of existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible  (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    wait until element is enabled  (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]    ${wait_time}
    click element   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]
    
Click on save button of Add Technology Page
    Sleep    ${search_sleep}
    wait until element is visible  //button[@class='btn button-green']    ${wait_time}
    wait until element is enabled  //button[@class='btn button-green']     ${wait_time}
    click element   //button[@class='btn button-green']
    wait until element is not visible       ${shadow}          60
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
    Wait Until Element Is Visible    (//div[@id='software']//tbody//i[contains(@class,'fa-plus-circle')])[1]       ${wait_time}
    Wait Until Element Is Enabled    (//div[@id='software']//tbody//i[contains(@class,'fa-plus-circle')])[1]       ${wait_time}
    sleep   ${search_sleep}
    Click Element    (//div[@id='software']//tbody//i[contains(@class,'fa-plus-circle')])[1]
    wait until element is not visible       ${shadow}          60

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
    wait until element is visible   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]   ${wait_time}
    wait until element is enabled   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]   ${wait_time}
    click element   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]

Get the text of IP discovered devices inside table
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]   ${wait_time}
    wait until element is enabled   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]   ${wait_time}
    ${IP_discovered_count_text}=    get text   (//h5[normalize-space()='${IP_Discovered_devices}']//parent::div//div[normalize-space()='Discovered Devices']//following::a)[1]
    log    ${IP_discovered_count_text}
    set global variable     ${IP_discovered_count_text}

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
    wait until element is visible       (//thead//tr)[2]       ${wait_time}
    wait until element is enabled       (//thead//tr)[2]       ${wait_time}
    wait until element is visible   css:#searchbar-discoveredassetList     ${wait_time}
    wait until element is enabled   css:#searchbar-discoveredassetList    ${wait_time}
    input text  css:#searchbar-discoveredassetList     ${MAC_Address}
    sleep       ${search_sleep}
#    wait until element is visible       css:thead tr       ${wait_time}
     wait until element is visible       (//thead//tr)[2]       ${wait_time}

Enter input in the brand field of advanced search of discovered asset
    [Arguments]     ${option}
    wait until element is visible  css:.modal-body .qa-brands      ${wait_time}
    wait until element is enabled       css:.modal-body .qa-brands     ${wait_time}
    click element       css:.modal-body .qa-brands
#    Clear Element Text      css:.modal-body .qa-brands
    input text      css:.modal-body .qa-brands input       ${option}
    Generic.Select parameter    ${option}

Click on the table inside advanced search of discovered asset for brand
    wait until element is visible    (//div[contains(text(),'Lenovo')])[1]     120
    wait until element is enabled  (//div[contains(text(),'Lenovo')])[1]     120
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
#    wait until element is not visible       ${shadow}          60

Click on the table inside advanced search of discovered asset for technology group
    wait until element is visible    //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td     120
    wait until element is enabled   //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td     120
    click element    //div[contains(@class,'Contract-Form-Edit')]//tbody[contains(@class,'location-list-qa')]//tr//td

Click on the table inside advanced search of discovered asset for technology type
    wait until element is visible    (//div[contains(text(),'Extended service')])[1]     120
    wait until element is enabled   (//div[contains(text(),'Extended service')])[1]     120
    click element    (//div[contains(text(),'Extended service')])[1]


Enter input in the technology group field of advanced search of discovered asset
    wait until element is visible  css:.modal-body .qa-group      ${wait_time}
    wait until element is enabled       css:.modal-body .qa-group     ${wait_time}
    click element       css:.modal-body .qa-group
    input text      css:.modal-body .qa-group input       Applications
    sleep   ${search_sleep}
    Wait Until Element Is Visible    css:.modal-body .qa-group input    ${wait_time}
    Wait Until Element Is enabled    css:.modal-body .qa-group input    ${wait_time}
    Press Keys  css:.modal-body .qa-group input     ENTER
#    wait until element is not visible       ${shadow}          60


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
    Wait Until Element Is Visible    (//div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')])[1]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')])[1]       ${wait_time}
    Mouse Over    (//div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')])[1]  


Get MAC_Address by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}
    Wait Until Element Is Enabled   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_address1}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_MAC_address1}
    set global variable     ${hover_MAC_address1}

Get Host name by hovering over discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}
    Wait Until Element Is Enabled   //div[contains(text(),'${discovered_asset_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes')]//child::div[contains(@class,'box position-relative')][1]      ${wait_time}

    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_host name}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_host name}
    set global variable     ${hover_host name}

Click on newly discovered tab under network discovery
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is visible    css:.qa-newly-discovered-tab     ${wait_time}
    Wait Until Element Is enabled    css:.qa-newly-discovered-tab     ${wait_time}
    click element    css:.qa-newly-discovered-tab

Click on newly discovered tab under service now
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is visible    css:#new-dicovered-sn    ${wait_time}
    Wait Until Element Is enabled    css:#new-dicovered-sn     ${wait_time}
    click element    css:#new-dicovered-sn


Mouse Hover over searched existing assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over    (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]

Click on the down arrow icon of existing assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible  (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]       ${wait_time}
    wait until element is enabled    (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]       ${wait_time}
    click element     (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]
#    click image       (//div[contains(@class,'qa-assets-boxes-right')]//following-sibling::div//img)[1]

Enter input in the brand field of existing asset
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    Wait Until Element Is enabled    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    click element    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]
    sleep   ${search_sleep}
    input text    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]       ${option}
#    Press Keys      (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]     ENTER
    Wait Until Element Is Visible    //span[normalize-space()='${option}']     ${wait_time}
    Wait Until Element Is Enabled    //span[normalize-space()='${option}']     ${wait_time}
    Click Element    //span[normalize-space()='${option}']
    
Mouse Hover over searched IP Assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   css:.box .left-text span     ${wait_time}
    Wait Until Element Is Enabled    css:.box .left-text span     ${wait_time}
    Mouse Over    css:.box .left-text span

Get MAC_Address by hovering over IP discovered assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(@class,'box')]//div[contains(@class,'left-text')])[2]      ${wait_time}
    Wait Until Element Is Enabled   (//div[contains(@class,'box')]//div[contains(@class,'left-text')])[2]      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_addressIP}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_MAC_addressIP}
    set global variable     ${hover_MAC_addressIP}

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

Get MAC_Address by hovering over discovery asset detail page
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(@class,'welcome-main')])[2]      ${wait_time}
    Wait Until Element Is Enabled   (//div[contains(@class,'welcome-main')])[2]     ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //div[contains(@class,'welcome-main')]//b[contains(text(),'Mac Address')]//parent::div
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_MAC_addressdiscoveryassetdetail}    Get Substring    ${parts[1]}    1
    Log to console     ${hover_MAC_addressdiscoveryassetdetail}
    set global variable     ${hover_MAC_addressdiscoveryassetdetail}

Get asset id by hovering over existing assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    Wait Until Element Is Enabled   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]      ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_assetid}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_assetid}
    set global variable     ${hover_assetid}

Get text of selected brand of filter of existing asset
    Wait Until Element Is Visible  //span[@class='ng-value-label ng-star-inserted']       ${wait_time}
    Wait Until Element Is enabled  //span[@class='ng-value-label ng-star-inserted']       ${wait_time}
    ${brand}=        Get Text    //span[@class='ng-value-label ng-star-inserted']
    Log to console      ${brand}
    set global variable     ${brand}

Enter input in the product field of filters of existing agent
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[2]      ${wait_time}
    Wait Until Element Is enabled    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[2]      ${wait_time}
    click element    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[2]
    input text    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[2]       ${option}
    Press Keys      (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[2]     ENTER


Click on down arrow link on discovery asset list page
    wait until element is visible      //tr[1]//following-sibling::td[normalize-space()='View']//span      ${wait_time}
    wait until element is enabled      //tr[1]//following-sibling::td[normalize-space()='View']//span      ${wait_time}
    click element  //tr[1]//following-sibling::td[normalize-space()='View']//span

Click on view button link on discovery asset list page
    wait until element is visible      //tr[1]//following-sibling::td[normalize-space()='View']//span      ${wait_time}
    wait until element is enabled      //tr[1]//following-sibling::td[normalize-space()='View']//span      ${wait_time}
    click element  //tr[1]//following-sibling::td[normalize-space()='View']//span

Mouse Hover over filters of existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over   (//div[contains(text(),'${discovered_existing_brand}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]

Visible the print qr button to for data loading
    wait until element is visible   css:#PrintQrButton   ${wait_time}
    wait until element is enabled   css:#PrintQrButton   ${wait_time}
    wait until element is visible   css:#location-tab   ${wait_time}

Enter input in search bar of software tab under technology details page
    [Arguments]     ${option}
    wait until element is visible   css:#searchbar-softwareTab     ${wait_time}
    wait until element is enabled   css:#searchbar-softwareTab     ${wait_time}
    click element   css:#searchbar-softwareTab
    input text  css:#searchbar-softwareTab     ${option}
    Sleep    ${yop_sleep}
    Wait Until Element Is Not Visible    ${loaderIcon}  ${wait_time}

Click on Existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,"right-text")])[1]      ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,"right-text")])[1]      ${wait_time}
    Click Element    (//div[contains(@class,"right-text")])[1]


###############################################################


Close Browser Session for OCS file
    Run Keyword If    '${TEST_STATUS}' == 'FAIL'     Run Keywords     My Failure Handling     AND     Welcome to the code
    close browser



#Close Browser Session for OCS File
#    Run Keyword If    '${TEST_STATUS}' == 'FAIL'    Run Keywords     My Failure Handling     AND     Welcome to the code
##    ...    My Failure Handling Keyword
#        ...    ELSE    Welcome to the code

#My Failure Handling
#    ${status}=    Run Keyword And Return Status         Execute Further Steps 1
#    Log    Current status is :${status}
#    Run Keyword If    '${status}' == 'True'    Run Keywords     Execute Further Steps 2    AND     Welcome to the code
#    Run Keyword If    '${status}' == 'False'    Welcome to the code

My Failure Handling
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    OCS.Click on newly discovered tab under network discovery
    UnselectAssetAPI.Hit API Endpoint
    Generic.Refresh the existing page
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    OCS.Click on newly discovered tab under network discovery
    OCS.Click on Existing asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Technology - Details
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Welcome to the code
    Log     testing this method
    Close browser

click on the asset id inside the table of agent discovery
    wait until element is not visible    ${loaderIcon}    ${wait_time}
    wait until element is visible   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[8]   ${wait_time}
    wait until element is enabled   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[8]   ${wait_time}
    click element   //h5[normalize-space()='${agentDiscovery_TagName}']//parent::div//div//table//td[8]

Wait for the invisiblity of alert msg
    [Arguments]    ${option}
    wait until element is visible    ${alert_Msg}          ${wait_time}
    wait until element is enabled    ${alert_Msg}          ${wait_time}
    ${get_alertMsg} =    get text    ${alert_Msg}
    log to console     ${get_alertMsg}
    should be equal    ${get_alertMsg}     ${option}

Search filters and verify results
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    Wait Until Element Is enabled    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    click element    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]
    sleep   ${search_sleep}
    input text    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]       ${option}
    Wait Until Element Is Visible    //ng-dropdown-panel[contains (@id, '0')]//div//div//div        ${wait_time}
    ${filter_text}=         get text        //ng-dropdown-panel[contains (@id, '0')]//div//div//div
    Set Global Variable    ${filter_text}

Mouse Hover over existing asset after applying filters
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${option}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${option}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over   (//div[contains(text(),'${option}')]//ancestor::div[contains(@class,'box')]//child::div[contains(@class,'assets-text')])[2]


Enter input in brand filters field of existing asset with different tech type
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    Wait Until Element Is enabled    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]      ${wait_time}
    click element    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]
    sleep   ${search_sleep}
    input text    (//div[contains(@class,'right-side-filter')]//following-sibling::div//input)[1]       ${option}

Choose filters for Existing asset with different tech type
    [Arguments]     ${option1}      ${option2}
    wait until element is not visible   ${loaderIcon}        ${wait_time}
    wait until element is visible       //*[@placeholder='${option1}']        ${wait_time}
    wait until element is enabled       //*[@placeholder='${option1}']        ${wait_time}
    Click element   //*[@placeholder='${option1}']
    Clear Element Text      //ng-select[@placeholder='${option1}']//input[@type='text']
    input text      //ng-select[@placeholder='${option1}']//input[@type='text']         ${option2}

Verify that No items found with the selected filter
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //div[contains(@class,'ng-option-disabled')]        ${wait_time}
    ${filter_existing_text}=        get text        //div[contains(@class,'ng-option-disabled')]
    log to console          ${filter_existing_text}
    set global variable     ${filter_existing_text}
    Should be equal         ${filter_existing_text}         No items found

Wait until brand loader is invisible
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     wait until element is not visible   //div[@class='full-width-field']//ancestor::ng-select[@id='BrandName']//following-sibling::div[contains(@class,'spinner-loader')]    ${wait_time}

Mouse Hover over current page after hovering over ip and discovered assets
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible  //div[@id='right-column']//parent::div[contains(@class,'item')]//child::span[@title='Current Page']     ${wait_time}
    Wait Until Element Is Enabled    //div[@id='right-column']//parent::div[contains(@class,'item')]//child::span[@title='Current Page']     ${wait_time}
    Mouse Over   //div[@id='right-column']//parent::div[contains(@class,'item')]//child::span[@title='Current Page']

Mouse Hover over apply button after hovering over existing assets filter
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible  //button[normalize-space()='Apply']     ${wait_time}
    Wait Until Element Is Enabled    //button[normalize-space()='Apply']     ${wait_time}
    Mouse Over   //button[normalize-space()='Apply']

Mouse Hover over searched existing assets after craeting technology
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand1} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${discovered_existing_brand1} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over    (//div[contains(text(),'${discovered_existing_brand1} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]

Click on the confirm button under unmatch asset pop up
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible  css:.qa-convert-assignee-tm-${option}    ${wait_time}
    Wait Until Element Is Enabled   css:.qa-convert-assignee-tm-${option}     ${wait_time}
    click element   css:.qa-convert-assignee-tm-${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}


Mouse Hover over searched existing assets after creating technology frm add technology
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible   (//div[contains(text(),'${discovered_existing_brand} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(text(),'${discovered_existing_brand} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]     ${wait_time}
    Mouse Over    (//div[contains(text(),'${discovered_existing_brand} ')]//ancestor::div[contains(@class,'qa-assets-boxes-right')]//child::div[contains(@class,'assets-text')])[2]

Click on the unmatch link under discovery assets list page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible  //i[contains(@class,'fa-unlink')]    ${wait_time}
    Wait Until Element Is Enabled  //i[contains(@class,'fa-unlink')]     ${wait_time}
    click element   //i[contains(@class,'fa-unlink')]
    sleep   2

Mouse hover over first existing asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'column-boxes-right')]//div[contains(@class,'child-container')]//div[contains(@class,'assets-text')]//parent::div)[1]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,'column-boxes-right')]//div[contains(@class,'child-container')]//div[contains(@class,'assets-text')]//parent::div)[1]     ${wait_time}
    Mouse Over   (//div[contains(@class,'column-boxes-right')]//div[contains(@class,'child-container')]//div[contains(@class,'assets-text')]//parent::div)[1]
    sleep   5
Get asset id by hovering over first existing assets
    [Arguments]     ${text}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible  (//div[contains(@class,'column-boxes-right')]//div[contains(@class,'child-container')]//div[contains(@class,'assets-text')]//parent::div)[1]      ${wait_time}
    Wait Until Element Is Enabled   (//div[contains(@class,'column-boxes-right')]//div[contains(@class,'child-container')]//div[contains(@class,'assets-text')]//parent::div)[1]     ${wait_time}
    sleep       ${search_sleep}
    ${hover_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'${text}')]//ancestor::li
    ${parts}    Split String    ${hover_text}    ${text}
    ${hover_assetid1}    Get Substring    ${parts[1]}    1
    Log to console      ${hover_assetid1}
    set global variable     ${hover_assetid1}

Get the text of no records after searching with invalid mac address under newly discovery tab
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@class,'qa-column-boxes-left')]//following-sibling::div//p       ${wait_time}
    wait until element is enabled      //div[contains(@class,'qa-column-boxes-left')]//following-sibling::div//p    ${wait_time}
    ${fetch_text_newly_discovered} =    get text  //div[contains(@class,'qa-column-boxes-left')]//following-sibling::div//p
    log to console     ${fetch_text_newly_discovered}
    set global variable   ${fetch_text_newly_discovered}
    should be equal    ${option}    ${fetch_text_newly_discovered}

Click on the newly dicovered of tenable tab under asset discovery
    wait until element is visible   //a[@id='new-dicovered-tenable']    ${wait_time}
    wait until element is enabled   //a[@id='new-dicovered-tenable']     ${wait_time}
    click element   //a[@id='new-dicovered-tenable']

Click on newly discovered tab under tanium
#    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is visible    css:#new-dicovered-tanium   ${wait_time}
    Wait Until Element Is enabled    css:#new-dicovered-tanium     ${wait_time}
    click element    css:#new-dicovered-tanium

Mouse hover over first discovered asset
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//div[contains(@class,'column-boxes-left')]//div[contains(@class,'child-container')]//div[contains(@class,'left-text')])[1]     ${wait_time}
    Wait Until Element Is Enabled    (//div[contains(@class,'column-boxes-left')]//div[contains(@class,'child-container')]//div[contains(@class,'left-text')])[1]     ${wait_time}
    sleep   ${search_sleep}
    Mouse Over   (//div[contains(@class,'column-boxes-left')]//div[contains(@class,'child-container')]//div[contains(@class,'left-text')])[1]
    sleep   ${search_sleep}

Get the total count of discovered devices
    [Arguments]   ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='searchbar-discoveredassetList']//parent::div//ancestor::div[contains(@class,'search-input')]//h3     ${wait_time}
    Wait Until Element Is Enabled    //input[@id='searchbar-discoveredassetList']//parent::div//ancestor::div[contains(@class,'search-input')]//h3     ${wait_time}
    ${discovered_device_text}=     Get text   //input[@id='searchbar-discoveredassetList']//parent::div//ancestor::div[contains(@class,'search-input')]//h3
    ${parts}    split string    ${discovered_device_text}    ${option}
    ${discovered_device_count}    Get Substring    ${parts[1]}    1
    log        ${discovered_device_count}
    set global variable     ${discovered_device_count}

Compare the count of Discovered assets count inside and outside list
    [Arguments]     ${option1}      ${option2}
    should be equal     ${option1}      ${option2}