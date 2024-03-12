*** Settings ***
Documentation   Contains all keyword of  Dashboard page
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


Test Setup      open the browser with the url
Test Teardown   Close Browser session

*** Variables ***

*** Test Cases ***
Product Bulk import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Products
    Generic.Verify your current page location contains      add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_import       Brand    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep       ${yop_sleep}
    Switch Window       aithentic | Product - List
    Bulk_Import_ExportPage.Verify product added using bulk_import_export   ${generated_addProductName}

Product Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Products
    Generic.Verify your current page location contains      add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_import       Brand    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Switch Window       aithentic | Product - List
    Bulk_Import_ExportPage.Verify product added using bulk_import_export   ${generated_addProductName}
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Edit - Products
    Generic.Verify your current page location contains      product-bulk-edit
    Bulk_Import_ExportPage.Enter the new value in the product name column in bulk_edit     ProductId
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_edit       BrandName    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_edit        ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       TechType    1
    Generic.Click on the button     Check Data
    Generic.Click on the button     Update      #Check Data,Edit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    Sleep       ${yop_sleep}
    Switch Window       aithentic | Product - List
    Bulk_Import_ExportPage.Click on Refresh icon of product-list page
    Bulk_Import_ExportPage.Verify product added using bulk_import_export   ${generated_EditProductName}

Department Bulk Import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department-list
    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains     add-department-grid
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_import     department_name
    Bulk_Import_ExportPage.Select option from department status column in bulk_import      status
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep       ${yop_sleep}
    Switch Window       aithentic | Department - List
    Bulk_Import_ExportPage.Verify department added using bulk_import_export   ${generated_addDepartmentName}

Department Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department-list
    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains     add-department-grid
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_import     department_name
    Bulk_Import_ExportPage.Select option from department status column in bulk_import      status
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep       ${yop_sleep}
    Switch Window       aithentic | Department - List
    Bulk_Import_ExportPage.Verify department added using bulk_import_export   ${generated_addDepartmentName}
    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains     department-bulk-edit
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_edit     department_name
    Bulk_Import_ExportPage.Select option from department status column in bulk_edit      DepartmentStatus
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_edit     costCenter
    Generic.Click on the button     Check Data
    Generic.Click on the button     Update      #Check Data,Edit,Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${yop_sleep}
    Switch Window       aithentic | Department - List
    Bulk_Import_ExportPage.Verify department added using bulk_import_export     ${generated_EditDepartmentName}

Add Product Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Click add product button
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      Getac
    DashboardPage.Add product description
    DashboardPage.Add product feature
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    DashboardPage.Select product status   Active
    DashboardPage.Save added product details
    Generic.Fetch alert message text and compare it with        Product created successfully
    DashboardPage.Verify product added    ${generated_product}
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Edit - Products
    Generic.Verify your current page location contains      product-bulk-edit
    Bulk_Import_ExportPage.Enter the new value in the product name column in bulk_edit      ProductId
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_edit       BrandName    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_edit        ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       TechType       1
    Generic.Click on the button     Update      #Check Data,Edit
    MemberPage.Confirm the exit import process pop appers
    sleep   ${search_sleep}
    Generic.Click on the button     Confirm
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${yop_sleep}
    Switch Window       aithentic | Product - List
    Bulk_Import_ExportPage.Verify product added using bulk_import_export    ${generated_EditProductName}

Add Department Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department-list
    DashboardPage.Click on action button
    DashboardPage.Click on add department
    DashboardPage.Create unique department name random
    DashboardPage.Select department cost center     1300
    DashboardPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    DashboardPage.Verify department added       ${generated_DepartmentNumber}
    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains      department-bulk-edit
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_edit     department_name
    Bulk_Import_ExportPage.Select option from department status column in bulk_edit       DepartmentStatus
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_edit     costCenter
    Generic.Click on the button     Check Data
    Generic.Click on the button     Update      #Check Data,Edit      #Check Data,Edit,Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Department - List
    Bulk_Import_ExportPage.Verify department added using bulk_import_export     ${generated_EditDepartmentName}

Location Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      add-location
    LocationPage.Select location country     United States
    LocationPage.Select location building name   Trump tower
    LocationPage.Select location floor   second
    LocationPage.Select location room    203
    LocationPage.Select location address one     this address one of the location
    LocationPage.Select location address two     this address two of the location
    LocationPage.Select location state       Texas
    LocationPage.Select location city        Austin
    LocationPage.Select location zip     147001
    LocationPage.Enter random cost center value
    LocationPage.Create random location name
    LocationPage.Create random IP subnet
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    Bulk_Import_ExportPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on Location action button
    LocationPage.Select the option from action menu      edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Edit - Locations
    Generic.Verify your current page location contains      location-bulk-edit
    LocationPage.Select option from country column       Country
    Bulk_Import_ExportPage.Enter the new value in the building name column     BuildingName        Phelps tower
    Bulk_Import_ExportPage.Enter the new value in the floor number column      Floor       first
    Bulk_Import_ExportPage.Enter the new value in the room number column       Room        303
    Bulk_Import_ExportPage.Enter the new value in the state column    State        Kassrine
    Bulk_Import_ExportPage.Enter the new value in the city column     City         Tabursuq
    Bulk_Import_ExportPage.Perform the keyboard action      City
    Bulk_Import_ExportPage.Enter random zip code of bulk import of loaction     Zip
    Bulk_Import_ExportPage.Perform the keyboard action      Zip
    Bulk_Import_ExportPage.Enter the new value of cost center in location bulk edit     CostCenter
    Bulk_Import_ExportPage.Perform the keyboard action      CostCenter
    Bulk_Import_ExportPage.Enter the new value in the location name column     LocationTypeName
    Bulk_Import_ExportPage.Perform the keyboard action       LocationTypeName
    Bulk_Import_ExportPage.Create random IP subnet in location bulk import      IPSubnets
    Bulk_Import_ExportPage.Perform the keyboard action        IPSubnets
    Generic.Click on the button     Check Data
    Generic.Click on the button     Update      #Check Data,Edit
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep      ${search_sleep}
    Switch Window       aithentic | Location - List
    Bulk_Import_ExportPage.Search by location name     ${generated_NewLocationName}

Assigned Users Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      asset-overview
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  23  ${pageHeading}   Page Load - Total Page Load Time of Team Members     23    ${pageTime}     ${ActualTime}    PageLoad_Time

    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Click on assigned user action button
    MemberPage.Choose the option from the action menu   Add Assignee
    MemberPage.Create random assignee first name
    MemberPage.Create random assignee last name
    MemberPage.Create random assignee email
    MemberPage.Create random assignee ID
    MemberPage.Save the add assignee    save
    Generic.Fetch alert message text and compare it with        Assigned Users created successfully
    Bulk_Import_ExportPage.Search assigned user by first and last name    ${generated_assigneeFname} ${generated_assigneeLname}
    MemberPage.Click on assigned user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep      ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains      assignee-bulk-edit
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Update      #Check Data
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Member - List
    Bulk_Import_ExportPage.Search assigned user by first and last name    ${generated_assigneeFname} ${generated_assigneeLname}
    Bulk_Import_ExportPage.Search by empID  ${generated_assigneeEmpID}

Team Member Bulk Edit
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Team Members
    MemberPage.Click on team member action button
    MemberPage.Choose the option from the action menu   Add Member
    Generic.Verify your current page location contains      addmembers
    MemberPage.Enter team member first name
    MemberPage.Enter team member last name
    MemberPage.Enter team member business email
    TeamMemberPage.Enter the Position in member form        QA
    MemberPage.Enter team member department     Do not Delete this Department
    MemberPage.Enter team member location    United States - Main Office - 21 - 2
    MemberPage.Enter team member role   Admin
    TeamMemberPage.Create random employee id
    Generic.Enter phone number      India   +91     9646289871
    MemberPage.Save new team member form    save
    sleep   ${search_sleep}
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    Bulk_Import_ExportPage.Search team member by first and last name   ${generate_teamMember_FirstName} ${generate_teamMember_LastName}
    MemberPage.Click on team member user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep     ${yop_sleep}
    Switch Window       aithentic | Edit - Members
    Generic.Verify your current page location contains      member-bulk-edit
    Bulk_Import_ExportPage.Enter random employee id of bulk import      EmployeeId
    Bulk_Import_ExportPage.Enter the new value of team member in the phone number column    MobileNo
    Bulk_Import_ExportPage.Enter the new value of team member in the email column      Email
    Bulk_Import_ExportPage.Enter the new value of team member in the department column      DepartmentName
    Bulk_Import_ExportPage.Perform the keyboard action      DepartmentName
    Bulk_Import_ExportPage.Enter the new value of team member in the location column        LocationName
    Bulk_Import_ExportPage.Perform the keyboard action      LocationName
    Bulk_Import_ExportPage.Enter the new value of team member in the role column     UserRoleName
    Bulk_Import_ExportPage.Perform the keyboard action      UserRoleName
    Generic.Click on the button     Update
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Member - List
    Bulk_Import_ExportPage.Search team member by first and last name    ${generate_teamMember_FirstName} ${generate_teamMember_LastName}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Technology Bulk edit
    [Tags]       sanity
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815277
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add cost type of technology cost information         Open Ended Contract
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    sleep   ${search_sleep}
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on action button of technology
    TechnologyPage.Click on Bulk_edit under action button
    sleep     ${yop_sleep}
    switch window     aithentic | Edit - Assets
    Generic.Verify your current page location contains      technology-bulk-edit
    Bulk_Import_ExportPage.click on the arrow of product    Product Information     2
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    ModelProductName_1     Product_2589283776
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    Brand      BrandName2556763617
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    TechnologyGroup      Applications
    Bulk_Import_ExportPage.Select the new value of technology group in bulk edit of technology    TechnologyType      Hardware
    Bulk_Import_ExportPage.click on the arrow of product    Product Information     1
    Bulk_Import_ExportPage.Enter the new value of asset id of bulk edit of technology   AssetId
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information     2
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit        Status
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     2
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    LocationTypeName_1
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    DepartmentName
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    AssignedName
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     2
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit        SupportPartnerName_1
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit        SupplierName
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    2
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPartnerName      Dell
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostTypeName      Purchased
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPeriod      Once
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostCenter      123456
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    1
    Generic.Click on the button     Check data      #Update,Edit
    Generic.Click on the button     Update
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Technology - List
    TechnologyPage.Search by AssetId       ${generated_assetidbulkedit}

Team member Bulk Import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on team member action button
    MemberPage.Choose the option from the action menu   Bulk Import
    sleep     ${yop_sleep}
    switch window     aithentic | Member - Import
    Generic.Verify your current page location contains      add-member-grid
    Bulk_Import_ExportPage.Enter the new value of first name in bulk import of team member      FirstName
    Bulk_Import_ExportPage.Enter the new value of last name in bulk import of team member       LastName
    Bulk_Import_ExportPage.Enter random employee id of bulk import      EmployeeId
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CountryCode     1
    Bulk_Import_ExportPage.Enter the new value of team member in the phone number column        MobileNo
    Bulk_Import_ExportPage.Enter the new value of team member in the email column       BusinessEmail
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       DepartmentName      3
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       MemberLocation      3
    Bulk_Import_ExportPage.Perform the keyboard action      MemberLocation
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       MemberRole     2
    Bulk_Import_ExportPage.Perform the keyboard action      MemberRole
    Bulk_Import_ExportPage.Enter position and title of team member bulk import      QA
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Member - List
    TeamMemberPage.Search Team Member by name       ${generated_Firstname}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated

Assigned User Bulk Import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Team Members
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Choose the option from the action menu   Bulk Import
    sleep     ${yop_sleep}
    switch window     aithentic | Data-Wizard
    Generic.Verify your current page location contains      add-assignee-grid
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Member - List
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Search assigned user by first name   ${generated_assigneeFname}
    Generic.Wait until table get load

Location Bulk Import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Select the option from action menu      import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Locations
    Generic.Verify your current page location contains      add-location-grid
    LocationPage.Select option from country column       Country
    Bulk_Import_ExportPage.Enter the new value in the building name column     BuildingName        Phelps Tower
    Bulk_Import_ExportPage.Enter the new value in the floor number column      Floor      1
    Bulk_Import_ExportPage.Enter the new value in the room number column       Room        204
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress1      This is address1
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress2      This is address2
    Bulk_Import_ExportPage.Enter the new value in the state column    State       Berat District
    Bulk_Import_ExportPage.Enter the new value in the city column     City        Banaj
    Bulk_Import_ExportPage.Enter random zip code of bulk import of loaction     Zip
    Bulk_Import_ExportPage.Enter the new value of cost center in location bulk edit     CostCenter
    Bulk_Import_ExportPage.Enter the new value in the location name column     LocationTypeName
    Bulk_Import_ExportPage.Perform the keyboard action      LocationTypeName
    Bulk_Import_ExportPage.Create random IP subnet in location bulk import      IPSubnets
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish         #Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Location - List
    Generic.Verify your current page location contains      locationlist
    Bulk_Import_ExportPage.Search by location name   ${generated_NewLocationName}
    Generic.Wait until table get load

Technology Bulk import
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on checkbox under technology bulk import
    Generic.click on the button     Next
    Generic.Verify your current page location contains     add-technology
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import       Brand        QABrand555
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import     Product        Product_00337612322
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      ItemTechCount         1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload is prepared
    Generic.click on the button     Next
    Generic.Verify your current page location contains     add-technology-templates
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       LocationName        1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       DepartmentName        1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       AssignTo        1
    Bulk_Import_Exportpage.Enter the new value of asset id of technology bulk import      AssetId
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Status        1
    Bulk_Import_ExportPage.Perform the keyboard action      Status
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PurchaseOrderNo         25
    Bulk_Import_ExportPage.Perform the keyboard action      PurchaseOrderNo
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import     PurchaseDt         01/21/2021
    Bulk_Import_ExportPage.Perform the keyboard action      PurchaseDt
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import     WarrantyEndDt         03/23/2025
    Bulk_Import_ExportPage.Perform the keyboard action      WarrantyEndDt
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      Comment         Testing
    Bulk_Import_ExportPage.Perform the keyboard action      Comment
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      CostType        Purchased
    Bulk_Import_ExportPage.Perform the keyboard action      CostType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPartner        testqa 20Feb
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentType        FixedPayment
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPeriod      Monthly
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPeriod
    Bulk_Import_Exportpage.Select option from technology type column in bulk_edit      BudgetCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      BudgetPaymentValue      2500
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetPaymentValue
    Bulk_Import_Exportpage.Select option from technology type column in bulk_edit      ActualPaymentCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      ActualPaymentCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastActualPaymentValue      2000
    Bulk_Import_ExportPage.Perform the keyboard action      LastActualPaymentValue
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CostCenter        1
    Bulk_Import_ExportPage.Perform the keyboard action      CostCenter
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Perform the keyboard action      Supplier
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Bulk_Import_ExportPage.Perform the keyboard action      SupportPartner
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_21
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_2      Capex
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_2
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_9      Account123
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_9
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_3      1654
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_3
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_4      1100
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_7      100
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_7
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_8      12
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_8
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      RenewalDate      02/11/2024
    Bulk_Import_ExportPage.Perform the keyboard action      RenewalDate
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastPaymentDate     03/12/2024
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload Successful
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Technology - List
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Search by AssetId       ${generated_assetid}
    Generic.Wait until table get load