*** Settings ***
Documentation   Contains all test cases of Department page
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
Department bulk edit
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department

Add_edit_delete_department_via_profile_list
    [Tags]    Sanity        Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    TechnologyPage.Create unique department name random
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    DepartmentPage.Search by department name      ${generated_departmentnumber}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Edit
    TechnologyPage.Create unique department name random
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department updated successfully
    Generic.Verify your current page location contains      department-list
    DepartmentPage.Search by department name      ${generated_departmentnumber}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Remove
    Generic.Select parameter        Yes
    Generic.Fetch alert message text and compare it with        Department deleted successfully

#Add department and verify via organisation
#    [Tags]    NT
#    Generic.open the browser with the url
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form    ${email}    ${valid_password}
#    Generic.Verify your current page location contains      dashboard
#    LandingPage.Verify you are on dashboard page
#    Generic.Click on the profile name
#    Generic.Select option from profile list     personal-details
#    I_iconPage.Choose options inside personal_details        Organization
#    I_iconPage.Choose tabs under organization        company
#    Generic.Verify your current page location contains      dashboard
#    sleep   ${search_sleep}
#    DepartmentPage.Verify I-icon of company information under organistaion
#    Generic.Scroll Window To End
#    DepartmentPage.Create random department name
#    DepartmentPage.Select department random cost center
#    Generic.click on the button     Add
#    Generic.Fetch alert message text and compare it with        Department added successfully
#    Generic.Verify your current page location contains      department-list
#    DepartmentPage.Search by department name      ${generated_Department}

Verify the validations of all fields of Add department
    [Tags]    Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    TechnologyPage.Save the department       add
    DepartmentPage.Verify the validation department name field
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentname_validation}      Please enter Department Name
    DepartmentPage.Verify the validation department status
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentstatus_validation}      Please Select Status
    DepartmentPage.Enter the wrong status of department and verify      wrongstatus

Verify the validations of all fields of Edit department
    [Tags]        Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    TechnologyPage.Create unique department name random
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    DepartmentPage.Search by department name      ${generated_departmentnumber}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Edit
    DepartmentPage.Clear the data of the field while adding department      add-department-name
    DepartmentPage.Clear the data of the field while adding department      add-department-status
    TechnologyPage.Save the department       add
    DepartmentPage.Verify the validation department name field
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentname_validation}      Please enter Department Name
    DepartmentPage.Verify the validation department status
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentstatus_validation}      Please Select Status
    TechnologyPage.Save the department       close

Verify department should not be removed having technology created
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    TechnologyPage.Create unique department name random
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    DepartmentPage.Search by department name      ${generated_departmentnumber}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list      OPMR815309
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      ${generated_departmentnumber}
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Search by department name      ${generated_departmentnumber}
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Remove
    Generic.Select parameter        Yes
    Generic.Fetch alert message text and compare it with        Department already in use.

Add Department Heirarchy and verify select department filter with Parent department and Sub department
    Generic.click on the tab	Register
    Generic.Verify your current page location contains      register
    ReplaceDomainAPI.Replace Domain
    RegisterUserPage.Create random register first name
    RegisterUserPage.Create random register last name
    RegisterUserPage.Create random register company name
    RegisterUserPage.Click on member type
    RegisterUserPage.Select the member type      End User
    RegisterUserPage.Create partner random business email
    RegisterUserPage.Choose register user country      India   +91     9646289871
    RegisterUserPage.Select the checkbox
    RegisterUserPage.Save the register form
    Generic.Verify your current page location contains      update-email
    Generic.Open new window     yopmail
    Generic.Refresh the existing page
    Generic.Search yopmail emails for       ${generate_register_Email}
    Generic.Switch to iframe by ID      ifinbox
    Yopmail.Click on email of yopmail   Email Register Verification Required.
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
    LandingPage.Fill the login Form      ${generate_register_Email}    Paramdeep@112
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
    TwoFactorAuth.Enter the otp     ${passcode}
    TwoFactorAuth.Click verification button
    Generic.Verify your current page location contains     subscription
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
    SubscriptionPage.Select and move next with subscription
    Generic.Verify your current page location contains     subscription-payment
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Click on same billing address checkbox
    SubscriptionPage.Switch to card iframe
    SubscriptionPage.Enter cardnumber    42424242424242420429242
    Unselect Frame
    SubscriptionPage.Enter card user name    Paramdeep Singh
    SubscriptionPage.Check the authorization checkbox
    SubscriptionPage.Check the acknowledgement checkbox
    SubscriptionPage.Click on complete process button
    Generic.Verify your current page location contains     welcome
    Generic.Fetch alert message text and compare it with       Payment Successful
    DashboardPage.Click on complete setup button      Complete Setup
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the employee ID checkbox   yes
    DashboardPage.Select the location ID checkbox   yes
    DashboardPage.Select the asset ID checkbox      no
    Generic.Fetch alert message text and compare it with       Settings Updated
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    DepartmentPage.Create random Parent Department
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    DepartmentPage.Create random Sub Department
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    DepartmentPage.Click on added department action button
    DepartmentPage.Choose the option from the action menu   Add Department
    TechnologyPage.Create unique department name random
    DepartmentPage.Input into parent Department     ${generated_Parent_DepartmentNumber}
    DepartmentPage.Input into sub Department        ${generated_Sub_DepartmentNumber}
    DepartmentPage.Select department random cost center
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Select the option from Department filter
    DepartmentPage.Select filter with heirarchy     ${generated_Parent_DepartmentNumber}
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Select filter with heirarchy     ${generated_DepartmentNumber}
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Select filter with heirarchy     ${generated_Sub_DepartmentNumber}
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_Sub_DepartmentNumber}
    DepartmentPage.Select filter with heirarchy     ${generated_DepartmentNumber}
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_Sub_DepartmentNumber}
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_DepartmentNumber}
    DepartmentPage.Select filter with heirarchy     ${generated_Parent_DepartmentNumber}
    Generic.Wait for table skelton to get disable
    Generic.Wait until table get load for filters
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_Sub_DepartmentNumber}
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_DepartmentNumber}
    DepartmentPage.Verify that table contains the Department Name under Department column       Department Name    ${generated_Parent_DepartmentNumber}

Verify all the validations of Department page under asset wizard
    [Tags]      Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains     technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.click on bulk import under action button of technology
    sleep   ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    Bulk_Import_ExportPage.click on checkbox under technology bulk import
    Bulk_Import_ExportPage.click on all checkbox under technology bulk import        Any new department names
    Generic.click on the button     Next
    Generic.click on the tab        Add Department
    TechnologyPage.Save the department       add
    DepartmentPage.Verify the validation department name field
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentname_validation}      Please enter Department Name
    DepartmentPage.Verify the validation department status
    DepartmentPage.Compare and verify the validation messages of department     ${Departmentstatus_validation}      Please Select Status
    Bulk_Import_ExportPage.Select the status under add department technology bulk import
    Bulk_Import_ExportPage.Enter cost center under add department technology bulk import   316546
    TechnologyPage.Save the department       add
    RegisterUserPage.Fetch the validation message after entering invalid data in register user page     Please enter Department Name
    Bulk_Import_ExportPage.Select the department from dropdown under technology bulk import     Department_milan
    TechnologyPage.Save the department       add
    Generic.Fetch alert message text and compare it with       Department already exists