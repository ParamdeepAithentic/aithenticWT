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

Test Setup      open the browser with the url
Test Teardown   Close Browser session
*** Variables ***

*** Test Cases ***

Verify all i-icon of Dashboard page
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   Asset Overview
    Generic.Verify your current page location contains      dashboard
    I_iconPage.Click on i-icon of asset-overview tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of asset-overview tab
    DashboardPage.select the option from the dashboard drawer   Account Overview
    Generic.Verify your current page location contains      account-overview
    I_iconPage.Click on i-icon of account_overview tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of account_overview tab

Verify all i-icon of profile-listing
    [Tags]     Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    I_iconPage.Click on i-icon of system configuration tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of system configuration tab
    I_iconPage.Choose tabs under organization        company
    I_iconPage.Click on i-icon of industry under company financial information
    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on link inside industry i-icon      https://www.naics.com/search/
#    sleep       ${yop_sleep}
#    switch window       NAICS & SIC Identification Tools | NAICS Association
#    Generic.Verify your current page location contains      naics.com
#    Generic.Verify your current page contains this text     NAICS Identification Tools
#    Go back
#    I_iconPage.Click on i-icon of company department
#    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on i-icon of company department
#    I_iconPage.Click on view added Departments list      View Your Added Departments List
#    Generic.Verify your current page location contains      department-list
#    I_iconPage.Click on action menu button of department
#    I_iconPage.Choose Add department from Action button options          Add Department
#    I_iconPage.Click on i-icon of cost_center in department
#    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on i-icon of cost_center in department
#    I_iconPage.Click on cancel add department        close
#    I_iconPage.Search by Department             Customer Support        #Communications
#    I_iconPage.Click on three dots of Department list
#    I_iconPage.Choose option from three_dots of Department     Details
#    I_iconPage.Click on i-icon of cost_center in department
#    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on i-icon of cost_center in department
#    I_iconPage.Click on cancel add department        close
#    I_iconPage.Click on three dots of Department list
#    I_iconPage.Choose option from three_dots of Department     Edit
#    I_iconPage.Click on i-icon of cost_center in department
#    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on i-icon of cost_center in department
#    I_iconPage.Click on cancel add department        close
#    Generic.Verify your current page location contains      department-list
    I_iconPage.Choose options inside personal_details        Technology
    I_iconPage.Click on i-icon inside technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon inside technology

Verify all i-icon of team member page
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    I_iconPage.Click on i-icon of team-members tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of team-members tab

Verify all i-icon of Technology page
    [Tags]   Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    I_iconPage.Click on i-icon of technology tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on Link inside pop-up of technology
    sleep   ${yop_sleep}
    switch window       Technology Overview - Jira Service Management
    Generic.Verify your current page location contains      servicedesk
    Generic.Verify your current page contains this text     Technology Overview
    sleep   ${yop_sleep}
    switch window       aithentic | Technology - List
    I_iconPage.Click on i-icon of technology tab
    I_iconPage.Click on i-icon of technology tab
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    I_iconPage.Click on i-icon of cost_center in add technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in add technology
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    I_iconPage.Click on i-icon of cost_center in edit technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of cost_center in edit technology
#    I_iconPage.Click on Back tab          Back to Technology Details
     sleep   ${yop_sleep}
    switch window       aithentic | Edit - Technology
    TechnologyPage.Click on update button of edit_technology page       Update
#    TechnologyPage.Accept updated edited technology pop up     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains      technology-details
    I_iconPage.Click on clone button on product details page        Clone
    I_iconPage.Click on i-icon of cost_center in clone technology
    Generic.Verify pop-up is visible after clicking on i-icon
#    I_iconPage.Click on Back tab          Back to Manage Technology
    sleep   ${yop_sleep}
    switch window       aithentic | Clone - Technology

Verify all i-icon of partners page
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    I_iconPage.Click on i-icon of partners tab
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of partners tab


Verify all i-icon of Discovery assets
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu        Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
#    I_iconPage.Choose tab under Discovery Assets       agent-discovery
#    I_iconPage.Click on i-icon inside agent discovery
#    I_iconPage.Click on link inside agent_discovery i-icon
#    sleep       ${yop_sleep}
#    switch window       Asset Discovery - Jira Service Management
#    Generic.Verify your current page location contains      customer
#    Generic.Verify your current page contains this text     Asset Discovery
#    sleep       ${yop_sleep}
#    switch window       aithentic | Sentinel One Newly-Discovered
    OCS.Click on newly discovered tab under network discovery
    I_iconPage.Click on i_icon under network_discovery tab


Verify all i-icon of advanced search
    [Tags]     Smoke          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click on advanced search button link under add technology
    I_iconPage.Click on i_icon of advanced search under add technology
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i_icon of advanced search under add technology
    I_iconPage.Click on the cross icon of advanced search under technology
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    Generic.select the option from the side menu        Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset  ${discovered_asset_brand}
    Generic.Scroll Window To End
    OCS.Click on the down arrow icon of discovered asset
    OCS.Mouse Hover over searched Discovered Assets
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Verify pop is visible after clicking i-icon of advancede search under discovered asset
    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Click on the cross icon of advanced search under technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Create unique serial number random
    OCS.Enter The Asset_id in Add Technology Page
    Generic.Scroll Window To End
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window     aithentic | Agent Discovery
    Generic.Refresh the existing page
    OCS.Choose Tab under Asset Discovery    agent-discovery
    Generic.Verify your current page contains this text    ${generated_AssetID}
    sleep   ${search_sleep}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    sleep   ${search_sleep}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    OCS.Visible the print qr button to for data loading
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    sleep   ${search_sleep}
    OCS.Enter input in search bar of software tab under technology details page     python
    Generic.Scroll the page till   499
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Verify pop is visible after clicking i-icon of advancede search under discovered asset
    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Click on the cross icon of advanced search under technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Create Asset_id for software component
    Generic.Scroll Window To End
    OCS.Click on save button of Add Technology Page

    OCS.Wait for the invisiblity of alert msg       Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window      aithentic | Technology - Details


    Generic.Verify your current page location contains    technology-details

    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    Generic.Scroll Window To End
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    ${discovered_IP}
    Generic.Scroll Window To End
    OCS.Click on the down arrow icon of discovered asset
    OCS.Mouse Hover over searched IP Assets
    OCS.Get MAC_Address by hovering over IP discovered assets    MacAddress:
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Verify pop is visible after clicking i-icon of advancede search under discovered asset

    I_iconPage.Click on i_icon of advanced search under add discovered asset
    I_iconPage.Click on the cross icon of advanced search under technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Create random unique serial number
    OCS.Enter The Asset_id in Add Technology Page
    Generic.Scroll Window To End
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg       Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    Generic.Scroll Window To End
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint



Upload File I-icon while add and edit technology
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Upload I-icon under attachment tab
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on attachment tab
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.

Upload I-icon under clone add technology
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on clone button on techonology details page       Clone
    Generic.Verify your current page location contains      clone-addtechnology
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.



Upload I-icon while adding discovery and component asset
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset   ${discovered_asset_brand}
    Generic.Scroll Window To End
    OCS.Click on the down arrow icon of discovered asset
    OCS.Mouse Hover over searched Discovered Assets
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
     Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window     aithentic | Agent Discovery
    Generic.Refresh the existing page
    OCS.Choose Tab under Asset Discovery    agent-discovery
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    OCS.Visible the print qr button to for data loading
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    sleep   ${search_sleep}
    OCS.Enter input in search bar of software tab under technology details page     python
    Generic.Scroll the page till   499
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322

    OCS.Create Asset_id for software component
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg       Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window      aithentic | Technology - Details
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    Generic.Scroll Window To End
    I_iconPage.Fetch the text of I-icon of upload file while adding technology     You can upload 1 file of 8MB or 8 files of 1MB each.
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Verify I-icon of management console page
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    I_iconPage.Click on i-icon of management console page
    Generic.Verify pop-up is visible after clicking on i-icon
    I_iconPage.Click on i-icon of management console page

#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F

