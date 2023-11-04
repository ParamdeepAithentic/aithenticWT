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
Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Activate and deactivate the location
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}

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
    LocationPage.Create random location name
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}

    LocationPage.Click on Location action button
    LocationPage.Select the option from action menu      edit
    sleep   5
    Switch Window       aithentic | Edit - Locations
    Generic.Verify your current page location contains      location-bulk-edit
    LocationPage.Select option from country column       Country
    LocationPage.Enter the new value in the building name column     BuildingName        Phelps tower
    LocationPage.Enter the new value in the floor number column      Floor       first
    LocationPage.Enter the new value in the room number column       Room        303
    LocationPage.Enter the new value in the state column    State       Adana
    LocationPage.Enter the new value in the city column     City        Adana
    LocationPage.Enter the new value in the location name column     LocationTypeName

    Generic.Click on the button     Update      #Check Data,Edit
#    MemberPage.Confirm the exit import process pop appers
#    Generic.Click on the button     Confirm
#    Generic.Fetch alert message text and compare it with        Products updated successfully
    MemberPage.Verify the upload message text    Upload       Upload Successful
    Generic.Click on the button     Exit
    MemberPage.Confirm the exit import process pop appers
    Generic.Click on the button     Confirm
    sleep       1
    Switch Window       aithentic | Location - List
    LocationPage.Search by location name     ${generated_NewLocationName}


