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
Export Partner list
    [Tags]      Stable
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    ReplaceDomainAPI.Replace Domain
    Generic.select the option from the side menu    Partners
    Generic.Verify your current page location contains      partner-listing
    Generic.Wait until table get load
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export partner list under technology details
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Select tab under technology details      partners
    Generic.Wait until table get load
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export button of partner under technology details page
    PartnersPage.Download the selected extension file of partner under technology details      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export Location List
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Location
    Generic.Verify your current page location contains      locationlist
    Generic.Wait until table get load
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on Location action button
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export location list of location under technology details page
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Click on update button of edit_technology page      Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    Generic.Verify your current page location contains     technology-details
    TechnologyPage.Click on Location tab of technology- list page
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    LocationPage.Click on the export button of location under technology details page
    LocationPage.Download the selected extension file of location under technology details      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export partner list while adding new partner
    [Tags]      Stable
    Generic.click on the tab	    Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
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
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export list of parent tab under technology details
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Parent assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    Generic.Scroll Window To End
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId      ${generated_NewParentAssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      parent-components
    TechnologyPage.Click on add new entry parent button under technology details page      Add New Entry
    sleep   ${search_sleep}
    TechnologyPage.Select add new entry        Existing Asset
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Get And Verify The Count Of existing asset of parent
    Generic.click on the tab        Link
    Generic.Fetch alert message text and compare it with        Technology linked successfully.
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of parent tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export Team member list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Excel(.xlsx)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      OpenDocument(.ods)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Comma Separated Values(.csv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TeamMemberPage.Click on add team member action button
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Tab Separated Values(.tsv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export Assigned User list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Team Members
    Generic.Verify your current page location contains      memberslist
    MemberPage.Click on assigned user tab under team member      Assigned Users
    MemberPage.Click on action button of assigned users
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Excel(.xlsx)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    MemberPage.Click on action button of assigned users
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      OpenDocument(.ods)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    MemberPage.Click on action button of assigned users
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Comma Separated Values(.csv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    MemberPage.Click on action button of assigned users
    TeamMemberPage.Choose option after clicking on Action button    Export Data
    TeamMemberPage.Download the selected extension file of team member      Tab Separated Values(.tsv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!


Export technology details page list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
#    TechnologyPage.click on add technology button
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    #           TechnologyPage.Click technology product input field
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select purchase date
    TechnologyPage.Select warranty end date    12/12/2028
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Add technology lifecycle comment    Technology Lifecycle Information- comment
    TechnologyPage.Add order number of technology cost information     56
    TechnologyPage.Add payment partner of technology cost information      testqa 20Feb
    TechnologyPage.Add cost type of technology cost information        Purchased
    TechnologyPage.Add payment type of technology cost information     FixedPayment
    TechnologyPage.Add payment peroid of technology cost information       Monthly
    TechnologyPage.Add first payment date of technology cost information       12/12/2028
    TechnologyPage.Add budget payment of technology cost information       1100
    TechnologyPage.Add actual payment of technology cost information       1050
    TechnologyPage.Add expense type of technology cost information     Capex
    TechnologyPage.Add assignment information location     United States - Test qa Up50260220 - 21 - 2
    TechnologyPage.Add assignment information department name      TestQA Department Up31840619
    TechnologyPage.Add assignment information assign to        Testqaup94590327      QA
    TechnologyPage.Add support partner of partners information     QABusiness04191432
    TechnologyPage.Add supplier of partners information        qabrand10050505
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Click on the export button of deatils tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of deatils tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of deatils tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of deatils tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export component tab list
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Click on action button of technology
    TechnologyPage.Choose add technology from action button of technology
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       OPMR815274
    TechnologyPage.Create unique serial number random
    TechnologyPage.Add assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      components
    TechnologyPage.Click on add new entry component button under technology details page       Add New Entry
    TechnologyPage.Select add new entry        New Asset
    Generic.Verify your current page location contains      addtechnology
    TechnologyPage.Click technology brand input field
    TechnologyPage.Select parameter from brand dropdown list       QABrand555
    TechnologyPage.Select parameter from technology dropdown list       Product_00337612322
    TechnologyPage.Add New_Component assetID for technology lifecycle information random
    TechnologyPage.Select technology lifecycle status      Active
    Generic.Scroll Window To End
#    sleep   ${search_sleep}
    TechnologyPage.Click on save technology form button
    Generic.Fetch alert message text and compare it with        Technology created successfully
    TechnologyPage.Click on save technology form pop button
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains     technology-details
    OCS.Visible the print qr button to for data loading
    TechnologyPage.Select tab under technology details      components
    TechnologyPage.Click on add new entry component button under technology details page       Add New Entry
    sleep   ${search_sleep}
    TechnologyPage.Select add new entry        Existing Asset
    sleep   ${search_sleep}
    Generic.Verify your current page location contains      technology
    Generic.Wait until table get load
    TechnologyPage.Get And Verify The Count Of existing asset of parent
    Generic.click on the tab        Link
    Generic.Fetch alert message text and compare it with        Technology linked successfully.
    TechnologyPage.Click on the export button of component tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .xlsx
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of component tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .ods
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of component tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .csv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    TechnologyPage.Click on the export button of component tab under technology details page
    TechnologyPage.Download the selected extension file of parent under technology details      .tsv
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

Export account overview tab data
    [Tags]      Stable
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}    ${valid_password}
#    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      dashboard
    DashboardPage.select the option from the dashboard drawer       Account Overview
    Generic.Verify your current page location contains          account-overview
    DashboardPage.Click on the export button under account overview tab
    TeamMemberPage.Download the selected extension file of team member      Excel(.xlsx)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    DashboardPage.Click on the export button under account overview tab
    TeamMemberPage.Download the selected extension file of team member      OpenDocument(.ods)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    DashboardPage.Click on the export button under account overview tab
    TeamMemberPage.Download the selected extension file of team member     Comma Separated Values(.csv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    DashboardPage.Click on the export button under account overview tab
    TeamMemberPage.Download the selected extension file of team member      Tab Separated Values(.tsv)
    PartnersPage.Confirm to export file        confirm
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

