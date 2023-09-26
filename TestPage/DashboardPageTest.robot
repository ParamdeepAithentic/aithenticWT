*** Settings ***
Documentation     Verify the Dashboard page test
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
Resource        ../Pages/MemberPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Click the option from side drawer

    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer   IT Performance
    Generic.Verify your current page location contains      it-performance

Verify the drawer list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Verify your current page location contains      home
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  24  ${pageHeading}   Page Load - Total Page Load Time of Home Page after login      24    ${pageTime}     ${ActualTime}    PageLoad_Time

    Generic.select the option from the side menu    Dashboard
    Generic.Verify your current page location contains      dashboard
    DashboardPage.Verify the drawer list parameters


Verify the side options list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    DashboardPage.Verify the side option list parameters

click the option from menu
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner

Verify the profile option list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    DashboardPage.Verify the profile option list parameters

Create and verify new brand
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     Brand
    Generic.Verify your current page location contains      brand
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      Australia
    DashboardPage.Save added brand details
    DashboardPage.Click added brand main save button
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Verify Brand added      ${generated_BrandName}



Create a new product with adding new brand
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     Brand
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
    Generic.Select option from profile list     Product
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}


Add Product Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     Product
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      Getac
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product status   Active
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      edit
    sleep   5
    Switch Window       aithentic | Edit - Products
    Generic.Verify your current page location contains      product-bulk-edit
    DashboardPage.Enter the new value in the product name column      ProductId
    DashboardPage.Enter the new value in the brand name column       BrandName    QABrand555
    DashboardPage.Select option from status column        ProductStatus
    DashboardPage.Select option from technology type column       TechType


    Generic.Click on the button     Update      #Check Data,Edit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    Generic.Fetch alert message text and compare it with        Products updated successfully
    MemberPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Exit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    sleep       1
    Switch Window       aithentic | Product - List
    DashboardPage.Verify product added    ${generated_EditProductName}




































