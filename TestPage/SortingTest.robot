*** Settings ***
Documentation   Contains all test cases of Message page
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
Resource    ../Pages/PaginationPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
Test the sorting of assigned user asset history page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab      Assigned Users
    MemberPage.Search assigned user by first name   Vishal Debut
    MemberPage.Click on three dots of Team Member listing
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    SortingPage.Verify the sorting of the table     2       Asset ID
    SortingPage.Verify the sorting of the table     3       Group
    SortingPage.Verify the sorting of the table     4       Brand
#    SortingPage.Verify the sorting of the table     5       Product        # Filter now working fine
    SortingPage.Verify the sorting of the table     6       Product Description
    SortingPage.Verify the sorting of the table     7       Assigned Date


Test the sorting of technology page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    SortingPage.Verify the sorting of the table     2       Group
    SortingPage.Verify the sorting of the table     3       Brand
    SortingPage.Verify the sorting of the table     4       Product
    SortingPage.Verify the sorting of the table     5       Product Description
    SortingPage.Verify the sorting of the table     6       Created Date
    SortingPage.Verify the sorting of the table     7       Agent
    SortingPage.Verify the sorting of the table     8       Status
    SortingPage.Verify the sorting of the table     9       Asset ID
    SortingPage.Verify the sorting of the table     10       Location
    SortingPage.Verify the sorting of the table     11      Assignee

Test the sorting of brand page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    SortingPage.Verify the sorting of the table method two     3       Status
    SortingPage.Verify the sorting of the table method two     2       Brand Name


Test the sorting of product page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    SortingPage.Verify the sorting of the table method two     3       Brand Name
    SortingPage.Verify the sorting of the table method two     2       Product Name
    SortingPage.Verify the sorting of the table method two     4       Description
    SortingPage.Verify the sorting of the table method two     5       Technology Group
    SortingPage.Verify the sorting of the table method two     6       Status


Test the sorting of location page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method three     3       Country
    SortingPage.Verify the sorting of the table method three     2       Location Name
    SortingPage.Verify the sorting of the table method three     4       State
    SortingPage.Verify the sorting of the table method three     5       City
#    SortingPage.Verify the sorting of the table method three     6       Technology        #clicking on complete word
    SortingPage.Verify the sorting of the table method three     7       Status


Test the sorting of team member page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     3       Location
    SortingPage.Verify the sorting of the table method two     2       Name
    SortingPage.Verify the sorting of the table method two     4       Role
    SortingPage.Verify the sorting of the table method two     5       Assigned Assets
    SortingPage.Verify the sorting of the table method two     6       Status


Test the sorting of partners page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     3       Partner Type
    SortingPage.Verify the sorting of the table method two     2       Business Name
    SortingPage.Verify the sorting of the table method two     4       Technology
    SortingPage.Verify the sorting of the table method two     5       Added on
    SortingPage.Verify the sorting of the table method two     6       Status


Test the sorting of department page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    Generic.Wait until table get load
#    SortingPage.Verify the sorting of the table method three     3       Cost Center       #filter not working right
    SortingPage.Verify the sorting of the table method three     2       Department Name
    SortingPage.Verify the sorting of the table method three     4       Status


Test the sorting of Assigned user page table inside department page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    Generic.Wait until table get load
    DepartmentPage.Select option from side menu in department list       Assigned Users
    Generic.Verify your current page location contains      assignee-list
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     3       Email Id
    SortingPage.Verify the sorting of the table method two     2       Assignee Name
    SortingPage.Verify the sorting of the table method two     4       Employee Id
    SortingPage.Verify the sorting of the table method two     5       Assigned Assets


Test the sorting of team members page table inside department page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    Generic.Wait until table get load
    DepartmentPage.Select option from side menu in department list        Team Members
    Generic.Verify your current page location contains      member
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     4       User Type
#    SortingPage.Verify the sorting of the table method two     3       Email       Not working - one emial starts with small rest all are with big
    SortingPage.Verify the sorting of the table method two     2       Name
#    SortingPage.Verify the sorting of the table method two     5       Last Login  #last login is not coming - bug need to be fixed
    SortingPage.Verify the sorting of the table method two     6       Status


Test the sorting of team member asset history page table
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Search Team Member by name    Param113 Deep
    TeamMemberPage.Click on three dots of Team Member listing
    sleep       ${search_sleep}
    MemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    SortingPage.Verify the sorting of the table     2       Asset ID
    SortingPage.Verify the sorting of the table     3       Group
    SortingPage.Verify the sorting of the table     4       Brand
    SortingPage.Verify the sorting of the table     5       Product
    SortingPage.Verify the sorting of the table     6       Product Description
    SortingPage.Verify the sorting of the table     7       Assigned Date

Test the sorting of contract page table
    [Tags]      Unstable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts-list
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     2       Business Name
    SortingPage.Verify the sorting of the table method two     3       Partner Type
    SortingPage.Verify the sorting of the table method two     4       Function
#    SortingPage.Verify the sorting of the table method two     5       Contract ID
#    SortingPage.Verify the sorting of the table method two     6       Created Date
#    SortingPage.Verify the sorting of the table method two     7       End Date
    SortingPage.Verify the sorting of the table method two     8       Status
    SortingPage.Verify the sorting of the table method two     9       Permissions
    SortingPage.Verify the sorting of the table method two     10      Technology

Test the sorting of department page list via bulk import of technology table
    [Tags]    Smoke     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Click on Bulk_import under action button
    sleep       ${yop_sleep}
    Switch Window       aithentic | Data-Wizard
    TechnologyPage.Select the check box option from asset wizard        Departments
    TechnologyPage.Select the check box option from asset wizard        Locations
    TechnologyPage.Select the check box option from asset wizard        Team Members
    TechnologyPage.Select the check box option from asset wizard        Brands
    TechnologyPage.Select the check box option from asset wizard        Products
    TechnologyPage.Select the check box option from asset wizard        Partners
    Generic.click on the button      Next
    Generic.Verify your current page location contains      department-list
    Generic.Wait until table get load
#    SortingPage.Verify the sorting of the table method two     3       Cost Center
#    SortingPage.Verify the sorting of the table method two     2       Department Name
#    SortingPage.Verify the sorting of the table method two     4       Status          #Departments table contains 4th code
    Generic.click on the button      Next
    SortingPage.Verify the sorting of the table method three     4       State
    SortingPage.Verify the sorting of the table method three     3       Country
    SortingPage.Verify the sorting of the table method three     2       Location Name
    SortingPage.Verify the sorting of the table method three     5       City
    SortingPage.Verify the sorting of the table method three     6       Technology
    SortingPage.Verify the sorting of the table method three     7       Status

    Generic.click on the button      Next
    SortingPage.Verify the sorting of the table method two     3       Location
    SortingPage.Verify the sorting of the table method two     2       Name
    SortingPage.Verify the sorting of the table method two     4       Role
    SortingPage.Verify the sorting of the table method two     5       Assigned Assets
    SortingPage.Verify the sorting of the table method two     6       Status
#
    Generic.click on the button      Next
#    SortingPage.Verify the sorting of the table method two     3       Status
#    SortingPage.Verify the sorting of the table method two     2       Brand Name       #Data is more than 10

    Generic.click on the button      Next
    SortingPage.Verify the sorting of the table method two     3       Brand Name
    SortingPage.Verify the sorting of the table method two     2       Product Name
    SortingPage.Verify the sorting of the table method two     4       Description
    SortingPage.Verify the sorting of the table method two     5       Technology Group
    SortingPage.Verify the sorting of the table method two     6       Status

    Generic.click on the button      Next
    SortingPage.Verify the sorting of the table method two     3       Partner Type
    SortingPage.Verify the sorting of the table method two     2       Business Name
    SortingPage.Verify the sorting of the table method two     4       Technology
    SortingPage.Verify the sorting of the table method two     5       Added on
    SortingPage.Verify the sorting of the table method two     6       Status



Test the sorting of removed technology page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Click on removed assets option of technology filters
    Sleep    ${yop_sleep}
    SortingPage.Verify the sorting of the table     3       Group
    SortingPage.Verify the sorting of the table     4       Brand
    SortingPage.Verify the sorting of the table     5       Product
    SortingPage.Verify the sorting of the table     6       Product Description
    SortingPage.Verify the sorting of the table     7       Created Date
    SortingPage.Verify the sorting of the table     8       Agent
    SortingPage.Verify the sorting of the table     9       Record Status
    SortingPage.Verify the sorting of the table     10      Asset ID
    SortingPage.Verify the sorting of the table     11      Location
    SortingPage.Verify the sorting of the table     12      Assignee

Test the sorting of inbox table page under message page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    MessagePage.Save compose message     inbox
    Generic.Verify your current page location contains      inbox
    SortingPage.Verify the sorting of the table method four    2       From
    SortingPage.Verify the sorting of the table method four    3       Company
    SortingPage.Verify the sorting of the table method four    4       Partner Type
    SortingPage.Verify the sorting of the table method four    5       Subject
    SortingPage.Verify the sorting of the table method four    6       Status
    SortingPage.Verify the sorting of the table method four    7       Date
    SortingPage.Verify the sorting of the table method four    1       Flag


Test the sorting of sent table page under message page
    [Tags]    Smoke     Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Messages
    Generic.Verify your current page location contains      message
    MessagePage.Save compose message     sent
    Generic.Verify your current page location contains      sent
    SortingPage.Verify the sorting of the table method four    2       To
    SortingPage.Verify the sorting of the table method four    3       Subject
    SortingPage.Verify the sorting of the table method four    4       Status
    SortingPage.Verify the sorting of the table method four    5       Date


Test the sorting of bulk edit grid under team members
    [Tags]    Smoke     rerun       Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on team member action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep     ${yop_sleep}
    switch window     aithentic | Edit - Members
    Generic.Verify your current page location contains      member-bulk-edit
    sleep   ${search_sleep}
    SortingPage.Verify the sorting of the table method five    10      Position/Title
    SortingPage.Verify the sorting of the table method five    11      Employee ID
    SortingPage.Expand all sorting field
    SortingPage.Verify the sorting of the table method five    3       Last Name
    SortingPage.Verify the sorting of the table method five    2       First Name
    SortingPage.Verify the sorting of the table method five    4       Country Code
    SortingPage.Verify the sorting of the table method five    5       Mobile number
    SortingPage.Verify the sorting of the table method five    6       Business Email
    SortingPage.Verify the sorting of the table method five    7       Department
    SortingPage.Verify the sorting of the table method five    8       Member Location
    SortingPage.Verify the sorting of the table method five    9       Role





Test the sorting of bulk edit grid under assigned users
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Assigned Users
    MemberPage.Click on assigned user action button
    MemberPage.Choose the option from the action menu   Bulk Edit
    sleep     ${yop_sleep}
    switch window     aithentic | Data-Wizard
    Generic.Verify your current page location contains      assignee-bulk-edit
    SortingPage.Expand all sorting field
    SortingPage.Verify the sorting of the table method five    2      First Name
    SortingPage.Verify the sorting of the table method five    3      Last Name
    SortingPage.Verify the sorting of the table method five    4      Business Email
    SortingPage.Verify the sorting of the table method five    5      Employee Id

Test the sorting of Recent Activities Table under Dashboard page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form          jasdeep@15963.fr.nf     Paramdeep@112
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    DashboardPage.Click on the filter Past under recent Activities table        Months
    PaginationPage.Check the table get load for Recent Activities
    PaginationPage.Click on the pagination dropdown     autoCreatedAsset
    PaginationPage.Select the value from the pagination drop down count    500
    SortingPage.Verify the sorting of the table method six    2        Actioned By
    SortingPage.Verify the sorting of the table method six    3        Created At


Zz kill browser
    Run Process    cmd.exe    /C    taskkill /IM firefox.exe /F