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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   IT Performances
    Generic.Verify your current page location contains      it-performance


Verify the drawer list
    [Tags]      Time        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Verify your current page location contains      dashboard
    Generic.Verify your current page location contains      home
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  24  ${pageHeading}   Page Load - Total Page Load Time of Home Page after login      24    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify the drawer list parameters

#
#Verify the side options list
#    [Tags]      Unstable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
##    LandingPage.Verify you are on dashboard page
#    Generic.Verify your current page location contains      dashboard
#    DashboardPage.Verify the side option list parameters

click the option from menu
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

Verify the profile option list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify the profile option list parameters

Create and verify new brand
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    ReplaceDomainAPI.Replace Domain
    DashboardPage.click on share icon of dashboard page
    DashboardPage.Enter to Email into popup
    DashboardPage.Click on Send Invite button
    Generic.Verify alertify is visible
    Generic.Fetch alert message text and compare it with        Invite sent successfully
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
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
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated


Verify Help Center
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    Generic.Select other option from profile list   Edit
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    Generic.Select other option from profile list   Edit
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
    Generic.Select other option from profile list   Deactivate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deactivated successfully

Activate Brand and address via brand under profile list
    [Tags]   Smoke      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    Generic.Select other option from profile list   Edit
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
    Generic.Select other option from profile list   Deactivate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deactivated successfully
    DashboardPage.Click on three dots
    Generic.Select other option from profile list   Activate
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand activated successfully

Remove Brand and address via brand under profile list
    [Tags]    Smoke     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    Generic.Select other option from profile list   Edit
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
    Generic.Select other option from profile list   Remove
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deleted successfully

Verify adding a new brand from profile listing
    [Tags]      Sanity     rerun        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    Generic.Select other option from profile list   Remove
    DashboardPage.Select option from the pop up     yes
    Generic.Fetch alert message text and compare it with      Brand deleted successfully

Verify Department quick_links in profile settings dropdown
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list      department-dropdown
    Generic.Verify your current page location contains       department-list
    Generic.Verify your current page contains this text    Added Departments
    DashboardPage.Get and verify the text and compare it with     Added Departments

Search By Technology Group in product list
    [Tags]      Time        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand-list
    Generic.Verify your current page contains this text     Added Brands
    DashboardPage.Get and verify the text and compare it with   Added Brands

Verify Product quick_links in profile settings dropdown
    [Tags]     Sanity       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list      product-dropdown
    Generic.Verify your current page location contains       product-list
    Generic.Verify your current page contains this text    Added Products
    DashboardPage.Get and verify the text and compare it with       Added Products

Search By Brand name in product list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        A new agent has been downloaded for       Macos.
#    DashboardPage.Click on View more dropdown under recent notifications    View More
#    DashboardPage.Verify the invisiblity of view_more button

Click and verify the count of the tabs under renewal overview by management console
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Get And Verify The Count Of tabs under renewal overview by management console

Click and verify the count of the tabs under renewal overview by choosing the value from the dropdown by management console
    [Tags]     Sanity       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
    DashboardPage.Click on pre defined brand list       /n software

View Predefined product
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
    DashboardPage.Click on pre defined product list       [W306MI0U247

Verifying the Renewals Overview section of Management console - End of Life
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Fetch the count renewals overview subtabs      End of life
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Fetch the count renewals overview subtabs      Overdue renewals
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Fetch the count renewals overview subtabs      Overdue contracts
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Fetch the count renewals overview subtabs      Expired warranties
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
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
    Generic.Verify your current page location contains      dashboard
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Fetch the count renewals overview subtabs      Overdue certificates
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Select parameter from technology dropdown list      Certificate1 product
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
    DashboardPage.Fetch the count renewals overview subtabs     Upcoming cerificates
    DashboardPage.Set Globally the count from renewal overview subtabs
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Select parameter from technology dropdown list       Certificate1 product
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
    DashboardPage.Fetch the count renewals overview subtabs         Upcoming cerificates
    DashboardPage.Compare the counts of renewal overview after adding the asset
    DashboardPage.Click on the subtabs          Upcoming cerificates
    DashboardPage.Search and verify through asset_id      ${generated_AssetID}
    DashboardPage.Click on Back to management console tab
    Generic.Verify your current page location contains    management-console

Verifying the Subscription Overview section of Management console
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

#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F