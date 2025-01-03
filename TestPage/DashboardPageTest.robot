*** Settings ***
Documentation   Contains all test cases of Dashboard page
Library           SeleniumLibrary
Library           ExcelLibrary
Library           String
Library           Collections
Library           BuiltIn
Library           random
Library           DateTime
Library           OperatingSystem
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
Click the option from side drawer
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   IT Performances
    Generic.Verify your current page location contains      it-performance


Verify the drawer list
    [Tags]      Time     Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Verify your current page location contains      home
    LandingPage.Verify you are on dashboard page

    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify the drawer list parameters

Verify the side options list
    [Tags]      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Verify the side option list parameters

click the option from menu
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

Verify the profile option list
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Verify the profile option list parameters

Create and verify new brand
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}

Create a new product with adding new brand
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}


Add Brand via personal detail under technology
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
#    Generic.Verify your current page location contains      brand
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.

    DashboardPage.Click on Edit address
    DashboardPage.Enter Brand Address Line one
    DashboardPage.Enter Brand address line two
    DashboardPage.Select State  Iowa
    DashboardPage.Select City     Ackley
    DashboardPage.Zip code Input    655432
#    DashboardPage.Click On Save Button
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Enter Brand New Address Line one
    DashboardPage.Enter Brand new address line two
    DashboardPage.Select State    Alaska
    DashboardPage.Select City     Aleutians East Borough
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully
    DashboardPage.Click on main Save Button
#    DashboardPage.Click On Search Bar
    DashboardPage.Verify Brand added      ${generated_BrandName}


Invite user into Aithentic
    [Tags]      Smoke       Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    ReplaceDomainAPI.Replace Domain
    DashboardPage.click on share icon of dashboard page
    DashboardPage.Enter to Email into popup
    DashboardPage.Click on Send Invite button
    Generic.Verify alertify is visible
    Generic.Fetch alert message text and compare it with        Invite sent successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.Open new window      yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       ${generate_sharetoEmail}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    DashboardPage.Click on Register button in email
    sleep       ${yop_sleep}
    Switch Window        aithentic | Register
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create random register company name
    RegisterUserPage.Click on member type
    RegisterUserPage.Select the member type      End User
    DashboardPage.Enter business email
    RegisterUserPage.Choose register user country      India   +91     9050756099
    RegisterUserPage.Select the checkbox
    RegisterUserPage.Save the register form
#    Generic.Verify your current page location contains      update-email
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       ${generate_sharetoEmail}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Tani@123
    UserAccount.Confirm the entered password    Tani@123
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generate_sharetoEmail}    Tani@123
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
    SubscriptionPage.Input text into manufacturer zip code     73301
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
    Generic.Wait the billing image loader to get hide
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated


Verify Help Center
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.click on Help center icon of dashboard page
    DashboardPage.Click on link of information center list      A Complete Guide
    sleep       ${yop_sleep}
    Switch Window       Get Started Guide - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     Get Started Guide
    Switch Window      aithentic | Management - Console
    DashboardPage.Click on link of information center list      Knowledge Base

    sleep       ${yop_sleep}
    Switch Window       Help Center Home - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     SEARCH OUR KNOWLEDGE BASE
    Switch Window       aithentic | Management - Console
    DashboardPage.Click on link of information center list      What’s New!

    sleep       ${yop_sleep}
    Switch Window       What's New! - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     What's New!
    Switch Window       aithentic | Management - Console
    DashboardPage.Click on link of Support      Customer

    sleep       ${yop_sleep}
    Switch Window       Customer Service Desk - Jira Service Management
    Generic.Verify your current page location contains      servicedesk
    Generic.Verify your current page contains this text     Customer Service Desk
    Switch Window       aithentic | Management - Console
    DashboardPage.Search any keyword of FAQ section     How do I complete my account setup?
    DashboardPage.Verify the keyword        How do I complete my account setup?
    DashboardPage.Search any keyword of FAQ section     Testing
    DashboardPage.Verify no result found with wrong FAQ

Edit Brand and address via brand under profile list
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings

    ReplaceDomainAPI.Replace Domain

    DashboardPage.Click on View Your Added Brand List
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Enter Brand Address Line one
    DashboardPage.Enter Brand address line two
    DashboardPage.Select State  Iowa
    DashboardPage.Select City     Ackley
    DashboardPage.Zip code Input    655432
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Enter Brand New Address Line one
    DashboardPage.Enter Brand new address line two
    DashboardPage.Select State    Alaska
    DashboardPage.Select City     Aleutians East Borough
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on main Save Button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    DashboardPage.click on Plus icon
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    Generic.click on the button   Edit
    DashboardPage.Click on Cross Icon
    Generic.Fetch alert message text and compare it with       Address deleted successfully
    DashboardPage.Click on Edit address
    DashboardPage.Edit Brand Address Line one
    DashboardPage.Edit Brand Address Line two
    DashboardPage.Edit State while edit address  Arizona
    DashboardPage.Edit city while edit address    Ajo
    DashboardPage.Zip code Input    988765

    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Edit New Brand Address Line one
    DashboardPage.edit New Brand Address Line two
    DashboardPage.Select New Address State    Arkansas
    DashboardPage.Edit city while edit address     Alma
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.


Deactivate Brand and address via brand under profile list
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings

    ReplaceDomainAPI.Replace Domain

    DashboardPage.Click on View Your Added Brand List
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Enter Brand Address Line one
    DashboardPage.Enter Brand address line two
    DashboardPage.Select State  Iowa
    DashboardPage.Select City     Ackley
    DashboardPage.Zip code Input    655432
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Enter Brand New Address Line one
    DashboardPage.Enter Brand new address line two
    DashboardPage.Select State    Alaska
    DashboardPage.Select City     Aleutians East Borough
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on main Save Button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    DashboardPage.click on Plus icon
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    Generic.click on the button   Edit
    DashboardPage.Click on Cross Icon
    Generic.Fetch alert message text and compare it with       Address deleted successfully
    DashboardPage.Click on Edit address
    DashboardPage.Edit Brand Address Line one
    DashboardPage.Edit Brand Address Line two
    DashboardPage.Edit State while edit address  Arizona
    DashboardPage.Edit city while edit address    Ajo
    DashboardPage.Zip code Input    988765

    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Edit New Brand Address Line one
    DashboardPage.edit New Brand Address Line two
    DashboardPage.Select New Address State    Arkansas
    DashboardPage.Edit city while edit address     Alma
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    DashboardPage.Click on back to brand list link
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Deactivate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deactivated successfully

Activate Brand and address via brand under profile list
    [Tags]   Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings

    ReplaceDomainAPI.Replace Domain

    DashboardPage.Click on View Your Added Brand List
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Enter Brand Address Line one
    DashboardPage.Enter Brand address line two
    DashboardPage.Select State  Iowa
    DashboardPage.Select City     Ackley
    DashboardPage.Zip code Input    655432
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Enter Brand New Address Line one
    DashboardPage.Enter Brand new address line two
    DashboardPage.Select State    Alaska
    DashboardPage.Select City     Aleutians East Borough
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on main Save Button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    DashboardPage.click on Plus icon
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    Generic.click on the button   Edit
    DashboardPage.Click on Cross Icon
    Generic.Fetch alert message text and compare it with       Address deleted successfully
    DashboardPage.Click on Edit address
    DashboardPage.Edit Brand Address Line one
    DashboardPage.Edit Brand Address Line two
    DashboardPage.Edit State while edit address  Arizona
    DashboardPage.Edit city while edit address    Ajo
    DashboardPage.Zip code Input    988765

    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Edit New Brand Address Line one
    DashboardPage.edit New Brand Address Line two
    DashboardPage.Select New Address State    Arkansas
    DashboardPage.Edit city while edit address     Alma
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    DashboardPage.Click on back to brand list link
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Deactivate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deactivated successfully
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Activate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand activated successfully

Remove Brand and address via brand under profile list
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings

    ReplaceDomainAPI.Replace Domain

    DashboardPage.Click on View Your Added Brand List
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Enter Brand Address Line one
    DashboardPage.Enter Brand address line two
    DashboardPage.Select State  Iowa
    DashboardPage.Select City     Ackley
    DashboardPage.Zip code Input    655432
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Enter Brand New Address Line one
    DashboardPage.Enter Brand new address line two
    DashboardPage.Select State    Alaska
    DashboardPage.Select City     Aleutians East Borough
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on main Save Button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    DashboardPage.click on Plus icon
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    Generic.click on the button   Edit
    DashboardPage.Click on Cross Icon
    Generic.Fetch alert message text and compare it with       Address deleted successfully
    DashboardPage.Click on Edit address
    DashboardPage.Edit Brand Address Line one
    DashboardPage.Edit Brand Address Line two
    DashboardPage.Edit State while edit address  Arizona
    DashboardPage.Edit city while edit address    Ajo
    DashboardPage.Zip code Input    988765

    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    DashboardPage.Click on Add New Address
    DashboardPage.Edit New Brand Address Line one
    DashboardPage.edit New Brand Address Line two
    DashboardPage.Select New Address State    Arkansas
    DashboardPage.Edit city while edit address     Alma
    DashboardPage.Zip code Input    788654
    DashboardPage.Click On Save Button
    Generic.Fetch alert message text and compare it with        Address created successfully

    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      Brand Updated Successfully.
    DashboardPage.Click on back to brand list link
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Remove
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deleted successfully

Verify adding a new brand from profile listing
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    ReplaceDomainAPI.Replace Domain
    Generic.Verify your current page location contains  brand-list
#    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Add multiple brand URL as per index     1
    DashboardPage.click on Plus icon
    DashboardPage.Add multiple brand URL as per index     2
    DashboardPage.click on Plus icon
    DashboardPage.Add multiple brand URL as per index     3
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Remove
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deleted successfully

Verify Department quick_links in profile settings dropdown
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list      department-dropdown
    Generic.Verify your current page location contains       department-list
    Generic.Verify your current page contains this text    Added Departments
    DashboardPage.Get and verify the text and compare it with     Added Departments

Search By Technology Group in product list
    [Tags]      Time      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     License
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Search by technology-group        Applications
    DashboardPage.Check the value after search
    DashboardPage.Verify product added    ${generated_product}

Verify Brand quick_links in profile settings Dropdown
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand-list
    Generic.Verify your current page contains this text     Added Brands
    DashboardPage.Get and verify the text and compare it with   Added Brands

Verify Product quick_links in profile settings dropdown
    [Tags]     Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list      product-dropdown
    Generic.Verify your current page location contains       product-list
    Generic.Verify your current page contains this text    Added Products
    DashboardPage.Get and verify the text and compare it with       Added Products

Search By Brand name in product list
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     License
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Search by brand name      ${generated_BrandName}
    DashboardPage.Check the value after search
    DashboardPage.Verify product added    ${generated_product}

Verify Reports Asset Alert
    [Tags]    NT        Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology

    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        You added Asset ID      ${generated_AssetID}.
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click on cross icon of product while editing technology

    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Select edited technology lifecycle status      Active
    TechnologyPage.Click on update button of edit_technology page       Update
    TechnologyPage.Accept updated edited technology pop up     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains      technology
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        You updated Asset ID      ${generated_AssetID}.
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    Generic.Verify your current page location contains      technology
    Generic.Verify your current page contains this text     No Records
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        You deleted Asset ID      ${generated_AssetID}.
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text    Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        A new agent has been downloaded for      Linux.
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        A new agent has been downloaded for   Windows.
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        A new agent has been downloaded for       Macos.
#    DashboardPage.Click on View more dropdown under recent notifications    View More
#    DashboardPage.Verify the invisiblity of view_more button

Click and verify the count of the tabs under renewal overview by management console
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console

Click and verify the count of the tabs under renewal overview by choosing the value from the dropdown by management console
    [Tags]     Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     0
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     1
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     2
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     3
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console
    DashboardPage.Click on the first dropdown under management console
    DashboardPage.Select the first value of To dropdown of quarter     3
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     2
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console

Verify Account_overview Recent Activities Filters
    [Tags]      Smoke       Sanity     
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    RegisterUserPage.Select the option from the personal details sidebar        personal-profile
    Generic.Verify your current page location contains    personal-profile
    RegisterUserPage.Click on edit button to edit the profile details    Edit
    RegisterUserPage.Create self register first name    Test QA31280530
    RegisterUserPage.Create self register last name     Up3128
    RegisterUserPage.Save the Profile details       Save
    Generic.Fetch alert message text and compare it with    Profile saved successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        You added Asset ID      ${generated_AssetID}.
    DashboardPage.Click on the filter under recent Activities table     Asset Id        ${generated_AssetID}
    Generic.Verify your current page contains this text     Billing Details
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        You added Asset ID      ${generated_AssetID}.
    DashboardPage.Click on row of recent activities table
    Generic.Verify your current page location contains     technology-detail
    DashboardPage.Click on Back to account overview button
    DashboardPage.Reset the filters for recent activities
    PaginationPage.Check the table get load for Recent Activities
    DashboardPage.Click on the filter under recent Activities table     Actioned By        Test QA31280530 Up3128
    PaginationPage.Check the table get load for Recent Activities
    DashboardPage.Reset the filters for recent activities
    DashboardPage.Click on the filter Past under recent Activities table        Hours       Days
    DashboardPage.Click on the filter Past under recent Activities table        Days        Months
    DashboardPage.Click on the filter Past under recent Activities table        Months      Hours
    PaginationPage.Check the table get load for Recent Activities

Add and delete product from profile listing
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Remove
    DashboardPage.Select option from the pop up of product     Yes
    Generic.Fetch alert message text and compare it with      Product deleted successfully

View Predefined brand
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
    DashboardPage.Click on pre defined brand list       /n software

View Predefined product
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

    Generic.Verify your current page location contains       dashboard

    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
    DashboardPage.Click on pre defined product list       [W306MI0U247

Verifying the Renewals Overview section of Management console - End of Life
    [Tags]       Smoke       Sanity       
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

    Generic.Verify your current page location contains       dashboard

    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      End of life
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        Brand_End_of_Life
    TechnologyPage.Select parameter from technology dropdown list       Product_End_of_Life
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs         End of life
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          End of life
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

################################### Upcoming end of life ##############################################################
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs      Upcoming end of life
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        Brand_End_of_Life
    TechnologyPage.Select parameter from technology dropdown list         Product_future_end_of_life
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs         Upcoming end of life
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Upcoming end of life
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Renewals Overview section of Management console - Overdue Renewals
    [Tags]       Sanity      Smoke        
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      Overdue renewals
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        Hewlett Packard Enterprise
    TechnologyPage.Select parameter from technology dropdown list       K2P85B
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Input current Date
    TechnologyPage.Enter current or future date as renewal date    ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Refresh the existing page
    DashboardPage.Fetch the count renewals overview subtabs        Overdue renewals
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Overdue renewals
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

######################################## Upcoming renewals ##########################################################
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs      Upcoming renewals
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        Hewlett Packard Enterprise
    TechnologyPage.Select parameter from technology dropdown list       K2P85B
    TechnologyPage.Add assetID for technology lifecycle information random
#    TechnologyPage.Input current Date
    TechnologyPage.Input future Date
    TechnologyPage.Enter current or future date as renewal date        ${formatted_future_date}
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs         Upcoming renewals
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Upcoming renewals
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Renewals Overview section of Management console - Overdue contracts
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      Overdue contracts
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_3107799167
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Input current Date
    TechnologyPage.Enter current or future date as renewal date    ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs        Overdue contracts
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Overdue contracts
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

############################### Upcoming Contracts #######################################################
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs     Upcoming contracts
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_3107799167
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Input future Date
    TechnologyPage.Enter current or future date as renewal date        ${formatted_future_date}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs         Upcoming contracts
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Upcoming contracts
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Renewals Overview section of Management console - Expired warranties
    [Tags]    NT        Smoke         
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      Expired warranties
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list         Hewlett Packard Enterprise
    TechnologyPage.Select parameter from technology dropdown list       K2P85B
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Renewal Date via technology
    TechnologyPage.Input current Date
    TechnologyPage.Select warranty end date    ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains    dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs        Expired warranties
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Expired warranties
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

################################ Warranty expirations #############################################################
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs     Warranty expirations
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list         Hewlett Packard Enterprise
    TechnologyPage.Select parameter from technology dropdown list       K2P85B
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Input future Date
    TechnologyPage.Select warranty end date    ${formatted_future_date}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs         Warranty expirations
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Warranty expirations
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Renewals Overview section of Management console - Overdue certificates
    [Tags]      Smoke         
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      Overdue certificates
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list      Product_certificate
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Input current Date
    TechnologyPage.Enter current or future date as renewal date    ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs        Overdue certificates
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Overdue certificates
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

####################################### Upcoming cerificates ###################################################################

    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs     Upcoming certificates
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_certificate
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date self    05/13/2024
    TechnologyPage.Input future Date
    TechnologyPage.Enter current or future date as renewal date    ${formatted_future_date}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    DashboardPage.Click on the dropdown of quarter end under management console
    DashboardPage.Select the first value of To dropdown of quarter     4
    DashboardPage.Fetch the count renewals overview subtabs         Upcoming certificates
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Upcoming certificates
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Subscription Overview section of Management console
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll the page till    4000
    Generic.Verify your current page contains this text    Subscription Overview
    DashboardPage.Verify subscription overview should contain        Google
    DashboardPage.Fetch the count under subscription overview section of management console     Google
    DashboardPage.Set Globally the count from subscription overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    Google
    TechnologyPage.Select parameter from technology dropdown list    GAPPS
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information        Open Ended Contract
    TechnologyPage.Add payment type of technology cost information     VariablePayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       05/06/2024
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll the page till    4000
    Generic.Verify your current page contains this text    Subscription Overview
    DashboardPage.Verify subscription overview should contain        Google
    DashboardPage.Fetch the count under subscription overview section of management console     Google
    DashboardPage.Compare the counts of subscription overview
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll the page till    5000
    Generic.Verify your current page contains this text   Subscription Overview
    DashboardPage.Verify subscription overview should contain        Microsoft Corporation
    DashboardPage.Fetch the count under subscription overview section of management console     Microsoft Corporation
    DashboardPage.Set Globally the count from subscription overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list    Microsoft Corporation
    TechnologyPage.Select parameter from technology dropdown list    M365
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information        Open Ended Contract
    TechnologyPage.Add payment type of technology cost information     VariablePayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       05/06/2024
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll the page till    4000
    Generic.Verify your current page contains this text    Subscription Overview
    DashboardPage.Verify subscription overview should contain        Microsoft Corporation
    DashboardPage.Fetch the count under subscription overview section of management console     Microsoft Corporation
    DashboardPage.Compare the counts of subscription overview
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console
    Generic.Scroll Window To End
    DashboardPage.See all subscription connector
    Generic.Verify your current page contains this text     Renewals overview details
    DashboardPage.Click on Download-icon of subscription overview
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    renewals-overview-details
    Generic.Verify your current page location contains    .pdf
    Switch Window       Main
    Generic.Verify your current page location contains    management-console
    DashboardPage.Click dropdown of subscription overview tables        Google
    DashboardPage.Click on arrow icon inside subscription overview tables    Google
    Generic.Verify your current page location contains    technology
    Generic.Verify your current page contains this text     Technology
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains     management-console
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll Window To End
    DashboardPage.See all subscription connector
    Generic.Verify your current page contains this text     Renewals overview details
    DashboardPage.Click dropdown of subscription overview tables        Google
    DashboardPage.Click on arrow icon inside subscription overview tables    Microsoft Corporation
    Generic.Verify your current page location contains    technology
    Generic.Verify your current page contains this text     Technology
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console
    DashboardPage.wait until renewal overview section is load
    Generic.Scroll Window To End
    DashboardPage.See all subscription connector
    Generic.Verify your current page contains this text     Renewals overview details
    DashboardPage.Click on done button of subscription overview    Done

Management Console - Quarters filter dropdown
    [Tags]    NT
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
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
    SubscriptionPage.Select card type university
    SubscriptionPage.Enter card account number    000123456789
    SubscriptionPage.Enter card routing number      110000000
    SubscriptionPage.Enter account holder name    Paramdeep Singh
    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox     yes
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox     no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Verify your current page contains this element
    DashboardPage.Click on 'click here to add' link
    Generic.Verify your current page location contains      company-info
    DashboardPage.Enter dates in Quarter        1       03/31/2024
    Generic.Fetch alert message text and compare it with        Company financial data updated successfully
    DashboardPage.Enter dates in Quarter        2       06/30/2024
    Generic.Fetch alert message text and compare it with        Company financial data updated successfully
    DashboardPage.Enter dates in Quarter        3       09/30/2024
    Generic.Fetch alert message text and compare it with        Company financial data updated successfully
    DashboardPage.Enter Financial Year end date
    Generic.Fetch alert message text and compare it with        Company financial data updated successfully
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Verify your current page not contains this element

Change password and login with new password
    [Tags]      Sanity      smoke
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Test@123
    UserAccount.Confirm the entered password   Test@123
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generate_register_Email}    Test@123
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
    SubscriptionPage.Select card type university
    SubscriptionPage.Enter card account number    000123456789
    SubscriptionPage.Enter card routing number      110000000
    SubscriptionPage.Enter account holder name    Paramdeep Singh
    SubscriptionPage.Check the authorization checkbox
    sleep       ${search_sleep}
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox     yes
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox     no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.Click on change password link under security
    Generic.Fetch alert message text and compare it with       OTP sent successfully
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Change Password
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get security key of password    Here is your authorized OTP access code:
    sleep       ${yop_sleep}
    Switch Window   aithentic | Security
    Generic.Verify your current page location contains     security
    DashboardPage.Enter the security key    ${passcode}
    DashboardPage.Enter input in the new password field     Test@1234
    DashboardPage.Enter input in the confirm password field     Test@1234
    DashboardPage.Click on save button under change password
    Generic.Fetch alert message text and compare it with       Password changed successfully
    DashboardPage.click on the authentication tab under security
    Generic.Verify your current page location contains     security
    DashboardPage.Click on the checkboxes under auhtentication tab
    Generic.Fetch alert message text and compare it with       Two factor updated successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     ${generate_register_Email}   Test@1234
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.Click on change password link under security
    Generic.Fetch alert message text and compare it with       OTP sent successfully
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Change Password
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get security key of password    Here is your authorized OTP access code:
    sleep       ${yop_sleep}
    Switch Window   aithentic | Security
    DashboardPage.Enter the security key     ${passcode}
    sleep   ${search_sleep}
    DashboardPage.Enter input in the new password field     Test@123
    DashboardPage.Enter input in the confirm password field     Test@123
    DashboardPage.Click on save button under change password
    Generic.Fetch alert message text and compare it with       Password changed successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Refresh the existing page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     ${generate_register_Email}   Test@123
    Generic.Verify your current page location contains      dashboard

Enter password more than the limit of the password while register
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Test@123Test@123Test@123Test@123Test@123
    UserAccount.Click on term and condition checkbox
    DashboardPage.Wait for the visibility of the validation of password field under create account

Enter password less than the limit of the password while register
    [Tags]      Sanity
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Test@12
    UserAccount.Click on term and condition checkbox
    DashboardPage.Wait for the visibility of the validation of password field under create account

Enter password with 32 characters while register
    [Tags]    NT
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Paramdeep@112Paramdeep@11234
    UserAccount.Confirm the entered password   Paramdeep@112Paramdeep@11234
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generate_register_Email}   Paramdeep@112Paramdeep@11234
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
#--------------------------------------SUBSCRIPTION------------------------------------------------------------
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
#-------------------------------------------BILLING-----------------------------------------------------
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Click on same billing address checkbox
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

Download invoice pdf
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    BillingPage.Click on the invoice history tab under billing
    BillingPage.Click on the pdf option under the table of invoice
    Generic.Verify your current page location contains     invoice-pdf
    Generic.Verify your current page contains this text     Client ID:
    Generic.click on the button     Download Pdf Version
    Sleep    ${Yop_Sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    .pdf

Click and verify view manage member under billing
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       chirag@dmts.fr.nf    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    BillingPage.Get the value of team member under billing
    Generic.click on the tab        Manage Members
    Generic.Verify your current page location contains      memberslist
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    TechnologyPage.verify Text from Assignment Information       ${tam_member_billing_int}       ${total_data_count}

Click and verify on manage subscription under billing
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       chirag@dmts.fr.nf    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    BillingPage.Get the value of manage subscription under billing
    Generic.click on the tab       Manage Subscription
    Generic.Verify your current page location contains     subscription
    Generic.click on the button     Change Plan
    BillingPage.Get the value of manage subscription under subscription page
    TechnologyPage.verify Text from Assignment Information       ${subscription_plan}       ${plan_name}

Compose Message reply and delete that message
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     dashboard
    Generic.Click on the profile name
     Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.click on the authentication tab under security
    Generic.Verify your current page location contains     security
    DashboardPage.Click on the checkboxes under auhtentication tab
    Generic.Fetch alert message text and compare it with       Two factor updated successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter     Compose
    Generic.Verify your current page location contains      message
    DashboardPage.Enter input in the recipient list field under compose message    ${generated_TMFname}
    DashboardPage.Enter input in the message status field under compose message     Public
    DashboardPage.Enter text in the subject field under compose message
    DashboardPage.Enter text in the client message field under compose message
    Generic.click on the button     Send
    Generic.Fetch alert message text and compare it with       Message sent successfully
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Sent
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under sent serach bar      ${generated_subject}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  ${generated_TMbusinessEmail}    Test@456
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep   ${search_sleep}
    DashboardPage.Get the text of the recent notification        New message received from Milan Johar
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Inbox
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under inbox serach bar       ${generated_subject}
    Dashboardpage.Click on three dots
    DashboardPage.Click on the reply option to reply the message
    Generic.Verify your current page location contains      reply
    DashboardPage.Enter input in the reply back page
    Generic.click on the button     Send
    Generic.Fetch alert message text and compare it with       Message sent successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form   debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep   ${search_sleep}
    DashboardPage.Get the text of the recent notification        New message received from ${generated_TMFname} ${generated_Tmlname}
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Inbox
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under inbox serach bar       ${generated_reply}
    DashboardPage.Search by subject under inbox serach bar       ${generated_TMFname}
    DashboardPage.Click on the flag icon to flag the message
    Generic.Fetch alert message text and compare it with       Message flagged successfully
    Dashboardpage.Click on three dots
    DashboardPage.Click on the remove option to remove the message
    Generic.Select parameter        Yes
    Generic.Fetch alert message text and compare it with       Message removed successfully

No data in the charts of the management console page
    [Tags]      Sanity
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
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
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
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
    SubscriptionPage.Click on same billing address checkbox
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
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Verify your current page contains this element
    DashboardPage.Verify that Management console page contains No data chart        budget-overview-main
    DashboardPage.Click on No key Data under chart          budget-overview-main
    Generic.Verify your current page location contains     technology-list
    DashboardPage.Remove the Download Agent pop-up
    DashboardPage.Verify and click on the finance filter under technology
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Cost Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Expense Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Budget
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify that Management console page contains No data chart        subscription-overview-main
    DashboardPage.Click on No key Data under chart          subscription-overview-main
    Generic.Verify your current page location contains     technology-list
    DashboardPage.Verify and click on the finance filter under technology
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Cost Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Expense Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Budget
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify that Management console page contains No data chart        contracts-licenses-main
    DashboardPage.Click on No key Data under chart          contracts-licenses-main
    Generic.Verify your current page location contains     technology-list
    DashboardPage.Verify and click on the finance filter under technology
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Cost Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Expense Type
    DashboardPage.Verify all the checkmark boxes of finance filter are auto-check       Budget

Renewals overview drilldown - Add column Host name
    [Tags]    NT        
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs      Overdue renewals
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Select parameter from technology dropdown list      Product_renewal_overview
    TechnologyPage.Add host name for technology group information for hardware random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Input current Date
    TechnologyPage.Enter current or future date as renewal date    ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add budget payment of technology cost information       11000
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Fetch the count renewals overview subtabs        Overdue renewals
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Overdue renewals
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    Generic.Verify your current page contains this text   ${result}

Message Side bar filters
    [Tags]     time    smoke      rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    MessagePage.Click on select partner filter from message side bar list
    MessagePage.Select the filter from partner      End User
#    MemberPage.Wait till message listing appear
    MemberPage.Verify the pagination listing and execute the count verification code
#    MessagePage.Fetch the total count of message listing after selecting filter
#    MessagePage.Set pagination to max for inbox list in message
#    MemberPage.Wait till message listing appear
#    PaginationPage.Click on the pagination dropdown     inbox
#    PaginationPage.Select the value from the pagination drop down count    500
#    PaginationPage.Check Pagination     inbox

    MessagePage.Fetch the country from location filter and click     Partner Type         End User    End User

    Generic.Click on the reset filters link
    MessagePage.Select the filter from partner    Manufacturer
#    MemberPage.Wait till message listing appear
    MemberPage.Verify the pagination listing and execute the count verification code
#    MessagePage.Fetch the total count of message listing after selecting filter
#    MessagePage.Set pagination to max for inbox list in message
    MessagePage.Fetch the country from location filter and click     Partner Type         Manufacturer    Manufacturer
    Generic.Click on the reset filters link
    Generic.Refresh the existing page
    ReportsPage.Fetch the total count
    MessagePage.Click on select partner filter from message side bar list
    MessagePage.Select the filter from partner      All Partners
    PaginationPage.Fetch the total count for filter only
    MessagePage.Compare the total count after selecting filter

Click on the status filter under brand via profile list
    [Tags]    NT          
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     jasdeep@15963.fr.nf     Paramdeep@112
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains     brand-list
    DashboardPage.Click on the status filter under Brand via profile
    DashboardPage.Select the option from the filters under brand via profile     0
    DashboardPage.Click on the added brands heading
    DashboardPage.Get the text of selected status filter under brand via profile       Active
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    TeamMemberPage.Fetch the country from team member filter and click       Status     ${New_status_Brand}        ${New_status_Brand}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains     brand-list
    DashboardPage.Click on the status filter under Brand via profile
    DashboardPage.Select the option from the filters under brand via profile     1
    DashboardPage.Click on the added brands heading
    DashboardPage.Get the text of selected status filter under brand via profile       Inactive
    Generic.Wait until table get load
    PaginationPage.Check filter Pagination of Recent Activites
#   -- PaginationPage.Click on the pagination dropdown    brand
#   -- PaginationPage.Select the value from the pagination drop down count     500
#   -- PaginationPage.Fetch the selected value of the dropdown     brand
    PaginationPage.Fetch the total count
    TeamMemberPage.Fetch the country from team member filter and click       Status     ${New_status_Brand}        ${New_status_Brand}

Verify Team member in permissions according to user roles
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    RegisterUserPage.Select the option from the personal details sidebar        member
    DashboardPage.Choose permission tab under members profile
    Generic.Verify your current page location contains      member
    DashboardPage.Pick User role of the member      Account Manager
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     permission-read
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Pick User role of the member      Account Manager
    DashboardPage.Select the permission of member according to user role        permission-read
    DashboardPage.Verify that user contains read-permissions    Add-Subscription-Deleted
    DashboardPage.Pick User role of the member      Account Manager
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Change-Plan
    DashboardPage.Pick User role of the member      Admin
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Pick User role of the member      Admin
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Add-Subscription-Deleted
    DashboardPage.Pick User role of the member      Admin
    DashboardPage.Pick User role of the member      Asset Manager
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     permission-read
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Select the permission of member according to user role        permission-read
    DashboardPage.Verify that user contains read-permissions        Export-Technology-Details
    DashboardPage.Select the permission of member according to user role        permission-read
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Add-Subscription-Deleted
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Pick User role of the member      Asset Reader
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Add-Subscription-Deleted
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Pick User role of the member      Asset User
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Change-Plan
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Pick User role of the member      CSPM
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Verify user role have permissions     no-permission
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Edit-Personal-Profile       Manage-Personal-Profile
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Verify that user contains permissions     Manage-Subscription     Change-Plan
    DashboardPage.Select the permission of member according to user role        no-permission
    DashboardPage.Pick User role of the member      Subscriber
    DashboardPage.Verify user role have permissions     permission-write
    DashboardPage.Select the permission of member according to user role        permission-write
    DashboardPage.Verify that user contains permissions         Manage-Subscription       Change-Plan
    DashboardPage.Select the permission of member according to user role        permission-write

Click on the product filters via profile list
    [Tags]      time      smoke       rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     deepparam112@mail-mario.fr.nf     Paramdeep@112
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains     product
    DashboardPage.Click on the status filter under product via profile

    DashboardPage.Select the option from the filters under product via profile      0

    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected status filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click       Status      ${New_product_Status}         ${New_product_Status}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains     product
    DashboardPage.Click on the status filter under product via profile
    DashboardPage.Select the option from the filters under product via profile      1
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected status filter under product via profile
    Generic.Wait until table get load for filters
#    PaginationPage.Check filter Pagination of Recent Activites
#    PaginationPage.Click on the pagination dropdown    products
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown      products
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click       Status     ${New_product_Status}        ${New_product_Status}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the brand filter under product via profile
    DashboardPage.Select the option from the brand filter under product via profile     2
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected brand filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click        Brand Name       ${selected_Brand}        ${selected_Brand}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the brand filter under product via profile
    DashboardPage.Select the option from the brand filter under product via profile     3
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected brand filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click        Brand Name       ${selected_Brand}        ${selected_Brand}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the brand filter under product via profile
    DashboardPage.Select the option from the brand filter under product via profile    5
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected brand filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click        Brand Name      ${selected_Brand}        ${selected_Brand}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the technology group filter under product via profile
    DashboardPage.Select the option from the technology group filter under product via profile      1
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected technology group filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click         Technology Group        ${New_product_tech_group}        ${New_product_tech_group}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the technology group filter under product via profile
    DashboardPage.Select the option from the technology group filter under product via profile      3
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected technology group filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Check filter Pagination of Recent Activites
#     PaginationPage.Click on the pagination dropdown    products
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown      products
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Set pagination to max
    TeamMemberPage.Fetch the country from team member filter and click         Technology Group        ${New_product_tech_group}        ${New_product_tech_group}
    DashboardPage.Click on the reset button under product
    DashboardPage.Click on the technology group filter under product via profile
    DashboardPage.Select the option from the technology group filter under product via profile      4
    DashboardPage.Click on the added products heading
    DashboardPage.Get the text of selected technology group filter under product via profile
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    TeamMemberPage.Fetch the country from team member filter and click         Technology Group        ${New_product_tech_group}        ${New_product_tech_group}

Suspend the account while the contract active
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    SubscriptionPage.Click on the suspend my account button link under billing details
    DashboardPage.Get the text of the pop up while suspending the account when contract is active
    Generic.click on the button     Okay, I will manage Contracts first
    Generic.Verify your current page location contains      contracts-list
    Generic.Wait until table get load

Click on the usage analytics tab under management console
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Select parameter         Usage Analytics
    Generic.Verify your current page location contains     usage-analytics

Verify Notification Mark all as read
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
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    Generic.select the option from the side menu    Dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    TechnologyPage.Click on the asset alert option under notifications
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     You updated Asset ID      ${generated_AssetID}.
    TechnologyPage.Get the text of the recent notification of added assets      You updated Asset ID ${generated_AssetID}.
    DashboardPage.Analyse text is bold before click on Mark all as read         You updated Asset ID      ${generated_AssetID}
    DashboardPage.Click on Mark all as read option
    DashboardPage.Verify text is normal after clicking Mark all as read         You added Asset ID      ${generated_AssetID}
    DashboardPage.Verify text is normal after clicking Mark all as read         You updated Asset ID      ${generated_AssetID}
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Linux
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    DashboardPage.Click on alerts tabs      system-alert
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     A new agent has been downloaded for     Linux.
    DashboardPage.Get and verify the text from system notification       A new agent has been downloaded for Linux.
    DashboardPage.Analyse text is bold before click on Mark all as read         A new agent has been downloaded for     Linux
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    Windows
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    DashboardPage.Click on alerts tabs      system-alert
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     A new agent has been downloaded for     Windows.
    DashboardPage.Get and verify the text from system notification       A new agent has been downloaded for Windows.
    DashboardPage.Analyse text is bold before click on Mark all as read         A new agent has been downloaded for     Windows
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains      discovery-assets
    DashboardPage.Click on download agent button to download        Download Agent
    OCS.Choose options to install from download agent button    single
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download
    Generic.select the option from the side menu    Dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    DashboardPage.Click on alerts tabs      system-alert
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     A new agent has been downloaded for     Macos.
    DashboardPage.Get and verify the text from system notification       A new agent has been downloaded for Macos.
    DashboardPage.Analyse text is bold before click on Mark all as read         A new agent has been downloaded for     Macos
    DashboardPage.Click on Mark all as read option
    DashboardPage.Verify text is normal after clicking Mark all as read         A new agent has been downloaded for      Macos
    DashboardPage.Verify text is normal after clicking Mark all as read         A new agent has been downloaded for      Windows
    DashboardPage.Verify text is normal after clicking Mark all as read         A new agent has been downloaded for      Linux
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    ReplaceDomainAPI.Replace Domain
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     ${generate_BusinessName}
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}
    Generic.select the option from the side menu    Smart Share
    Generic.Verify your current page location contains      contract
    ContractsPage.Click on create new contract button
    sleep   ${search_sleep}
    ContractsPage.Select type of contract     Dynamic Smart Share
    Generic.Verify your current page location contains      generate-contract
    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Test qa Up50260220 - 21 - 2
    ContractsPage.Enter contract permission       Read/Write
    Generic.Fetch Current Date
    ContractsPage.Select contract start date        ${current_date}
    ContractsPage.Select contract end date      12/12/2028
    ContractsPage.Select contract function       Dynamic
    ContractsPage.Click preview selection button on contact
    ContractsPage.Enter contract description comment      Enter comment for contract description.
    ContractsPage.Enter contract name     ${generate_PersonName}
    ContractsPage.Select the checkboxes
    ContractsPage.Save create contract button
    ContractsPage.Save contract modal     Create Contract
    Generic.Fetch alert message text and compare it with        Contract created successfully
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract ID from the row
    Generic.select the option from the side menu    Dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    DashboardPage.Click on alerts tabs      contract-alert
    DashboardPage.Get and verify the text from Contract notification        Contract ${fetch_contract_ID} with ${generate_BusinessName} is pending.
    DashboardPage.Analyse text is bold before click on Mark all as read         Contract ${fetch_contract_ID} with      ${generate_BusinessName} is pending
    DashboardPage.Click on Mark all as read option
    DashboardPage.Verify text is normal after clicking Mark all as read         Contract ${fetch_contract_ID} with      ${generate_BusinessName} is pending

Verify all the validations of Add and Edit product page
    [Tags]      Negative
    Generic.click on the tab    	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Save added product details
    DashboardPage.Fetch the all validation message of add product page
    DashboardPage.Create random productName
    sleep   ${search_sleep}
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on three dots of Department list
    DashboardPage.Click on the edit option under three dots of product      Edit
    DashboardPage.Verify the visibility of the product name under edit product pop up
    DashboardPage.Click on the brand cross icon under edit product
    LoginPage.Clear the element text of field under login page      productName
    DashboardPage.Verify the visibility of enter product placeholder
    DashboardPage.Click on the save and cancel button under edit product       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page      Please enter Product Name
    DashboardPage.Create random productName while edit
    DashboardPage.Select brand from list while edit      QABrand555
    DashboardPage.Add product description via link
    DashboardPage.Add product feature while edit
    DashboardPage.Click on the cross icon of tech type under product          TechTypes
    DashboardPage.Click on the save and cancel button under edit product       Save
    sleep  ${search_sleep}
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page       Please Select Technology Type

Verfying all field validations of Add Brand page
    [Tags]    Negative         
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Save added brand details
    DashboardPage.Verify the validation message of Brand name field
    DashboardPage.Compare and verify the validation messages      ${Brandname_validation}     Please Enter Brand Name
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}      Please enter Business URL
    DashboardPage.Verify the validation message of Brand manufacturer country field
    DashboardPage.Compare and verify the validation messages        ${brandCountry_validation}       Please Select Country
################################################# INPUT INVALID DATA ####################################################################################
    DashboardPage.Add Invalid business manufacturer URL         invalidBrandURL
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}       Please enter valid Business URL
    DashboardPage.Add invalid brand manufacturer country            475638InvalidCountry
    DashboardPage.Cancel Brand details
    Generic.Verify your current page location contains     brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country
    DashboardPage.Cancel the added new address
    DashboardPage.Click on Add New Address
    DashboardPage.Enter the country in the new address when add brand   addressCountry   United States
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country

Verfying all field validations of Edit Brand page
    [Tags]    Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    DashboardPage.Edit the URL of edit brand page
    Generic.click on the button   Update
    Generic.Fetch alert message text and compare it with      domain is required.
    DashboardPage.Click on Add New Address
    DashboardPage.Enter the country in the new address when add brand   addressCountry   United States
    DashboardPage.Clear the field of country in add adddress of brand       qa-country
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country
    DashboardPage.Close the Address pop-up of brand
    DashboardPage.Clear the data of the field           brandName
    DashboardPage.Verify the validation of edit brand name
    DashboardPage.Compare and verify the validation messages      ${editbrand_name1}     Please Enter Brand Name
    DashboardPage.Clear the data of brand manufacturer country
    DashboardPage.Verify the validation message of Brand manufacturer country field
    DashboardPage.Compare and verify the validation messages        ${brandCountry_validation}      Please Select Country

Verify user should not able to Edit Product having Technology created
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list      ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on three dots of product list
    DashboardPage.Click on the edit option under three dots of product      Edit
    DashboardPage.Verify the warning is visible when edit product    Edit Product
    DashboardPage.Compare the warning of product when Edited or removed    ${product_warning_text}     ${generated_product} is now shareable with other companies and cannot be edited or removed.

Verify user should not able to Deactivate Product having Technology created
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list      ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on three dots of product list
    DashboardPage.Choose option from product list three-dots      deactivate
    DashboardPage.Verify the warning is visible when deactivate or remove product    Deactivate Product
    DashboardPage.Compare the warning of product when Edited or removed    ${product_warning_text}     ${generated_product} is now shareable with other companies and cannot be edited or removed.

Verify user should not able to Remove Product having Technology created
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list      ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on three dots of product list
    DashboardPage.Choose option from product list three-dots      remove
    DashboardPage.Verify the warning is visible when deactivate or remove product    Remove Product
    DashboardPage.Compare the warning of product when Edited or removed    ${product_warning_text}     ${generated_product} is now shareable with other companies and cannot be edited or removed.

Verify user should not able to Deactivate Brand having Product created
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Deactivate
    DashboardPage.Verify the warning is visible when deactivate or remove brand      Deactivate Brand
    DashboardPage.Compare the warning of product when Edited or removed    ${Brand_warning_text}        Cannot deactivate ${generated_BrandName} as it is in use

Verify user should not able to Remove Brand having Product created
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Remove
    DashboardPage.Verify the warning is visible when deactivate or remove brand      Remove Brand
    DashboardPage.Compare the warning of product when Edited or removed    ${Brand_warning_text}     Cannot remove ${generated_BrandName} as it is in use.


Verify user should not able to Edit Brand having Product created
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Verify Brand added      ${generated_BrandName}
    DashboardPage.Click on three dots
    Generic.Select simple option from profile list   Edit
    Generic.Verify your current page location contains      brand
    DashboardPage.Verify update button is not visible on edit brand page

Verify all the character validations of add brand page
    [Tags]   Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Save added brand details
    DashboardPage.Verify the validation message of Brand name field
    DashboardPage.Compare and verify the validation messages      ${Brandname_validation}     Please Enter Brand Name
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}      Please enter Business URL
    DashboardPage.Verify the validation message of Brand manufacturer country field
    DashboardPage.Compare and verify the validation messages        ${brandCountry_validation}       Please Select Country
################################################# INPUT INVALID DATA ####################################################################################
    DashboardPage.Add Invalid business manufacturer URL         invalidBrandURL
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}       Please enter valid Business URL
    DashboardPage.Add invalid brand manufacturer country            475638InvalidCountry
    DashboardPage.Cancel Brand details
    Generic.Verify your current page location contains     brand-list
    DashboardPage.Click add brand button
    DashboardPage.Add self created brand name           Brandmilan
    DashboardPage.Add self business manufacturer URL        Brandmilan.com
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Name already exists.
    LoginPage.Clear The Element Text for phone number      ${add_brand_mfc_URL}
    LoginPage.Clear the element text of field under login page      Name
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country
    DashboardPage.Cancel the added new address
    DashboardPage.Click on Add New Address
    DashboardPage.Enter the country in the new address when add brand   addressCountry    United States Minor Outlying Islands
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country

Share invite to the registered user
    [Tags]    Negative
     Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.click on share icon of dashboard page
    DashboardPage.Click on Send Invite button
    DashboardPage.Fetch the validation of to field under share aithentic        Please enter their business email
    DashboardPage.Enter to Static Email into popup of share aithentic       jasdeep@15963.fr.nf
    DashboardPage.Click on Send Invite button
    Generic.Fetch alert message text and compare it with containing text        Email Address already exists.

Verify all the validations of Personal Details page
    [Tags]       Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    RegisterUserPage.Select the option from the personal details sidebar        personal-profile
    Generic.Verify your current page location contains    personal-profile
    RegisterUserPage.Click on edit button to edit the profile details    Edit
    LoginPage.Clear the element text of field under login page    FirstName
    LoginPage.Clear the element text of field under login page     LastName
    LoginPage.Clear the element text of field under login page     Email
    LoginPage.Clear The Element Text for phone number     ${profile_phone}
    sleep       ${search_sleep}
    RegisterUserPage.Save the Profile details       Save
    DashboardPage.Fetch the all validation message on Personal Details page
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create self register invalid business name under Personal Details     deepparam112@mail-mario.fr.nf
    RegisterUserPage.Create self register invalid phone number under Personal Details          98745612
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page        Please enter a valid mobile Number
    LoginPage.Clear The Element Text for phone number     ${profile_phone}
    RegisterUserPage.Create self register invalid phone number under Personal Details         987456123214
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page        Please enter a valid mobile Number
    LoginPage.Clear The Element Text for phone number     ${profile_phone}
    RegisterUserPage.Create self register invalid phone number under Personal Details      9874561232
    LoginPage.Clear the element text of field under login page     Email
    RegisterUserPage.Create self register invalid business name under Personal Details     samuel@yopmail.net
    RegisterUserPage.Save the Profile details       Save
    DashboardPage.Get the text of the pop up after changing email in the personal detail
    sleep       ${search_sleep}
    RegisterUserPage.Verify the email change warning pop-up and choose option       red
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Clear the element text of field under login page     Email
    RegisterUserPage.Create self register invalid business name under Personal Details     samuel@yopmail
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page       Please enter valid Email
    LoginPage.Clear the element text of field under login page     Email
    RegisterUserPage.Create self register invalid business name under Personal Details     samuelyopmail.net
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page       Please enter valid Email
    LoginPage.Clear the element text of field under login page     Email
    RegisterUserPage.Create self register invalid business name under Personal Details     deepparam112@mail-mario.fr.nf
    DashboardPage.Click on the cross icon of Department and Location under Personal Details     Department
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page      Please enter Department
    DashboardPage.Select the department and Location from dropdown      Department       Customer Support
    DashboardPage.Click on the cross icon of Department and Location under Personal Details     LocationType
    RegisterUserPage.Save the Profile details       Save
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page      Please select Location

Verify all the validations of Company fiancial information under organisation
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    I_iconPage.Choose tabs under organization        company
    Generic.Verify your current page location contains     organization
    DashboardPage.visibility of the I-icon under company information
    DashboardPage.Clear the text of the field under company information     q1
    DashboardPage.Click on the No of employees field
    Generic.Fetch alert message text and compare it with       Q1End Date Required
    DashboardPage.Enter text in the finacial year 1 date field      q1      Test
    DashboardPage.Click on the No of employees field
    Generic.Fetch And Verify error toast messages    Please use valid date format.
    DashboardPage.Clear the text of the field under company information     q2
    DashboardPage.Click on the No of employees field
    Generic.Fetch And Verify error toast messages    Please use valid date format.
    Generic.Fetch And Verify error toast messages       Q2End Date Required
    DashboardPage.Enter text in the finacial year 1 date field      q2      Test
    DashboardPage.Click on the No of employees field
    Generic.Fetch And Verify error toast messages    Please use valid date format.
    DashboardPage.Clear the text of the field under company information     q3
    DashboardPage.Click on the No of employees field
    Generic.Fetch And Verify error toast messages   Please use valid date format.
    Generic.Fetch And Verify error toast messages       Q3End Date Required
    DashboardPage.Enter text in the finacial year 1 date field      q3      Test
    DashboardPage.Click on the No of employees field
    Generic.Fetch And Verify error toast messages    Please use valid date format.


Verify all the validations of Add Brand asset wizard
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Create Brands
    Generic.click on the button     Next
    Generic.click on the button    Add Brand
    DashboardPage.Save added brand details
    DashboardPage.Verify the validation message of Brand name field
    DashboardPage.Compare and verify the validation messages      ${Brandname_validation}     Please Enter Brand Name
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}      Please enter Business URL
    DashboardPage.Verify the validation message of Brand manufacturer country field
    DashboardPage.Compare and verify the validation messages        ${brandCountry_validation}       Please Select Country
################################################# INPUT INVALID DATA ####################################################################################
    DashboardPage.Add Invalid business manufacturer URL         invalidBrandURL
    DashboardPage.Verify the validation message of Brand manufacturer URL field
    DashboardPage.Compare and verify the validation messages        ${brandURL_validation}       Please enter valid Business URL
    DashboardPage.Add invalid brand manufacturer country            475638InvalidCountry
    DashboardPage.Cancel Brand details
    Generic.Verify your current page location contains     brand-list
    Generic.click on the button    Add Brand
    DashboardPage.Add self created brand name           Brandmilan
    DashboardPage.Add self business manufacturer URL        Brandmilan.com
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Name already exists.
    LoginPage.Clear The Element Text for phone number      ${add_brand_mfc_URL}
    LoginPage.Clear the element text of field under login page      Name
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on Edit address
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country
    DashboardPage.Cancel the added new address
    DashboardPage.Click on Add New Address
    DashboardPage.Enter the country in the new address when add brand   addressCountry    United States Minor Outlying Islands
    DashboardPage.Clear the field of country in add adddress of brand       qa-country-name
    DashboardPage.Verify the validation message of Brand_country field when add new address
    DashboardPage.Compare and verify the validation messages        ${Country_validation1}           Please Select Country


Verify all the validations of Add Product under asset wizard
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Create Products
    Generic.click on the button     Next
    Generic.click on the tab        Add Product
    Bulk_Import_ExportPage.Save added product details technology bulk import
    DashboardPage.Fetch the all validation message of add product page under asset wizard
    DashboardPage.Create self productName       Product_bulk_import
    DashboardPage.Add product brand name       QABrand555
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    Bulk_Import_ExportPage.Select product status technology bulk import   Active
    Bulk_Import_ExportPage.Save added product details technology bulk import
    Generic.Fetch alert message text and compare it with        Product name already exists.
    DashboardPage.Add invalid brand under product asset wizard      475638InvalidBrand

Hover over Filter Icon features
    [Tags]        Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains       dashboard
    LandingPage.Verify you are on dashboard page
    DashboardPage.Hover over reset filter icon of management console
    DashboardPage.Compare the text of Icon      ${title_locator}        Reset Filter
    DashboardPage.Hover over other icons of mangement console       QtrActive
    DashboardPage.Compare the text of Icon      ${title_locator}      Quarter Filter
    DashboardPage.Hover over other icons of mangement console       DateRInactive
    DashboardPage.Compare the text of Icon      ${title_locator}        Date Filter

Verify all the validations of Product Bulk import under asset wizard
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Create Products
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on the product bulk import option under asset wizard via technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Products
    Generic.Verify your current page location contains      add-product-grid
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Status, Brand is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field     ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Product Name, Status is missing. Please fill in required data., Brand is invalid
    Bulk_Import_ExportPage.Clear the text of the field      Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Name, Brand is missing. Please fill in required data.
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Description, Features is missing.
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Technology Type, Technology Group is missing. Please fill in required data., Brand is invalid
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the static value in the product name column in bulk_import     ProductName         Product_bulk_import
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_import       Brand    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Product_bulk_import already exists

Verify all the validations of Compose Message
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter     Compose
    Generic.Verify your current page location contains      message
    Generic.click on the button     Send
    DashboardPage.Fetch the all validation message after click on the send button of compose message
    DashboardPage.Add invalid text in the recipient field under compose message     Invalid45
    DashboardPage.Enter invalid input in the status field under compose message     Text
    DashboardPage.Enter 101 text in the subject field under compose message
    DashboardPage.Wait for the invisibility of the 0 character remaining text
    LoginPage.Clear the element text of field under login page      ClientMessageSubject
    DashboardPage.Enter text in the subject field under compose message
    DashboardPage.Enter 101 characters in the client message field under compose message
    DashboardPage.Wait for the invisibility of the 0 character remaining text

Verify all the validations of Reply message
    [Tags]          Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     dashboard
    Generic.Click on the profile name
     Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.click on the authentication tab under security
    Generic.Verify your current page location contains     security
    DashboardPage.Click on the checkboxes under auhtentication tab
    Generic.Fetch alert message text and compare it with       Two factor updated successfully
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter     Compose
    Generic.Verify your current page location contains      message
    DashboardPage.Enter input in the recipient list field under compose message    ${generated_TMFname}
    DashboardPage.Enter input in the message status field under compose message     Public
    DashboardPage.Enter text in the subject field under compose message
    DashboardPage.Enter text in the client message field under compose message
    Generic.click on the button     Send
    Generic.Fetch alert message text and compare it with       Message sent successfully
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Sent
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under sent serach bar      ${generated_subject}
    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  ${generated_TMbusinessEmail}    Test@456
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep   ${search_sleep}
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Inbox
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under inbox serach bar       ${generated_subject}
    Dashboardpage.Click on three dots
    DashboardPage.Click on the reply option to reply the message
    Generic.Verify your current page location contains      reply
    DashboardPage.click on the cross icon of To field and asset id under reply message       Select Recipients
    DashboardPage.click on the cross icon of status field under reply message
    Generic.click on the button     Send
    DashboardPage.Fetch the all validation message after click on the send button of reply message
    DashboardPage.Add invalid text in the to field under reply compose      Invalid45
    DashboardPage.Enter invalid input in the status field under reply message     Text
    DashboardPage.Enter 301 charcters under message body of reply message
    DashboardPage.Wait for the invisibility of the 0 character remaining text
#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F