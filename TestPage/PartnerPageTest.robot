*** Settings ***
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

Compose Message invite user test
    [Tags]      Sanity      Smoke       Time
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Generic.Verify your current page contains this text     Partners
    Calculate Running time  3  ${pageHeading}   Page Load - Total load time from clicking partner option from side listing to partner listing page      3    ${pageTime}     ${ActualTime}    PageLoad_Time

#-------------------------- PARTNER--------------------------------------------------------------
#    LoginPage.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain

    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Generic.Verify your current page contains this text     Add New Partner
    Calculate Running time  4  ${pageHeading}   Page Load - Total load time from clicking add partner button from partner listing to add partner page      4    ${pageTime}     ${ActualTime}    PageLoad_Time


    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
#    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States
    sleep   ${search_sleep}


#-------------------------- CONTACT --------------------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Generic.Verify your current page contains this text     Contact Person
    Calculate Running time  5  ${pageHeading}   Page Load - Total load time from clicking add new contact and enter contact person name under add partner      5    ${pageTime}     ${ActualTime}    PageLoad_Time

#    PartnersPage.Enter contact business email    ${generate_PersonName}      ${generate_BusinessName}
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}
#-------------------------- PRODUCT-----newely added---------------------------------------------------------
    Generic.Click on the profile name
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Generic.Verify your current page contains this text     Added Products
    Calculate Running time  6  ${pageHeading}   Page Load - Total load time from clicking product option from profile listing to product listing page      6    ${pageTime}     ${ActualTime}    PageLoad_Time

    DashboardPage.Click on action button
    DashboardPage.Click add product button

    ${StartTime1} =     Get Current Time in Milliseconds
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generate_BusinessName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Verify your current page contains this text     Added Products
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   Page Load - Total load time of filling the add product details form under add product     7    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}

#-------------------------- TECHNOLOGY----newely added-------------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Verify your current page contains this text     Technology
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   Page Load - Total load time from clicking technology option from side listing to technology page listing      8    ${pageTime}     ${ActualTime}    PageLoad_Time


    ${StartTime1} =     Get Current Time in Milliseconds
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    Generic.Verify your current page contains this text     Add New Technology
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   Page Load - Total load time from clicking add new technology option from from action dropdown to add technology      9    ${pageTime}     ${ActualTime}    PageLoad_Time

    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generate_BusinessName}
    TechnologyPage.Select parameter from technology dropdown list      ${generated_product}
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add assignment information location     United States - Main Office - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
#-------------------------- CONTRACT-----------------------------------------------------------

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Smart Share
    Generic.Verify your current page location contains      contract
    Generic.Verify your current page contains this text     Smart Share
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  10  ${pageHeading}   Page Load - Total load time from clicking contract option from side listing to contract page listing      10    ${pageTime}     ${ActualTime}    PageLoad_Time


#    ContractsPage.Click on create new contract button
    Generic.click on the tab        Create New Smart Share
    ${StartTime1} =     Get Current Time in Milliseconds
    ContractsPage.Select type of contract     Dynamic Smart Share
    Generic.Verify your current page location contains      generate-contract
    Generic.Verify your current page contains this text     Generate New Smart Share
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  11  ${pageHeading}   Page Load - Total load time from clicking Dynamic Contract option from pop up to generate new contract page      11    ${pageTime}     ${ActualTime}    PageLoad_Time


    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Main Office - 21 - 2
    ContractsPage.Enter contract permission       Read/Write
    Generic.Fetch Current Date
    ContractsPage.Select contract start date        ${current_date}
    ContractsPage.Select contract end date      12/12/2028
    ContractsPage.Select contract function       Dynamic
    ContractsPage.Click preview selection button on contact
    ContractsPage.Enter contract description comment      Enter comment for contract description.
    ContractsPage.Enter contract name     ${generate_PersonName}
    ContractsPage.Select the checkboxes
    ContractsPage.Save create contract button
    ContractsPage.Save contract modal     Create Contract
    Generic.Fetch alert message text and compare it with        Contract created successfully
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract ID from the row
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract Brand Name from the row      ${generate_BusinessName}

    Generic.Click on the profile name
    Generic.Select logout option from profile list
    Generic.Verify your current page location contains      logout
    Generic.Fetch log_out alert message

#--------------------------------------YOP mail -----------------------------------------------------------

    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       ${generate_PersonName}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Partner Invitation

    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    ${StartTime1} =     Get Current Time in Milliseconds
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Register

    Generic.Verify your current page location contains      register
    Generic.Verify your current page contains this text     Become a Registered Member
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  12  ${pageHeading}   Page Load - Total load time of become a registered member page from yopmail page      12    ${pageTime}     ${ActualTime}    PageLoad_Time
#----------------------------------REGISTER MEMBER--------------------------------------------------------------

    RegisterMember.Fill first name for partner register member      balwinder
    RegisterMember.Fill last name for partner register member       singh
    RegisterMember.Check the term and condition checkbox
    RegisterMember.Submit the registration form
    Generic.Verify your current page location contains      update-email


    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    ${StartTime1} =     Get Current Time in Milliseconds
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    Generic.Verify your current page contains this text     Create your user account
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  13  ${pageHeading}   Page Load - Total load time of Create your user account Page from Yopmail Page      13    ${pageTime}     ${ActualTime}    PageLoad_Time

#----------------------------------------USER ACCOUNT---------------------------------------------------
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth


    LandingPage.Fill the login Form      ${generate_ContactBusinessEmail}    Paramdeep@112
#    Generic.Fetch alert message text and compare it with       OTP sent successfully

    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox

    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail

    ${StartTime1} =     Get Current Time in Milliseconds
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    Generic.Verify your current page contains this text     6-digit code
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  14  ${pageHeading}   Page Load - Total load time of Two-Factor Authentication Page from Yopmail Page      14    ${pageTime}     ${ActualTime}    PageLoad_Time
#
#    Switch Window   aithentic | Login
#    sleep       2
#    close window
#    sleep       2
#    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    ${StartTime1} =     Get Current Time in Milliseconds
    TwoFactorAuth.Click verification button
#--------------------------------------SUBSCRIPTION------------------------------------------------------------
    Generic.Verify your current page location contains     subscription
    Generic.Verify your current page contains this text     Company Name
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  15  ${pageHeading}   Page Load - Total Page Load Time of Subscription page from OTP page     15    ${pageTime}     ${ActualTime}    PageLoad_Time

    SubscriptionPage.Select country of manufacturer profile     United States
    SubscriptionPage.Select state of manufacturer profile   Texas
    SubscriptionPage.Select city of manufacturer profile    Abram
    SubscriptionPage.Input text into manufacturer address one       This is address 1
    SubscriptionPage.Input text into manufacturer address two       This is address 2
    SubscriptionPage.Input text into manufacturer zip code      73301
    SubscriptionPage.Select department of manufacturer profile      Customer Support
    SubscriptionPage.Input text into manufacturer position/title    Agent
    Generic.Scroll Window To End
    SubscriptionPage.Save the manufacturer profile
    Generic.Verify your current page location contains     subscription-menu
    Generic.Fetch alert message text and compare it with       Profile saved successfully

    SubscriptionPage.Select plan of subscription

    ${StartTime1} =     Get Current Time in Milliseconds
    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  16  ${pageHeading}   Page Load - Total Page Load Time of Subscription form page from payment page     16    ${pageTime}     ${ActualTime}    PageLoad_Time


#-------------------------------------------BILLING-----------------------------------------------------
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420429242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox

    ${StartTime1} =     Get Current Time in Milliseconds
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome

    Generic.Verify your current page contains this text     Watch Now

    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  17  ${pageHeading}   Page Load - Total Page Load Time of Billing Payment to Welcome Page      17    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.Fetch alert message text and compare it with       Payment Successful


#-------------------------------------------SET UP---------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  18  ${pageHeading}   Page Load - Total Page Load Time of Complete Setup to Organization Page      18    ${pageTime}     ${ActualTime}    PageLoad_Time


    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

    Generic.select the option from the side menu    Smart Share
    Generic.Verify your current page location contains      contracts-list
#    ContractsPage.Fetch the contract ID from the row
#    ContractsPage.Click on the first tab row    ${generate_BusinessName}
#    sleep   50000
    Generic.Verify your current page contains this text     Create New Smart Share
    ContractsPage.Click on the first tab row of contract list page table
    Generic.Verify your current page location contains      view-smartshare
    ContractsPage.Save the contract details     Accept
    ContractsPage.Select the contract form pop up checkboxes
    ContractsPage.Save the contract pop up details
    Generic.Fetch alert message text and compare it with       Status updated successfully
    Generic.Verify your current page location contains      view-smartshare-details
#---------------------------------------------LOGOUT-------------------------------------------
    Generic.Click on the profile name
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.Verify your current page contains this text      Login
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  19  ${pageHeading}   Page Load - Total Page Load Time of Login Page from Logout Page      19    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
#-------------------------- ADD NEW CONTACT----------------------------------------------------
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Search by business name    ${generate_BusinessName}
    sleep       ${search_sleep}
    PartnersPage.Click first row of table
    PartnersPage.Click on edit button
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact name

    PartnersPage.Enter secondary contact business email    ${generate_PersonName}     yopmail
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      Main Office
    PartnersPage.Save the secondary contact
    PartnersPage.Click on update button
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generate_BusinessName}

#-------------------------- MESSAGE--------------------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Verify your current page contains this text      Message Box
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time    20  ${pageHeading}   Page Load - Total Page Load Time after clicking message option from side menu to Message Page      20    ${pageTime}     ${ActualTime}    PageLoad_Time
#-------------------------- ADD TEAM MEMBER------------------------------------------------------

    MessagePage.Select side option from message list    Compose
    MessagePage.Enter contract ID   ${fetch_contract_ID}
    MessagePage.Enter asset ID      ${generated_AssetID}
    MessagePage.Enter Recipient list    ${generate_PersonName}
    MessagePage.Select compose message pop up option    yes

    sleep       ${yop_sleep}
    Switch Window   aithentic | Add - Member

    Generic.Verify your current page location contains      addmembers
    MessagePage.Enter team member last name     phelps
    Generic.Enter phone number      India   +91     9646289871
    MessagePage.Enter team member department ID     Customer Support
    MessagePage.Enter team member location      Main Office
    MessagePage.Save team member        save
    Generic.Verify alert message of add team member of compose message    Email sent successfully
    sleep       ${yop_sleep}
    Switch Window   aithentic | Message - Compose
#    sleep       50000
    MessagePage.Select message status       public
    MessagePage.Enter message subject       This message is of compose message subject
    MessagePage.Enter message details       This message is of compose message description
    MessagePage.Save compose message        send
    Generic.Fetch alert message text and compare it with    Message sent successfully
    Generic.Verify your current page location contains      sent

#-------------------------- verigy new added contcat ---------------

    Generic.Open new window     yopmail
#    Generic.Search yopmail emails for       ${generate_PersonName}
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       ${generate_SecondaryContactBusinessEmail}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Team Member Invitation
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account


    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth


    LandingPage.Fill the login Form      ${generate_SecondaryContactBusinessEmail}    Paramdeep@112
#    Generic.Fetch alert message text and compare it with       OTP sent successfully

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
#    Switch Window   aithentic | Login
#    sleep       2
#    close window
#    sleep       2
#    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button

    Generic.Verify your current page location contains     dashboard
#--------------------------------------------END-----------------------------------------------------------


Export Specificartner into Excel Doc CSV and TSV for manufacturer
    [Tags]      NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    PartnersPage.Click on add custome business URL icon
#    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    PartnersPage.Click contact main save button
    Generic.Verify your current page location contains      partner-listing
    sleep       5
#    Generic.Fetch alert message text and compare it with        Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Select the partner row      ${generate_BusinessName}
    Generic.Verify your current page location contains      partner-details

    Generic.click on the button     Edit
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Partner updated successfully


Export Specificartner into Excel Doc CSV and TSV for Supplier
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Supplier
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    PartnersPage.Click contact main save button
    Generic.Verify your current page location contains      partner-listing
    sleep       5
#    Generic.Fetch alert message text and compare it with        Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Select the partner row      ${generate_BusinessName}
    Generic.Verify your current page location contains      partner-details

    Generic.click on the button     Edit
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Partner updated successfully




Export Specificartner into Excel Doc CSV and TSV for Support Partner
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Support Partner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    PartnersPage.Click contact main save button
    Generic.Verify your current page location contains      partner-listing
    sleep       5
#    Generic.Fetch alert message text and compare it with        Partner created successfully
    Generic.Wait until table get load
    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    PartnersPage.Search by business name    ${generate_BusinessName}
    PartnersPage.Select the partner row      ${generate_BusinessName}
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with        Partner updated successfully

Add Manufacturer via personal detail under technology and partner
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}


Edit Manufacturer via partner
    [Tags]      Sanity
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select country     United States
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    Generic.click on the button     Add
    Generic.Scroll the page till        500
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    Generic.click on the button     Add
    PartnersPage.Wait for add contact pop up hide
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}


Deactivate Manufacturer via partner
    [Tags]      Sanity
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015           #css:#Zip
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select country     United States
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    Generic.click on the button     Add
    Generic.Scroll the page till        500
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    Generic.click on the button     Add
    PartnersPage.Wait for add contact pop up hide
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully


Activate Manufacturer via partner
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select country     United States
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    Generic.click on the button     Add
    Generic.Scroll the page till        500
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    Generic.click on the button     Add
    PartnersPage.Wait for add contact pop up hide
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Activate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully

Remove Manufacturer from partner
    [Tags]    Sanity   Smoke
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select country     United States
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    Generic.click on the button     Add
    Generic.Scroll the page till        500
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    PartnersPage.Wait for add address pop up hide
    Generic.Scroll the page till    700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    Generic.click on the button     Add
    sleep   ${search_sleep}
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Activate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Partner deleted successfully


View Details and check the details of Contract
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    ReplaceDomainAPI.Replace Domain
    Generic.select the option from the side menu    Partners
    PartnersPage.Click new partner button
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
#   PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States
    PartnersPage.Click on the save button   Save
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name   ${generate_BusinessName}
    Generic.select the option from the side menu    Technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    PartnersPage.Click here to add link of contract details
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generate_BusinessName}
    TechnologyPage.Add product description via technology
    TechnologyPage.Add product feature via technology
    TechnologyPage.Select product technology type via technology     Hardware
    TechnologyPage.Select product technology group via technology   Applications
    TechnologyPage.Click on save product pop inside technology page
    Generic.Fetch alert message text and compare it with    Product created successfully
#    TechnologyPage.Select parameter from technology dropdown list    ${generated_product}
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Renewal Date via technology
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by BrandName      ${generate_BusinessName}
    Generic.select the option from the side menu    Smart Share
    Generic.click on the button link    View Details
    ContractsPage.Click on back to contract link
#    ContractsPage.Click on create new contract button
    Generic.click on the tab        Create New Smart Share
    ContractsPage.Select type of contract     Dynamic Smart Share
    Generic.Verify your current page location contains      generate-contract
    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Main Office - 21 - 2
    ContractsPage.Enter contract permission       Read/Write
    Generic.Fetch Current Date
    ContractsPage.Select contract start date        ${current_date}
    ContractsPage.Select contract end date      12/12/2028
    ContractsPage.Select contract function       Dynamic
    ContractsPage.Click preview selection button on contact
    ContractsPage.Enter contract description comment      Enter comment for contract description.
    ContractsPage.Click on add new contact for this partner link under contract
    PartnersPage.Enter Random Contact Person Via Link
    PartnersPage.Enter contact business email via link    ${generate_contactPersonName}
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location via link      United States - Main Office - 21 - 2
    PartnersPage.Click on save button of contact via link   Save
    Generic.Fetch alert message text and compare it with    Contact created successfully
    PartnersPage.Enter and select contact name via link
    ContractsPage.Select the checkboxes
    ContractsPage.Save create contract button
    ContractsPage.Save contract modal     Create Contract
    Generic.Fetch alert message text and compare it with        Contract created successfully
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract Brand Name from the row      ${generate_BusinessName}
    ContractsPage.Click on the first tab row    ${generate_BusinessName}
    Generic.click on the button     Withdraw
    Generic.Fetch alert message text and compare it with        Status updated successfully
    PartnersPage.Click on back to contracts link via contract
    Generic.Verify your current page location contains  contracts-list
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract Brand Name from the row      ${generate_BusinessName}
    PartnersPage.Verify status after withdraw the contract  Inactive
    ContractsPage.Click on the first tab row    ${generate_BusinessName}
    PartnersPage.Click on the three buttons link of contract via view smart details     Brand
    Generic.Verify your current page location contains    view-contract-brands
    PartnersPage.Verify pages with the element  Brand Name
    PartnersPage.Click on back to contract details button link
    PartnersPage.Click on the three buttons link of contract via view smart details     Locations
    Generic.Verify your current page location contains    view-location
    PartnersPage.Verify pages with the element  Location Name
    PartnersPage.Click on back to contract details button link
    PartnersPage.Click on the three buttons link of contract via view smart details     Technology
    Generic.Verify your current page location contains    technology
    PartnersPage.Verify pages with the element  Item
    PartnersPage.Click on back to contract details button link
    PartnersPage.Download the contract pdf


Add_edit_deactivate_removeSupplier while adding brand
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Supplier
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Zip code Input     24015
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    Generic.Scroll the page till        700
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Iowa
    PartnersPage.Select City        Ackley
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select the partner address country        United States
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State         Arizona
    PartnersPage.Select City         Ajo
    PartnersPage.Add new zip code of partner     15321531
    Generic.click on the button     Add
    PartnersPage.Wait for add address pop up hide
    sleep   ${search_sleep}
    PartnersPage.Click on pencil icon of address and contact under partner   3
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9665654657
    PartnersPage.Enter contact location      United States - Quark city - 12 - 202
    sleep   ${search_sleep}
    PartnersPage.Update the partner information of edit contact
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Activate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Partner deleted successfully

Add_edit_deactivate_removeSupport_partner_while_adding_brand
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Support Partner
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       Australia
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add Unique address_two of partner
    PartnersPage.Select State       Victoria
    PartnersPage.Select City        Albanvale
    PartnersPage.Zip code Input     2659998
    PartnersPage.Save new Address
    Generic.Scroll the page till        700
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9699897854
    PartnersPage.Enter contact location       Aland Islands
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Sleep     5
    #Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    Generic.Scroll the page till        700
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State        Northern Territory
    PartnersPage.Select City         Anula
    PartnersPage.Add new zip code of partner     581515
    PartnersPage.Update the partner information
    sleep   ${search_sleep}
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select the partner address country        Australia
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Select State          South Australia
    PartnersPage.Select City          Albert Park
    PartnersPage.Add new zip code of partner     10012354
    Generic.click on the button     Add
    PartnersPage.Wait for add address pop up hide
    sleep   ${search_sleep}
    PartnersPage.Click on pencil icon of address and contact under partner   3
    PartnersPage.Enter random contact name
    PartnersPage.Enter new_business_email of contact    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9112355987
    PartnersPage.Enter contact location      United States - Quark city - 12 - 202
#    sleep   3s
    PartnersPage.Update the partner information of edit contact
    Generic.click on the button     Update
    Generic.Fetch alert message text and compare it with    Partner updated successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner      Activate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Status updated successfully
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Partner deleted successfully

Partner Side bar Filters
    [Tags]     time     smoke
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Partners
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        Manufacturer
    ReportsPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Select the value from the pagination drop down count    500

    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Manufacturer        Manufacturer
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  14  ${pageHeading}   Filter Page - Data load time of filter select partner under partner page      14    ${pageTime}     ${ActualTime}    Filter_Time

    Generic.Click on the reset filters link
    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        Supplier
    ReportsPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Supplier        Supplier
    Generic.Click on the reset filters link
    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        Support Partner
    ReportsPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Support Partner        Support Partner
    Generic.Click on the reset filters link
    ReportsPage.Fetch the total count
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        All Partners
    ReportsPage.Fetch the total count After selecting filter
    MessagePage.Comapre the total count after selecting filter
######################################### STATUS ###############################################################################
    Generic.Click on the reset filters link
    PartnersPage.Click on the filters from partner module       Select Status

    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Checkmark after clicking on the filters        Active
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  15  ${pageHeading}   Filter Page - Data load time of filter status under partner page      15    ${pageTime}     ${ActualTime}    Filter_Time

    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Status       Active        Active
    Generic.Click on the reset filters link
    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Status
    PartnersPage.Checkmark after clicking on the filters        Inactive
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Select the value from the pagination drop down count    500
    ReportsPage.Fetch the total count
    PartnersPage.Fetch the selected filter and verify from Table    Status       Inactive        Inactive
    Generic.Click on the reset filters link
    ReportsPage.Fetch the total count
    PartnersPage.Click on the filters from partner module       Select Status
    PartnersPage.Checkmark after clicking on the filters        All
    ReportsPage.Fetch the total count After selecting filter
    MessagePage.Comapre the total count after selecting filter

Verify all the validations of Add Partners
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    ReplaceDomainAPI.Replace Domain
    Generic.select the option from the side menu    Partners
    PartnersPage.Click new partner button
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Clear the field of country in add adddress of partner       country
    DashboardPage.Enter the country in the new address when add brand    countryPartner    Albania
    PartnersPage.Clear the field of country in add adddress of partner    country
    DashboardPage.Verify the validation message of Brand_country field when add new address
    PartnersPage.Compare the Validations on Partner Page        ${Country_validation1}           Please Select Country
    PartnersPage.Cancel the pop-ups         addAddressModal
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Save the new contact
    Generic.Fetch alert message text and compare it with        Please enter values to save contact
    PartnersPage.Cancel the pop-ups         addContactModal
    PartnersPage.Clear the data of the fields while adding partner      Select Partner Type
    PartnersPage.Verify the validations of these fields         Partner Type
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation1}      Please select Partner Type
    PartnersPage.Clear the data of the fields while adding partner      Select or Search a Business Name
    PartnersPage.Verify the validations of these fields         Business Name
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation1}       Please select or enter Business Name
    PartnersPage.Clear the data of Partner Business URL
    PartnersPage.Verify the validation of Partner business URL
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation2}       Please select or enter valid Business URL
    PartnersPage.Clear the data of the fields while adding partner      Select Country
    PartnersPage.Verify the validations of these fields     Country
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation1}       Please select Country

Verify all the validations of Edit Partners
    [Tags]      NT
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.Clear the field for edit business URL
    PartnersPage.Verify the validation of Partner business URL while edit partner
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation_URL}       Please select Business URL
#    PartnersPage.Clear the field of country on edit partner
#    PartnersPage.Verify the validations of these fields     Country
#    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation1}       Please select Country
    PartnersPage.Click on Add new Address of partner        Add new Address
    PartnersPage.Select country     United States
    PartnersPage.Edit the country of add new address
    DashboardPage.Verify the validation message of Brand_country field when add new address
    PartnersPage.Compare the Validations on Partner Page        ${Country_validation1}           Please Select Country
    PartnersPage.Select country     United States
    Generic.click on the button     Add
    Generic.Fetch alert message text and compare it with            Address already exists
    PartnersPage.Edit the country of add new address
    PartnersPage.Select country     Albania
    Generic.click on the button     Add
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Add the contact of Edit partner
    Generic.Fetch alert message text and compare it with        Please enter values to save contact.

#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F