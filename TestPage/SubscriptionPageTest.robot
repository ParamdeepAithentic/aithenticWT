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
    [Tags]      Sanity     Smoke
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
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
   SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Google       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      6
    SubscriptionPage.Click on the ok button after selecting the time
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

Run now from view details
#    [Tags]      Stable
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
    [Tags]      Smoke     Sanity        Rerun
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
        SubscriptionPage.click on the connector tab under technoogy settings
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
        SubscriptionPage.Click on the connectors button link under technology settings page

#        SubscriptionPage.Click on the activate option under subscription connector table        Google
#        SubscriptionPage.Click on the activate option under subscription connector table        Microsoft Corporation
#        Generic.Fetch alert message text and compare it with        Status Updated
    EXCEPT
        SubscriptionPage.My Failure Handling
        Fail
    END

View Scheduler from view Result
#    [Tags]      Stable
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
    SubscriptionPage.Click on option under three dots of subscription connector     Microsoft Corporation        View Results
    #SubscriptionPage.Click on option under three dots of subscription connector     Microsoft Corporation          View Results

    Generic.Verify your current page location contains    subscription
    SubscriptionPage.Choose tab under subscription page after clicking on view_result
    SubscriptionPage.Fetch and compare the Brand from the table    Microsoft Corporation


#Create the scheduler of sentinel one
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    LandingPage.Verify you are on dashboard page
#    Generic.Verify your current page location contains      dashboard
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne     Create Scheduler
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
#    sleep   ${search_sleep}
#    Generic.click on the button     Create
#    Generic.Fetch alert message text and compare it with        Scheduler created sucessfully

#Edit the scheduler of Sentinelone
#    [Tags]      Sanity      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
#    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
#    SubscriptionPage.Select the time from the timepicker      5
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne      Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
#    SubscriptionPage.Select the time from the timepicker      2
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      3
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      4
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#
#Run_now_delete_view-details_of_sentinelOne
#    [Tags]      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Details
#    Generic.click on the button     Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Delete
#    Generic.click on the button     Yes
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Deleted
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the activate option under subscription connector table        SentinelOne
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Active
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Details
#    SubscriptionPage.Get the value of fields under view details of subscription connector   1       SentinelOne
#    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John
#
#View Scheduler from view Result of sentinelone
#    [Tags]      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne      View Results
#    Generic.Verify your current page location contains      discovery-assets
#    Generic.Verify your current page contains this text    Asset Discovery
#    SubscriptionPage.Verify the visibility of no records under view details under sentinel one
#    Go Back
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      Microsoft Corporation

#Edit the scheduler of Sentinelone
#    [Tags]      Sanity      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
#    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
#    SubscriptionPage.Select the time from the timepicker      5
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne      Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
#    SubscriptionPage.Select the time from the timepicker      2
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      3
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      4
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                               # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#
#Run_now_delete_view-details_of_sentinelOne
#    [Tags]      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne       Details
#    Generic.click on the button     Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Delete
#    Generic.click on the button     Yes
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Deleted
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the activate option under subscription connector table        SentinelOne
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Active
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Details
#    SubscriptionPage.Get the value of fields under view details of subscription connector   1       SentinelOne
#    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John
#
#View Scheduler from view Result of sentinelone
#    [Tags]      Stable
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
#    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne      View Results
#    Generic.Verify your current page location contains      discovery-assets
#    Generic.Verify your current page contains this text    Asset Discovery
#    SubscriptionPage.Verify the visibility of no records under view details under sentinel one
#    Go Back
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      Microsoft Corporation

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
    [Tags]      Sanity     Smoke        Rerun
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
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the create button link of service now under subscription connector      ServiceNow          Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the url end point field of service now      https://dev231279.service-now.com
    SubscriptionPage.Enter input in the username field of service now       gurmilan

    SubscriptionPage.Enter input in the password field of service now      [xNZ5w5t(_[EJKMOM(dL7jC*gwyAqeYR

    SubscriptionPage.Enter input in the client id field of service now     b736c1fecf3b021092418c18e0464b57
    SubscriptionPage.Enter input in the secret key field of service now     }6@ENaGIQy
    Generic.click on the button     Create Connection
#    Generic.click on the button     By System
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
#    Generic.Fetch alert message text and compare it with       Scheduler created successfully
    Generic.Wait until table get load
#    sleep   300s
    SubscriptionPage.Fetch text of status under the table of subscription connector     ServiceNow
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      ServiceNow
    SubscriptionPage.Click on option under three dots of subscription connector     ServiceNow      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
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
    Generic.click on the button     No, thanks
    Generic.Verify your current page contains this text    No Records
#    SubscriptionPage.Fetch and compare the product from the table
#    Generic.Wait until table get load
#    Go Back
#    Generic.Verify your current page location contains      technology-settings
#    Generic.select the option from the side menu    Asset Discovery
##    Generic.click on the button     No, thanks

#    SubscriptionPage.Click on the service now tab under discovery assets
#    OCS.Click on newly discovered tab under service now
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets       Edit
#    SubscriptionPage.click on the cross icon of service now under asset discovery    1
#    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Weekly
#    SubscriptionPage.Enter input in the input field of day asset discovery       Monday

#   SubscriptionPage.Select the time from the timepicker     7
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets    Edit
#    SubscriptionPage.click on the cross icon of service now under asset discovery    1
#    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Monthly
#    SubscriptionPage.Enter input in the start date field of service now under asset discovery

#    SubscriptionPage.Select the time from the timepicker      8
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets      Edit
#    SubscriptionPage.click on the cross icon of service now under asset discovery    1
#    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Daily

#    SubscriptionPage.Select the time from the timepicker      9
#    SubscriptionPage.Click on the ok button after selecting the time

#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets     Edit
#    SubscriptionPage.click on the cross icon of service now under asset discovery    1
#    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Yearly
#    SubscriptionPage.Enter input in the start date field of service now under asset discovery

#    SubscriptionPage.Select the time from the timepicker      2
#    SubscriptionPage.Click on the ok button after selecting the time

#    sleep   ${search_sleep}
#    Generic.click on the button     Update
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets     Details
#    SubscriptionPage.Click on the options under action button of service now under discovery assets     Run Now
##    SubscriptionPage.Click on cross icon of details under service now          #  delete this line after bug got fixed #
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    sleep   ${search_sleep}
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets      Delete
#    Generic.click on the button     Yes
#    SubscriptionPage.click on the cross icon of delete pop up under asset discovery
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets      Activate
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    Generic.click on the tab       Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    SubscriptionPage.Click on the action button of service now under discovery assets
#    SubscriptionPage.Click on the options under action button of service now under discovery assets      Details
#    SubscriptionPage.Get the value of fields under view details of subscription connector   1       ServiceNow
#    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}


Click on connetors button link under asset discovery
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

    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the sentinel one tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    SubscriptionPage.Click on the service now tab under discovery assets
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load

Create JAMFF account with valid data
#    [Tags]      OnlyQA
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the jamff tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      JAMF Software        Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    SubscriptionPage.Enter input in the url end point field of service now      https://aithenticnfr.jamfcloud.com
    SubscriptionPage.Enter input in the username field of service now       tokenGenerator
    SubscriptionPage.Enter input in the password field of service now       Abhishek@1234#
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
    Generic.Wait until table get load
#    sleep   300s
    SubscriptionPage.Fetch text of status under the table of subscription connector     JAMF Software
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software       Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector    JAMF Software     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector   JAMF Software       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     JAMF Software     Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        JAMF Software
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     JAMF Software      Active
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector    JAMF Software    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      Jamf Pro
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
    SubscriptionPage.Click on option under three dots of subscription connector    JAMF Software    View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    Generic.click on the button     No, thanks
    Generic.Verify your current page contains this text    No Records

Create jamff account with invalid data
#    [Tags]      OnlyQA
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the jamff tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      JAMF Software        Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    SubscriptionPage.Enter input in the url end point field of service now      https://aithenticnfr.jamfcloud.com
    SubscriptionPage.Enter input in the username field of service now       tokenGenerator
    SubscriptionPage.Enter input in the password field of service now       Abhishek@12#
    Generic.click on the button     Create Connection
    Generic.Verify your current page contains this text     Jamf Pro Connection Failed.

#Edit the scheduler of jamff
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software      Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
#    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
#    SubscriptionPage.Select the time from the timepicker      2
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update                                          # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software       Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
#    SubscriptionPage.Select the time from the timepicker      3
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector    JAMF Software      Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      4
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector    JAMF Software      Scheduler
#    SubscriptionPage.click on the cross icon of create scheduler    1
#    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
#    SubscriptionPage.Enter input in the start date field of billing details
#    SubscriptionPage.Select the time from the timepicker      5
#    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
#    Generic.click on the button     Update
##    Generic.click on the button     Update                                                    # Remove this line after bug got fixed #
#    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
#
#Run now from view details of jamff
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software       Details
#    Generic.click on the button     Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software     Delete
#    Generic.click on the button     Yes
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     JAMF Software      Deleted
#    sleep  ${search_sleep}
#    SubscriptionPage.Click on the activate option under subscription connector table        JAMF Software
#    Generic.Fetch alert message text and compare it with        Status Updated
#    SubscriptionPage.Fetch text of delete under table of subscription connector     JAMF Software     Active
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software     Run Now
#    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software     Details
#    SubscriptionPage.Get the value of fields under view details of subscription connector   1       Jamf Pro
#    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John
#
#
#View Results of jamff account
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
#    Generic.Verify your current page location contains      dashboard
#    Generic.Click on the profile name
#    Generic.Select option from profile list     subscription-connector
#    Generic.Verify your current page location contains      technology-settings
#    SubscriptionPage.Click on the three dots of subscription connector      JAMF Software
#    SubscriptionPage.Click on option under three dots of subscription connector     JAMF Software     View Results
#    Generic.Verify your current page location contains      discovery-assets
#    Generic.Verify your current page contains this text    Asset Discovery
#    Generic.Verify your current page contains this text    No Records

Create sentinel account and verify the options
#    [Tags]      OnlyQA
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the jamff tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      SentinelOne        Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    SubscriptionPage.Enter input in the url end point field of service now      https://usea1-300-nfr.sentinelone.net/
    SubscriptionPage.Enter input in the token field of sentinelone      eyJraWQiOiJ0b2tlblNpZ25pbmciLCJhbGciOiJFUzI1NiJ9.eyJzdWIiOiJzZXJ2aWNldXNlci1kZmZmY2QwOC0xY2EwLTRjNzktYmE0OC03MDRiOWE5MzUwYzhAbWdtdC0xMTQ0Ny5zZW50aW5lbG9uZS5uZXQiLCJpc3MiOiJhdXRobi11cy1lYXN0LTEtcHJvZCIsImRlcGxveW1lbnRfaWQiOiIxMTQ0NyIsInR5cGUiOiJ1c2VyIiwiZXhwIjoxNzgyOTgwMjc5LCJpYXQiOjE3MTk5MTE4NDksImp0aSI6ImIzMTFjMzdlLTJkYTAtNGYyYS1hMzQwLWY1NzY4ZTRlZTRlNiJ9.77AhkZYTzL37pnSf5OnCii8LHlCN_nI_fxuXU1N28B9HyT7cYFcbN9-saRnq3YJdpWADuDNdc4wzTcFN2bsg0w
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
    Generic.Wait until table get load
#    sleep   300s
    SubscriptionPage.Fetch text of status under the table of subscription connector     SentinelOne
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector   SentinelOne       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne         Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        SentinelOne
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     SentinelOne      Active
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector     SentinelOne    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      SentinelOne
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      SentinelOne
    SubscriptionPage.Click on option under three dots of subscription connector    SentinelOne    View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    Generic.Verify your current page contains this text    No Records

Click on the three dots of Intune and verify the details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
     SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector     Intune      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector     Intune     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector    Intune     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector     Intune      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
#    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector   Intune       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
#    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector     Intune    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     Intune        Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        Intune
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    Intune      Active
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector    Intune    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector     Intune    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      Intune
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      Intune
    SubscriptionPage.Click on option under three dots of subscription connector    Intune    View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    Generic.Verify your current page contains this text    No Records


Create Tenable Account and verify the details
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
#    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the tenable tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      Tenable       Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the access key of tenable account     a632865206c0e117cd04af6b233f5ffc6908f651d0c250f415333adb1aaf9e61
    SubscriptionPage.Enter input in the secret key field of service now     1002caed92c9ad78c3a95c994ba2c4ed834f1891438e1356fac2e1f167cd7907
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
    Generic.Wait until table get load
    SubscriptionPage.Fetch text of status under the table of subscription connector    Tenable
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector     Tenable      Scheduler
     SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector     Tenable     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector    Tenable     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector     Tenable     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector     Tenable
    SubscriptionPage.Click on option under three dots of subscription connector   Tenable       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector    Tenable   Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    Tenable       Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        Tenable
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    Tenable     Active
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector    Tenable    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector     Tenable    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      Tenable
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      Tenable
    SubscriptionPage.Click on option under three dots of subscription connector   Tenable    View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    SubscriptionPage.Fetch and compare the product from the table
    Generic.Wait until table get load
    Go Back
    Generic.Verify your current page location contains      technology-settings
    Generic.select the option from the side menu    Asset Discovery
    SubscriptionPage.Click on the tenable tab under asset discovery
    OCS.Click on the newly dicovered of tenable tab under asset discovery
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets       Edit
    SubscriptionPage.click on the cross icon of tenable under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tenable    Weekly
    SubscriptionPage.Enter input in the input field of day asset discovery under tenable       Monday
    SubscriptionPage.Select the time from the timepicker of tenable under asset discovery     7
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets     Edit
    SubscriptionPage.click on the cross icon of tenable under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tenable   Monthly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery under tenable

    SubscriptionPage.Select the time from the timepicker of tenable under asset discovery      8
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets     Edit
    SubscriptionPage.click on the cross icon of tenable under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tenable    Daily

    SubscriptionPage.Select the time from the timepicker of tenable under asset discovery       9
    SubscriptionPage.Click on the ok button after selecting the time

    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets     Edit
    SubscriptionPage.click on the cross icon of tenable under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tenable     Yearly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery under tenable

    SubscriptionPage.Select the time from the timepicker of tenable under asset discovery       2
     Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets      Details
    Generic.click on the button    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets      Delete
    SubscriptionPage.click on the yes option of delete pop up under asset discovery tenable
#    SubscriptionPage.click on the cross icon of delete pop up under asset discovery
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets   Activate
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of tenable under discovery assets
    SubscriptionPage.Click on the options under action button of tenable under discovery assets    Details
    SubscriptionPage.Get the value of fields under view details of subscription of tenable tab under asset discovery   1       Tenable
    SubscriptionPage.Get the value of fields under view details of subscription of tenable tab under asset discovery   2       ${generate_register_Fname} ${generate_register_Lname}







Create tanium Account and verify the details
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
#    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the tanium tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      Tanium       Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the url end point field of service now    https://tk-aithentic-api.titankube.com
    SubscriptionPage.Enter input in the token field of sentinelone    token-d53bda519331ac209e39883cbd4b6b5e7c4617bb4ea5b0d7235421b680

    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
    Generic.Wait until table get load
    SubscriptionPage.Fetch text of status under the table of subscription connector     Tanium
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector     Tanium      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector     Tanium     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector   Tanium     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector     Tanium
    SubscriptionPage.Click on option under three dots of subscription connector     Tanium      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector   Tanium       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector     Tanium   Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    Tanium       Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        Tanium
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     Tanium    Active
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector    Tanium    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector     Tanium    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      Tanium
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on the three dots of subscription connector      Tanium
    SubscriptionPage.Click on option under three dots of subscription connector    Tanium    View Results
    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    SubscriptionPage.Fetch and compare the product from the table
    Generic.Wait until table get load
    Go Back
    Generic.Verify your current page location contains      technology-settings
    Generic.select the option from the side menu    Asset Discovery
    SubscriptionPage.Click on the tanium tab under asset discovery
    OCS.Click on newly discovered tab under tanium
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets       Edit
    SubscriptionPage.click on the cross icon of tanium under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tanium    Weekly
    SubscriptionPage.Enter input in the input field of day asset discovery under tanium       Monday
    SubscriptionPage.Select the time from the timepicker of tanium under asset discovery     7
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets       Edit
    SubscriptionPage.click on the cross icon of tanium under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tanium    Monthly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery under tanium

    SubscriptionPage.Select the time from the timepicker of tanium under asset discovery     8
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets       Edit
    SubscriptionPage.click on the cross icon of tanium under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tanium    Daily

    SubscriptionPage.Select the time from the timepicker of tanium under asset discovery     9
    SubscriptionPage.Click on the ok button after selecting the time

    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets       Edit
    SubscriptionPage.click on the cross icon of tanium under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery under tanium    Yearly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery under tanium
    SubscriptionPage.Select the time from the timepicker of tanium under asset discovery      2
    SubscriptionPage.Click on the ok button after selecting the time

    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets    Details
    Generic.click on the button    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets      Delete
    SubscriptionPage.click on the yes option of delete pop up under asset discovery tanium
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets   Activate
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets      Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of tanium under discovery assets
    SubscriptionPage.Click on the options under action button of tanium under discovery assets   Details
    SubscriptionPage.Get the value of fields under view details of subscription of tanium tab under asset discovery  1       Tanium
    SubscriptionPage.Get the value of fields under view details of subscription of tanium tab under asset discovery   2       ${generate_register_Fname} ${generate_register_Lname}

Create CrowdStrike Account and verify the details
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
    Generic.select the option from the side menu    Asset Discovery
    Generic.Verify your current page location contains     discovery-assets
#    Generic.click on the button     No, thanks
    SubscriptionPage.Click on the crowd strike tab under asset discovery
    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains     connector
    Generic.Wait until table get load
    SubscriptionPage.Click on the create button link of service now under subscription connector      CrowdStrike       Create
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create Connection
    Generic.Verify your current page location contains      create-connection
    SubscriptionPage.Enter input in the url end point field of service now     https://api.us-2.crowdstrike.com
    SubscriptionPage.Enter input in the client id field of service now    53f4568b30e04d03a2ba6675e5b3b14f
    SubscriptionPage.Enter input in the secret key field of service now     AQXdIMKk8GV32gj6L1xBEDn7PFRaCcZo09Si4z5W

    Generic.click on the button     Create Connection
    Generic.Verify your current page location contains      technology-settings
    Generic.Fetch alert message text and compare it with       Technology created successfully
    Generic.Wait until table get load
    SubscriptionPage.Fetch text of status under the table of subscription connector     CrowdStrike
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector     CrowdStrike      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector     CrowdStrike     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector    CrowdStrike     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector     CrowdStrike      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector   CrowdStrike       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector     CrowdStrike   Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    CrowdStrike        Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        CrowdStrike
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     CrowdStrike      Active
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector    CrowdStrike    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector     CrowdStrike    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      CrowdStrike
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      CrowdStrike
    SubscriptionPage.Click on option under three dots of subscription connector    CrowdStrike    View Results

    Generic.Verify your current page location contains      discovery-assets
    Generic.Verify your current page contains this text    Asset Discovery
    SubscriptionPage.Fetch and compare the product from the table
    Generic.Wait until table get load
    Go Back
    Generic.Verify your current page location contains      technology-settings
    Generic.select the option from the side menu    Asset Discovery
    SubscriptionPage.Click on the crowd strike tab under asset discovery
    OCS.Click on newly discovered tab under service now
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets       Edit
    SubscriptionPage.click on the cross icon of crowdstrike under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Weekly
    SubscriptionPage.Enter input in the input field of day asset discovery       Monday
    SubscriptionPage.Select the time from the timepicker     7
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets     Edit
    SubscriptionPage.click on the cross icon of crowdstrike under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Monthly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery

    SubscriptionPage.Select the time from the timepicker      8
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets      Edit
    SubscriptionPage.click on the cross icon of crowdstrike under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Daily

    SubscriptionPage.Select the time from the timepicker      9
    SubscriptionPage.Click on the ok button after selecting the time

    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets     Edit
    SubscriptionPage.click on the cross icon of crowdstrike under asset discovery    1
    SubscriptionPage.Enter input in the input field of frequency under asset discovery    Yearly
    SubscriptionPage.Enter input in the start date field of service now under asset discovery

    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time

    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets     Details
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets    Run Now
#    SubscriptionPage.Click on cross icon of details under service now          #  delete this line after bug got fixed #
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets      Delete
    Generic.click on the button     Yes
#    SubscriptionPage.click on the cross icon of delete pop up under asset discovery
    Generic.Fetch alert message text and compare it with        Status Updated
   SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets   Activate
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Click on the action button of service now under discovery assets
    Generic.click on the tab       Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the action button of crowd strike under discovery assets
    SubscriptionPage.Click on the options under action button of crowdstrike under discovery assets    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       CrowdStrike
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       ${generate_register_Fname} ${generate_register_Lname}

Click on the three dots of Azure and verify the details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      samuel@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector     Azure Cloud Utilization      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Tuesday
    SubscriptionPage.Select the time from the timepicker      3
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector     Azure Cloud Utilization     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      4
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector    Azure Cloud Utilization     Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Select the time from the timepicker      5
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector     Azure Cloud Utilization      Scheduler
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Select the time from the timepicker      2
    SubscriptionPage.Click on the ok button after selecting the time
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector   Azure Cloud Utilization       Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector     Azure Cloud Utilization    Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector     Azure Cloud Utilization        Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table        Azure Cloud Utilization
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector    Azure Cloud Utilization      Active
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector    Azure Cloud Utilization    Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector     Azure Cloud Utilization    Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1      Azure Cloud Utilization
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John
    SubscriptionPage.Click on cross icon of details under service now
    SubscriptionPage.Click on the three dots of subscription connector      Azure Cloud Utilization
    SubscriptionPage.Click on option under three dots of subscription connector    Azure Cloud Utilization    View Results
    Generic.Verify your current page location contains      azurecloud
    Generic.Verify your current page contains this text    Coming Soon
