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
Activate and deactivate the location
    [Tags]      Time      Sanity        Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
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

Edit the Location
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Edit
    Generic.Verify your current page location contains    edit

    #################################################################
    LocationPage.Edit location country   United States
    LocationPage.Select location building name   Trump tower
    LocationPage.Select location floor   second
    LocationPage.Select location room    203
    LocationPage.Select location address one     this address one of the location
    LocationPage.Select location address two     this address two of the location
    LocationPage.Edit location state       Arizona
    LocationPage.Edit location city        Anthem
    LocationPage.Select location zip     5781
    LocationPage.Enter random cost center value
    LocationPage.Create random location name
    Generic.click on the button    Update
    Generic.Fetch alert message text and compare it with    Location updated successfully

Remove Location from listing
    [Tags]      Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Remove
    LocationPage.Select option from pop-up to remove location    Yes
    Generic.Fetch alert message text and compare it with    Location deleted successfully

Add Location from profile Listing
    [Tags]     Sanity     Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list    add-location-dropdown
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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully

Verify Location_name Hide and show after changes it from settings
    [Tags]      Smoke
    Generic.open the browser with the url
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the location ID checkbox   no
    Generic.Fetch alert message text and compare it with    Settings Updated
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      dashboard
    LocationPage.Create random location_name when generated by user
    LocationPage.Select location country     United States
    LocationPage.Enter building_name location_name when generated by user   Trump tower
    LocationPage.Enter floor location_name when generated by user   second
    LocationPage.Enter room location_name when generated by user    203
    LocationPage.Enter address_1 location_name when generated by user     this address one of the location
    LocationPage.Enter address_2 location_name when generated by user     this address two of the location
    LocationPage.Select location state       Texas
    LocationPage.Select location city        Austin
    LocationPage.Enter zip_code location_name when generated by user      147001
    LocationPage.Enter random cost center value
    LocationPage.Save location form     add
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name    ${generated_location_user}

    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with    Settings Updated
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      add-location
    LocationPage.Select location country     United States
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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name        ${generated_location}

Click on the select status filter and verify it
    [Tags]     time     smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist

    ${StartTime1} =     Get Current Time in Milliseconds
    LocationPage.Click on the status filter under location
    LocationPage.Select the option from status filter under location        Inactive
    LocationPage.Get the text of selected status filter under location      Inactive
    Generic.Wait until table get load for filters
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  9  ${pageHeading}   Filter Page - Data load time of filter inactive under location status      9    ${pageTime}     ${ActualTime}    Filter_Time


    PaginationPage.Fetch the total count for filter only
    PaginationPage.Check Pagination     location-list
#    PaginationPage.Click on the pagination dropdown     location-list
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown     location-list
    PaginationPage.Fetch the total count for filter only
    LocationPage.Fetch the country from location filter and click       Status      7     Inactive         ${New_status}

Click on the select location filter and verify it
    [Tags]    time     smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on the location filter under location
    LocationPage.Select the option from location filter under location         Afghanistan
    LocationPage.Get the text of selected filter under location     Afghanistan
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Check Pagination     location-list
#    PaginationPage.Click on the pagination dropdown     location-list
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown     location-list
    PaginationPage.Fetch the total count for filter only

    ${StartTime1} =     Get Current Time in Milliseconds
    LocationPage.Fetch the country from location filter and click       Country     3     Afghanistan         ${New_Name}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  10  ${pageHeading}   Filter Page - Data load time of filter Country under location group      10    ${pageTime}     ${ActualTime}    Filter_Time

    Generic.Click on the reset filters link
    Generic.Wait for table skelton to get disable
    LocationPage.Click on the location filter under location
    LocationPage.Select the option from location filter under location         Canada
    LocationPage.Get the text of selected filter under location     Canada
    sleep   ${search_sleep}
    Generic.Wait until table get load for filters
    sleep   ${search_sleep}
    Generic.Scroll Window To End
    sleep   ${search_sleep}
    PaginationPage.Fetch the total count for filter only

    PaginationPage.Check Pagination     location-list
    PaginationPage.Fetch the total count for filter only

    LocationPage.Fetch the country from location filter and click       Country     3        Canada          ${New_Name}
    Generic.Click on the reset filters link
    Generic.Wait for table skelton to get disable
    LocationPage.Click on the location filter under location
    LocationPage.Select the option from location filter under location          India
    LocationPage.Get the text of selected filter under location      India
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only

    PaginationPage.Check Pagination     location-list
    PaginationPage.Fetch the total count for filter only

    LocationPage.Fetch the country from location filter and click       Country     3        India          ${New_Name}
    Generic.Click on the reset filters link
    Generic.Wait for table skelton to get disable
    LocationPage.Click on the location filter under location
    LocationPage.Select the option from location filter under location         Turkey
    LocationPage.Get the text of selected filter under location    Turkey
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Check Pagination     location-list
#    PaginationPage.Click on the pagination dropdown     location-list
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown     location-list
    PaginationPage.Fetch the total count for filter only
    LocationPage.Fetch the country from location filter and click       Country     3     Turkey        ${New_Name}

Click on the select Active status filter and verify it
    [Tags]    NT
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      johns@mai.25u.com         Test@123
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on the status filter under location
    LocationPage.Select the option from status filter under location        Active
    LocationPage.Get the text of selected status filter under location      Active
    Generic.Wait until table get load for filters
    PaginationPage.Fetch the total count for filter only
    PaginationPage.Check Pagination     location-list
#    PaginationPage.Click on the pagination dropdown     location-list
#    PaginationPage.Select the value from the pagination drop down count     500
#    PaginationPage.Fetch the selected value of the dropdown     location-list
    PaginationPage.Fetch the total count for filter only
    LocationPage.Fetch the country from location filter and click       Status      7     Active         ${New_status}

Verifying the validations of all fields of Add location
    [Tags]    Negative
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}    ${valid_password}
    Generic.Verify your current page location contains      dashboard
    LandingPage.Verify you are on dashboard page
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the location ID checkbox   no
    Generic.Fetch alert message text and compare it with    Settings Updated
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      addlocation
    LocationPage.Click on Save to add location
    LocationPage.Verify the validation of Location name field
    LocationPage.Compare and verify the validation messages of Location     ${Locationname_validation}      Please Enter Location Name
    LocationPage.Verify the validation of country name field
    LocationPage.Compare and verify the validation messages of Location     ${Locationcountry_validation}       Please Select Country
    LocationPage.Add invalid Location Name      LocationTypeName       A*
    LocationPage.Verify the validation of Location name field
    LocationPage.Compare and verify the validation messages of Location     ${Locationname_validation}      Please Enter Valid Location Name
    LocationPage.Add invalid Location country       567country
    LocationPage.Click on cancel Location
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    I_iconPage.Choose options inside personal_details        Organization
    I_iconPage.Choose tabs under organization        system
    Generic.Verify your current page location contains     organization
    DashboardPage.Select the location ID checkbox   yes
    Generic.Fetch alert message text and compare it with    Settings Updated
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      add-location
    LocationPage.Save location form     save
    LocationPage.Verify the validation of country name field
    LocationPage.Compare and verify the validation messages of Location     ${Locationcountry_validation}       Please Select Country
    LocationPage.Verify the validation of Location name field when organization settings is yes
    LocationPage.Compare and verify the validation messages of Location     ${Locationnameyes_validation}      Please Enter Location Name
    LocationPage.Add invalid Location Name      locationName     A*
    LocationPage.Verify the validation of Location name field when organization settings is yes
    LocationPage.Compare and verify the validation messages of Location     ${Locationname_validation}      Please Enter Valid Location Name
    LocationPage.Click on cancel Location

Verifying the validations of all fields of Edit location
    [Tags]    Negative
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
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Edit
    Generic.Verify your current page location contains    edit
    LocationPage.Clear the data of location country     qa-country-name
    LocationPage.clear the data of location name
    Generic.click on the button    Update
    LocationPage.Verify the validation of country name field
    LocationPage.Compare and verify the validation messages of Location     ${Locationcountry_validation}       Please Select Country
    LocationPage.Verify the validation of Location name field when organization settings is yes
    LocationPage.Compare and verify the validation messages of Location     ${Locationnameyes_validation}      Please Enter Location Name

Add multiple IP subnets while adding location
    [Tags]      NT
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
    LocationPage.Enter input in the IP subnet field     1           192.168.0.0/23
    LocationPage.Click on the plus icon of the subnet
    LocationPage.Enter input in the IP subnet field     2            10.255.255.255/25
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Edit
    Generic.Verify your current page location contains    edit
    LocationPage.Edit location country   United States
    LocationPage.Select location building name   Trump tower
    LocationPage.Select location floor   second
    LocationPage.Select location room    203
    LocationPage.Select location address one     this address one of the location
    LocationPage.Select location address two     this address two of the location
    LocationPage.Edit location state       Arizona
    LocationPage.Edit location city        Anthem
    LocationPage.Select location zip     5781
    LocationPage.Enter random cost center value
    LocationPage.Create random location name
    LocationPage.Click on the plus icon of the subnet
    LocationPage.Enter input in the IP subnet field     3             172.20.0.0/26
    Generic.click on the button    Update
    Generic.Fetch alert message text and compare it with    Location updated successfully
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}

Verify user should not able to Deactivate Location having Team Member created
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Input new location in add team member    ${generated_location}
#    TeamMemberPage.Select team member location with new domain
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Location having more than 0 technologies member, partner or contract cannot be deactivated.

Verify user should not able to Remove Location having Team Member created
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button        Add New Member
    TeamMemberPage.Enter team member first name
    TeamMemberPage.Enter team member last name
    Generic.Enter phone number      India   +91     9646289871
    TeamMemberPage.Enter team member business email_mailinator
    TeamMemberPage.Enter the Position in member form        QA
    TeamMemberPage.Click on team member department
    TeamMemberPage.Select team member department        DepartmentName0451927202
    TeamMemberPage.Select team member role     Admin
    TeamMemberPage.Click on team member location
    TeamMemberPage.Input new location in add team member    ${generated_location}
    TeamMemberPage.Save the team member form   save
    Generic.Fetch alert message text and compare it with        Team Member created successfully
    TeamMemberPage.Search Team Member by name       ${generated_TMFname}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Verify that remove Location button is not visible having asset, member, partner or contract created.

Verify user should not able to Deactivate Location having Technology
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location          ${generated_location}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load for filters
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Location having more than 0 technologies member, partner or contract cannot be deactivated.

Verify user should not able to Remove Location having Technology
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Add assignment information location          ${generated_location}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load for filters
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Verify that remove Location button is not visible having asset, member, partner or contract created.

Verify user should not able to Deactivate Location having Manufacturer
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Location having more than 0 technologies member, partner or contract cannot be deactivated.

Verify user should not able to Deactivate Location having Supplier
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Supplier
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Location having more than 0 technologies member, partner or contract cannot be deactivated.

Verify user should not able to Deactivate Location having Support Partner
    [Tags]      Negative
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
    Generic.click on the button     Save
    Generic.Fetch alert message text and compare it with    Location created successfully
    LocationPage.Search by location name     ${generated_location}
    Generic.Click on the profile name
    Generic.Select option from profile list     personal-details
    Generic.Verify your current page location contains      personal-profile
    DashboardPage.Select an option from company details side list    Technology
    Generic.Verify your current page location contains       technology-settings
    ReplaceDomainAPI.Replace Domain
    DashboardPage.Click on View Your Added Brand List
    Generic.Verify your current page location contains      brand-list
    DashboardPage.Click add brand button
    DashboardPage.Create random brandName
    DashboardPage.Add static Business Manufacturer URL      yopmail.net
    DashboardPage.Add brand manufacturer country      United States
    DashboardPage.Save added brand details
    Generic.Fetch alert message text and compare it with        Brand created successfully.
    DashboardPage.Click on main Save Button
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner
    PartnersPage.Click new partner button
    Generic.Verify your current page location contains      addpartner
    PartnersPage.Select partner type of new partner     Support Partner
    PartnersPage.Select partner business_name     ${generated_BrandName}
    PartnersPage.Select partner business URL
    PartnersPage.Select partner country       United States
    PartnersPage.Click on Add new Contact of partner        Add new Contact
    PartnersPage.Enter random contact person
    PartnersPage.Enter contact business email    ${generate_PersonName}     yopmail
    Generic.Enter phone number      India   +91     9646289871
    PartnersPage.Enter contact location      ${generated_location}
    PartnersPage.Save the new contact
    PartnersPage.Click contact main save button
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name    ${generated_BrandName}
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    LocationPage.Search by location name     ${generated_location}
    LocationPage.Fetch the location Name from the row       ${generated_location}
    LocationPage.Click on three dots on row
    LocationPage.Select the option from row menu     Deactivate
    LocationPage.Select option from change location status pop up     yes
    Generic.Fetch alert message text and compare it with    Location having more than 0 technologies member, partner or contract cannot be deactivated.
