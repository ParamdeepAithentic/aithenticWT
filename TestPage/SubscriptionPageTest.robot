*** Settings ***
Documentation   Contains all keyword of  Dashboard page
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

#Create the scheduler
#    [
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      Google
#    SubscriptionPage.Click on option under three dots of subscription connector     Create Scheduler
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
#    sleep   ${search_sleep}
#    Generic.click on the button     Create
#    Generic.Fetch alert message text and compare it with        Scheduler created sucessfully

Edit the scheduler
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Enter input in the input field of time under create scheduler      12:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Enter input in the input field of time under create scheduler      1:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      3:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

Run now from view details
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google     Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     Google      Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        Google
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     Google      Active
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google     Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       GAPPS
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John

Suspend and unsuspend the account
    [Tags]      Smoke       Stable
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
        Generic.Verify your current page location contains      dashboard
       LandingPage.Verify you are on dashboard page
        Generic.Click on the profile name
        Generic.Select option from profile list     billing-dropdown
        Generic.Verify your current page location contains      billing-details
        SubscriptionPage.Click on the suspend my account button link under billing details
        SubscriptionPage.Enter input in the description field of billing details
        SubscriptionPage.Enter input in the start date field of billing details

        TechnologyPage.Input future Date

        SubscriptionPage.Enter input in the end date field of billing details       ${formatted_future_date}
        sleep   ${search_sleep}
        Generic.click on the button     Suspend
        Generic.Fetch alert message text and compare it with        Account suspended successfully.
        Generic.Click on the profile name
        Generic.Select option from profile list     personal-details
        Generic.Verify your current page location contains      personal-profile
        Generic.Select parameter    Technology
        Generic.Verify your current page location contains      technology-settings
        Generic.click on the tab    Connectors
        SubscriptionPage.Visible the disable activate button link after suspending account
        Generic.Click on the profile name
        Generic.Select option from profile list     billing-dropdown
        Generic.Verify your current page location contains      billing-details
        SubscriptionPage.Click on the Unsuspend my account button link under billing details
        SubscriptionPage.click on the checkboxes under unsuspend my account button link
        SubscriptionPage.click on the confirm button of unsuspend pop up
        Generic.Fetch alert message text and compare it with        Payment Successful
        Generic.Click on the profile name
        Generic.Select option from profile list     personal-details
        Generic.Verify your curren t page location contains      personal-profile
        Generic.Select parameter    Technology
        Generic.Verify your current page location contains      technology-settings
        Generic.click on the tab    Connectors
        SubscriptionPage.Click on the activate option under subscription connector table        Google
        SubscriptionPage.Click on the activate option under subscription connector table        Microsoft Corporation
        Generic.Fetch alert message text and compare it with        Status Updated
    EXCEPT
        SubscriptionPage.My Failure Handling
        Fail
    END

View Scheduler from view Result
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google     View Results
    Generic.Verify your current page contains this text    Sorry! You do not have permission to access this page.
    Go Back
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Microsoft Corporation
    SubscriptionPage.Click on option under three dots of subscription connector     Microsoft Corporation          View Results

    Generic.Verify your current page location contains    subscription
    SubscriptionPage.Choose tab under subscription page after clicking on view_result
    SubscriptionPage.Fetch and compare the Brand from the table    Microsoft Corporation

Edit the scheduler of Sentinelone
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Enter input in the input field of time under create scheduler      12:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Enter input in the input field of time under create scheduler      1:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      3:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

Run_now_delete_view-details_of_sentinelOne
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        SentinelOne
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Active
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       SentinelOne
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John

View Scheduler from view Result of sentinelone
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne      View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    SubscriptionPage.Verify the visibility of no records under view details under sentinel one
    Go Back
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Microsoft Corporation


Create service now with invalid data
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
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the create button link of service now under subscription connector      ServiceNow          Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the url end point field of service now      https://qa-admin.aithentic.com/
    SubscriptionPage.Enter input in the username field of service now       Milan
    SubscriptionPage.Enter input in the password field of service now       Test@123
    SubscriptionPage.Enter input in the client id field of service now     Client@001
    SubscriptionPage.Enter input in the secret key field of service now     gdevg:mlks
    Generic.click on the button     Create Connection
    Generic.Verify your current page contains this text     Service Now Connection Failed.

Create service now with valid data
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
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the create button link of service now under subscription connector      ServiceNow          Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the url end point field of service now      https://dev258787.service-now.com
    SubscriptionPage.Enter input in the username field of service now       ParamD
    SubscriptionPage.Enter input in the password field of service now       sbd{Vc]x0P7t7h!We$ZI#j%b+_i1WNNnwam.rtD.5%@klTvb:P$4[A!Q1n&aYe$ScRLFNsJGH&d;m.
    SubscriptionPage.Enter input in the client id field of service now     405229d86f230210f8a735c71f96d3af
    SubscriptionPage.Enter input in the secret key field of service now     i[N(m1}|EO
    Generic.click on the button     Create Connection
    Generic.click on the button     By System
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
#    Generic.Fetch alert message text and compare it with       Scheduler created successfully
    Generic.Wait until table get load
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Enter input in the input field of time under create scheduler      12:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Enter input in the input field of time under create scheduler      1:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      3:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector    ServiceNow       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     ServiceNow     Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        ServiceNow
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     ServiceNow      Active
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       ServiceNow
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow     View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    SubscriptionPage.Fetch and compare the product from the table       ATI Control Panel
    Generic.Wait until table get load
    Go Back
    Generic.Verify your current page location contains      technology-settings
    Generic.select the option from the side menu    Asset Discovery
    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the service now tab under discovery assets
    OCS.Click on newly discovered tab under service now
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Edit
    SubscriptionPage.click on the cross icon of service now under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Weekly
    SubscriptionPage.Enter input in the input field of day asset discovery       Monday
    SubscriptionPage.Enter input in the input field of time under asset discovery      12:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Edit
    SubscriptionPage.click on the cross icon of service now under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Monthly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery
    SubscriptionPage.Enter input in the input field of time under asset discovery       2:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Edit
    SubscriptionPage.click on the cross icon of service now under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Daily
    SubscriptionPage.Enter input in the input field of time under asset discovery      1:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Edit
    SubscriptionPage.click on the cross icon of service now under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Yearly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery
    SubscriptionPage.Enter input in the input field of time under asset discovery      3:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Click on cross icon of details under service now          #  delete this line after bug got fixed #
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep   ${search_sleep}
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Delete
    Generic.click on the button     Yes
    SubscriptionPage.click on the cross icon of delete pop up under asset discovery
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Activate
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the settings icon under service now via discovery assets
    Generic.click on the tab       Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       ServiceNow
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}

