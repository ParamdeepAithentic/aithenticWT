*** Settings ***
Documentation     Contains all keyword of Two Factor Authentication page
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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ContractsPage.robot
Resource        ../Pages/RegisterMember.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/Admin_PanelPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session

*** Test Cases ***
Change plan Assign commercial plan
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     mehak@mynes.com    Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing
    Admin_PanelPage.Get and verify text from current Plan
    Go To       ${admin_url}
    LandingPage.Fill the login form of Admin panel     ${admin_name}       ${admin_password}
    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${admin_name}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail       Admin OTP Access
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Admin_PanelPage.Get Admin OTP acess from email      Here is your authorized OTP access code:
    sleep       ${yop_sleep}
    Switch Window    aithentic | Two factor authentication
    TwoFactorAuth.Enter the Admin Access OTP     ${passcode}
    TwoFactorAuth.Click on the verify button
    Sleep    ${yop_sleep}
    Generic.Verify your current page contains this text         Manage Subscriptions
    Admin_PanelPage.Choose option from side menu of Admin_panel    Manage Subscriptions
    Admin_PanelPage.Select option under side menu       Subscribed Companies
    Generic.Verify your current page contains this text         Subscribed Companies
    Admin_PanelPage.Search the end user under subscribed companies          mehak@mynes.com
    Admin_PanelPage.Click on the three_dots of the table
    Admin_PanelPage.Choose option by clicking on three_dots         Assign Commercial Plan
    Admin_PanelPage.