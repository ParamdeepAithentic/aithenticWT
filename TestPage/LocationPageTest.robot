*** Settings ***
Documentation   Contains all test cases of Location page
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Activate and deactivate the location
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      asset-overview
    ${StartTime1} =     Get Current Time in Milliseconds
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time    21  ${pageHeading}   Page Load - Total Page Load Time of Location Page      21    ${pageTime}     ${ActualTime}    PageLoad_Time

    LocationPage.Click on Location action button

    ${StartTime1} =     Get Current Time in Milliseconds
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      add-location
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time    22  ${pageHeading}   Page Load - Total Page Load Time of Add Location Page to location form      22    ${pageTime}     ${ActualTime}    PageLoad_Time


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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Status updated successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch and verify the location status from the row   Inactive
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Activate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Status updated successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch and verify the location status from the row   Active