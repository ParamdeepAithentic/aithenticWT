*** Settings ***
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
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

*** Variables ***
${Totalcount_field}        css:.qa-total-count-list
${dept_searchbar}       css:input[placeholder='Search by Department Name']
${three_dots_dept}      css:.three-dots

*** Keywords ***
Click on i-icon of team-members tab
    wait until element is visible       css:#member-list-Iicon      60
    click element       css:#member-list-Iicon

Click on i-icon of technology tab
    wait until element is visible       css:#technology-list-Iicon      60
    click element       css:#technology-list-Iicon

Click on Link inside pop-up of technology
    wait until element is visible       css:a[title='Technology Overview Article']      60
    click link       css:a[title='Technology Overview Article']

Click on i-icon of cost_center in add technology
    wait until element is visible       css:.qa-iIconSection-add-tech-cc        60
    click element       css:.qa-iIconSection-add-tech-cc

Click on i-icon of cost_center in edit technology
    wait until element is visible       css:.qa-iIconSection-edit-tech-cc       60
    click element   css:.qa-iIconSection-edit-tech-cc

Click on Back tab
    [Arguments]     ${option}
    Generic.Select parameter        ${option}

Click on clone button on product details page
    [Arguments]    ${option}
    Generic.click on the button link     ${option}
    wait until element is not visible      ${loaderIcon}    60

Click on i-icon of cost_center in clone technology
    wait until element is visible       css:.qa-iIconSection-add-tech-cc        60
    click element       css:.qa-iIconSection-add-tech-cc

Click on i-icon of partners tab
    wait until element is visible    css:#partner-list-Iicon        60
    click element       css:#partner-list-Iicon

Click on i-icon of asset-overview tab
    wait until element is visible       css:.qa-dashboard-home-iIcon       60
    click element       css:.qa-dashboard-home-iIcon

Verify i-icon popup is visible
    wait until element is visible        css:.popover-content       60
    log to console      Yes,Pop-up is visible for i-icon content.

Click on i-icon of account_overview tab
    wait until element is visible       css:.qa-dashboard-report-Iicon     60
    click element       css:.qa-dashboard-report-Iicon

Choose options inside personal_details
    [Arguments]     ${option}
    Generic.Select parameter    ${option}

Choose tabs under organization
    [Arguments]     ${option}
    wait until element is visible       css:#nav-${option}-tab     60
    click element       css:#nav-${option}-tab

Click on i-icon of system configuration tab
    wait until element is visible       css:#advance-search-add-technology-Iicon        60
    click element       css:#advance-search-add-technology-Iicon

Click on i-icon of industry under company financial information
    wait until element is visible       css:.qa-company-information-financial-industry      60
    click element       css:.qa-company-information-financial-industry

Click on link inside industry i-icon
    [Arguments]    ${link}
    Generic.click on the button link    ${link}

Click on i-icon of company department
    wait until element is visible       css:.qa-company-department-Iicon        60
    click element       css:.qa-company-department-Iicon

Click on view added Departments list
    [Arguments]     ${option}
    Generic.click on the button link        ${option}

Click on action menu button of department
    wait until element is visible       css:#Team-Member-Actions        60
    click element       css:#Team-Member-Actions

Choose Add department from Action button options
    [Arguments]    ${option}
    Generic.click on the tab        ${option}

Click on i-icon of cost_center in department
    wait until element is visible       css:.qa-iIconSection-dept-cc        60
    click element       css:.qa-iIconSection-dept-cc

Click on cancel add department
    [Arguments]    ${option}
    wait until element is visible       css:.qa-${option}-department-modal        60
    wait until element is enabled       css:.qa-${option}-department-modal        60
    click element        css:.qa-${option}-department-modal
    sleep       ${search_sleep}
# option: add, close

Search by Department
    [Arguments]    ${option}
    wait until element is visible       css:thead tr       60
    wait until element is visible       ${dept_SearchBar}       60
    Clear Element Text      ${dept_SearchBar}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text      ${dept_SearchBar}   ${option}
    wait until element is visible       css:thead tr       60

Click on three dots of Department list
    sleep       ${search_sleep}
    wait until element is visible   ${three_dots_dept}   60
    click element   ${three_dots_dept}

Choose option from three_dots of Department
    [Arguments]     ${option}
    Generic.Select other option from profile list       ${option}

Click on i-icon inside technology
    wait until element is visible       css:#technology-products-Iicon      60
    click element       css:#technology-products-Iicon

Click on i-icon inside agent discovery
    Wait Until Page Contains Element        //button[normalize-space()='Download Agent']        60
#   wait until element is visible       css:#nav-system-configuration .qa-iIconSection-network-discovery     60
    wait until element is visible   css:.qa-iIconSection-agent-discovery     60
    click element       css:.qa-iIconSection-agent-discovery
    sleep       ${search_sleep}

Click on link inside agent_discovery i-icon
    wait until element is visible       css:a[title='Network Discovery']        60
    click element       css:a[title='Network Discovery']

Choose tab under Discovery Assets
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}       60
    wait until element is visible       css:.qa-${option}-tab       60
    click element       css:.qa-${option}-tab
#option: agent-discovery, network-discovery

Click on i_icon under network_discovery tab
    Wait Until Page Contains element       //p[normalize-space()='Discovered Assets List']     60
    wait until element is visible       css:.qa-iIconSection-network-discovery      60
    click element       css:.qa-iIconSection-network-discovery

Click on i_icon of advanced search under add technology
    wait until element is visible   css:#advance-search-add-technology-Iicon    60
    wait until element is enabled   css:#advance-search-add-technology-Iicon    60
    click element   css:#advance-search-add-technology-Iicon

Click on the cross icon of advanced search under technology
    wait until element is visible   //div[@class='modal-dialog1']//span[normalize-space()='×']      60
    wait until element is enabled   //div[@class='modal-dialog1']//span[normalize-space()='×']      60
    click element   //div[@class='modal-dialog1']//span[normalize-space()='×']

Click on advanced search link under create asset network discovery
    wait until element is visible  (//span[contains(text(),'Advance Search')])[2]    60
    wait until element is enabled   (//span[contains(text(),'Advance Search')])[2]    60
    click element   (//span[contains(text(),'Advance Search')])[2]
    wait until element is not visible      ${loaderIcon}    60

Click on i_icon of advanced search under add discovered asset
    wait until element is visible   css:.info-icon i    60
    wait until element is enabled   css:.info-icon i    60
    Mouse over      css:.info-icon i

Verify pop is visible after clicking i-icon of advancede search under discovered asset
    wait until element is visible       css:#tooltip-0        60
    log to console      Yes, pop-up is visible for i-icon