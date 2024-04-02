*** Settings ***
Documentation   Contains all test cases of OCS page
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
Resource        ../Pages/UnselectAssetAPI.robot


Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Download agent for OCS from signup - Linux
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create random register company name
    RegisterUserPage.Click on member type
    RegisterUserPage.Select the member type      End User
    RegisterUserPage.Create partner random business email
    RegisterUserPage.Choose register user country      India   +91     9646289871
    RegisterUserPage.Select the checkbox
    RegisterUserPage.Save the register form

    Generic.Verify your current page location contains      update-email
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${generate_register_Email}
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account

#----------------------------------------USER ACCOUNT---------------------------------------------------
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
#    Generic.Fetch alert message text and compare it with       OTP sent successfully

    LandingPage.Fill the login Form      ${generate_register_Email}    Paramdeep@112

    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button

    Generic.Verify your current page location contains     subscription

    SubscriptionPage.Select country of manufacturer profile     United States
    SubscriptionPage.Select state of manufacturer profile   Texas
    SubscriptionPage.Select city of manufacturer profile    Abram
    SubscriptionPage.Input text into manufacturer address one       This is address 1
    SubscriptionPage.Input text into manufacturer address two       This is address 2
    SubscriptionPage.Input text into manufacturer zip code      73301
    SubscriptionPage.Select department of manufacturer profile      Customer Support
    SubscriptionPage.Input text into manufacturer position/title    Agent
    SubscriptionPage.Save the manufacturer profile
    Generic.Verify your current page location contains     subscription-menu
    Generic.Fetch alert message text and compare it with       Profile saved successfully

    SubscriptionPage.Select plan of subscription

    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment

    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420424242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download agent for OCS from signup - Windows
    [Tags]      Sanity
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create random register company name
    RegisterUserPage.Click on member type
    RegisterUserPage.Select the member type      End User
    RegisterUserPage.Create partner random business email
    RegisterUserPage.Choose register user country      India   +91     9646289871
    RegisterUserPage.Select the checkbox
    RegisterUserPage.Save the register form

    Generic.Verify your current page location contains      update-email
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${generate_register_Email}
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account

#----------------------------------------USER ACCOUNT---------------------------------------------------
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
#    Generic.Fetch alert message text and compare it with       OTP sent successfully

    LandingPage.Fill the login Form      ${generate_register_Email}    Paramdeep@112

    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button

    Generic.Verify your current page location contains     subscription

    SubscriptionPage.Select country of manufacturer profile     United States
    SubscriptionPage.Select state of manufacturer profile   Texas
    SubscriptionPage.Select city of manufacturer profile    Abram
    SubscriptionPage.Input text into manufacturer address one       This is address 1
    SubscriptionPage.Input text into manufacturer address two       This is address 2
    SubscriptionPage.Input text into manufacturer zip code      73301
    SubscriptionPage.Select department of manufacturer profile      Customer Support
    SubscriptionPage.Input text into manufacturer position/title    Agent
    SubscriptionPage.Save the manufacturer profile
    Generic.Verify your current page location contains     subscription-menu
    Generic.Fetch alert message text and compare it with       Profile saved successfully

    SubscriptionPage.Select plan of subscription

    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment

    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420424242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download agent for OCS from signup - macOS
    [Tags]      Sanity
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create random register company name
    RegisterUserPage.Click on member type
    RegisterUserPage.Select the member type      End User
    RegisterUserPage.Create partner random business email
    RegisterUserPage.Choose register user country      India   +91     9646289871
    RegisterUserPage.Select the checkbox
    RegisterUserPage.Save the register form
    Generic.Verify your current page location contains      update-email
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${generate_register_Email}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account

#----------------------------------------USER ACCOUNT---------------------------------------------------
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
#    Generic.Fetch alert message text and compare it with       OTP sent successfully

    LandingPage.Fill the login Form      ${generate_register_Email}    Paramdeep@112

    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button

    Generic.Verify your current page location contains     subscription

    SubscriptionPage.Select country of manufacturer profile     United States
    SubscriptionPage.Select state of manufacturer profile   Texas
    SubscriptionPage.Select city of manufacturer profile    Abram
    SubscriptionPage.Input text into manufacturer address one       This is address 1
    SubscriptionPage.Input text into manufacturer address two       This is address 2
    SubscriptionPage.Input text into manufacturer zip code      73301
    SubscriptionPage.Select department of manufacturer profile      Customer Support
    SubscriptionPage.Input text into manufacturer position/title    Agent
    SubscriptionPage.Save the manufacturer profile
    Generic.Verify your current page location contains     subscription-menu
    Generic.Fetch alert message text and compare it with       Profile saved successfully

    SubscriptionPage.Select plan of subscription

    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment

    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420424242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from network discovery - Linux
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from network discovery - Windows
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from network discovery - macOS
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from asset discovery - Linux
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    sleep   ${search_sleep}
    OCS.Choose tab under Discovery Assets   agent-discovery
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from asset discovery - Windows
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    sleep   ${search_sleep}
    OCS.Choose tab under Discovery Assets   agent-discovery
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from asset discovery - macOS
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    sleep   ${search_sleep}
    OCS.Choose tab under Discovery Assets   agent-discovery
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Search Discovered Assets
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Choose tab under Discovery Assets   agent-discovery
    OCS.Get value of Tag_name from Agent discovery      johnsoftwaresolutions-
    OCS.Choose tab under Discovery Assets   network-discovery
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    ${asset_details}
    OCS.Verify Searched discovery asset    ${asset_details}
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Click on Searched Discovered asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page contains this text    Asset Infomation
    OCS.Click on tab under dicovery_asset_detail page    Hardware
    Generic.Verify your current page contains this text     ${hover_serial_number}
    OCS.Click on tab under dicovery_asset_detail page    Network
    Generic.Verify your current page contains this text    ${hover_MAC_address}

Search Existing Assets
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of Existing assets
    OCS.Enter text to search existing asset    ${generated_AssetID}
    OCS.Verify searched existing asset    ${generated_AssetID}

Match Discovery and Existing Asset
    [Tags]      Sanity    t
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Select any Discovered asset
    OCS.Click on search icon of Existing assets
    OCS.Enter text to search existing asset    ${generated_AssetID}
    OCS.Verify searched existing asset    ${generated_AssetID}
    OCS.Select any existing asset
    OCS.Click on search icon of Existing assets
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Serial no. and compare it with    ${hover_serial_number}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Apply filters and clear filter on Discovered Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    OCS.Choose tab under Discovery Assets   network-discovery
    OCS.click on filter icon of discovered assets
    OCS.Choose filters for discovered asset     Select Brand
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched Discovered Asset
    OCS.Get text by hovering over assets    Brand:
    OCS.verify Text by hovering over assets  ${substring}       ${selected_brand}
    OCS.Click on clear filter button link of discovered assets    Clear Filters
    OCS.Choose filters for discovered asset     Select MAC Address
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched Discovered Asset
    OCS.Get text by hovering over assets     MacAddress:
    OCS.verify Text by hovering over assets  ${substring}       ${selected_brand}
    OCS.Click on clear filter button link of discovered assets    Clear Filters
    OCS.Choose filters for discovered asset     Select Agent Tags
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched Discovered Asset
    OCS.Get text by hovering over assets    Tag:
    OCS.verify Text by hovering over assets  ${substring}       ${selected_brand}
    OCS.Click on clear filter button link of discovered assets    Clear Filters
    OCS.Hover over searched Discovered Asset
    OCS.Get text by hovering over assets     Brand:

Apply filters and clear filter on Existing Assets
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     johns@mai.25u.com     Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    OCS.Choose tab under Discovery Assets   network-discovery
    OCS.click on filter icon of existing assets
    OCS.Choose filters for discovered asset     Select Brand
    OCS.Get text of selected brand, mac address and agent of discovered assets  1
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   1
    Generic.click on the button     Apply
    OCS.Hover over searched existing Asset
    OCS.Get text by hovering over existing assets   Brand:
    OCS.verify Text by hovering over assets  ${substring1}       ${selected_brand}
    OCS.Click on clear filter button link of discovered assets      Clear Filters
    OCS.Choose filters for discovered asset     Select Product
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched existing Asset
    OCS.Get text by hovering over existing assets   ProductId:
    OCS.verify Text by hovering over assets  ${substring1}       ${selected_brand}
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for discovered asset    Select Department
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched existing Asset
    OCS.click on the right text asset result of existing asset
    sleep       ${yop_sleep}
    Switch Window   aithentic | Technology - Details
    TechnologyPage.Click on Location tab of technology- list page
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     DepartmentName
    OCS.verify Text by hovering over assets  ${assign_loc_input_value}       ${selected_brand}
    sleep       ${yop_sleep}
    Switch Window   aithentic | Asset - Discovery
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for discovered asset    Select Location
    OCS.Get text of selected brand, mac address and agent of discovered assets  0
    OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
    Generic.click on the button     Apply
    OCS.Hover over searched existing Asset
    OCS.click on the right text asset result of existing asset
    sleep       ${yop_sleep}
    Switch Window   aithentic | Technology - Details
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     LocationName
    OCS.verify Text by hovering over assets  ${assign_loc_input_value}       ${selected_brand}
    sleep       ${yop_sleep}
    Switch Window   aithentic | Asset - Discovery
    OCS.Click on clear filter button link of discovered assets      Clear Filters
    OCS.Hover over searched existing Asset
    OCS.Get text by hovering over existing assets  ProductId:

Add Discovery Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Agent/Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page

    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    OCS.Verify Page should contain Element     discovery-info-tab
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    OCS.Verify Discovery_info contains following tab    network-tab
    OCS.Verify Discovery_info contains following tab    devices-tab
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Create Asset from Add Assets Page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    More Details
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    close window
    switch window    aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    View Component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    close window
    Switch Window       aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    Create Asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    TechnologyPage.Create unique serial number random
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Add component as an asset after Adding OCS asset
    [Tags]      Sanity      smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    More Details
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    Close Window
    switch window    aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    Create Asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    switch window    aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    Generic.Verify your current page contains this text    ${generated_AssetID}
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    View Component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    OCS.Verify Discovery_info contains following tab    software-tab
    Generic.Scroll the page till   300
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Create Asset_id for software component
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail

    OCS.Verify Software tab Should contain Element
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Network Discovery in case of no records
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       raghu@yopmail.com         Test@001
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Fetch text from Agent/Discovered assets column and compare it with      No records
    OCS.Fetch text from Existing assets column and compare it with     No records
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Fetch text from Agent Discovery tab and compare it with    No record found

Add component as an asset from Agent Discovery page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Agent/Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
#    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    OCS.Verify Page should contain Element     discovery-info-tab
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    Generic.Scroll the page till   499
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
#    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Create Asset_id for software component
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Technology - Details
    OCS.Verify Software tab Should contain Element
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Network discovery search on discovered asset list with MAC address
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List        10:7B:44:62:66:87
    sleep   ${search_sleep}
    Generic.Wait until table get load
    Generic.Verify your current page contains this text     10:7B:44:62:66:87

Network discovery search on discovered asset list with IP address
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List         192.168.0.137
    sleep   ${search_sleep}
    Generic.Wait until table get load
    Generic.Verify your current page contains this text      192.168.0.137

Upload Image and Document File while Add Discovery Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Agent/Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Create unique serial number random
    OCS.Enter The Asset_id in Add Technology Page
    TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
    Generic.Scroll Window To End
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       aithentic | Add Discovery Asset
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    TechnologyPage.Click on attachment tab
    TechnologyPage.Upload file          Document_02.pdf
    Generic.Scroll Window To End
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       Main
    TechnologyPage.Download the file by clicking on download icon over file    .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       Main
    OCS.Verify Page should contain Element     discovery-info-tab
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    OCS.Verify Discovery_info contains following tab    network-tab
    OCS.Verify Discovery_info contains following tab    devices-tab
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit The Host_Name of Asset
    Generic.Scroll Window To End
    TechnologyPage.Remove the document by clicking on cross-icon    .pdf
    TechnologyPage.Remove the document by clicking on cross-icon    .png
    TechnologyPage.Upload file      Image_02.png     Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Edit - Technology
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Upload Image and Document File while Add component as an asset from Agent Discovery page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Agent/Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
    Generic.Scroll Window To End
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       aithentic | Add Discovery Asset
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    OCS.Verify Page should contain Element     discovery-info-tab
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    Generic.Scroll the page till   499
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Create Asset_id for software component
    TechnologyPage.Upload file      Image_01.jpg      Document_02.pdf       Image_02.png
    Generic.Scroll Window To End
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       aithentic | Add Discovery Asset
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Technology - Details
    OCS.Verify Discovery_info contains following tab    software-tab
    Generic.Refresh the existing page
    OCS.Click on Discovery_info tab on Technology details Page
    OCS.Verify Discovery_info contains following tab    hardware-tab
    OCS.Verify Discovery_info contains following tab    software-tab
    OCS.Verify Software tab Should contain Element
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit The Host_Name of Asset
    Generic.Scroll Window To End
    TechnologyPage.Remove the document by clicking on cross-icon    .jpg
    TechnologyPage.Remove the document by clicking on cross-icon    .pdf
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Match IP Discovered asset with Existing asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Select any Discovered asset
    OCS.Click on search icon of discovery assets
    OCS.Hover Existing Agent
    OCS.Get text by hovering over existing assets of technology    Tag:
    OCS.Select any existing asset
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${hover_details}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Match Discovery Asset with Static Existing Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Serial number by hovering over discovered assets     Serial Number:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Select any Discovered asset
    OCS.Hover Existing Agent
    OCS.Get text by hovering over existing assets of technology    Tag:
    OCS.Select any existing asset
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId        ${hover_details}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Serial no. and compare it with    ${hover_serial_number}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Match IP Discovered Asset with Dynamic Existing Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Host name by hovering over discovered assets     Host name:
    OCS.Select any Discovered asset
    OCS.Click on search icon of discovery assets
    OCS.Click on search icon of Existing assets
    OCS.Enter text to search existing asset    ${generated_AssetID}
    OCS.Verify searched existing asset    ${generated_AssetID}
    OCS.Select any existing asset
    OCS.Click on search icon of Existing assets
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with    ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Visit discovered asset list when click on No. IP discovered devices
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Click on Go to Agent Discovery Page
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Verify your current page location contains     discovery-assets

Refresh search text on discovered asset list page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List         192.168.0.137
    sleep   ${search_sleep}
    Generic.Wait until table get load
    Generic.Verify your current page contains this text      192.168.0.137
    OCS.Click on Refresh Icon of discovered asset lists
    Generic.Wait until table get load

Add asset with IP Address under discovered asset list
    [Tags]    retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
#    OCS.Get Host name by hovering over discovered assets        Host name:
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    Generic.Wait until table get load
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Create random unique serial number
    OCS.Enter The Asset_id in Add Technology Page
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Refresh the existing page
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
#    OCS.Get Value of Host-Name and compare it with      ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Add Asset with IP address from Network Discovery Page
    [Tags]    retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    OCS.Get Host name by hovering over discovered assets        Host name:
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    View Component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    close window
    Switch Window       aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    Create Asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Create unique serial number random
    OCS.Enter The Asset_id in Add Technology Page
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address}
    OCS.Get Value of Host-Name and compare it with      ${hover_host name}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Network discovery search on discovered asset list with Tag Name
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List         johnsoftwaresolutions-1428-3
    sleep   ${search_sleep}
    Generic.Wait until table get load
    Generic.Verify your current page contains this text      johnsoftwaresolutions-1428-3

Search with containing fields under advance search of discovered asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    Create Asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    Generic.click on the button     Reset Filters
    OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
    Generic.click on the button     Search
    sleep      ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for brand
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the Brand Name from the brand field of discovered asset
    TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter and select technology type in advance search of discovered search
    Generic.click on the button     Search
    sleep       ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology type
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the technology type from the technology type field of component of discovered asset
    TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter input in the technology group field of advanced search of discovered asset
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology group
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Get text of technology group inside add technology
    TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
     Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter product in the product input field     Vishal luthra
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of product inside add technology
    TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

    Generic.click on the button     Reset Filters
    TechnologyPage.Enter description in the description input field     Aithentic Description
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of description inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter feature in the description input field     Aithentic Feature
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of feature inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}

Search with containing fields under advance search of component of discovered asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.select the option from the side menu        Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    I_iconPage.Choose tab under Discovery Assets       network-discovery

    Generic.Verify your current page location contains    ocs
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Generic.Verify your current page location contains    add-assets
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    Create Asset
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    switch window    aithentic | Asset - Discovery
    Generic.Verify your current page location contains    add-assets
    Generic.Verify your current page contains this text    ${generated_AssetID}
    OCS.Click on three-dots inside table of add assets
    OCS.Select option inside three-dots    View Component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovery Asset Detail
    Generic.Verify your current page location contains    discovery-asset-detail
    OCS.Verify Discovery_info contains following tab    software-tab
    Generic.Scroll the page till   300
    OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
    OCS.Click on plus icon of any component
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    Generic.click on the button     Reset Filters
    OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
    Generic.click on the button     Search
    sleep      ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for brand
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the Brand Name from the brand field of discovered asset
    TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter and select technology type in advance search of discovered search
    Generic.click on the button     Search
    sleep       ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology type
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the technology type from the technology type field of component of discovered asset
    TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter input in the technology group field of advanced search of discovered asset
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology group
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Get text of technology group inside add technology
    TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
     Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter product in the product input field     Vishal luthra
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of product inside add technology
    TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

    Generic.click on the button     Reset Filters
    TechnologyPage.Enter description in the description input field     Aithentic Description
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of description inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter feature in the description input field     Aithentic Feature
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of feature inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}
    I_iconPage.Click on the cross icon of advanced search under technology
    sleep   ${search_sleep}

    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Search with containing fields under advance search of IP Address of discovered asset
     Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    OCS.Hover over searched Discovered Asset
    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    Generic.Wait until table get load
    OCS.Click on Plus icon under table
    Sleep    ${Yop_Sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page location contains    add-discovered-asset
    Generic.Verify your current page contains this text    Add Technology
    I_iconPage.Click on advanced search link under create asset network discovery
    sleep   ${search_sleep}
    Generic.click on the button     Reset Filters
    OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
    Generic.click on the button     Search
    sleep      ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for brand
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the Brand Name from the brand field of discovered asset
    TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter and select technology type in advance search of discovered search
    Generic.click on the button     Search
    sleep       ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology type
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    OCS.Fetch the technology type from the technology type field of component of discovered asset
    TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
    Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    OCS.Enter input in the technology group field of advanced search of discovered asset
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    OCS.Click on the table inside advanced search of discovered asset for technology group
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Get text of technology group inside add technology
    TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
     Generic.Refresh the existing page
    I_iconPage.Click on advanced search link under create asset network discovery
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter product in the product input field     Vishal luthra
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of product inside add technology
    TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

    Generic.click on the button     Reset Filters
    TechnologyPage.Enter description in the description input field     Aithentic Description
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of description inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter feature in the description input field     Aithentic Feature
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of feature inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}

#Disconnect
#    DisconnectConnectorAPI.Hit API to disconnect connector
    