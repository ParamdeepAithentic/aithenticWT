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
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    Generic.Verify your current page contains this text     Partners

#-------------------------- PARTNER--------------------------------------------------------------
#    LoginPage.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain

    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    Generic.Verify your current page contains this text     Add New Partner


    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
#    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States
    sleep   ${search_sleep}


#-------------------------- CONTACT --------------------------------------------------------------
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person
    Generic.Verify your current page contains this text     Contact Person

#    PartnersPage.Enter contact business email    ${generate_PersonName}      ${generate_BusinessName}
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}
#-------------------------- PRODUCT-----newely added---------------------------------------------------------
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Verify your current page contains this text     Added Products

    DashboardPage.Click on action button
    DashboardPage.Click add product button

    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generate_BusinessName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Verify your current page contains this text     Added Products

    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}

#-------------------------- TECHNOLOGY----newely added-------------------------------------------------------
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Verify your current page contains this text     Technology


#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    Generic.Verify your current page contains this text     Add New Technology

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

    Generic.select the option from the side menu    Smart Share
    Generic.Verify your current page location contains      contract
    Generic.Verify your current page contains this text     Smart Share


#    ContractsPage.Click on create new contract button
    Generic.click on the tab        Create New Smart Share
    sleep       ${search_sleep}
    ContractsPage.Select type of contract     Dynamic Smart Share
    Generic.Verify your current page location contains      generate-contract
    Generic.Verify your current page contains this text     Generate New Smart Share


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
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Register

    Generic.Verify your current page location contains      register
    Generic.Verify your current page contains this text     Become a Registered Member
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
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    Generic.Verify your current page contains this text     Create your user account

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

    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    Generic.Verify your current page contains this text     6-digit code
#
#    Switch Window   aithentic | Login
#    sleep       2
#    close window
#    sleep       2
#    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
#--------------------------------------SUBSCRIPTION------------------------------------------------------------
    Generic.Verify your current page location contains     subscription
    Generic.Verify your current page contains this text     Company Name

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

    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment


#-------------------------------------------BILLING-----------------------------------------------------
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420429242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox

    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome

    Generic.Verify your current page contains this text     Watch Now


    Generic.Fetch alert message text and compare it with       Payment Successful


#-------------------------------------------SET UP---------------------------------------------------
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization


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
    Generic.Select logout option from profile list
    Generic.Fetch log_out alert message
    Generic.Verify your current page contains this text      Login

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
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Verify your current page contains this text      Message Box
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
    Generic.Fetch alert message text and compare it with        Partner created successfully
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
    [Tags]      Sanity      rerun
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
    PartnersPage.Select partner country       United States
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Click on add custome business URL icon
    PartnersPage.Create partner random secondary business URL
    PartnersPage.Click contact main save button
    Generic.Verify your current page location contains      partner-listing
    Generic.Fetch alert message text and compare it with        Partner created successfully
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
    Generic.Fetch alert message text and compare it with        Partner created successfully
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    Sleep    ${search_sleep}
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    Sleep    ${search_sleep}
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    Sleep    ${search_sleep}
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    sleep   ${search_sleep}
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    Sleep    ${search_sleep}
    PartnersPage.click on edit icon
    PartnersPage.Add Unique address_one of partner
    PartnersPage.Add new address_two of partner
    PartnersPage.Click on cross-icon for clearing text
    PartnersPage.Select State       Alaska
    PartnersPage.Select City        Akutan
    PartnersPage.Add new zip code of partner     56709
    PartnersPage.Update the partner information
    Generic.Scroll the page till        700
    Sleep    ${search_sleep}
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    Sleep    ${search_sleep}
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
    Sleep    ${search_sleep}
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
    Generic.Fetch alert message text and compare it with    Partner created successfully
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
    sleep   ${search_sleep}
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    Generic.Scroll the page till        700
    Sleep    ${search_sleep}
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
    Sleep    ${search_sleep}
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9699897854
    PartnersPage.Enter contact location       Aland Islands
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    Generic.click on the button     Edit
    PartnersPage.click on plus icon to add another business_url
    PartnersPage.Add second business_url        ${generated_BrandName}
    Generic.Scroll the page till        700
    Sleep    ${search_sleep}
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
    Generic.Wait until table get load
    sleep       ${search_sleep}
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count After selecting filter
    PaginationPage.Set pagination to max
    Generic.Wait until table get load for filters
#    PaginationPage.Click on the pagination dropdown     partner-list
#    PaginationPage.Select the value from the pagination drop down count    500


    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Manufacturer        Manufacturer

    Generic.Click on the reset filters link
#    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        Supplier
    Generic.Wait until table get load for filters
    ReportsPage.Fetch the total count After selecting filter
    PaginationPage.Set pagination to max
    Generic.Wait until table get load for filters
#    PaginationPage.Click on the pagination dropdown     partner-list
#    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Supplier        Supplier
    Generic.Click on the reset filters link
#    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        Support Partner
    Generic.Wait until table get load for filters
    ReportsPage.Fetch the total count After selecting filter
    PaginationPage.Set pagination to max
    Generic.Wait until table get load for filters
#    PaginationPage.Click on the pagination dropdown     partner-list
#    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Partner Type        Support Partner        Support Partner
    Generic.Click on the reset filters link
    ReportsPage.Fetch the total count
    PartnersPage.Click on the filters from partner module       Select Partner
    PartnersPage.Checkmark after clicking on the filters        All Partners
    Generic.Wait until table get load for filters
    ReportsPage.Fetch the total count After selecting filter
    PartnersPage.Compare the total count after selecting filter
######################################### STATUS ###############################################################################
    Generic.Click on the reset filters link
    Generic.Wait until table get load for filters
    PartnersPage.Click on the filters from partner module       Select Status

    PartnersPage.Checkmark after clicking on the filters        Active
#    sleep       2

    Generic.Wait until table get load for filters
    ReportsPage.Fetch the total count After selecting filter

    PaginationPage.Set pagination to max
    Generic.Wait until table get load for filters
#    PaginationPage.Click on the pagination dropdown     partner-list
#    PaginationPage.Select the value from the pagination drop down count    500
    PartnersPage.Fetch the selected filter and verify from Table    Status       Active        Active
    Generic.Click on the reset filters link
#    Generic.Refresh the existing page
    PartnersPage.Click on the filters from partner module       Select Status
    PartnersPage.Checkmark after clicking on the filters        Inactive
#    sleep       2
    Generic.Wait until table get load for filters
     ReportsPage.Fetch the total count After selecting filter
    PaginationPage.Set pagination to max
    Generic.Wait until table get load for filters
#    PaginationPage.Click on the pagination dropdown     partner-list
#    PaginationPage.Select the value from the pagination drop down count    500
    ReportsPage.Fetch the total count
    PartnersPage.Fetch the selected filter and verify from Table    Status       Inactive        Inactive
    Generic.Click on the reset filters link
    ReportsPage.Fetch the total count
    PartnersPage.Click on the filters from partner module       Select Status
    PartnersPage.Checkmark after clicking on the filters        All
#    sleep       2
    Generic.Wait until table get load for filters
    ReportsPage.Fetch the total count After selecting filter
    ReportsPage.Fetch the total count After selecting filter
    PartnersPage.Compare the total count after selecting filter

Verify all the validations of Add Partners
    [Tags]      Negative
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
    [Tags]     Negative
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

#Create partner 100 times
#    Generic.click on the tab	    Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.select the option from the side menu    Partners
#    Generic.Verify your current page location contains      partner
#
#    Generic.Verify your current page contains this text     Partners
#
##-------------------------- PARTNER--------------------------------------------------------------
##    LoginPage.Fetch the refresh token from the login api
#    ReplaceDomainAPI.Replace Domain
#    PartnersPage.Create many partners

Verify that user is not able to Deactivate and remove Manufacturer having technology
    [Tags]      Negative
    Generic.click on the tab	Login
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
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    PartnersPage.Click here to add link of contract details
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    TechnologyPage.Add product description via technology
    TechnologyPage.Add product feature via technology
    TechnologyPage.Select product technology type via technology     Hardware
    TechnologyPage.Select product technology group via technology   Applications
    TechnologyPage.Click on save product pop inside technology page
    Generic.Fetch alert message text and compare it with    Product created successfully
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.wait until table get load
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned
    PartnersPage.Select option from the pop up  No
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned

Verify that user is not able to Deactivate and remove Supplier having technology
    [Tags]      Negative
    Generic.click on the tab	Login
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
    PartnersPage.Select partner type of new partner     Supplier
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add supplier of partners information     ${generated_BrandName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.wait until table get load
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned
    PartnersPage.Select option from the pop up  No
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned

Verify that user is not able to Deactivate and remove Support Partner having technology
    [Tags]      Negative
    Generic.click on the tab	Login
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
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add support partner of partners information     ${generated_BrandName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.wait until table get load
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Search by business name    ${generated_BrandName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Deactivate
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned
    PartnersPage.Select option from the pop up  No
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with   You cannot delete or inactivate this partner as you have active contract or technology assigned

Asset Wizard : Verify the validations of add partner
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       -All partners (manufacturer, supplier & support partners)

    Generic.click on the button     Next
    Generic.click on the tab        Add Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    Bulk_Import_ExportPage.Search by business name under asset wizard    ${generate_BusinessName}
    Generic.click on the tab        Add Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generate_BusinessName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with     Partner with same company name and partner type already exists
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
    PartnersPage.Clear the data of the fields while adding partner      Select Country
    PartnersPage.Verify the validations of these fields     Country
    PartnersPage.Compare the Validations on Partner Page        ${Partner_validation1}       Please select Country

#Zz kill browser
 #   Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F