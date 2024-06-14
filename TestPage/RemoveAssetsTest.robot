*** Settings ***
Documentation   Contains all keyword of  Department page
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
Resource        ../Pages/LoginPage.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Resource        ../Pages/DepartmentPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/PaginationPage.robot



Test Setup      open the browser with the url
Test Teardown   Close Browser session



*** Test Cases ***
Free the asset limit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard



     Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count


    PaginationPage.Run the remove asset journey         #######################################

    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on plan of subscription        Premium
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     300
    sleep       5
    SubscriptionPage.Update the payment of changed plan     proceed

    Sleep   ${yop_sleep}
    TechnologyPage.Click on pop up of available Inactive Asset      cancel
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful



