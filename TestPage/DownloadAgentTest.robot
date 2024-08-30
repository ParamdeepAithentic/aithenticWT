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

Download agent for OCS from signup - Linux
    [Tags]      Sanity      Smoke       Stable
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginPage.Fetch the refresh token from the login api
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
    Generic.Refresh the existing page
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
    SubscriptionPage.Enter cardnumber    42424242424242420429242
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
    [Tags]      Sanity      Stable
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginPage.Fetch the refresh token from the login api
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
    Generic.Refresh the existing page
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
    SubscriptionPage.Enter cardnumber    42424242424242420429242
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
    [Tags]      Sanity      Stable
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
#    LoginPage.Fetch the refresh token from the login api
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
    Generic.Refresh the existing page
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
    SubscriptionPage.Enter cardnumber    42424242424242420429242
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
    [Tags]      Sanity          Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from network discovery - Windows
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from network discovery - macOS
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Download Agent from asset discovery - Linux
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    sleep   ${search_sleep}
    OCS.Choose tab under Discovery Assets   agent-discovery
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download


Network Discovery in case of no records
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       raghu@yopmail.com         Test@001
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains   aad
    OCS.Click on newly discovered tab under network discovery
    OCS.Fetch text from Agent/Discovered assets column and compare it with      No records
    OCS.Fetch text from Existing assets column and compare it with     No records
    OCS.Choose Tab under Asset Discovery    agent-discovery
    OCS.Fetch text from Agent Discovery tab and compare it with    No record found


Visit discovered asset list when click on No. IP discovered devices
    [Tags]      Unstable    yy
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    OCS.click on the value of IP discovered devices of inside table
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Discovered Assets
    Generic.Verify your current page location contains     discovery-assets-list
    OCS.Click on Go to Agent Discovery Page
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Sentinel One Newly-Discovered
    Generic.Verify your current page location contains     discovery-assets


#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F




#Refresh search text on discovered asset list page
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
#    Generic.select the option from the side menu    Asset Discovery
#    Generic.Verify your current page location contains     discovery-assets
#    OCS.click on the value of IP discovered devices of inside table
#    Sleep    ${yop_sleep}
#    Switch Window       aithentic | Discovered Assets
#    Generic.Verify your current page location contains     discovery-assets-list
#    OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List         192.168.0.137
#    sleep   ${search_sleep}
#    Generic.Wait until table get load
#    Generic.Verify your current page contains this text      192.168.0.137
#    OCS.Click on Refresh Icon of discovered asset lists
#    Generic.Wait until table get load

Verify Filters of Existing asets by adding assets of different tech type - HARDWARE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
#    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in the brand field of existing asset       ${generated_BrandName}
    Generic.click on the button     Apply
    OCS.Click on the down arrow icon of existing assets
    OCS.Mouse Hover over existing asset after applying filters      ${generated_BrandName}
    OCS.Get text by hovering over existing assets of technology   Brand:
    OCS.verify Text by hovering over assets  ${substring1}       ${generated_BrandName}
    OCS.Click on the down arrow icon of existing assets
    OCS.Click on clear filter button link of discovered assets      Clear Filters
    OCS.Choose filters for discovered asset     Select Product      ${generated_product}
    Generic.click on the button     Apply
    Generic.Scroll Window To End
    OCS.Click on the down arrow icon of existing assets
    sleep   ${search_sleep}
    OCS.Mouse Hover over existing asset after applying filters      ${generated_BrandName}
    OCS.Get text by hovering over existing assets of technology   Model/Product Name:
    OCS.verify Text by hovering over assets  ${substring1}      ${generated_product}
    OCS.Click on the down arrow icon of existing assets
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for discovered asset    Select Department    ${generated_DepartmentNumber}
    Generic.click on the button     Apply
    OCS.Click on the down arrow icon of existing assets
    OCS.Mouse Hover over existing asset after applying filters      ${generated_BrandName}
    OCS.Get text by hovering over existing assets of technology   Department Name:
    OCS.verify Text by hovering over assets  ${substring1}      ${generated_DepartmentNumber}
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for discovered asset    Select Location     United States - ${generated_buildingname} - 6 - 30
    Generic.click on the button     Apply
    Generic.Scroll Window To End
    OCS.Click on the down arrow icon of existing assets
    OCS.Click on the down arrow icon of existing assets
    OCS.Mouse Hover over existing asset after applying filters      ${generated_BrandName}
    OCS.Get text by hovering over existing assets of technology   Location Name:
    OCS.verify Text by hovering over assets  ${substring1}      United States - ${generated_buildingname} - 6 - 30
    OCS.Click on clear filter button link of discovered assets      Clear Filters

################################### LICENSE ASSET #######################################################################
Verify Filters of Existing asets by adding assets of different tech type - LICENSE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     License
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters

################################### SUBSCRIPTION ASSET #########################################################################
Verify Filters of Existing asets by adding assets of different tech type - SUBSCRIPTION
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Subscription
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters

################################### MAINTENANCE #########################################################################
Verify Filters of Existing asets by adding assets of different tech type - MAINTENANCE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Maintenance
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters

################################################# FREEWARE ASSET ##########################################################
Verify Filters of Existing asets by adding assets of different tech type - FREEWARE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Freeware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters

####################################### CERTIFICATE #########################################################
Verify Filters of Existing asets by adding assets of different tech type - CERTIFICATE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Certificate
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters

####################################### VIRTUAL MACHINE #########################################################
Verify Filters of Existing asets by adding assets of different tech type - VIRTUAL MACHINE
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Virtual Machines
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    aad
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    OCS.Click on newly discovered tab under network discovery
    OCS.click on filter icon of existing assets
    OCS.Enter input in brand filters field of existing asset with different tech type       ${generated_BrandName}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Product      ${generated_product}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Department    ${generated_DepartmentNumber}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets  Clear Filters
    OCS.Choose filters for Existing asset with different tech type       Select Location     ${generated_buildingname}
    OCS.Verify that No items found with the selected filter
    OCS.Click on clear filter button link of discovered assets      Clear Filters