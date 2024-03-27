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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Click the option from side drawer
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   IT Performances
    Generic.Verify your current page location contains      it-performance


Verify the drawer list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Verify your current page location contains      home
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  24  ${pageHeading}   Page Load - Total Page Load Time of Home Page after login      24    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify the drawer list parameters


Verify the side options list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    DashboardPage.Verify the side option list parameters

click the option from menu
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

Verify the profile option list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    DashboardPage.Verify the profile option list parameters

Create and verify new brand
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    ReplaceDomainAPI.Replace Domain
    DashboardPage.click on share icon of dashboard page
    DashboardPage.Enter toEmail into popup
    DashboardPage.Click on Send Invite button
    Generic.Verify alertify is visible
    Generic.Fetch alert message text and compare it with        Invite sent successfully
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.Open new window      yopmail
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


Verify Help Center
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.click on Help center icon of dashboard page
    DashboardPage.Click on link of information center list      A Complete Guide
    sleep       ${yop_sleep}
    Switch Window       Get Started Guide - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     Get Started Guide
    Switch Window      aithentic | Asset - Overview
    DashboardPage.Click on link of information center list      Knowledge Base

    sleep       ${yop_sleep}
    Switch Window       Help Center Home - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     SEARCH OUR KNOWLEDGE BASE
    Switch Window       aithentic | Asset - Overview
    DashboardPage.Click on link of information center list      What’s New!

    sleep       ${yop_sleep}
    Switch Window       What's New! - Jira Service Management
    Generic.Verify your current page location contains     servicedesk
    Generic.Verify your current page contains this text     What's New!
    Switch Window       aithentic | Asset - Overview
    DashboardPage.Click on link of Support      Customer

    sleep       ${yop_sleep}
    Switch Window       Customer Service Desk - Jira Service Management
    Generic.Verify your current page location contains      servicedesk
    Generic.Verify your current page contains this text     Customer Service Desk
    Switch Window       aithentic | Asset - Overview
    DashboardPage.Search any keyword of FAQ section     How do I complete my account setup?
    DashboardPage.Verify the keyword        How do I complete my account setup?
    DashboardPage.Search any keyword of FAQ section     Testing
    DashboardPage.Verify no result found with wrong FAQ

Edit Brand and address via brand under profile list
    [Tags]    rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    ReplaceDomainAPI.Replace Domain
    Generic.Verify your current page location contains  brand-list
    ReplaceDomainAPI.Replace Domain
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list      department-dropdown
    Generic.Verify your current page location contains       department-list
    Generic.Verify your current page contains this text    Added Departments
    DashboardPage.Get and verify the text and compare it with     Added Departments

Search By Technology Group in product list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand-list
    Generic.Verify your current page contains this text     Added Brands
    DashboardPage.Get and verify the text and compare it with   Added Brands

Verify Product quick_links in profile settings dropdown
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list      product-dropdown
    Generic.Verify your current page location contains       product-list
    Generic.Verify your current page contains this text    Added Products
    DashboardPage.Get and verify the text and compare it with       Added Products

Search By Brand name in product list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]    retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}       ${valid_password}
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
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    Generic.Verify your current page contains this text     Billing Details
    Generic.Refresh the existing page
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab        A new agent has been downloaded for       Macos.
    DashboardPage.Click on View more dropdown under recent notifications    View More
    DashboardPage.Verify the invisiblity of view_more button