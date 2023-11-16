*** Settings ***
Documentation   Contains all test cases of Dashboard page
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
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Click the option from side drawer
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   IT Performance
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
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}


Add Product Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      Getac
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Edit - Products
    Generic.Verify your current page location contains      product-bulk-edit
    DashboardPage.Enter the new value in the product name column      ProductId
    DashboardPage.Enter the new value in the brand name column       BrandName    QABrand555
    DashboardPage.Select option from status column        ProductStatus
    DashboardPage.Select option from technology type column       TechType

    Generic.Click on the button     Update      #Check Data,Edit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
#    Generic.Fetch alert message text and compare it with        Products updated successfully
    MemberPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Exit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    sleep       1
    Switch Window       aithentic | Product - List
    DashboardPage.Verify product added    ${generated_EditProductName}



Add Department Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department-list
    DashboardPage.Click on action button
    DashboardPage.Click on add department
    DashboardPage.Create unique department name random
#    DashboardPage.Select department status    Active
    DashboardPage.Select department cost center     1300
    DashboardPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    DashboardPage.Verify department added       ${generated_DepartmentNumber}

    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains      department-bulk-edit
    DashboardPage.Enter the new value in the department name column     department_name
    DashboardPage.Select option from department status column       DepartmentStatus
    DashboardPage.Enter the new value in the cost center column     costCenter

    Generic.Click on the button     Upload      #Check Data,Edit,Upload
    DashboardPage.Verify the upload message text    Upload       Upload successful
    Generic.Click on the button     Exit
    DashboardPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm



Add Brand
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Technology
    Generic.Verify your current page location contains  technology-settings
#    Generic.Verify your current page location contains      brand
    ReplaceDomainAPI.Replace Domain
    DashboardPage.See added brand link
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
    Generic.Open new window      yopmail
    Generic.Search yopmail emails for       ${generate_sharetoEmail}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    DashboardPage.Click on Register button in email
    sleep       3
    DashboardPage.Switch to window        aithentic | Register
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
    Generic.Verify your current page location contains     keycloak
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
    sleep       2
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
    DashboardPage.Select the asset ID checkbox      yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Verify Help Center
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




































