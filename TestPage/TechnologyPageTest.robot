*** Settings ***
Documentation   Contains all test cases of Technology page
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
${self_searchId} =   AssetID_1803536655

*** Test Cases ***

Free the asset limit
    [Tags]      Smoke     Sanity      Time      rerun       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Run the remove asset journey



Fill the technology form for license product
    [Tags]      Time        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add random technology product version
    TechnologyPage.Add random technology product edition
    TechnologyPage.Add random technology hostOn
    TechnologyPage.Add random technology idKey
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment

    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add contract Id of contract information random
    TechnologyPage.Add cost each of contract information random
    TechnologyPage.Add chargeable basis of contract information self      User
    TechnologyPage.Add max contracted of contract information random
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



Fill the technology form for hardware product
    [Tags]      Sanity      Smoke       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Fill the technology form for maintenance product
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815324
#    TechnologyPage.Add technology group information contract start date
#    TechnologyPage.Add technology group information contract end date      12/12/2028
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Fill the technology form for subscription product
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815277
#    TechnologyPage.Add technology group information contract start date
#    TechnologyPage.Add technology group information contract end date     12/12/2028
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Open Ended Contract
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Create new asset with new brand and product
    [Tags]      Sanity      Smoke       Time        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL     qwerty
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    DashboardPage.Verify Brand added      ${generated_BrandName}

    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    Generic.Wait until table get load
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
#    sleep       1500
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology

    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Search by BrandName   ${generated_BrandName}
    TechnologyPage.Search by ProductName   ${generated_product}
#    TechnologyPage.Search by assignee      Testqaup94590327      QA
#    TechnologyPage.Search by SerialNo   ${generated_serialNo}       #yet to cover

Restore asset type one
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815324
#    TechnologyPage.Add technology group information contract start date
#    TechnologyPage.Add technology group information contract end date    12/12/2028
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Open Ended Contract
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

    TechnologyPage.Click on manage technology sub option       Technology List

    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Removed Assets

    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}


Restore asset from removed asset details page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_2727984358
#    TechnologyPage.Add technology group information contract start date
#    TechnologyPage.Add technology group information contract end date      12/12/2028
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Open Ended Contract
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

    TechnologyPage.Click on manage technology sub option       Technology List

    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}



################# Still have to work on this testcase ###############
Restore asset by selecting checkbox
    [Tags]    Smoke     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
#    TechnologyPage.Add technology group information contract start date
#    TechnologyPage.Add technology group information contract end date      12/12/2028
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option        Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}



######## UN comment when to use ##############
#Remove asset by self search
#
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.select the option from the side menu    Technology
#    Generic.Verify your current page location contains      technology
#    Search and remove asset     ${self_searchId}
#    Select an option from technology table actions      Remove
#    Remove asset from technology table
#    Fetch alert message text and compare it with        Technology Removed Successfully
#    Click on manage technology sub option           Removed Assets
#    Search by AssetId      ${self_searchId}
#    Select and restore asset
#    Fetch alert message text and compare it with        Assets restored successfully.
#    Search by AssetId      ${self_searchId}


Edit brand and product via details
    [Tags]     Smoke        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
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
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click on cross icon of product while editing technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Select edited technology lifecycle status      Active
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on update button of edit_technology page       Update
    TechnologyPage.Accept updated edited technology pop up     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Sent Message should show in the Sent Tab
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
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
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Verify assetID is visible       ${generated_AssetID}
    TechnologyPage.Click on the specific tab    messages
    TechnologyPage.Click on compose message button     Compose Message
    TechnologyPage.Click on TO of compose message
    TechnologyPage.Select the first value of To dropdown of compose message
    TechnologyPage.Select compose message status       Public
    TechnologyPage.Enter subject of compose message        Subject message
    TechnologyPage.Enter message body of compose message       Message body
    TechnologyPage.Click on the send button of compose message
    Generic.Fetch alert message text and compare it with        Message sent successfully
    TechnologyPage.Verify subject of recent added email        ${get_messageSubjectValue}
    TechnologyPage.Verify message body of recent added email       ${get_messageBodyValue}


Add Products with 10 combinations of Tech Type and Tech group
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Hardware
    DashboardPage.Select product technology group     Accessories
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
    #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      License
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      License
    DashboardPage.Select product technology group     Cameras & Camcorders
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Subscription
    DashboardPage.Select product technology group     Car Audio & Video
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Subscription
    DashboardPage.Select product technology group     Home Audio
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Maintenance
    DashboardPage.Select product technology group     Communication
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Maintenance
    DashboardPage.Select product technology group     CRT TVs
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Virtual Machines
    DashboardPage.Select product technology group     DVD / TV Combos
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}
     #---------------------------------------------------------------------------------------
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      QABrand555
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type      Virtual Machines
    DashboardPage.Select product technology group     Displays & Projectors
    DashboardPage.Select product status       Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added        ${generated_product}


Add Technology Page - Add New location and assign that location
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter unique location name random
    TechnologyPage.Save the new added location         save
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_location}

    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}

    TechnologyPage.Click on add assign to
    TechnologyPage.Create unique assign to first name random
    TechnologyPage.Create unique assign to last name random
    MemberPage.Enter business email of assigned users
    TechnologyPage.Create unique assign to employee_ID random
    TechnologyPage.Save the assign to      save
    Generic.Fetch alert message text and compare it with       Assigned Users created successfully

Add New Support Partner and Assign that Partner
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
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
#    TechnologyPage.Add support partner of partners information     QABusiness04191432
#    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details


    TechnologyPage.Select tab under technology details      partners
    TechnologyPage.Click on assign partner button under technology details page        Assign Partner

    TechnologyPage.Click here to add support partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Technology - Details
    TechnologyPage.Wait till support partner get auto polute        ${generate_BusinessName}
#    sleep       10
    TechnologyPage.Click here to add supplier partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    Switch Window       aithentic | Technology - Details
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Submit the assign partner form       Submit
    Generic.Fetch alert message text and compare it with        Partners updated successfully
    TechnologyPage.Verify that support partner is added in partner association      Support Partner
    TechnologyPage.Verify that supplier partner is added in partner association     Supplier




Add New Support Partner and Assign that Partner via technology form only
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
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

    TechnologyPage.Click here to add support partner via technology form
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till support partner get auto polute        ${generate_BusinessName}
    TechnologyPage.Click here to add supplier partner via technology form
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}

    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details

    TechnologyPage.Select tab under technology details      partners
    TechnologyPage.Verify that support partner is added in partner association      Support Partner
    TechnologyPage.Verify that supplier partner is added in partner association     Supplier

Verify the history of added technology
    [Tags]      Sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
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
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details

    TechnologyPage.Select tab under technology details      partners
    TechnologyPage.Click on assign partner button under technology details page        Assign Partner

    TechnologyPage.Click here to add support partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Technology - Details
    TechnologyPage.Wait till support partner get auto polute        ${generate_BusinessName}
#    sleep       10

    TechnologyPage.Click here to add supplier partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    Switch Window       aithentic | Technology - Details
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Submit the assign partner form       Submit
    Generic.Fetch alert message text and compare it with        Partners updated successfully

    TechnologyPage.Select tab under technology details      history
    TechnologyPage.Verify area changed under history tab     Supplier

    TechnologyPage.Verify area changed under history tab      Support Partner

    TechnologyPage.Verify area changed under history tab       Created At
    TechnologyPage.Confirm area changed with view under history tab      Created At
    TechnologyPage.Close the view history pop up
    TechnologyPage.Select tab under technology details      parent-components

    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Parent assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      history
    TechnologyPage.Verify area changed under history tab       New Parent
    TechnologyPage.Select tab under technology details      components
    TechnologyPage.Click on add new entry component button under technology details page       Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
#    TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Component assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      history
    TechnologyPage.Verify area changed under history tab        New Component

#Upload the new attachment file
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.select the option from the side menu    Technology
#    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
#    Generic.Verify your current page location contains      addtechnology
#    TechnologyPage.Click technology brand input field
#    TechnologyPage.Select parameter from brand dropdown list       QABrand555
#    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
#    TechnologyPage.Add assetID for technology lifecycle information random
#    TechnologyPage.Click on save technology form button
#    Generic.Fetch alert message text and compare it with        Technology created successfully
#    TechnologyPage.Click on save technology form pop button
#    Generic.Verify your current page location contains      technology
#    TechnologyPage.Search by AssetId       ${generated_AssetID}
#    TechnologyPage.Click on the first row of the technology table
#    Generic.Verify your current page location contains     technology-details
#
#    TechnologyPage.Select tab under technology details      attachments
#    TechnologyPage.Upload File under technology attachments tab
#    TechnologyPage.Click on upload button under technology history tab
#    sleep       50000


Add Technology Page - Add New Supplier and support partner and assign them
    [Tags]     Sanity       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click the add here link on supplier to add new supplier
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Click the add here link on support to add new support partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till support partner get auto polute        ${generate_BusinessName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Add new Technology- Add New Location and assign that location
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Add new Technology- Add New Department and assign that department
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Add new Technology- Add New Assignee and assign that Assignee
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Click on add assign to
    TechnologyPage.Create unique assign to first name random
    TechnologyPage.Create unique assign to last name random
    TechnologyPage.Create unique assign to Business_email random     ${generated_assignFname}        yopmail
    TechnologyPage.Create unique assign to employee_ID random
    TechnologyPage.Save the assign to      save
    Generic.Fetch alert message text and compare it with       Assigned Users created successfully
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Add new Technology- Add New support-partner and assign that support partner
    [Tags]     Sanity       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click the add here link on support to add new support partner
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till support partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Add new Technology- Add New Supplier and assign that supplier
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click the add here link on supplier to add new supplier
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Edit Technology Page - Add New location and assign that location
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   Albania
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      8
    TechnologyPage.Enter room of the location       27
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Berat District
    TechnologyPage.Select city of location      Banaj
    TechnologyPage.Enter Zip_code       203061
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Edit - Technology
#    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully


Edit Technology Page - Add New Department and assign that Department
    [Tags]     Smoke        Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Edit Technology Page - Add New Assignee and assign that Assignee
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on add assign to
    TechnologyPage.Create unique assign to first name random
    TechnologyPage.Create unique assign to last name random
    TechnologyPage.Create unique assign to Business_email random     ${generated_assignFname}        yopmail
    TechnologyPage.Create unique assign to employee_ID random
    TechnologyPage.Save the assign to      save
    Generic.Fetch alert message text and compare it with       Assigned Users created successfully
    TechnologyPage.Add assignment information assign to       ${generated_assignFname}      ${generated_assignLname}
    TechnologyPage.Click on update button of edit_technology page     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Edit Technology Page - Add New Supplier and assign that Supplier
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click the add here link on supplier to edit new supplier
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Edit - Technology
    TechnologyPage.Wait till supplier partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Click on update button of edit_technology page     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Edit Technology Page - Add New Support Partner and assign that Support Partner
    [Tags]      Sanity     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click the add here link on support to edit new support
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL      ${generate_BusinessName}
    PartnersPage.Select partner country       United States
    TechnologyPage.Click contact main save button
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Edit - Technology
    TechnologyPage.Wait till support partner get auto polute       ${generate_BusinessName}
    TechnologyPage.Click on update button of edit_technology page     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Technology Details- Verify the Location Details
    [Tags]      sanity      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   United States
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      6
    TechnologyPage.Enter room of the location       30
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Alaska
    TechnologyPage.Select city of location      Akutan
    TechnologyPage.Enter Zip_code       67540
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Click on add assign to
    TechnologyPage.Create unique assign to first name random
    TechnologyPage.Create unique assign to last name random
    TechnologyPage.Create unique assign to Business_email random     ${generated_assignFname}        yopmail
    TechnologyPage.Create unique assign to employee_ID random
    TechnologyPage.Save the assign to      save
    Generic.Fetch alert message text and compare it with       Assigned Users created successfully
    TechnologyPage.Add assignment information assign to        ${generated_assignFname}  ${generated_assignLname}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully

    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details

    TechnologyPage.Click on Location tab of technology- list page
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     LocationName
    TechnologyPage.verify Text from Assignment Information     ${assign_loc_input_value}          United States - ${generated_buildingname} - 6 - 30
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     DepartmentName
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}       ${generated_DepartmentNumber}
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     AssignTo
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}       ${generated_assignFname} ${generated_assignLname}
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     EmployeeId
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}       ${generate_employeeid}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on Location tab of technology- list page
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     LocationName
    TechnologyPage.verify Text from Assignment Information      ${assign_loc_input_value}         United States - Test qa Up50260220 - 21 - 2
    Generic.Verify your current page contains this text     Past Location
    TechnologyPage.Verify parameter from past location table    ${generated_buildingname}

Technology-Inactive asset and Restore asset
    [Tags]      smoke           Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     chirag@dmts.fr.nf    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     500
    SubscriptionPage.Set asset range to     100
    SubscriptionPage.Set asset range to     200
    SubscriptionPage.Update the payment of changed plan     proceed
    TechnologyPage.Click on pop up of available Inactive Asset   cancel
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     100
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on asset limit exceeded pop up
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on proceed button of technology list page
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     200
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on pop up of available Inactive Asset       technology
    Generic.Verify your current page location contains      manage-technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
#    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Select and restore asset
    Generic.click on the button     Restore
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     100
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on asset limit exceeded pop up
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on proceed button of technology list page
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful

Inactive asset - Restore asset from Technology Details page
    [Tags]      smoke       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     chirag@dmts.fr.nf    Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     500
    SubscriptionPage.Set asset range to     200
    SubscriptionPage.Update the payment of changed plan     proceed
    TechnologyPage.Click on pop up of available Inactive Asset   cancel
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful      ############
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     100
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on asset limit exceeded pop up
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on proceed button of technology list page
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     200
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on pop up of available Inactive Asset      cancel
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful
    Generic.select the option from the side menu    Technology
    TechnologyPage.Click on manage technology sub option      Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Removed Assets
    Generic.Wait until table get load
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on restore button of technology Details Page
    TechnologyPage.Click on back to list of technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    Generic.Click on the profile name
    Generic.Select option from profile list     subscription-dropdown
    Generic.Verify your current page location contains      subscription
    SubscriptionPage.Select if you want to change plan or asset    Change Plan
    TechnologyPage.Click on current plan of subscription
    Generic.Scroll the page till    200
    SubscriptionPage.Set asset range to     100
    SubscriptionPage.Update the payment of changed plan     proceed
    Sleep   ${yop_sleep}
    TechnologyPage.Click on asset limit exceeded pop up
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId      ${generated_AssetID}
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on proceed button of technology list page
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful

Verify the technology data while applying agent Filters
    [Tags]      Unstable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Create random unique serial number
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains   aad
    I_iconPage.Choose tab under Discovery Assets       network-discovery
    OCS.Click on newly discovered tab under network discovery
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    Apple Inc
    OCS.Click on the down arrow icon of discovered asset
    Generic.Scroll Window To End
    OCS.Mouse Hover over searched Discovered Assets
    OCS.Get Tagname by hovering over discovered assets    Tag:
    OCS.Select any Discovered asset
    OCS.Click on search icon of discovery assets
    OCS.Click on search icon of Existing assets
    OCS.Enter text to search existing asset    ${generated_AssetID}
    OCS.Click on the down arrow icon of existing assets
    Generic.Scroll Window To End
    OCS.Mouse Hover over searched existing assets
    OCS.Verify searched existing asset    ${generated_AssetID}
    OCS.Select any existing asset
    OCS.Click on search icon of Existing assets
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Choose filter from Technology Page       Agent
    TechnologyPage.Select checkbox from Agent Filters       Assets with Agent
    Generic.Wait until table get load
    TechnologyPage.Verify that Agent column should contain text     ${hover_tagname}
    TechnologyPage.Select checkbox from Agent Filters       Assets without Agent
    Generic.Wait until table get load
    TechnologyPage.Verify that Agent column should contain text     -
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Click on the attachment tab under technology
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on attachment tab
    TechnologyPage.Upload file       Image_01.jpg       Image_02.png        Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    Sleep    ${search_sleep}
    TechnologyPage.Download the file by clicking on download icon over file    .jpg
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .jpg
    Switch Window       Main
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Generic.Verify your current page contains this text    Dummy PDF file
    Switch Window       Main
    TechnologyPage.Download the file by clicking on download icon over file    .jpg
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .jpg
    Switch Window       Main



Upload file: Image and Document files while adding Technology
    [Tags]    Smoke     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    Generic.Scroll Window To End
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Generic.Verify your current page contains this text    Dummy PDF file
    Switch Window       Main
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button

Upload file: Image and Document files while Edit Technology
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Upload file      Image_01.jpg       Image_02.png
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    Generic.Scroll Window To End
    TechnologyPage.Remove the document by clicking on cross-icon    .png
    TechnologyPage.Upload file      Image_02.png    Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    Generic.Scroll Window To End
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Generic.Verify your current page contains this text    Dummy PDF file
    Switch Window       Main
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Upload file: Image and document files while Clone the Technology
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on clone button on techonology details page       Clone
    Generic.Verify your current page location contains      clone-addtechnology
    TechnologyPage.Add assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    Generic.Scroll Window To End
    TechnologyPage.View the file by clicking on view icon over file     .jpg
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Generic.Verify your current page contains this text    Dummy PDF file
    Switch Window       Main
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button

Search with brand_product_technologytype_technologygroup on advanced search
    [Tags]     Sanity       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click on advanced search button link under add technology
    TechnologyPage.Click technology advanced brand input field
    TechnologyPage.Select parameter from advanced brand dropdown list        Lenovo
    Generic.click on the button     Search
    sleep      ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Fetch the Brand Name from the brand field
    TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
    TechnologyPage.Click on advanced search button link under add technology
    Generic.click on the button     Reset Filters
    TechnologyPage.Click technology advanced technology type and group input field  advaceType
    TechnologyPage.Select parameter from advanced technology type dropdown list     advaceType       Hardware
    Generic.click on the button     Search
    sleep       ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Fetch the technology type from the technology type field
    TechnologyPage.verify Text from Assignment Information      Hardware       ${Technology_type}
    TechnologyPage.Click on advanced search button link under add technology
    Generic.click on the button     Reset Filters
    TechnologyPage.Click technology advanced technology type and group input field    advaceGroup
    TechnologyPage.Select parameter from advanced technology type dropdown list     advaceGroup     Applications
    TechnologyPage.Enter product in the product input field     Xampp
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the technology group row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Get text of technology group inside add technology
    TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
    TechnologyPage.Click on advanced search button link under add technology
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter product in the product input field     Vishal luthra
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of product inside add technology
    TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter description in the description input field     Aithentic Description
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of description inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter feature in the description input field     Aithentic Feature
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Get text of feature inside add technology
    TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter input in the not containing product field     Product_0033761232
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click on advanced search button link under add technology
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter input in the not containing description field       Product Description
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click on advanced search button link under add technology
    Generic.click on the button     Reset Filters
    TechnologyPage.Enter input in the not containing feature field      Product feature
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
    Generic.Scroll Window To End
    Generic.click on the button     Select
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology

Search Technnology with Product Version
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add random technology product version
    TechnologyPage.Add random technology product edition
    TechnologyPage.Add random technology hostOn
    TechnologyPage.Add random technology idKey
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by Product Version       ${result}
    TechnologyPage.Click on the first row of the technology table
    TechnologyPage.Verify that product version on technology details page


Verify cross icon and reset icon while adding product
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      ZZ123
    TechnologyPage.Click on cross icon of product while editing technology
    TechnologyPage.Verify the invisibility of product after clicking on cross icon
    TechnologyPage.Click on reset icon while adding technology
    TechnologyPage.Verify the invisibility of brand after clicking on reset icon
    TechnologyPage.Verify the invisibility of technology type after clicking on reset icon

Creating technology while creating cancellation notice period and contract end date
    [Tags]      Stable      rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add random technology product version
    TechnologyPage.Add random technology product edition
    TechnologyPage.Add random technology hostOn
    TechnologyPage.Add random technology idKey
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add contract Id of contract information random
    TechnologyPage.Add cost each of contract information random
    TechnologyPage.Add chargeable basis of contract information self      User
    TechnologyPage.Add max contracted of contract information random
    TechnologyPage.Add technology group information contract start date
    TechnologyPage.Add technology group information contract end date      12/12/2028
    TechnologyPage.Enter input in the cancellation notice period field      -9974
    sleep   ${search_sleep}
    TechnologyPage.Verify the validation when entering negative value in cancellation notice period field
    TechnologyPage.Enter input in the cancellation notice period field      656565
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
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Change contract end date      11/12/2028
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      close
    TechnologyPage.Verify pop-up is invisible
    TechnologyPage.Enter input in the cancellation notice period field      -99
    sleep   ${search_sleep}
    TechnologyPage.Verify the validation when entering negative value in cancellation notice period field
    TechnologyPage.Enter input in the cancellation notice period field      100215
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Dispose the technology while adding new brand and product
    [Tags]      Stable      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    TechnologyPage.Select parameter from technology dropdown list      ${generated_product}
    TechnologyPage.Wait until brand loder is invisible
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Disposal
    Generic.Select parameter    Yes
    Generic.Fetch alert message text and compare it with        Status updated successfully
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    Generic.Wait until table get load
    TechnologyPage.Verify status is visible of added technology
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Technology Removed Successfully

Add the technology from profile listing
    [Tags]      Stable      rerun
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     add-technology-dropdown
    Generic.Verify your current page location contains      addtechnology
    PartnersPage.Click here to add link of contract details
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      QABrand555
    TechnologyPage.Add product description via technology
    TechnologyPage.Add product feature via technology
    TechnologyPage.Select product technology type via technology     Hardware
    TechnologyPage.Select product technology group via technology   Applications
    TechnologyPage.Click on save product pop inside technology page
    Generic.Fetch alert message text and compare it with    Product created successfully
    TechnologyPage.Wait until brand loder is invisible
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Technology Removed Successfully

Verify_Asset_ID_Changing_settings_from_Profile_list
    [Tags]      Stable    Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox      yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
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
    TechnologyPage.Wait until brand loder is invisible
    TechnologyPage.Get Inner Text of Brand under product information tab
    TechnologyPage.Get Inner Text of Product under product information tab
    TechnologyPage.Get inner text of description under product information
    TechnologyPage.Get inner text of feature under product information
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Search by BrandName   ${generated_BrandName}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the asset ID checkbox      yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by BrandName   ${generated_BrandName}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Remove
    PartnersPage.Select option from the pop up  Yes
    Generic.Fetch alert message text and compare it with      Technology Removed Successfully

Add Technology: Verify Renewal Date get auto-populate when enter contract end date
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Input current Date
    TechnologyPage.Add technology group information contract end date       ${current_date1}
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    Generic.Scroll the page till    1000
    TechnologyPage.Fetch the date from renewal date in add technology
    TechnologyPage.Compare Renewal date and contract end date in add technology     ${current_date1}        ${fetch_renewal_date}
    TechnologyPage.Input future Date
    TechnologyPage.Change contract end date     ${formatted_future_date}
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Close the warning contract date pop-up
    TechnologyPage.Verify pop-up is invisible
    TechnologyPage.Change contract end date         ${formatted_future_date}
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      close
    TechnologyPage.Verify pop-up is invisible
    TechnologyPage.Change contract end date         ${formatted_future_date}
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      confirm
    Enter input in the cancellation notice period field     2
    Generic.Scroll the page till    1000
    TechnologyPage.Fetch the date from renewal date in add technology
    TechnologyPage.Compare Renewal date and contract end date in add technology     ${formatted_future_date}         ${fetch_renewal_date}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Fetch renewal date from technology details page
    TechnologyPage.Fetch contract end date from technology details page
    TechnologyPage.Compare Renewal date and contract end date on Technology details page

Edit Technology: Verify Renewal Date and contract end date
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Input current Date
    TechnologyPage.Add technology group information contract end date       ${current_date1}
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    Generic.Refresh the existing page
    TechnologyPage.Input current Date
    TechnologyPage.Enter current or future date as renewal date     ${current_date1}
    TechnologyPage.Select technology lifecycle status      Active
    Generic.Scroll the page till    2000
    TechnologyPage.Input future Date
    TechnologyPage.Change contract end date         ${formatted_future_date}
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      close
    TechnologyPage.Verify pop-up is invisible
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Fetch renewal date from technology details page
    TechnologyPage.Fetch contract end date from technology details page
    TechnologyPage.Verify Renewal date and contract end date are not equal    ${details_renewal_date}       ${details_contract_date}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    Generic.Refresh the existing page
    TechnologyPage.Select technology lifecycle status      Active
    Generic.Scroll the page till    2000
    TechnologyPage.Change contract end date         07/25/2024
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      confirm
    TechnologyPage.Fetch the date from renewal date in add technology
    TechnologyPage.Compare Renewal date and contract end date in add technology     ${fetch_renewal_date}           07/25/2024
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Fetch renewal date from technology details page
    TechnologyPage.Fetch contract end date from technology details page
    TechnologyPage.Compare Renewal date and contract end date on Technology details page

Clone Technology: Verify Renewal Date and contract end date
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information        Fixed Length Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Input current Date
    TechnologyPage.Add technology group information contract end date       ${current_date1}
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on clone button on techonology details page       Clone
    Generic.Verify your current page location contains      clone-addtechnology
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Input future Date
    TechnologyPage.Enter current or future date as renewal date     ${formatted_future_date}
    TechnologyPage.Change contract end date      07/25/2024
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      close
    TechnologyPage.Verify pop-up is invisible
    TechnologyPage.Input current Date
    TechnologyPage.Change contract end date     ${current_date1}
    sleep       ${search_sleep}
    TechnologyPage.Verify warning pop-up is visible when change contract end date
    TechnologyPage.Select option from contract end date warning pop-up      confirm
    Enter input in the cancellation notice period field     2
    Generic.Scroll the page till    1000
    TechnologyPage.Fetch the date from renewal date in add technology
    TechnologyPage.Compare Renewal date and contract end date in add technology     ${fetch_renewal_date}     ${current_date1}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Fetch renewal date from technology details page
    TechnologyPage.Fetch contract end date from technology details page
    TechnologyPage.Compare Renewal date and contract end date on Technology details page


Search with hostname on the technology search bar
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    PartnersPage.Click here to add link of contract details
    DashboardPage.Create random productName
    DashboardPage.Add product brand name       QABrand555
    TechnologyPage.Add product description via technology
    TechnologyPage.Add product feature via technology
    TechnologyPage.Select product technology type via technology     Hardware
    TechnologyPage.Select particular technology group via link while adding technology    Notebooks & Accessories
    TechnologyPage.Click on save product pop inside technology page
    Generic.Fetch alert message text and compare it with    Product created successfully
    TechnologyPage.Wait until brand loder is invisible
    TechnologyPage.Add host name for technology group information for hardware random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by hostname       ${result}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Get Value of Host-Name and compare it with    ${result}

Compose reply and remove the message via technology details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email with cool fr nf email
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Refresh the existing page
    Generic.Verify your current page location contains      technology
    sleep       2
    DashboardPage.Click on the notifications icon under dashbaord page
    TechnologyPage.Click on the asset alert option under notifications
    sleep   ${search_sleep}
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     You added Asset ID      ${generated_AssetID}.
    TechnologyPage.Get the text of the recent notification of added assets      You added Asset ID ${generated_AssetID}.
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for   ${generated_TMbusinessEmail}
    sleep       ${search_sleep}
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Generic.click on the button     Verify
    Unselect Frame
    sleep       ${yop_sleep}
    Switch Window       aithentic | Create - Account
    Generic.Verify your current page location contains     create-account
    UserAccount.Enter the password      Test@456
    UserAccount.Confirm the entered password    Test@456
    UserAccount.Click on term and condition checkbox
    UserAccount.Click create account button
    Generic.Fetch alert message text and compare it with       Account created successfully.
    Generic.Verify your current page location contains     auth
    LandingPage.Fill the login Form      ${generated_TMbusinessEmail}    Test@456
    Switch Window    Inbox
    Generic.Refresh the existing page
    Generic.Refresh the existing page
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Click on email of yopmail   OTP Verification.
    Unselect Frame
    Generic.Switch to iframe by ID      ifmail
    Yopmail.Get verification OTP from email    Your passcode is
    sleep       ${yop_sleep}
    Switch Window   aithentic | OTP
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     dashboard
    Generic.Click on the profile name
     Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list   Security
    Generic.Verify your current page location contains  security
    DashboardPage.click on the authentication tab under security
    Generic.Verify your current page location contains     security
    DashboardPage.Click on the checkboxes under auhtentication tab
    Generic.Fetch alert message text and compare it with       Two factor updated successfully
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    TechnologyPage.Click on message tab of technology- list page
    Generic.click on the button     Compose Message
    TechnologyPage.Enter input in the recipient list field under compose message via technology details      ${generated_TMbusinessEmail}
    TechnologyPage.Enter input in the message status field under compose message via technology detail     Public
    DashboardPage.Enter text in the subject field under compose message
    DashboardPage.Enter text in the client message field under compose message
    Generic.click on the button     Send
    Generic.Fetch alert message text and compare it with       Message sent successfully
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Sent
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under sent serach bar     ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form  ${generated_TMbusinessEmail}    Test@456
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep   ${search_sleep}
    DashboardPage.Get the text of the recent notification        New message received from Milan Johar for Asset ${generated_AssetID}
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Inbox
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under inbox serach bar       ${generated_subject}
    Dashboardpage.Click on three dots
    DashboardPage.Click on the reply option to reply the message
    Generic.Verify your current page location contains      reply
    DashboardPage.Enter input in the reply back page
    Generic.click on the button     Send
    Generic.Fetch alert message text and compare it with       Message sent successfully
    Generic.Select parameter      Sent
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under sent serach bar     ${generated_TMFname}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form   debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep   ${search_sleep}
    DashboardPage.Get the text of the recent notification       New message received from ${generated_TMFname} ${generated_Tmlname} for Asset ${generated_AssetID}
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    Generic.Select parameter      Inbox
    Generic.Verify your current page location contains      message
    DashboardPage.Search by subject under inbox serach bar       ${generated_reply}
    DashboardPage.Search by subject under inbox serach bar       ${generated_TMFname}
    DashboardPage.Click on the flag icon to flag the message
    Generic.Fetch alert message text and compare it with       Message flagged successfully
    Dashboardpage.Click on three dots
    DashboardPage.Click on the remove option to remove the message
    Generic.Select parameter        Yes
    Generic.Fetch alert message text and compare it with       Message removed successfully

Download QR for an asset as PNG and SVG
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_0033761232
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on Print QR button
    TechnologyPage.Select option by clicking on Print QR button     PNG File
    TechnologyPage.Confirm to download QR file      Confirm
    TechnologyPage.Click on Print QR button
    TechnologyPage.Select option by clicking on Print QR button     SVG File
    TechnologyPage.Confirm to download QR file      Confirm
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      components
    TechnologyPage.Click on add new entry component button under technology details page       Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Component assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_NewComponent_AssetID}        #${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.click on the three dots inside table of parent tab from tehnology details page
    TechnologyPage.Select option from three-dots from technology details page       Print QR
    TechnologyPage.Select the format to download QR        PNG File
    TechnologyPage.Confirm to download QR file      Confirm
#    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.click on the three dots inside table of parent tab from tehnology details page
    Generic.Scroll Window To End
    TechnologyPage.Select option from three-dots from technology details page       Print QR
    TechnologyPage.Select the format to download QR        SVG File
    TechnologyPage.Confirm to download QR file      Confirm
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Parent assetID for technology lifecycle information random
    Generic.Scroll Window To End
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_NewParentAssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      components
    TechnologyPage.click on the three dots inside table of parent tab from tehnology details page
    TechnologyPage.Select option from three-dots from technology details page       Print QR
    TechnologyPage.Select the format to download QR        PNG File
    TechnologyPage.Confirm to download QR file      Confirm
    TechnologyPage.Scroll the element into view
    TechnologyPage.click on the three dots inside table of parent tab from tehnology details page
    TechnologyPage.Select option from three-dots from technology details page       Print QR
    TechnologyPage.Select the format to download QR        SVG File
    TechnologyPage.Confirm to download QR file      Confirm

Verify notification update location in asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Add assetID for technology lifecycle information random

    TechnologyPage.Select technology lifecycle status      Active

    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
#    TechnologyPage.Select edited technology lifecycle status      Active
    TechnologyPage.Click on add location
    sleep       ${yop_sleep}
    Switch Window       aithentic | Add - Location
    Generic.Verify your current page location contains      add-location
    TechnologyPage.Select country of the location   Albania
    TechnologyPage.Enter building_name of the location
    TechnologyPage.Enter floor of the location      8
    TechnologyPage.Enter room of the location       27
    TechnologyPage.Enter unique address_one of the location
    TechnologyPage.Enter unique address_two of the location
    TechnologyPage.Select state of location     Berat District
    TechnologyPage.Select city of location      Banaj
    TechnologyPage.Enter Zip_code       203061
    LocationPage.Create random IP subnet
    TechnologyPage.Save the new added location         save
    Generic.Verify alertify is visible
    sleep       ${yop_sleep}
    Switch Window       aithentic | Edit - Technology
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on Location tab of technology- list page
    TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     LocationName
    TechnologyPage.verify Text from Assignment Information     ${assign_loc_input_value}          Albania - ${generated_buildingname} - 8 - 27
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     technology-details
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep  ${search_sleep}
    TechnologyPage.Click on the asset alert option under notifications
    sleep  ${search_sleep}
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     You changed location of Asset ID      ${generated_AssetID}.
    TechnologyPage.Get the text of the recent notification of added assets      You changed location of Asset ID ${generated_AssetID}.

Verify_Notification_Update_Asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Add assetID for technology lifecycle information random

    TechnologyPage.Select technology lifecycle status      Active

    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click on cross icon of product while editing technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    TechnologyPage.Select edited technology lifecycle status      Active
    TechnologyPage.Click on update button of edit_technology page       Update
    TechnologyPage.Accept updated edited technology pop up     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    Generic.Refresh the existing page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Click on the notifications icon under dashbaord page
    sleep  ${search_sleep}
    TechnologyPage.Click on the asset alert option under notifications
    sleep  ${search_sleep}
    DashboardPage.Wait until alert is visible in the Recent Notifiation tab     You updated Asset ID      ${generated_AssetID}.
    TechnologyPage.Get the text of the recent notification of added assets      You updated Asset ID ${generated_AssetID}.

Click on the technology group filters and verify it
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     debut@cool.fr.nf   Test@123
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Click on the filters under technology page       Technology Group
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the filters of technology page      Applications
    TechnologyPage.Get the text of selected filter under technology     Applications
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Group      Applications        ${New_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the filters under technology page       Technology Group
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the filters of technology page      Accessories
    TechnologyPage.Get the text of selected filter under technology    Accessories
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Group      Accessories        ${New_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the filters under technology page       Technology Group
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the filters of technology page       CRT TVs
    TechnologyPage.Get the text of selected filter under technology     CRT TVs
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Group       CRT TVs        ${New_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    Generic.Fetch alert message text and compare it with       No additional sub-groups found!
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Tech Type
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the tech typen filters of technology page       Hardware
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Tech Type
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the tech typen filters of technology page       License
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Tech Type
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the tech typen filters of technology page       Subscription
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Tech Type
    Generic.Wait until table get load
    TechnologyPage.Click on the value under the tech typen filters of technology page      Maintenance
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Manufacturers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value      1
    TechnologyPage.Get the text of the value you selected under filter      1
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand       ${random_Namee}        ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Manufacturers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value      2
    TechnologyPage.Get the text of the value you selected under filter      2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand       ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Manufacturers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value      3
    TechnologyPage.Get the text of the value you selected under filter      3
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand       ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Suppliers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value      2
    TechnologyPage.Get the text of the value you selected under filter     2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
     PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Suppliers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value      5
    TechnologyPage.Get the text of the value you selected under filter      5
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
     PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Suppliers
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value     6
    TechnologyPage.Get the text of the value you selected under filter     6
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       SupportPartners
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value    3
    TechnologyPage.Get the text of the value you selected under filter     3
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       SupportPartners
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value    4
    TechnologyPage.Get the text of the value you selected under filter     4
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Partner
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       SupportPartners
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value    5
    TechnologyPage.Get the text of the value you selected under filter     5
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Location
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value    2
    TechnologyPage.Get the text of the value you selected under filter    2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Location      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Location
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value    3
    TechnologyPage.Get the text of the value you selected under filter    3
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Location      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Location
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   6
    TechnologyPage.Get the text of the value you selected under filter    6
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Location      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Brand
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   2
    TechnologyPage.Get the text of the value you selected under filter    2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Brand
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   6
    TechnologyPage.Get the text of the value you selected under filter    6
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Brand
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   7
    TechnologyPage.Get the text of the value you selected under filter    7
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Brand      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Department
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   1
    TechnologyPage.Get the text of the value you selected under filter   1
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Department
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   2
    TechnologyPage.Get the text of the value you selected under filter   2
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Status
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   2
    TechnologyPage.Get the text of the value you selected under filter   2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Status      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Select Status
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value   5
    TechnologyPage.Get the text of the value you selected under filter   5
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    LocationPage.Fetch the country from location filter and click    Status      ${random_Namee}       ${random_Namee}
    Generic.click on the tab        reset filters
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Agent
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value  1
    TechnologyPage.Get the text of the value you selected under filter   1
    Generic.Wait until table get load
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Select the value from the pagination drop down count     500
    PaginationPage.Fetch the selected value of the dropdown     technology
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}
    Generic.Click on the profile name
    Generic.Select other option from profile list     Logout
    Generic.Fetch log_out alert message
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     jasdeep@15963.fr.nf     Paramdeep@112
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Click on the tech type filter under technology       Agent
    Generic.Wait until table get load
    TechnologyPage.Click on the value under filters for selecting random value  2
    TechnologyPage.Get the text of the value you selected under filter   2
    Generic.Wait until table get load
    PaginationPage.Fetch the total count
    PaginationPage.Get count of total rows from Product Dropdown
    TechnologyPage.verify Text from Assignment Information     ${total_table_row_count}         ${total_data_count}

#Zz kill browser
#    [Tags]      Smoke     Sanity      Time      rerun       Stable    yy
#    Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F
#    Run Process    cmd.exe    /C    taskkill /IM python.exe /F

