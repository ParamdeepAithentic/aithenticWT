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

click on filter icon of discovered assets
    wait until element is visible  css:i[title='Filter: Agent/Network - Discovered Assets']    60
    wait until element is enabled   css:i[title='Filter: Agent/Network - Discovered Assets']    60
    click element   css:i[title='Filter: Agent/Network - Discovered Assets']

Choose filters for discovered asset
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    wait until element is visible   //ng-select[@placeholder='${option}']//input[@type='text']
    wait until element is enabled   //ng-select[@placeholder='${option}']//input[@type='text']
    click element   //ng-select[@placeholder='${option}']//input[@type='text']

Select brand , mac address and agent from dropdown of discovered asset filter
    [Arguments]     ${number}
    wait until element is visible     //div[contains (@id, '-${number}')]       60
    wait until element is enabled     //div[contains (@id, '-${number}')]       60
    click element   //div[contains (@id, '-${number}')]

Get text from Brand
   [Arguments]     ${text}
   wait until element is not visible    ${loaderIcon}      60
    Wait Until Element Is Visible   css:.left-text
    ${MAC_text}=        Get Text        //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'Brand:')]//ancestor::li
    ${parts}    Split String    ${MAC_text}    ${text}
    ${brand}    Get Substring    ${parts[1]}    1
    Log to console      ${brand}
    set global variable     ${brand}

Hover over searched Discovered Asset
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:.left-text     60
    Wait Until Element Is Enabled    css:.left-text     60
    Mouse Over    css:.left-text


Get text of selected brand, mac address and agent of discovered assets
     [Arguments]     ${number}
     Wait Until Element Is Visible  //div[contains (@id, -'${number}')]       60
    ${selected_brand}=        Get Text    //div[contains (@id, -'${number}')]
    Log to console      ${selected_brand}
    set global variable     ${selected_brand}

verify Text from brand
    [Arguments]     ${original}     ${compared}
    should be equal     ${original}     ${compared}


Get text from mac address
   [Arguments]     ${text}
   wait until element is not visible    ${loaderIcon}      60
   Wait Until Element Is Visible   css:.left-text      60
    ${MAC_text}=        Get Text         //bs-tooltip-container[@role='tooltip']//li//b[contains(text(),'MacAddress:')]//ancestor::li
    ${parts}    Split String    ${MAC_text}    ${text}
    ${MAC_Address}    Get Substring    ${parts[1]}    1
    Log to console      ${MAC_Address}
    set global variable     ${MAC_Address}




