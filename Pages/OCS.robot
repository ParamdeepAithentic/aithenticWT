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

Click on search icon of discovery assets
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible       //i[@title='Search: Agent/Network - Discovered Assets']     60
    Wait Until Element Is enabled       //i[@title='Search: Agent/Network - Discovered Assets']     60
    Click Element    //i[@title='Search: Agent/Network - Discovered Assets']

Enter text to search discovery assest
    [Arguments]     ${option}
    wait until element is not visible   ${loaderIcon}        60
    Wait Until Element Is Visible    //input[@placeholder='Search OCS Discovered Assets']       60
    Wait Until Element Is enabled    //input[@placeholder='Search OCS Discovered Assets']       60
    Input Text    //input[@placeholder='Search OCS Discovered Assets']    ${option}

Enter text to search existing assest
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

Click on Confirm Button
    [Arguments]     ${option}
    Generic.click on the button     ${option}

Get Value of MAC-Address
    wait until element is visible    //input[@id='Mac Address']   60
    ${mac_address_value} =    Get Value    //input[@id='Mac Address']
    Set Global Variable    ${mac_address_value}
    Log To Console    MAC Address is: ${mac_address_value}

Get Value of Serial no.
    wait until element is visible   //input[@id='Serial Number']   60
    ${serial_no.} =    Get Value    //input[@id='Serial Number']
    Set Global Variable    ${serial_no.}
    Log To Console    Serial No. is: ${serial_no.}

Get Value of Host-Name
#    [Arguments]     ${value}
    wait until element is visible   //input[@id='Computer/Host Name']   60
    ${host_value} =    Get Value    //input[@id='Computer/Host Name']
    Set Global Variable    ${host_value}
    Log To Console    Host Name is: ${host_value}

verify Text from Assignment Information
    [Arguments]     ${original}     ${compared}
    should be equal     ${original}     ${compared}

Edit the MAC_Address of Asset
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:#DYNA_14   60
    Input Text   css:#DYNA_14     ${option}

Edit the Serial_No. of Asset
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:#DYNA_21   60
    Input Text   css:#DYNA_21     ${option}

Edit The Host_Name of Asset
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      60
    Wait Until Element Is Visible    css:#DYNA_24   60
    Input Text   css:#DYNA_24     ${option}

 