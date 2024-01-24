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
    DashboardPage.Select the asset ID checkbox      yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Would you like to download agent    Yes, please!
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
    DashboardPage.Select the asset ID checkbox      yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Would you like to download agent    Yes, please!
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
    DashboardPage.Select the asset ID checkbox      yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    sleep   ${search_sleep}
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
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
    OCS.Would you like to download agent    Yes, please!
    OCS.Select the agent type    macOS
    OCS.Verify that agent is ready to get download
    Generic.click on the button link    Download

Apply filters on Discovered assets
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      chirag@dmts.fr.nf      Test@789
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    sleep   ${search_sleep}
    OCS.Choose tab under Discovery Assets   network-discovery
    OCS.click on filter icon of discovered assets
    sleep   3
    OCS.Choose filters for discovered asset     Select Brand
    sleep   2
    Select brand , mac address and agent from dropdown of discovered asset filter   LENOVO
    Generic.click on the button     Apply


