*** Settings ***
Documentation   Contains all test cases of OCS page
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
Resource        ../Pages/KeyClockPage.robot
Resource        ../Pages/TeamMemberPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/UnselectAssetAPI.robot
Resource        ../Pages/PaginationPage.robot



Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***


Verify pagination of technology Table
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     technology
    PaginationPage.Log WebElements      technology

Verify pagination of partner table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     partner-list
    PaginationPage.Log WebElements      partner-list

Verify pagination of contract table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Contracts
    Generic.Verify your current page location contains      contracts-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     contracts
    PaginationPage.Log WebElements      contracts

Verify pagination of Department table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     department-dropdown
    Generic.Verify your current page location contains      department
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     department
    PaginationPage.Log WebElements      department

Verify pagination of Brand table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     brand-dropdown
    Generic.Verify your current page location contains      brand-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     brand
    PaginationPage.Log WebElements      brand

Verify pagination of Product table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     product-dropdown
    Generic.Verify your current page location contains      product-list
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     products
    PaginationPage.Log WebElements      products

Verify pagination of location Table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     location-list
    PaginationPage.Log WebElements      location-list

Verify pagination of Team Member Table
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     member-list
    PaginationPage.Log WebElements      member-list

Verify pagination of Assigned User Table
    [Tags]    Smoke
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab   Assigned Users
    PaginationPage.Check the table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     assignee-list
    PaginationPage.Log WebElements      assignee-list

Verify Pagination of Product Dropdown when Add and Edit Technology
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click on advanced search button link under add technology
    TechnologyPage.Click technology advanced brand input field
    TechnologyPage.Select parameter from advanced brand dropdown list        Wacom
    Generic.click on the button     Search
    sleep      ${search_sleep}
    TechnologyPage.Wait until advanced search table get load
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     location-list
    PaginationPage.Log WebElements of Product Dropdown      location-list
    PaginationPage.Close the advance Search pop-up
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      addtechnology

    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       Wacom
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     location-list
    PaginationPage.Log WebElements of Product Dropdown      location-list
    TechnologyPage.Select parameter from technology dropdown list       ACK42014
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Click on the edit icon on the edit technology page
    TechnologyPage.Click on cross icon of product while editing technology
    TechnologyPage.Select parameter from brand dropdown list        HP Inc.
    PaginationPage.Fetch the total count
    PaginationPage.Click on the pagination dropdown     location-list
    PaginationPage.Log WebElements of Product Dropdown      location-list


Verify Pagination of Product Dropdown when Add discovered asset and component
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    Apple Inc
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
        OCS.Get Serial number by hovering over discovered assets     Serial Number:
        OCS.Get Host name by hovering over discovered assets     Host name:
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        I_iconPage.Click on advanced search link under create asset network discovery
        sleep   ${search_sleep}
        Generic.click on the button     Reset Filters
        OCS.Enter input in the brand field of advanced search of discovered asset       Wacom
        Generic.click on the button     Search
        sleep      ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        PaginationPage.Fetch the total count of OCS
        PaginationPage.Click on the pagination dropdown of OCS      location-list
        PaginationPage.Log WebElements of Product Dropdown of OCS   location-list
        PaginationPage.Close the advance Search pop-up
        sleep   ${search_sleep}
        Generic.Verify your current page location contains      add-discovered-asset
#        PaginationPage.Clear the brand from brand input field
        PaginationPage.Enter the input in the brand field of discovered asset
        PaginationPage.Select parameter from brand dropdown list of OCS       Wacom
        PaginationPage.Fetch the total count
        PaginationPage.Click on the pagination dropdown     location-list
        PaginationPage.Log WebElements of Product Dropdown      location-list
        TechnologyPage.Select parameter from technology dropdown list       ACK42014
        OCS.Enter The Asset_id in Add Technology Page
        TechnologyPage.Create random unique serial number
        Generic.Scroll Window To End
        sleep      ${search_sleep}
        TechnologyPage.Click on save technology form button
        Generic.Fetch alert message text and compare it with        Technology created successfully
#        TechnologyPage.Click on save technology form pop button
            Sleep    ${yop_sleep}
        switch window    aithentic | Asset - Discovery
        OCS.Choose tab under Discovery Assets   agent-discovery
        Generic.Verify your current page location contains      ocs
        Generic.Refresh the existing page

        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Visible the print qr button to for data loading
        OCS.Verify Page should contain Element     discovery-info-tab
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    software-tab
        sleep   ${search_sleep}
        OCS.Enter input in search bar of software tab under technology details page     python
        Generic.Scroll the page till   499
        OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
        OCS.Click on plus icon of any component
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        I_iconPage.Click on advanced search link under create asset network discovery
        sleep   ${search_sleep}
        Generic.click on the button     Reset Filters
        OCS.Enter input in the brand field of advanced search of discovered asset       Wacom
        Generic.click on the button     Search
        sleep      ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        PaginationPage.Fetch the total count of OCS
        PaginationPage.Click on the pagination dropdown of OCS    location-list
        PaginationPage.Log WebElements of Product Dropdown of OCS      location-list
        PaginationPage.Close the advance Search pop-up
        sleep   ${search_sleep}
        Generic.Verify your current page location contains      add-discovered-asset
#        PaginationPage.Clear the brand from brand input field
        PaginationPage.Enter the input in the brand field of discovered asset
        PaginationPage.Select parameter from brand dropdown list of OCS       Wacom
        Generic.Refresh the existing page
        PaginationPage.Fetch the total count
        PaginationPage.Click on the pagination dropdown     location-list
        PaginationPage.Log WebElements of Product Dropdown      location-list
        TechnologyPage.Select parameter from technology dropdown list       ACK42014
       OCS.Enter The Asset_id in Add Technology Page
       TechnologyPage.Create random unique serial number
       OCS.Enter The Asset_id in Add Technology Page
       Generic.Scroll Window To End
       sleep      ${search_sleep}
        TechnologyPage.Click on save technology form button
        Generic.Fetch alert message text and compare it with        Technology created successfully
        sleep  ${yop_sleep}
        switch window   aithentic | Technology - Details
#        Generic.select the option from the side menu        Technology
#        Generic.Verify your current page location contains      technology-list
#        TechnologyPage.Search by AssetId       ${generated_AssetID}
#        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint

