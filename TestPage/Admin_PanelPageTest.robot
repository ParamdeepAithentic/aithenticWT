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
Resource        ../Pages/Admin_PanelPage.robot

Suite Setup     Update settings for Asset_ID, employee_id and location
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Test Cases ***

Change plan- Assign commercial plan and change it to slotted
    [Tags]      smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     mehak@mynes.com     Test@123
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing
    Admin_PanelPage.Fetch text from current Plan
    Admin_PanelPage.Open Admin panel
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
    Generic.Verify your current page contains this text         Manage Subscriptions
    Admin_PanelPage.Choose option from side menu of Admin_panel    Manage Subscriptions
    Admin_PanelPage.Select option under side menu       Subscribed Companies
    Generic.Verify your current page contains this text         Subscribed Companies
    Admin_PanelPage.Search the end user under subscribed companies      mehak@mynes.com
    Admin_PanelPage.Scroll table horizontaly
    Admin_PanelPage.Click on the three_dots of the table
    Admin_PanelPage.Choose option by clicking on three_dots         Assign Commercial Plan
    Admin_PanelPage.Change the plan from Plan Name field        Commercial-Debut BETA Promo
    Admin_PanelPage.Click on the button inside assign commercial plan modal         Confirm
    Admin_PanelPage.Get alert message and compare it with           Subscription Updated Successfully
    Sleep    ${yop_sleep}
    switch window       aithentic | Billing
    Admin_PanelPage.Fetch text from current Plan
    Admin_PanelPage.Verify text from current plan after changing subscription       Debut BETA Promo
    Generic.Click on the profile name
    Admin_PanelPage.Select option from profile list
    Sleep   ${yop_sleep}
    Admin_PanelPage.click on confirm button to change plan     Confirm
    SubscriptionPage.Select plan of subscription
    SubscriptionPage.Set asset range to     200
    SubscriptionPage.Update the payment of changed plan    proceed
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    Generic.Click on the profile name
    Generic.Select option from profile list     billing-dropdown
    Generic.Verify your current page location contains      billing
    Admin_PanelPage.Fetch text from current Plan
    Admin_PanelPage.Verify text from current plan after changing subscription       Premium