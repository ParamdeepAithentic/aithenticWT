*** Settings ***
Documentation   Contains all test cases of Member page
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

Test Setup      open the browser with the url
Test Teardown   Close Browser session



*** Variables ***




*** Test Cases ***
Register new user
    [Tags]      Smoke       Time
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  25  ${pageHeading}   Page Load - Total Page Load Time of Register Page      25    ${pageTime}     ${ActualTime}    PageLoad_Time
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
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.click on the authentication tab under security
    Generic.Verify your current page location contains     security
    DashboardPage.Click on the checkboxes under auhtentication tab
    Generic.Fetch alert message text and compare it with       Two factor updated successfully


########################### DONT ADD IN PRE PROD #############################
Adding the data in the account
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       deepparam112@yopmail.net    Paramdeep@112
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   no
    DashboardPage.Select the asset ID checkbox      no
#    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      OPMR815309
    TechnologyPage.Method 1     OPMR815309
    TechnologyPage.Get new product     OPMR815309     License     Applications
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      OPMR815274
    TechnologyPage.Method 1      OPMR815274
    TechnologyPage.Get new product     OPMR815274     Hardware     Applications
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      OPMR815324
    TechnologyPage.Method 1      OPMR815324
    TechnologyPage.Get new product     OPMR815324      Maintenance     Applications

    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      OPMR815277
    TechnologyPage.Method 1      OPMR815277
    TechnologyPage.Get new product     OPMR815277      Subscription     Applications

    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      Product_665995755
    TechnologyPage.Method 1      Product_665995755
    TechnologyPage.Get new product     Product_665995755      Hardware     Applications

    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      Product_00337612322
    TechnologyPage.Method 1      Product_00337612322
    TechnologyPage.Get new product     Product_00337612322      Hardware     Applications

    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Click on the product field under add technology      Product_0033761232
    TechnologyPage.Method 1      Product_0033761232
    TechnologyPage.Get new product     Product_0033761232      Maintenance     CRT TVs



    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555        #Brand_End_of_Life
    TechnologyPage.Click on the product field under add technology      Product_End_of_Life
    TechnologyPage.Method 1      Product_End_of_Life
    TechnologyPage.Get new product     Product_End_of_Life       Hardware     Applications


    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Click on the product field under add technology      Product_certificate
    TechnologyPage.Method 1      Product_certificate
    TechnologyPage.Get new product     Product_certificate        Certificate     Communication



    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name using statc location     Afgahinsatan
#    Sleep    2
#    Generic.Wait until table get load
    LocationPage.Method 1       Afgahinsatan
    LocationPage.Get new location       Afgahinsatan
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name using statc location      United States - Test qa Up50260220 - 21 - 2

    LocationPage.Method 1        United States - Test qa Up50260220 - 21 - 2
    LocationPage.Get new location       United States - Test qa Up50260220 - 21 - 2
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Search by static department name      TestQA Department Up31840619
    DepartmentPage.Verify the search static department      TestQA Department Up31840619
    DepartmentPage.Get new department          TestQA Department Up31840619
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab under team member      Assigned Users
    MemberPage.Search assigned user by static first name        Testqaup94590327 QA
    MemberPage.Verify the search static member      Testqaup94590327 QA
    MemberPage.Get new assignee     Testqaup94590327      QA     Testqaup94590327@yopmail.com       55954

    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    PartnersPage.Search by static business name   QABusiness04191432
    PartnersPage.Verify the search static support partner       QABusiness04191432
    PartnersPage.Get new support Partner        Support Partner        QABusiness04191432
    PartnersPage.Search by static business name   qabrand10050505
    PartnersPage.Verify the search static support partner       qabrand10050505
    PartnersPage.Get new support Partner        Supplier       qabrand10050505
    PartnersPage.Search by static business name   testqa 20Feb
    PartnersPage.Verify the search static support partner       testqa 20Feb
    PartnersPage.Get new support Partner        Manufacturer       testqa 20Feb


#    Generic.select the option from the side menu    Team Members
#    Generic.Verify your current page location contains      memberslist
#    TeamMemberPage.Click on add team member action button
#    TeamMemberPage.Choose option after clicking on Action button        Add New Member
#    TeamMemberPage.Enter team member first name
#    TeamMemberPage.Enter team member last name
#    Generic.Enter phone number      India   +91     9646289871
#    TeamMemberPage.Enter team member business email
#    TeamMemberPage.Enter the Position in member form        QA
#    TeamMemberPage.Click on team member department
#    TeamMemberPage.Select team member department        DepartmentName0451927202
#    TeamMemberPage.Select team member role     Admin
#    TeamMemberPage.Click on team member location
#    TeamMemberPage.Select team member location with new domain
#    TeamMemberPage.Save the team member form   save
#    Generic.Fetch alert message text and compare it with        Team Member created successfully
#    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
#    TeamMemberPage.verify status of first name in member list     Invited
#    Generic.Click on the profile name
#    Generic.Select logout option from profile list
#    Generic.Fetch log_out alert message
#    Generic.Open new window     yopmail
#    Generic.Refresh the existing page
#    Generic.Search yopmail emails for  ${generated_TMbusinessEmail}
#    sleep       ${search_sleep}
#    Generic.Refresh the existing page
#    Generic.Switch to iframe by ID      ifmail
#    Generic.click on the button     Verify
#    Unselect Frame
#    sleep       ${yop_sleep}
#    Switch Window       aithentic | Create - Account
#    Generic.Verify your current page location contains     create-account
#    UserAccount.Enter the password      Test@456
#    UserAccount.Confirm the entered password    Test@456
#    UserAccount.Click on term and condition checkbox
#    UserAccount.Click create account button
#    Generic.Fetch alert message text and compare it with       Account created successfully.
#    Generic.Verify your current page location contains     auth
#    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
#    Switch Window    Inbox
#    Generic.Refresh the existing page
#    Generic.Refresh the existing page
#    Generic.Switch to iframe by ID      ifmail
#    Yopmail.Click on email of yopmail   OTP Verification.
#    Unselect Frame
#    Generic.Switch to iframe by ID      ifmail
#    Yopmail.Get verification OTP from email    Your passcode is
#    sleep       ${yop_sleep}
#    Switch Window   aithentic | OTP
#    TwoFactorAuth.Enter the otp     ${passcode}
#    TwoFactorAuth.Click verification button
#    Generic.Verify your current page location contains     dashboard
#    Generic.Click on the profile name
#    Generic.Select option from profile list     personal-details
#    Generic.Verify your current page location contains      personal-profile
#    DashboardPage.Select an option from company details side list   Security
#    Generic.Verify your current page location contains  security
#    DashboardPage.click on the authentication tab under security
#    Generic.Verify your current page location contains     security
#    DashboardPage.Click on the checkboxes under auhtentication tab
#    Generic.Fetch alert message text and compare it with       Two factor updated successfully
#    Generic.select the option from the side menu    Messages
#    Generic.Verify your current page location contains      message
#    DashboardPage.Sending message 10 times to the same user



