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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot
Resource        ../Pages/UnselectAssetAPI.robot


Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***
${self_searchId} =   AssetID_1803536655

*** Test Cases ***

Fill the technology form for license product
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    TechnologyPage.Add chargeable basis of contract information self      User
    TechnologyPage.Add cost each of contract information random
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
    [Tags]      Sanity      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815324
    TechnologyPage.Add technology group information contract start date
    TechnologyPage.Add technology group information contract end date      12/12/2028
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815277
    TechnologyPage.Add technology group information contract start date
    TechnologyPage.Add technology group information contract end date     12/12/2028
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
    [Tags]      Sanity      Smoke     retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create product name random
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
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
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815324
    TechnologyPage.Add technology group information contract start date
    TechnologyPage.Add technology group information contract end date    12/12/2028
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

    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}


Restore asset from removed asset details page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology

    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_2727984358
    TechnologyPage.Add technology group information contract start date
    TechnologyPage.Add technology group information contract end date      12/12/2028
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

    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}



################# Still have to work on this testcase ###############
Restore asset by selecting checkbox
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    TechnologyPage.Select an option from technology table actions      Remove
    TechnologyPage.Remove asset from technology table
    Generic.Fetch alert message text and compare it with        Technology Removed Successfully
    TechnologyPage.Click on manage technology sub option       Removed Assets
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on three dots of action button
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}



######## UN comment when to use ##############
#Remove asset by self search
#
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
#    Click on manage technology sub option       Technology List
#    Search by AssetId      ${self_searchId}


Edit brand and product via details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    TechnologyPage.Save the assign to      save
    Generic.Fetch alert message text and compare it with       Assigned Users created successfully

Add New Support Partner and Assign that Partner
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
#    TechnologyPage.Add support partner of partners information     QABusiness04191432
#    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
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


Verify the history of added technology
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
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
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      history
    TechnologyPage.Verify area changed under history tab        New Component

#Upload the new attachment file
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Add new Technology- Add New support-partner and assign that support partner
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]      Sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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
    [Tags]      sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
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

#Technology Details- Verify the Location Details-2
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.select the option from the side menu    Technology
#    Generic.Verify your current page location contains      technology
#    sleep   6
#    TechnologyPage.Search by AssetId       AssetID_3480632009
#    TechnologyPage.Click on the first row of the technology table
#    Generic.Verify your current page location contains     technology-details
#    TechnologyPage.Click on Location tab of technology- list page
#    TechnologyPage.Get Value of Assignment Information Location Name

Technology-Inactive asset and Restore asset
    [Tags]      smoke   retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     chirag@dmts.fr.nf    Test@001
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
    TechnologyPage.Select and restore asset
    TechnologyPage.Click on proceed button of technology list page
    SubscriptionPage.Select the payment method    ach
    SubscriptionPage.Select the account for payment
    SubscriptionPage.Proceed the payment     proceed
    Generic.Fetch alert message text and compare it with      Payment Successful

Inactive asset - Restore asset from Technology Details page
    [Tags]      smoke      retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     chirag@dmts.fr.nf    Test@001
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
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on restore button of technology Details Page
    TechnologyPage.Click on back to list of technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}
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
    [Tags]    retry
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
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
    Generic.Verify your current page location contains    ocs
    OCS.Hover over searched Discovered Asset
    OCS.Get Tagname by hovering over discovered assets    Tag:
    OCS.Select any Discovered asset
    OCS.Click on search icon of Existing assets
    OCS.Enter text to search existing asset    ${generated_AssetID}
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
    TechnologyPage.Click on the first row of the technology table
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Click on the attachment tab under technology
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    Switch Window       Main
    TechnologyPage.Download the file by clicking on download icon over file    .jpg
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .jpg
    Switch Window       Main



Upload file: Image and Document files while adding Technology
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    Switch Window       Main
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button

Upload file: Image and Document files while Edit Technology
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    Generic.Scroll Window To End
    TechnologyPage.Remove the document by clicking on cross-icon    .png
    TechnologyPage.Upload file      Image_02.png    Document_02.pdf
    Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
    TechnologyPage.View the file by clicking on view icon over file     .png
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
    TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
    TechnologyPage.Click on cross icon to close the document
    TechnologyPage.View the file by clicking on view icon over file     .pdf
    Sleep    ${yop_sleep}
    Switch Window       NEW
    Generic.Verify your current page location contains    amazonaws
    Generic.Verify your current page location contains    .pdf
    Switch Window       Main
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Upload file: Image and document files while Clone the Technology
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    Switch Window       Main
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button

Search with brand_product_technologytype_technologygroup on advanced search
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    Generic.click on the button     Search
    sleep   ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    TechnologyPage.Click on the row of the table inside advanced search
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