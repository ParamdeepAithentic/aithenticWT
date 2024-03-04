*** Settings ***
Documentation   Contains all test cases of Contracts page
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
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
######## UN comment when to use ##############
#Fill contract form
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.select the option from the side menu    Contracts
#    Generic.Verify your current page location contains      contracts
#    ContractsPage.Click on create new contract button
#    ContractsPage.Select type of contract     Dynamic Contract
#    Generic.Verify your current page location contains      generate-contract
#    ContractsPage.Enter contract type      SmartShare_Manufacturer
#    ContractsPage.Enter contract with     BusinessName60338
#    ContractsPage.Enter contract brand    BusinessName60338
#    ContractsPage.Enter contract location      United States - Main Office - 21 - 2
#    ContractsPage.Enter contract permission       Read/Write
#    ContractsPage.Select contract start date
#    ContractsPage.Select contract end date      12/12/2028
#    ContractsPage.Select contract function       Dynamic
#    ContractsPage.Click preview selection button on contact
#    ContractsPage.Enter contract description comment      Enter comment for contract description.
#    ContractsPage.Enter contract name     Person_61918
#    ContractsPage.Select the checkboxes
#    ContractsPage.Save create contract button
#    ContractsPage.Save contract modal     Create Contract
#    Generic.Fetch alert message text and compare it with        Contract created successfully
#    ContractsPage.Search by contract BrandName      BusinessName60338



Technology Auto removed from dynamic contract When edit Brand and product
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

#-------------------------- PARTNER--------------------------------------------------------------
#    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain

    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner


    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
#    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States

    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person

#    PartnersPage.Enter contact business email    ${generate_PersonName}      ${generate_BusinessName}
    PartnersPage.Enter contact business email    ${generate_PersonName}     ${generate_BusinessName}
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}

    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
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
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}

#--------------------------------- Technology ----------------------------------------------------

    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generate_BusinessName}
#    TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       ${generated_product}
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
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
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


    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts


    ContractsPage.Click on create new contract button

    ContractsPage.Select type of contract     Dynamic Contract
    Generic.Verify your current page location contains      generate-contract

    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Test qa Up50260220 - 21 - 2
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
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Fetch the contract Brand Name from the row      ${generate_BusinessName}

#----------------------------------------- EDIT TECHNOLOGY -------------------------------------

    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list     Product_0033761232
    TechnologyPage.Select edited technology lifecycle status      Active

    Generic.Scroll Window To End
    sleep   ${yop_sleep}
    TechnologyPage.Click on save technology form button
    sleep       ${search_sleep}

    TechnologyPage.Accept updated edited technology pop up     Update
    TechnologyPage.Click on technology Acknowledgement pop up      Acknowledge
    Generic.Fetch alert message text and compare it with        Technology updated successfully

#-----------------------------    CONTRACT -------------------------------------

    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Click on the first tab row    ${generate_BusinessName}
    ContractsPage.Verify technology is null






Technology Auto removed from static contract When edit Brand and product
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

#-------------------------- PARTNER--------------------------------------------------------------
#    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain

    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner


    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
#    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States

    PartnersPage.Click on contact person button
    PartnersPage.Enter random contact person

#    PartnersPage.Enter contact business email    ${generate_PersonName}      ${generate_BusinessName}
    PartnersPage.Enter contact business email    ${generate_PersonName}     ${generate_BusinessName}
#    PartnersPage.Choose contact country      India   +91     9646289871
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      United States - Main Office - 21 - 2
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generate_BusinessName}



    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
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
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}

#--------------------------------- Technology ----------------------------------------------------

    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generate_BusinessName}
    TechnologyPage.Select parameter from technology dropdown list        ${generated_product}
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
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
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


    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts


    ContractsPage.Click on create new contract button

    ContractsPage.Select type of contract     Static Contract
    Generic.Verify your current page location contains      generate-contract

    ContractsPage.Enter contract type      SmartShare_Manufacturer
    ContractsPage.Enter contract with     ${generate_BusinessName}
    ContractsPage.Enter contract brand    ${generate_BusinessName}
    ContractsPage.Enter contract location      United States - Test qa Up50260220 - 21 - 2
    ContractsPage.Enter contract permission       Read/Write
    ContractsPage.Select contract start date
    ContractsPage.Select contract end date      12/12/2028
    ContractsPage.Select contract function       Static
    ContractsPage.Click preview selection button on contact

    Generic.Verify your current page location contains      select-assets
    ContractsPage.Click on generate contract button on select asset page        Generate Contract

    Generic.Verify your current page location contains      createcontract
    ContractsPage.Wait until PDF is loaded properly

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

#----------------------------------------- EDIT TECHNOLOGY -------------------------------------

    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list        QABrand555
    TechnologyPage.Select parameter from technology dropdown list     Product_0033761232
    TechnologyPage.Select edited technology lifecycle status      Active
    Generic.Scroll Window To End
    sleep   ${yop_sleep}
    TechnologyPage.Click on save technology form button
    sleep   ${search_sleep}

    TechnologyPage.Accept updated edited technology pop up     Update
    TechnologyPage.Click on technology Acknowledgement pop up      Acknowledge
    Generic.Fetch alert message text and compare it with        Technology updated successfully

#-----------------------------    CONTRACT -------------------------------------

    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts
    ContractsPage.Search by contract BrandName      ${generate_BusinessName}
    ContractsPage.Click on the first tab row    ${generate_BusinessName}
    ContractsPage.Verify technology is null

