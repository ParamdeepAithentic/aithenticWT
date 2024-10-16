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
    [Tags]      Stable
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
    [Tags]      Stable
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

Add department and verify via organisation
    [Tags]      Stable
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        company
    Generic.Verify your current page location contains      dashboard
    sleep   ${search_sleep}
    DepartmentPage.Verify I-icon of company information under organistaion
    Generic.Scroll Window To End
    DepartmentPage.Create random department name
    DepartmentPage.Select department random cost center
    Generic.click on the button     Add
    Generic.Fetch alert message text and compare it with        Department added successfully
    Generic.Verify your current page location contains      department-list
    DepartmentPage.Search by department name      ${generated_Department}

Verify the validations of all fields of Add department
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