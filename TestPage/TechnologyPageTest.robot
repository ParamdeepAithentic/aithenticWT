*** Settings ***
Documentation   Contains all test cases of Technology page
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QALicense
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}



Fill the technology form for hardware product
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAMaintenance
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QASubscription
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
#    TechnologyPage.Verify that after saving technology form user redirect to technology page
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Create new asset with new brand and product
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       ${generated_BrandName}
    #           TechnologyPage.Click technology product input field
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
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
#    TechnologyPage.Search by assignee      Testqaup94590327 QA
#    TechnologyPage.Search by SerialNo   ${generated_serialNo}       #yet to cover


Restore asset type one
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QASubscription
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}


Restore asset from removed asset details page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QASubscription
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.Select an option from recovery table actions    Restore
    Generic.Fetch alert message text and compare it with        Assets restored successfully.
    TechnologyPage.Click on manage technology sub option       Technology List
    TechnologyPage.Search by AssetId   ${generated_AssetID}



################# Still have to work on this testcase ###############
Restore asset by selecting checkbox
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QASubscription
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       Panasonic
    TechnologyPage.Click technology product input field
    TechnologyPage.Select the first value of To dropdown of product
    TechnologyPage.Select edited technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    TechnologyPage.Accept updated edited technology pop up     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully


Sent Message should show in the Sent Tab
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAMaintenance
    TechnologyPage.Click on add location
    sleep       3
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
#    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on add department
    TechnologyPage.Create unique department name random
    TechnologyPage.Select department cost center     1300
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    TechnologyPage.Add assignment information department name      ${generated_DepartmentNumber}
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}

Add new Technology- Add New Assignee and assign that Assignee
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
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

Add new Technology- Add New support-partner and assign that support partner
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.Click on refresh location icon
    TechnologyPage.Add assignment information location     ${generated_buildingname}
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully


Edit Technology Page - Add New Department and assign that Department
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    TechnologyPage.Click on update button of edit_technology page     Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully

Edit Technology Page - Add New Supplier and assign that Supplier
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327 QA
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

Verify all i-icon of Technology page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on i-icon of technology tab
    Generic.Verify pop-up is visible after clicking on i-icon
    TechnologyPage.Click on Link inside pop-up of technology
    sleep   ${yop_sleep}
    switch window       Technology Overview - Jira Service Management
    Generic.Verify your current page location contains      servicedesk
    Generic.Verify your current page contains this text     Technology Overview
    sleep   ${yop_sleep}
    switch window       aithentic | Technology - List
    TechnologyPage.Click on i-icon of technology tab
    TechnologyPage.click on add technology button
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      QAHardware
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on i-icon of cost_center in add technology
    Generic.Verify pop-up is visible after clicking on i-icon
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on i-icon of cost_center in edit technology
    Generic.Verify pop-up is visible after clicking on i-icon
    TechnologyPage.Click on i-icon of cost_center in edit technology
    TechnologyPage.Click on Back tab          Back to Technology Details
    TechnologyPage.Click on clone button on product details page        Clone
    TechnologyPage.Click on i-icon of cost_center in clone technology
    Generic.Verify pop-up is visible after clicking on i-icon
    TechnologyPage.Click on Back tab          Back to Manage Technology