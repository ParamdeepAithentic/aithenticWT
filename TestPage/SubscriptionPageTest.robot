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

Create the scheduler
    [Tags]      rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Create Scheduler
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
    sleep   ${search_sleep}
    Generic.click on the button     Create
    Generic.Fetch alert message text and compare it with        Scheduler created sucessfully

Edit the scheduler
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Edit
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Weekly
    SubscriptionPage.Enter input in the input field of day under create scheduler       Monday
    SubscriptionPage.Enter input in the input field of time under create scheduler      12:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Edit
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Daily
    SubscriptionPage.Enter input in the input field of time under create scheduler      1:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Edit
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Monthly
   SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      2:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Edit
    SubscriptionPage.click on the cross icon of create scheduler    1
    SubscriptionPage.Enter input in the input field of frequency under create scheduler    Yearly
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the input field of time under create scheduler      3:00
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Scheduler updated sucessfully

Run now from view details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-connector
    Generic.Verify your current page location contains      technology-settings
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Details
    Generic.click on the button     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    sleep  ${search_sleep}
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Delete
    Generic.click on the button     Yes
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector      Deleted
    sleep  ${search_sleep}
    SubscriptionPage.Click on the activate option under subscription connector table
    Generic.Fetch alert message text and compare it with        Status Updated
    SubscriptionPage.Fetch text of delete under table of subscription connector      Active
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Run Now
    SubscriptionPage.Fetch alert message text of subscription connector and compare it with
    SubscriptionPage.Click on the three dots of subscription connector      Google
    SubscriptionPage.Click on option under three dots of subscription connector     Details
    SubscriptionPage.Get the value of fields under view details of subscription connector   1       GAPPS
    SubscriptionPage.Get the value of fields under view details of subscription connector   2       Samuel John

Suspend and unsuspend the account
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      Samuel@yopmail.net    Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing-details
    SubscriptionPage.Click on the suspend my account button link under billing details
    SubscriptionPage.Enter input in the description field of billing details
    SubscriptionPage.Enter input in the start date field of billing details
    SubscriptionPage.Enter input in the end date field of billing details
    sleep   ${search_sleep}
    Generic.click on the button     Suspend
    Generic.Fetch alert message text and compare it with        Account suspended successfully.
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    Generic.Select parameter    Technology
    Generic.Verify your current page location contains      technology-settings
    Generic.click on the tab    Subscription Connectors
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
    Generic.Verify your current page location contains      personal-profile
    Generic.Select parameter    Technology
    Generic.Verify your current page location contains      technology-settings
    Generic.click on the tab    Subscription Connectors
    SubscriptionPage.Click on the activate option under subscription connector table
    Generic.Fetch alert message text and compare it with        Status Updated
