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
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      enduser@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Sleep    ${search_sleep}
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

Login as Manufacturer with different roles
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      manufacturer@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Manufacturer Subscriber
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## MANUFACTURER ACCOUNT MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    manufactureraccountmanager@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       manufactureraccountmanager@yopmail.net
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
######################################## MANUFACTURER COMMUNICATION MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    manufacturercommunication@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       manufacturercommunication@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Communication Manager
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message
######################################## MANUFACTURER ADMIN #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    manufactureradmin@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       manufactureradmin@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Manufacturer Admin
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## MANUFACTURER PRODUCT MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    manufacturerproduct@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       manufacturerproduct@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Product Manager
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message


Login as Supplier with different roles
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      supplier@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Supplier Subscriber
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## SUPPLIER ACCOUNT MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    supplieraccountmanager@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       supplieraccountmanager@yopmail.net
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
######################################## SUPPLIER ADMIN #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    supplieradmin@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       supplieradmin@yopmail.net
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
    LoginPage.Verify the logged_in user should be     Supplier Admin
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

Login as Support_Partner with different roles
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      supportpartner@yopmail.net    Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains    personal-profile
    LoginPage.Get text of role field from profile personal details
    LoginPage.Verify the logged_in user should be    Support Subscriber
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## Support ACCOUNT MANAGER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    supportaccountmanager@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       supportaccountmanager@yopmail.net
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

######################################## Support Asset support #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    assetsupport@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       assetsupport@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Asset Support
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## Support ADMIN #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    supportadmin@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       supportadmin@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Support Admin
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message

######################################## Support MANAGAER #############################################################
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    supportmanager@yopmail.net    Test@123
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       supportmanager@yopmail.net
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
    LoginPage.Verify the logged_in user should be    Support Manager
    Generic.Click on the profile name
    Generic.Select other option from profile list    Logout
    Generic.Fetch log_out alert message