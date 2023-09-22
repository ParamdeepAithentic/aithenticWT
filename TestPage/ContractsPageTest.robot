*** Settings ***
Documentation   To validate the Login form
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
######## UN comment when to use ##############
#Fill contract form
#    Generic.click on the tab	Login
#    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    Generic.select the option from the side menu    Contracts
#    Generic.Verify your current page location contains      contracts
#    ContractsPage.Click on create new contract button
#    ContractsPage.Select type of contract     Dynamic Contract
#    Generic.Verify your current page location contains      generate-contract
#    ContractsPage.Enter contract type      SmartShare_Manufacturer
#    ContractsPage.Enter contract with     BusinessName60338
#    ContractsPage.Enter contract brand    BusinessName60338
#    ContractsPage.Enter contract location      United States - Main Office - 21 - 2
#    ContractsPage.Enter contract permission       Read/Write
#    ContractsPage.Select contract start date
#    ContractsPage.Select contract end date      12/12/2028
#    ContractsPage.Select contract function       Dynamic
#    ContractsPage.Click preview selection button on contact
#    ContractsPage.Enter contract description comment      Enter comment for contract description.
#    ContractsPage.Enter contract name     Person_61918
#    ContractsPage.Select the checkboxes
#    ContractsPage.Save create contract button
#    ContractsPage.Save contract modal     Create Contract
#    Generic.Fetch alert message text and compare it with        Contract created successfully
#    ContractsPage.Search by contract BrandName      BusinessName60338




































