*** Settings ***
Documentation   Contains all test cases of Message page
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
Resource        ../Pages/SortingPage.robot
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
Test the sorting of assigned user asset history page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on assigned user tab      Assigned Users
    TeamMemberPage.Search assigned user by first name   Param_113 Deep
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    SortingPage.Verify the sorting of the table     2       Asset ID
    SortingPage.Verify the sorting of the table     3       Group
    SortingPage.Verify the sorting of the table     4       Brand
#    SortingPage.Verify the sorting of the table     5       Product        # Filter now working fine
    SortingPage.Verify the sorting of the table     6       Product Description
    SortingPage.Verify the sorting of the table     7       Assigned Date


Test the sorting of technology page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    SortingPage.Verify the sorting of the table     2       Group
    SortingPage.Verify the sorting of the table     3       Brand
    SortingPage.Verify the sorting of the table     4       Product
    SortingPage.Verify the sorting of the table     5       Product Description
    SortingPage.Verify the sorting of the table     6       Created Date
    SortingPage.Verify the sorting of the table     7       Status
    SortingPage.Verify the sorting of the table     8       Asset ID
    SortingPage.Verify the sorting of the table     9       Location
    SortingPage.Verify the sorting of the table     10      Assignee

Test the sorting of brand page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    SortingPage.Verify the sorting of the table method two     3       Status
    SortingPage.Verify the sorting of the table method two     2       Brand Name


Test the sorting of brand page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand
    SortingPage.Verify the sorting of the table method two     3       Status
    SortingPage.Verify the sorting of the table method two     2       Brand Name

Test the sorting of product page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product
    SortingPage.Verify the sorting of the table method two     3       Brand Name
    SortingPage.Verify the sorting of the table method two     2       Product Name
    SortingPage.Verify the sorting of the table method two     4       Description
    SortingPage.Verify the sorting of the table method two     5       Technology Group
    SortingPage.Verify the sorting of the table method two     6       Status


Test the sorting of location page table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
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
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    Generic.Wait until table get load
    SortingPage.Verify the sorting of the table method two     3       Location
    SortingPage.Verify the sorting of the table method two     2       Name
    SortingPage.Verify the sorting of the table method two     4       Role
    SortingPage.Verify the sorting of the table method two     5       Assigned Assets
    SortingPage.Verify the sorting of the table method two     6       Status