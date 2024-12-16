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
Product Bulk import
    [Tags]    Sanity
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    EXCEPT
    Switch Window       aithentic | Product - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Product Bulk Edit
    [Tags]    Sanity
    TRY
     Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Generic.wait for the shadow to get hide from the current screen
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    Sleep       ${yop_sleep}
    Switch Window       aithentic | Product - List
    Bulk_Import_ExportPage.Click on Refresh icon of product-list page
    Bulk_Import_ExportPage.Verify product added using bulk_import_export   ${generated_EditProductName}
    EXCEPT    message
    Switch Window       aithentic | Product - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Department Bulk Import
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Department Bulk Edit
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Add Product Bulk Edit
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Bulk_Import_ExportPage.Verify product added using bulk_import_export    ${generated_product}
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
    EXCEPT
    Switch Window       aithentic | Product - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Add Department Bulk Edit
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Location Bulk Edit
    [Tags]    Sanity
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    LocationPage.Enter input in the IP subnet field     1              192.168.0.0/23
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
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
    Bulk_Import_ExportPage.Perform the keyboard action        IPSubnets
    Generic.Click on the button     Check Data
    Generic.Click on the button     Update      #Check Data,Edit
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep      ${search_sleep}
    Switch Window       aithentic | Location - List
    Bulk_Import_ExportPage.Search by location name     ${generated_NewLocationName}
    EXCEPT
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Assigned Users Bulk Edit
    [Tags]    Sanity     Time    smoke
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  23  ${pageHeading}   Page Load - Total Page Load Time of Team Members Listing     23    ${pageTime}     ${ActualTime}    PageLoad_Time

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
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Team Member Bulk Edit
    [Tags]    Sanity
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    TeamMemberPage.Enter team member business email_yopmail
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
    Generic.Click on the button     Check Data      #Update,Edit
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
    EXCEPT
    Switch window    aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Technology Bulk edit
    [Tags]       sanity
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    TechnologyPage.Renewal Date via technology
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
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    Brand      BrandName2556763617
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    TechnologyGroup      Applications
#    Bulk_Import_ExportPage.Select the new value of technology group in bulk edit of technology    TechnologyType      Hardware
    Bulk_Import_ExportPage.click on the arrow of product    Product Information     1
    Bulk_Import_ExportPage.Enter the new value of asset id of bulk edit of technology   AssetId
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information    2
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      PurchaseDt     03/11/2024
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      RenewalDate      03/11/2025
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      WarrantyEndDt      03/11/2027
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit        Status
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     2
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    LocationTypeName_1
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    DepartmentName
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    AssignedName
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     2
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit        SupportPartnerName_1       1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit        SupplierName           1
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    2
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPartnerName      Dell
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       PaymentPartnerName        1
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostTypeName      Purchased
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPeriod      Once
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostCenter      123456
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    1
    Generic.Click on the button     Check data      #Update,Edit
    Generic.Click on the button     Update
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on confirm warning button after update
    Sleep    ${yop_sleep}
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Technology - List
    TechnologyPage.Search by AssetId       ${generated_assetidbulkedit}4
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Team member Bulk Import
    [Tags]    Sanity
    TRY
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
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Assigned User Bulk Import
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Location Bulk Import
    [Tags]    NT
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
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
    EXCEPT
    Switch Window       aithentic | Location - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Technology Bulk import
    [Tags]    Sanity
    TRY
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
    Bulk_Import_ExportPage.click on checkbox under technology bulk import
    Generic.click on the button     Next
    Generic.Verify your current page location contains     add-technology
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import       Brand        QABrand555
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import     Product        OPMR815274

    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      ItemTechCount         1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text - bulk import tech    Upload       Upload is prepared
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
    Bulk_Import_Exportpage.Enter the new value in cost type field of technology bulk import      CostType        Rented
    Bulk_Import_ExportPage.Perform the keyboard action      CostType
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPartner        testqa 20Feb / for uat and pre prod use this method /
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit      PaymentPartner       1
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentType        FixedPayment
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPeriod      Monthly
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPeriod
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      FirstPaymentDate        02/03/2023
    Bulk_Import_ExportPage.Perform the keyboard action      FirstPaymentDate
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      LastPaymentDate       02/03/2024
    Bulk_Import_ExportPage.Perform the keyboard action      LastPaymentDate
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      RenewalDate      02/11/2024
    Bulk_Import_ExportPage.Perform the keyboard action      RenewalDate
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      BudgetCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      BudgetPaymentValue      2500
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetPaymentValue
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      ActualPaymentCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      ActualPaymentCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastActualPaymentValue      2000
    Bulk_Import_ExportPage.Perform the keyboard action      LastActualPaymentValue
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CostCenter        1
    Bulk_Import_ExportPage.Perform the keyboard action      CostCenter
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Perform the keyboard action      Supplier
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Bulk_Import_ExportPage.Perform the keyboard action      SupportPartner
#    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21
#    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_21
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_2      Capex
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_2
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_9      Account123
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_9
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_3      1654
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_3
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      DYNA_46      Tax123
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_46
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      DYNA_47      Track123
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_47

#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_4      CPU
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_5      Paramdeep
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_5
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_6      Test@123
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_6

    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21



#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_8      12
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_8
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_10      01/01/2023
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_10
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_11     01/01/2024
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_11
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_12     1
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_12
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastPaymentDate     03/12/2024
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload Successful
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Technology - List
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Search by AssetId       ${generated_bulk_import_assetid}
    Generic.Wait until table get load
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END




Verify Bulk Import on the Technology Page by adding all parameters
    [Tags]    Sanity     time   smoke    rerun
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the employee ID checkbox   no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
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
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    Generic.Wait until table get load
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on checkbox under technology bulk import
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import        Any new department names
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Location Names
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       Admin, Asset managers and Asset users.
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Create Brands
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Create Products
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       -All partners (manufacturer, supplier & support partners)
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import        Parent Child components

    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the tab        Add Department
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  6  ${pageHeading}   Asset wizard - Page redirect from setup to department      6    ${pageTime}     ${ActualTime}    AssetWizardPage_Time

    Bulk_Import_ExportPage.Create unique department name random under technology bulk import
#    Bulk_Import_ExportPage.Select department status ynder technology bulk import        Active
    Bulk_Import_ExportPage.Select department cost center under technology bulk import   316546
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    Bulk_Import_ExportPage.Verify department added using bulk_import_export under asset wizard      ${generated_Department_bulk}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the tab        Add Location
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  7  ${pageHeading}   Asset wizard - Page redirect from department to location      7    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    Generic.Verify your current page location contains      addLocation
    LocationPage.Select location country        United States
    LocationPage.Select location building name   Trump tower
    LocationPage.Select location floor   Third
    LocationPage.Select location room    203
    LocationPage.Select location address one     this address one of the location
    LocationPage.Select location address two     this address two of the location
    LocationPage.Select location state       Texas
    LocationPage.Select location city        Austin
    LocationPage.Select location zip     147001
    LocationPage.Enter random cost center value
    LocationPage.Create random location name
    LocationPage.Enter input in the IP subnet field     1           192.168.0.0/23
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    Bulk_Import_ExportPage.Search by location name under technology bulk import    ${generated_location}
#    LocationPage.Fetch the location Name from the row       ${generated_location}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the button     Add Member
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  8  ${pageHeading}   Asset wizard - Page redirect from location to team member      8    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
#    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter team member business email_yopmail
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Create random employee id
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department       ${generated_Department_bulk}
    TeamMemberPage.Select team member role     Admin
    Bulk_Import_ExportPage.Click on team member location technology bulk import     ${generated_location}
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    Bulk_Import_ExportPage.Search Team Member by name under asset wizard       ${generated_TMFname}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the button    Add Brand
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   Asset wizard - Page redirect from team member to brand      9    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    DashboardPage.Create random brandName
    DashboardPage.Create random brandName
    DashboardPage.Add business manufacturer URL       ${generated_BrandName}
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click added brand main save button
    Bulk_Import_ExportPage.Verify Brand added under asset wizard      ${generated_BrandName}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the tab        Add Product
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  10  ${pageHeading}   Asset wizard - Page redirect from brand to product      10    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    DashboardPage.Create random productName
    DashboardPage.Add product brand name      ${generated_BrandName}
    DashboardPage.Add product description via link
    Bulk_Import_ExportPage.Add product feature bulk import
    DashboardPage.Select product technology type     Hardware
    DashboardPage.Select product technology group     Applications
    Bulk_Import_ExportPage.Select product status technology bulk import   Active
    Bulk_Import_ExportPage.Save added product details technology bulk import
    Generic.Fetch alert message text and compare it with        Product created successfully
    Bulk_Import_ExportPage.Verify product added using bulk_import_export under asset wizard     ${generated_product}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.click on the tab        Add Partner
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  11  ${pageHeading}   Asset wizard - Page redirect from product to partners      11    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    Bulk_Import_ExportPage.Select partner business URL technology bulk import
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
    Bulk_Import_ExportPage.Enter contact business email via link under technology bulk import    ${generate_PersonName}      ${generated_BrandURL}
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    Bulk_Import_ExportPage.Search by business name under asset wizard    ${generated_BrandName}
    Generic.click on the tab        Add Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Supplier
    PartnersPage.Select partner business_name     ${generated_BrandName}
    Bulk_Import_ExportPage.Select partner business URL technology bulk import
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
    Bulk_Import_ExportPage.Enter contact business email via link under technology bulk import    ${generate_PersonName}      ${generated_BrandURL}
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    Bulk_Import_ExportPage.Search by business name under asset wizard    ${generated_BrandName}
    Generic.click on the tab        Add Partner
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Support Partner
    PartnersPage.Select partner business_name     ${generated_BrandName}
    Bulk_Import_ExportPage.Select partner business URL technology bulk import
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
    Bulk_Import_ExportPage.Enter contact business email via link under technology bulk import   ${generate_PersonName}      ${generated_BrandURL}
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    Bulk_Import_ExportPage.Search by business name under asset wizard    ${generated_BrandName}
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.Verify your current page location contains     add-technology
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  12  ${pageHeading}   Asset wizard - Page redirect from partners to technology assets      12    ${pageTime}     ${ActualTime}    AssetWizardPage_Time

    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import       Brand        ${generated_BrandName}
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import     Product         ${generated_product}
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      ItemTechCount         1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner       1
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text - bulk import tech    Upload       Upload is prepared
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Generic.Verify your current page location contains     add-technology-templates
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  13  ${pageHeading}   Asset wizard - Page redirect from technology asset grid to technology template      13    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
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
    Bulk_Import_Exportpage.Enter the new value in cost type field of technology bulk import      CostType        Rented
    Bulk_Import_ExportPage.Perform the keyboard action      CostType
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPartner        testqa 20Feb / for uat and pre prod this method /
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit      PaymentPartner       1
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentType        FixedPayment
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPeriod      Monthly
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPeriod
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      FirstPaymentDate        02/03/2023
    Bulk_Import_ExportPage.Perform the keyboard action      FirstPaymentDate
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      LastPaymentDate       02/03/2024
    Bulk_Import_ExportPage.Perform the keyboard action      LastPaymentDate
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      RenewalDate      02/11/2024
    Bulk_Import_ExportPage.Perform the keyboard action      RenewalDate
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      BudgetCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      BudgetPaymentValue      2500
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetPaymentValue
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      ActualPaymentCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      ActualPaymentCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastActualPaymentValue      2000
    Bulk_Import_ExportPage.Perform the keyboard action      LastActualPaymentValue
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CostCenter        1
    Bulk_Import_ExportPage.Perform the keyboard action      CostCenter
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Perform the keyboard action      Supplier
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Bulk_Import_ExportPage.Perform the keyboard action      SupportPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_2      Capex
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_2
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_9      Account123
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_9
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_3      1654
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_3
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      DYNA_46      Tax123
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_46
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      DYNA_47      Track123
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_47
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_5      Paramdeep
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_5
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_6      Test@123
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_6
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21
#    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_21
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_4      CPU
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_7      100
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_7
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_8      12
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload Successful
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Enter the new value in the fields of technology bulk import       ParentId     ${generated_AssetID}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  14  ${pageHeading}   Asset wizard - Page redirect from technology template to allocate component      14    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    sleep   2
    Generic.Click on the button     Check Data      #Update,Edit
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload Successful
    Generic.Fetch alert message text and compare it with    Assets linked successfully
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.Click on the button     Finish
    Bulk_Import_ExportPage.Click on I_m_done button when popup appears     no-im-done
    Sleep      ${yop_sleep}
    Switch Window       aithentic | Technology - List
    Generic.Verify your current page location contains     technology-list
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  15  ${pageHeading}   Asset wizard - Page redirect from allocate component to technology listing      15    ${pageTime}     ${ActualTime}    AssetWizardPage_Time
    TechnologyPage.Search by AssetId       ${generated_bulk_import_assetid}
    Generic.Wait until table get load
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the employee ID checkbox   no
    DashboardPage.Select the employee ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END




Technology bulk import while entering invalid data in payment period field
    [Tags]    NT
    TRY
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
    Bulk_Import_ExportPage.Verify the upload message text - bulk import tech    Upload       Upload is prepared
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
    Bulk_Import_Exportpage.Enter the new value in cost type field of technology bulk import      CostType        Rented
    Bulk_Import_ExportPage.Perform the keyboard action      CostType
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPartner        testqa 20Feb  /   for uat and pre prod this method /
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit      PaymentPartner       1
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentType        FixedPayment
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPeriod      2 years
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPeriod
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      FirstPaymentDate        02/03/2023
    Bulk_Import_ExportPage.Perform the keyboard action      FirstPaymentDate
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      LastPaymentDate       02/03/2024
    Bulk_Import_ExportPage.Perform the keyboard action      LastPaymentDate
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      RenewalDate      02/11/2024
    Bulk_Import_ExportPage.Perform the keyboard action      RenewalDate
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      BudgetCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      BudgetPaymentValue      2500
    Bulk_Import_ExportPage.Perform the keyboard action      BudgetPaymentValue
    Bulk_Import_Exportpage.Select option from budget currency in technology bulk import      ActualPaymentCurrency      1
    Bulk_Import_ExportPage.Perform the keyboard action      ActualPaymentCurrency
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      LastActualPaymentValue      2000
    Bulk_Import_ExportPage.Perform the keyboard action      LastActualPaymentValue
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CostCenter        1
    Bulk_Import_ExportPage.Perform the keyboard action      CostCenter
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       Supplier        1
    Bulk_Import_ExportPage.Perform the keyboard action      Supplier
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       SupportPartner        1
    Bulk_Import_ExportPage.Perform the keyboard action      SupportPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_2      Capex
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_2
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_9      Account123
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_9
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_3      1654
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_3
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_46
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_46
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_47
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_47
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_5      Paramdeep
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_5
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_6      Test@123
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_6
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21
#    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_21
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_4      CPU
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
#
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_7      100
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_7
#
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_8      12

    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   ValidationError       Payment Period is invalid. Please enter valid Payment Type like Once,Monthly,Annual,2 Years,3 Years,4 Years,5 Years,10 Years,Quarterlys
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Click on the confirm button under pop up in technology bulk import
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload failed
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END



Check the payment period alert when entering valid data
    [Tags]       sanity
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    TechnologyPage.Renewal Date via technology
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
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    Brand      BrandName2556763617
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology    TechnologyGroup      Applications
#    Bulk_Import_ExportPage.Select the new value of technology group in bulk edit of technology    TechnologyType      Hardware
    Bulk_Import_ExportPage.click on the arrow of product    Product Information     1
    Bulk_Import_ExportPage.Enter the new value of asset id of bulk edit of technology   AssetId
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information    2
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      PurchaseDt     03/11/2024
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      RenewalDate      03/11/2025
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      WarrantyEndDt      03/11/2027
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit        Status
    Bulk_Import_ExportPage.click on the arrow of product    Technology Lifecycle Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     2
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    LocationTypeName_1
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    DepartmentName
    Bulk_Import_ExportPage.Click on the fields and select value from dropdown of technology bulk edit    AssignedName
    Bulk_Import_ExportPage.click on the arrow of product    Assignment Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     2
   Bulk_Import_ExportPage.Select option from technology type column in bulk_edit        SupportPartnerName_1       1
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit        SupplierName           1
    Bulk_Import_ExportPage.click on the arrow of product    Partners Information     1
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    2
#    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPartnerName      Dell
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       PaymentPartnerName        1
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostTypeName      Purchased
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       PaymentPeriod       10 Years
    Bulk_Import_ExportPage.Enter the new value in the product, brand, group and type value in bulk_edit of technology       CostCenter      123456
    Bulk_Import_ExportPage.click on the arrow of product    Technology Cost Information    1
    Generic.Click on the button     Check data      #Update,Edit
    Generic.Click on the button     Update
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on confirm warning button after update
    Sleep    ${yop_sleep}
    Bulk_Import_ExportPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Finish
    sleep   ${search_sleep}
    Bulk_Import_ExportPage.Click on the confirm button of finish pop up
    sleep       ${search_sleep}
    Switch Window       aithentic | Technology - List
    TechnologyPage.Search by AssetId       ${generated_assetidbulkedit}
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Check the payment period alert when entering inavalid data
    [Tags]    NT
    TRY
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
    Bulk_Import_ExportPage.Verify the upload message text - bulk import tech    Upload       Upload is prepared
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
    Bulk_Import_Exportpage.Enter the new value in cost type field of technology bulk import      CostType        Rented
    Bulk_Import_ExportPage.Perform the keyboard action      CostType
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPartner        testqa 20Feb  /   for uat and pre prod this method /
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit      PaymentPartner       1
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPartner
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentType        FixedPayment
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentType
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      PaymentPeriod       10 years
    Bulk_Import_ExportPage.Perform the keyboard action      PaymentPeriod
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      FirstPaymentDate        02/03/2023
    Bulk_Import_ExportPage.Perform the keyboard action      FirstPaymentDate
    Bulk_Import_Exportpage.Enter the new value in last Payment date field of technology bulk import      LastPaymentDate       02/03/2024
    Bulk_Import_ExportPage.Perform the keyboard action      LastPaymentDate
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      RenewalDate      02/11/2024
    Bulk_Import_ExportPage.Perform the keyboard action      RenewalDate
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
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_2      Capex
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_2
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_9      Account123
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_9
    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_3      1654
    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_3
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_46
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_46
    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_47
    Bulk_Import_ExportPage.Perform the keyboard action      DYNA_47
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_4      CPU
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_4
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_5      Paramdeep
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_5
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_6      Test@123
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_6

    Bulk_Import_Exportpage.Enter the new value of serial number of technology bulk import      DYNA_21

#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_7      100
#    Bulk_Import_ExportPage.Perform the keyboard action      TECHDYNA_7
#
#    Bulk_Import_Exportpage.Enter the new value in the fields of technology bulk import      TECHDYNA_8      12

    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   ValidationError       Payment Period is invalid. Please enter valid Payment Type like Once,Monthly,Annual,2 Years,3 Years,4 Years,5 Years,10 Years,Quarterlys
    Generic.Click on the button     Upload
    Bulk_Import_ExportPage.Click on the confirm button under pop up in technology bulk import
    Bulk_Import_ExportPage.Verify the upload message text   UploadMessage       Upload failed
    EXCEPT
    Switch Window       aithentic | Technology - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Verify all the validations of department bulk import
    [Tags]      Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department-list
    DashboardPage.Click on action button
    DashboardPage.Select the option from department action menu      Bulk Import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains     add-department-grid
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Select option from department status column in bulk_import      status
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department Name is missing
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-department-grid
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department Name is missing, Status is missing
    Bulk_Import_ExportPage.Clear the text of the field      costCenter
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_import     department_name
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Status is missing
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    DashboardPage.Double click     department_name
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       department_name         Department_milan
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department already exists, Status is missing
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of department bulk edit
    [Tags]      Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Bulk_Import_ExportPage.Clear the text of the field      department_name
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department Name is missing
    Generic.Refresh the existing page
    Bulk_Import_ExportPage.Clear the text of the field      department_name
    Bulk_Import_ExportPage.Clear the text of the field      costCenter

    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_import     department_name
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    Bulk_Import_ExportPage.Clear the text of the field      department_name
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       department_name         Department_milan
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department already exists
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of product bulk import
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    DashboardPage.Click on action button
    DashboardPage.Select the option from action menu      import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Products
    Generic.Verify your current page location contains      add-product-grid
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Status, Brand is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field     ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Product Name, Status is missing. Please fill in required data., Brand is invalid
    Bulk_Import_ExportPage.Clear the text of the field      Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Name, Brand is missing. Please fill in required data.
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Description, Features is missing.
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the value in the product name column in bulk_import      ProductName
    Bulk_Import_ExportPage.Enter the random value in the brand field under product bulk import       Brand
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Technology Type, Technology Group is missing. Please fill in required data., Brand is invalid
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-product-grid
    Bulk_Import_ExportPage.Enter the static value in the product name column in bulk_import     ProductName         Product_bulk_import
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_import       Brand    QABrand555
    Bulk_Import_ExportPage.Select option from status column in bulk_import       ProductStatus
    Bulk_Import_ExportPage.Select option from technology type column in bulk_import     TechType
    Select option from technology group column in bulk_import       TechGroup
    Enter the value in the product_description column in bulk_import        ProductDescription
    Enter the value in the product_feature column in bulk_import        ProductFeatures
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Product_bulk_import already exists

Verify all the validations of product bulk edit
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form     testqa29j@mailinator.com   Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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
    Bulk_Import_ExportPage.Clear the text of the field      ProductId
    Bulk_Import_ExportPage.Clear the text of the field      BrandName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Name, Brand is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter the static value in the product name column in bulk_import     ProductId         Product_bulk_import
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors          Brand is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field      ProductDescription
    Bulk_Import_ExportPage.Clear the text of the field      ProductFeatures
    Bulk_Import_ExportPage.Clear the text of the field      ProductId
    Bulk_Import_ExportPage.Enter the new value in the product name column in bulk_edit     ProductId
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_edit       BrandName    QABrand555
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings      Description, Features is missing.
    Bulk_Import_ExportPage.Clear the text of the field      ProductId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Product Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings      Description, Features is missing.
    Bulk_Import_ExportPage.Clear the text of the field      BrandName
    Bulk_Import_ExportPage.Enter the static value in the product name column in bulk_import     ProductId       Product_bulk_import
    Bulk_Import_ExportPage.Enter the new value in the brand name column in bulk_edit       BrandName    QABrand555
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Product Product_bulk_import already exists

#    Bulk_Import_ExportPage.Enter the 101 characters in the bulk import   ProductId
#    Generic.Click on the button     Check Data      #Update,Edit
#    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors      Product Name is missing

Verify all the validations of assigned user bulk import with existing data
    [Tags]      Negative
    TRY
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
    DashboardPage.Select the employee ID checkbox   yes
    Generic.select the option from the side menu    Team Members
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Choose the option from the action menu   Bulk Import
    sleep     ${yop_sleep}
    switch window     aithentic | Data-Wizard
    Generic.Verify your current page location contains      add-assignee-grid
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       FirstName       Dc
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       LastName        Dc
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email, Employee Id is missing.
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors          Same user name & email already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & employee Id already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & email already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings          Employee Id is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Same user name already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings      Same email & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same email & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same email already exists, Employee Id is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same employee Id already exists, Business Email is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings         Same email already exists, Employee Id is missing.
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations on assigned user bulk import
    [Tags]    NT        Negative
    TRY
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
    DashboardPage.Select the employee ID checkbox   yes
    Generic.select the option from the side menu    Team Members
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Click on action button of assigned users
    MemberPage.Choose the option from the action menu   Bulk Import
    sleep     ${yop_sleep}
    switch window     aithentic | Data-Wizard
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           First Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Last Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email is missing.
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       AssignedEmail       A.a
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Email format is incorrect
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings          Employee Id is missing.
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Verify all the validations of assigned user bulk edit with existing data
    [Tags]      Negative
   TRY
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
    DashboardPage.Select the employee ID checkbox   yes
    Generic.select the option from the side menu    Team Members
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Click on action button of assigned users
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
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       FirstName       Dc
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       LastName        Dc
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email, Employee Id is missing.
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors          Same user name & email already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & employee Id already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Same user name & email already exists
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings          Employee Id is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the ID column     AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Same user name already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings      Same email & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same email & employee Id already exists
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same email already exists, Employee Id is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete      AssignedEmail
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmployeeId       1111
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings     Same employee Id already exists, Business Email is missing.
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import      AssignedEmail       dc@yopmail.net
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings         Same email already exists, Employee Id is missing.
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END


Verify all the validations on assigned user bulk edit
    [Tags]    NT        Negative
    TRY
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
    DashboardPage.Select the employee ID checkbox   yes
    Generic.select the option from the side menu    Team Members
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Click on action button of assigned users
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
    Bulk_Import_ExportPage.Clear the text of the field      FirstName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           First Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field      LastName
    Bulk_Import_ExportPage.Enter the new value of assigned in the first name column    FirstName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Last Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Clear the text of the field with delete           AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the last name column      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings           Business Email is missing.
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       AssignedEmail       A.a
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationErrors           Email format is incorrect
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmail
    Bulk_Import_ExportPage.Enter the new value of assigned in the email column for bulk import and edit      AssignedEmail
    Bulk_Import_ExportPage.Clear the text of the field      AssignedEmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    ValidationWarnings          Employee Id is missing.
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of Loaction Bulk import Page
    [Tags]    NT        Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the location ID checkbox         yes
    DashboardPage.Select the location ID checkbox   no
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Select the option from action menu      import
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Locations
    Generic.Verify your current page location contains      add-location-grid
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    LocationPage.Select option from country column       Country
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
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings         Building name is missing
    Bulk_Import_ExportPage.Enter the new value in the building name column     BuildingName        Phelps Tower
    Bulk_Import_ExportPage.Clear the text of the field      Floor
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Floor is missing
    Bulk_Import_ExportPage.Enter the new value in the floor number column      Floor      1
    Bulk_Import_ExportPage.Clear the text of the field      Room
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Room is missing
    Bulk_Import_ExportPage.Enter the new value in the room number column       Room        204
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress1
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 1 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress1      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress2
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 2 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress2      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      City
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     City is missing
    Bulk_Import_ExportPage.Enter the new value in the city column     City        Banaj
    Bulk_Import_ExportPage.Clear the text of the field      State
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     State is missing
    Bulk_Import_ExportPage.Enter the new value in the state column    State       Berat District
    Bulk_Import_ExportPage.Clear the text of the field      Zip
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Zip code is missing
    Bulk_Import_ExportPage.Enter random zip code of bulk import of loaction     Zip
    Bulk_Import_ExportPage.Clear the text of the field      CostCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Cost Center is missing
    Bulk_Import_ExportPage.Enter the new value of cost center in location bulk edit     CostCenter
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location is missing
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       LocationTypeName        *Main Office
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location already exists
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Bulk_Import_ExportPage.Enter the new value in the location name column     LocationTypeName
    Bulk_Import_ExportPage.Clear the text of the field      IPSubnets
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     IP Subnets is missing
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
    EXCEPT
    Switch Window       aithentic | Location - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations om Location bulk edit
    [Tags]    NT        Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the location ID checkbox         yes
    DashboardPage.Select the location ID checkbox   no
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
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
    LocationPage.Enter input in the IP subnet field     1              192.168.0.0/23
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    Bulk_Import_ExportPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on Location action button
    LocationPage.Select the option from action menu      edit
    sleep   ${yop_sleep}
    Switch Window       aithentic | Edit - Locations
    Generic.Verify your current page location contains      location-bulk-edit
    Bulk_Import_ExportPage.Clear the text of the field      BuildingName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings         Building name is missing
    Bulk_Import_ExportPage.Enter the new value in the building name column     BuildingName        Phelps Tower
    Bulk_Import_ExportPage.Clear the text of the field      Floor
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Floor is missing
    Bulk_Import_ExportPage.Enter the new value in the floor number column      Floor      1
    Bulk_Import_ExportPage.Clear the text of the field      Room
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Room is missing
    Bulk_Import_ExportPage.Enter the new value in the room number column       Room        204
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress1
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 1 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress1      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress2
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 2 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress2      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      City
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     City is missing
    Bulk_Import_ExportPage.Enter the new value in the city column     City        Tabursuq
    Bulk_Import_ExportPage.Clear the text of the field      State
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     State is missing
    Bulk_Import_ExportPage.Enter the new value in the state column    State       Kassrine
    Bulk_Import_ExportPage.Clear the text of the field      Zip
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Zip code is missing
    Bulk_Import_ExportPage.Enter random zip code of bulk import of loaction     Zip
    Bulk_Import_ExportPage.Clear the text of the field      CostCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Cost Center is missing
    Bulk_Import_ExportPage.Enter the new value of cost center in location bulk edit     CostCenter
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location is missing, State does not exist, City does not exist
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       LocationTypeName        *Main Office
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location already exists, State does not exist, City does not exist
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Bulk_Import_ExportPage.Enter the new value in the location name column     LocationTypeName
    Bulk_Import_ExportPage.Clear the text of the field      IPSubnets
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     IP Subnets is missing
    Bulk_Import_ExportPage.Clear the text of the field with delete      Country
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Country is missing, State cannot insert without Country, City cannot insert without Country, State does not exist, City does not exist
    EXCEPT
    Switch Window       aithentic | Location - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of department bulk import under asset wizard
    [Tags]      Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import        Any new department names
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on the bulk import option under asset wizard via technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Generic.Verify your current page location contains      add-department-grid
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Select option from department status column in bulk_import      status
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department Name is missing
    Generic.Refresh the existing page
    Generic.Verify your current page location contains     add-department-grid
    Bulk_Import_ExportPage.Enter the new value in the cost center column in bulk_import     costCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department Name is missing, Status is missing
    Bulk_Import_ExportPage.Clear the text of the field      costCenter
    Bulk_Import_ExportPage.Enter the new value in the department name column in bulk_import     department_name
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Status is missing
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    DashboardPage.Double click     department_name
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       department_name         Department_milan
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors      Department already exists, Status is missing
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Cost Center is missing
    EXCEPT
    Switch Window       aithentic | Department - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of location bulk import under asset wizard
    [Tags]      Negative
    TRY
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the location ID checkbox         yes
    DashboardPage.Select the location ID checkbox   no
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       - Location Names
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on the location bulk import option under asset wizard via technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Add - Locations
    Generic.Verify your current page location contains     add-location-grid
    LocationPage.Select option from country column       Country
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
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings         Building name is missing
    Bulk_Import_ExportPage.Enter the new value in the building name column     BuildingName        Phelps Tower
    Bulk_Import_ExportPage.Clear the text of the field      Floor
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Floor is missing
    Bulk_Import_ExportPage.Enter the new value in the floor number column      Floor      1
    Bulk_Import_ExportPage.Clear the text of the field      Room
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Room is missing
    Bulk_Import_ExportPage.Enter the new value in the room number column       Room        204
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress1
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 1 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress1      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      StreetAddress2
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings       Address line 2 is missing
    Bulk_Import_ExportPage.Enter the new value in the first address column      StreetAddress2      This is address1
    Bulk_Import_ExportPage.Clear the text of the field      City
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     City is missing
    Bulk_Import_ExportPage.Enter the new value in the city column     City        Banaj
    Bulk_Import_ExportPage.Clear the text of the field      State
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     State is missing
    Bulk_Import_ExportPage.Enter the new value in the state column    State       Berat District
    Bulk_Import_ExportPage.Clear the text of the field      Zip
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Zip code is missing
    Bulk_Import_ExportPage.Enter random zip code of bulk import of loaction     Zip
    Bulk_Import_ExportPage.Clear the text of the field      CostCenter
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     Cost Center is missing
    Bulk_Import_ExportPage.Enter the new value of cost center in location bulk edit     CostCenter
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location is missing
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       LocationTypeName        *Main Office
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationErrors     Location already exists
    Bulk_Import_ExportPage.Clear the text of the field      LocationTypeName
    Bulk_Import_ExportPage.Enter the new value in the location name column     LocationTypeName
    Bulk_Import_ExportPage.Clear the text of the field      IPSubnets
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings     IP Subnets is missing
    Bulk_Import_ExportPage.Enter static IP subnet      IPSubnets         192.168.0.1/25
    EXCEPT
    Switch Window       aithentic | Location - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

Verify all the validations of Team member bulk import under asset wizard
    [Tags]          Negative
    TRY
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
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on checkbox under technology bulk import
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import       Admin, Asset managers and Asset users.
    Generic.click on the button     Next
    Bulk_Import_ExportPage.Click on the team member bulk import under asset wizard
    sleep   ${yop_sleep}
    Switch Window       aithentic | Member - Import
    Bulk_Import_ExportPage.Verify that element is not enabled       Check Data
    Bulk_Import_ExportPage.Verify that element is not enabled       Upload
    Bulk_Import_ExportPage.Enter the new value of first name in bulk import of team member      FirstName
    Bulk_Import_ExportPage.Enter the new value of last name in bulk import of team member       LastName
    Bulk_Import_ExportPage.Enter random employee id of bulk import      EmployeeId
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       CountryCode     1
    Bulk_Import_ExportPage.Enter the new value of team member in the phone number column        MobileNo
    Bulk_Import_ExportPage.Enter the new value of team member in the email column       BusinessEmail
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Department, Location, Member Role is missing. Please fill in required data.
    Bulk_Import_ExportPage.Verify the upload message text    validationWarnings      Position/Title is missing.
    Bulk_Import_ExportPage.Clear the text of the field with delete under asset wizard      FirstName
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       DepartmentName      3
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       MemberLocation      3
    Bulk_Import_ExportPage.Perform the keyboard action      MemberLocation
    Bulk_Import_ExportPage.Select option from technology type column in bulk_edit       MemberRole     2
    Bulk_Import_ExportPage.Perform the keyboard action      MemberRole
    Bulk_Import_ExportPage.Enter position and title of team member bulk import      QA
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      First Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter the new value of first name in bulk import of team member      FirstName
    Bulk_Import_ExportPage.Clear the text of the field with delete under asset wizard      LastName
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Last Name is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter the new value of last name in bulk import of team member       LastName
    Bulk_Import_ExportPage.Clear the text of the field with delete under asset wizard      EmployeeId
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Employee ID is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter random employee id of bulk import      EmployeeId
    Bulk_Import_ExportPage.Clear the text of the field      MobileNo
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Mobile Number is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter the new value of team member in the phone number column        MobileNo
    Bulk_Import_ExportPage.Clear the text of the field with delete      BusinessEmail
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Business Email is missing. Please fill in required data.
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       BusinessEmail        F_milan1@mail-mario.fr.nf
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Business Email already exists
    Bulk_Import_ExportPage.Clear the text of the field with delete      BusinessEmail
    Bulk_Import_ExportPage.Clear the text of the field with delete under asset wizard      EmployeeId
    Bulk_Import_ExportPage.Clear the text of the field with delete under asset wizard      FirstName
    Bulk_Import_ExportPage.Enter static value in the fields of team membder bulk import under asset wizard       FirstName        F_milan1@mail-mario.fr.nf
    Bulk_Import_ExportPage.Enter static value in the fields of team membder bulk import under asset wizard       EmployeeId        267818408
    Bulk_Import_ExportPage.Enter the new value of team member in the email column       BusinessEmail
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Employee ID already exists
    Bulk_Import_ExportPage.Clear the text of the field      MobileNo
    Bulk_Import_ExportPage.Enter static value in the fields of department bulk import       MobileNo        963214563
    Generic.Click on the button     Check Data      #Update,Edit
    Bulk_Import_ExportPage.Verify the upload message text   validationErrors      Mobile Number is invalid, Employee ID already exists
    Bulk_Import_ExportPage.Clear the text of the field      MobileNo
    EXCEPT
    Switch Window       aithentic | Member - List
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    DashboardPage.Select the asset ID checkbox      no
    DashboardPage.Select the employee ID checkbox   yes
    Sleep    ${yop_Sleep}
    Fail
    END

#Zz kill browser
#    Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F


