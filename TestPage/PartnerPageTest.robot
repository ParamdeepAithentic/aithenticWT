*** Settings ***
Documentation   To validate the Login form
Library          SeleniumLibrary
Library           ExcelLibrary
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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot
Resource        ../Pages/Yopmail.robot
Resource        ../Pages/UserAccount.robot
Resource        ../Pages/TwoFactorAuth.robot
Resource        ../Pages/SubscriptionPage.robot
Resource        ../Pages/MessagePage.robot
Resource        ../Pages/LocationPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/RegisterUserPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***

Compose Message invite user test
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   Page Load - Total Load Time of Partner Page      3    ${pageTime}     ${ActualTime}    PageLoad_Time

#-------------------------- PARTNER--------------------------------------------------------------
    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain     ${refresh_Token}

    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  4  ${pageHeading}   Page Load - Total Load Time of Add Partner Page      4    ${pageTime}     ${ActualTime}    PageLoad_Time


    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
#    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States


#-------------------------- CONTACT --------------------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  5  ${pageHeading}   Page Load - Total Page Load Time of Add Contact      5    ${pageTime}     ${ActualTime}    PageLoad_Time

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
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Select option from profile list     Product
    Generic.Verify your current page location contains      product
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   Page Load - Total Load Time of Product Listing Page      6    ${pageTime}     ${ActualTime}    PageLoad_Time

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
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   Page Load - Total Load Time of Product Details pop up      7    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}

#-------------------------- TECHNOLOGY----newely added-------------------------------------------------------
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   Page Load - Total Load Time of Technology Page      8    ${pageTime}     ${ActualTime}    PageLoad_Time


    ${StartTime1} =     Get Current Time in Milliseconds
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   Page Load - Total Load Time of Add Technology Page      9    ${pageTime}     ${ActualTime}    PageLoad_Time

    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generate_BusinessName}
    TechnologyPage.Click technology product input field
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
#-------------------------- CONTRACT-----------------------------------------------------------

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  10  ${pageHeading}   Page Load - Total Load Time of Contracts Page      10    ${pageTime}     ${ActualTime}    PageLoad_Time


    ContractsPage.Click on create new contract button

    ${StartTime1} =     Get Current Time in Milliseconds
    ContractsPage.Select type of contract     Dynamic Contract
    Generic.Verify your current page location contains      generate-contract
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  11  ${pageHeading}   Page Load - Total Page Load Time of Add Dynamic Contracts Page      11    ${pageTime}     ${ActualTime}    PageLoad_Time


    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Main Office - 21 - 2
    ContractsPage.Enter contract permission       Read/Write
    ContractsPage.Select contract start date
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
    ContractsPage.Fetch the contract Brand Name from the row      ${generate_BusinessName}
#--------------------------------------YOP mail -----------------------------------------------------------

    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${generate_PersonName}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Partner Invitation

    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    ${StartTime1} =     Get Current Time in Milliseconds
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       3
    Switch Window       aithentic | Register

    Generic.Verify your current page location contains      register
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  12  ${pageHeading}   Page Load - Total Load Time of Become a Registered Member Page from Yopmail Page      12    ${pageTime}     ${ActualTime}    PageLoad_Time
#----------------------------------REGISTER MEMBER--------------------------------------------------------------

    RegisterMember.Fill first name for partner register member      balwinder
    RegisterMember.Fill last name for partner register member       singh
    RegisterMember.Check the term and condition checkbox
    RegisterMember.Submit the registration form
    Generic.Verify your current page location contains      update-email


    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Email Register Verification Required.
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    ${StartTime1} =     Get Current Time in Milliseconds
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       3
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  13  ${pageHeading}   Page Load - Total Load Time of Create your user account Page from Yopmail Page      13    ${pageTime}     ${ActualTime}    PageLoad_Time

#----------------------------------------USER ACCOUNT---------------------------------------------------
    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Verify your current page location contains     login
    Generic.Fetch alert message text and compare it with       Account created successfully.
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
    sleep       2
    Switch Window   aithentic | OTP
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  14  ${pageHeading}   Page Load - Total Load Time of Two-Factor Authentication Page from Yopmail Page      14    ${pageTime}     ${ActualTime}    PageLoad_Time

    Switch Window   aithentic | Login
    sleep       2
    close window
    sleep       2
    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    ${StartTime1} =     Get Current Time in Milliseconds
    TwoFactorAuth.Click verification button
#--------------------------------------SUBSCRIPTION------------------------------------------------------------
    Generic.Verify your current page location contains     subscription
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
    SubscriptionPage.Enter cardnumber    42424242424242420424242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh

    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox

    ${StartTime1} =     Get Current Time in Milliseconds
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
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

    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts-list
#    ContractsPage.Fetch the contract ID from the row
    ContractsPage.Click on the first tab row
    Generic.Verify your current page location contains      view-smartshare
    ContractsPage.Save the contract details     Accept
    ContractsPage.Select the contract form pop up checkboxes
    ContractsPage.Save the contract pop up details
    Generic.Fetch alert message text and compare it with       Status updated successfully
    Generic.Verify your current page location contains      view-smartshare-details
#---------------------------------------------LOGOUT-------------------------------------------
    Generic.Click on the profile name
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Select option from profile list     Logout
    Generic.Verify your current page location contains      login
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  19  ${pageHeading}   Page Load - Total Page Load Time of Login Page from Logout Page      19    ${pageTime}     ${ActualTime}    PageLoad_Time

    LandingPage.Fill the login Form      ${email}    ${valid_password}

#-------------------------- ADD NEW CONTACT----------------------------------------------------
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Search by business name    ${generate_BusinessName}
    sleep       2
    PartnersPage.Click first row of table
    PartnersPage.Click on edit button
    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person
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
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time    20  ${pageHeading}   Page Load - Total Page Load Time of Message Page      20    ${pageTime}     ${ActualTime}    PageLoad_Time
#-------------------------- ADD TEAM MEMBER------------------------------------------------------

    MessagePage.Select side option from message list    Compose
    MessagePage.Enter contract ID   ${fetch_contract_ID}
    MessagePage.Enter asset ID      ${generated_AssetID}
    MessagePage.Enter Recipient list    ${generate_PersonName}
    MessagePage.Select compose message pop up option    yes

    sleep       3
    Switch Window   aithentic | Add - Member

    Generic.Verify your current page location contains      addmembers
    MessagePage.Enter team member last name     phelps
    MessagePage.Enter team member department ID     Customer Support
    MessagePage.Enter team member location      Main Office
    MessagePage.Save team member        save
    Generic.Verify alert message of add team member of compose message    Email sent successfully
    sleep       3
    Switch Window   aithentic | Message - Compose

    MessagePage.Select message status       public
    MessagePage.Enter message subject       This message is of compose message subject
    MessagePage.Enter message details       This message is of compose message description
    MessagePage.Save compose message        send
    Generic.Fetch alert message text and compare it with    Message sent successfully
    Generic.Verify your current page location contains      sent

#-------------------------- verigy new added contcat ---------------

    Generic.Open new window     yopmail
    Generic.Search yopmail emails for       ${generate_PersonName}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Team Member Invitation
    Unselect Frame

    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on sign In button in yopmail email
    Unselect Frame
    sleep       3
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account


    UserAccount.Enter the password      Paramdeep@112
    UserAccount.Confirm the entered password    Paramdeep@112
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button


    Generic.Verify your current page location contains     login


    Generic.Fetch alert message text and compare it with       Account created successfully.
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
    sleep       2
    Switch Window   aithentic | OTP
    Switch Window   aithentic | Login
    sleep       2
    close window
    sleep       2
    Switch Window   aithentic | OTP

    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button

    Generic.Verify your current page location contains     asset-overview
#--------------------------------------------END-----------------------------------------------------------



######## UN comment when to use ##############
#test2
#    Generic.Open new window     yopmail
#    Generic.Search yopmail emails for       qsed@yopmail.com
#    Generic.Switch to iframe by ID      ifinbox
#    Yopmail.Click on email of yopmail
#    Unselect Frame
#
#
#    Generic.Switch to iframe by ID      ifmail
#
#    Yopmail.Get verification OTP from email     Your passcode is
#    TwoFactorAuth.Enter the otp     ${passcode}
#    TwoFactorAuth.Click verification button























