*** Settings ***
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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***



*** Test Cases ***
    Export Partner list
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    ReplaceDomainAPI.Replace Domain
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    Generic.Wait until table get load
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export partner list under technology details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       AssetID_7003489679
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      partners
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export Location List
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    Generic.Wait until table get load
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export location list of location under technology details page
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       AssetID_7003489679
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      location
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export partner list while adding new partner
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    ReplaceDomainAPI.Replace Domain
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    Generic.Wait until table get load
    PartnersPage.Click new partner button
    PartnersPage.Select partner type of new partner     Manufacturer
    PartnersPage.Create partner random business name
    PartnersPage.Enter partner business URL     yopmail
    PartnersPage.Select partner country       United States
    PartnersPage.Click on the save button   Save
    Generic.Fetch alert message text and compare it with    Partner created successfully
    PartnersPage.Search by business name   ${generate_BusinessName}
    PartnersPage.Click on three dots of partners listing
    PartnersPage.Select option from three dots of partner     Details
    Generic.Verify your current page location contains      partner-details
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export list of parent tab under technology details
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       AssetID_7003489679
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Parent assetID for technology lifecycle information random
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId      ${generated_NewParentAssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    TechnologyPage.Select add new entry        Existing Asset
    Generic.Verify your current page location contains      technology
    TechnologyPage.Get And Verify The Count Of existing asset of parent
    Generic.click on the tab        Link
    Generic.Fetch alert message text and compare it with        Technology linked successfully.
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export Team member list
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Click on export button of team member
    TeamMemberPage.Choose option after clicking on Action button    Export Data







