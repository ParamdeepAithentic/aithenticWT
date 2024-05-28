*** Settings ***
Documentation   Contains all test cases of Login API page
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

#Suite Setup    Get Current Date and Time
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link


*** Test Cases ***
Testone
    Generic.Fix the column number
    Generic.Fix the row number

Login as End_user with different roles
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      enduser@yopmail.net    Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Subscriber
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## ACCOUNT MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    accountmanager@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       accountmanager@yopmail.net
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    close window
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Account Manager
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

################################################# ASSET READER ############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    assetreader@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       assetreader@yopmail.net
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
    Generic.Verify your current page location contains      dashboard
    LoginPage.Wait until i_icon is visible
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Asset Reader
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message
###################################################### ASSET USER ######################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    assetuser@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       assetuser@yopmail.net
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
    Generic.Verify your current page location contains      dashboard
    LoginPage.Wait until i_icon is visible
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Asset User
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message
####################################### ASSET MANAGER ####################################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    assetmanagerr123@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       assetmanagerr123@yopmail.net
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
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Asset Manager
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message
####################################### ADMIN ###########################################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    adminnn123@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       adminnn123@yopmail.net
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
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Admin
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message
################################### CSPM ###############################################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    cspm12@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       cspm12@yopmail.net
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
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    CSPM
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message