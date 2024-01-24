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
    wait until element is visible   //div[contains(text(), '${option}')]   60
    wait until element is enabled   //div[contains(text(), '${option}')]   60
    click element   //div[contains(text(), '${option}')]

Select brand , mac address and agent from dropdown of discovered asset filter
    [Arguments]     ${option}
    wait until element is visible   //div[@class='ng-dropdown-panel-items scroll-host']//span[normalize-space()='${option}']    60
    wait until element is enabled   //div[@class='ng-dropdown-panel-items scroll-host']//span[normalize-space()='${option}']    60
    click element   //div[@class='ng-dropdown-panel-items scroll-host']//span[normalize-space()='${option}']



