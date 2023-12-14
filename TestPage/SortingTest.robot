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
Testing sorting
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      jasdeep@15963.fr.nf    Paramdeep@112
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on assigned user tab      Assigned Users
    TeamMemberPage.Search assigned user by first name   Param_113 Deep
    TeamMemberPage.Click on three dots of Team Member listing
    TeamMemberPage.Select option from three dots of Team Member     Asset History
    Generic.Verify your current page contains this text     Export
    SortingPage.Sort Test