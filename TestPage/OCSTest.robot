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


Test Setup      open the browser with the url
#Test Teardown   Close Browser Session



*** Variables ***


*** Test Cases ***

Search Discovered Assets
    TRY
       Generic.click on the tab	Login
       LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
       LandingPage.Verify you are on dashboard page
       Generic.Verify your current page location contains      management-console
       Generic.Click on the profile name
       Generic.Select option from profile list     view-discovery
       Generic.Verify your current page location contains    ocs
       OCS.Choose tab under Discovery Assets   agent-discovery
       OCS.Choose tab under Discovery Assets   network-discovery
       OCS.Click on newly discovered tab under network discovery
       OCS.Click on search icon of discovery assets
       OCS.Enter text to search discovery asset    1428-4
       OCS.Click on the down arrow icon of discovered asset
       OCS.Mouse Hover over searched Discovered Assets
       OCS.Verify Searched discovery asset    1428-4
       OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
       OCS.Get Serial number by hovering over discovered assets     Serial Number:
       OCS.Get Host name by hovering over discovered assets     Host name:
       OCS.Click on Searched Discovered asset
       Sleep    ${yop_sleep}
       Switch Window       aithentic | Discovery Asset Detail
       Generic.Verify your current page contains this text    Asset Infomation
       OCS.Click on tab under dicovery_asset_detail page    Hardware
       Generic.Verify your current page contains this text     ${hover_serial_number}
       OCS.Click on tab under dicovery_asset_detail page    Network
       Generic.Verify your current page contains this text    ${hover_MAC_address1}
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Search Existing Assets
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Click on action button of technology
        TechnologyPage.Choose add technology from action button of technology
        Generic.Verify your current page location contains      addtechnology
        TechnologyPage.Click technology brand input field
        TechnologyPage.Select parameter from brand dropdown list       QABrand555
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        TechnologyPage.Add assetID for technology lifecycle information random
        TechnologyPage.Click on save technology form button
        Generic.Fetch alert message text and compare it with        Technology created successfully
        TechnologyPage.Click on save technology form pop button
        Generic.Verify your current page location contains      technology-list
        Generic.Wait until table get load
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of Existing assets
        OCS.Enter text to search existing asset    ${generated_AssetID}
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over searched existing assets
        OCS.Verify searched existing asset    ${generated_AssetID}
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Match Discovery and Existing Asset
    [Tags]      Sanity
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Click on action button of technology
        TechnologyPage.Choose add technology from action button of technology
        Generic.Verify your current page location contains      addtechnology
        TechnologyPage.Click technology brand input field
        TechnologyPage.Select parameter from brand dropdown list       QABrand555
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        TechnologyPage.Add assetID for technology lifecycle information random
        TechnologyPage.Click on save technology form button
        Generic.Fetch alert message text and compare it with        Technology created successfully
        TechnologyPage.Click on save technology form pop button
        Generic.Verify your current page location contains      technology-list
        Generic.Wait until table get load
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
        OCS.Select any Discovered asset
        OCS.Click on search icon of Existing assets
        OCS.Enter text to search existing asset    ${generated_AssetID}
        OCS.Verify searched existing asset    ${generated_AssetID}
        OCS.Select any existing asset
        OCS.Click on search icon of Existing assets
        OCS.Verify that line appears between selected assets
        OCS.Click on Button inside Network Discovery Page     Confirm Matches
        Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Serial no. and compare it with    ${hover_serial_number}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Apply filters and clear filter on Discovered Asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form     johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains      discovery-assets
        OCS.Click on newly discovered tab under network discovery
        OCS.click on filter icon of discovered assets
        OCS.Choose filters for discovered asset     Select Brand
        OCS.Get text of selected brand, mac address and agent of discovered assets  0
        OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
        Generic.click on the button     Apply
        sleep   ${search_sleep}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Get text by hovering over assets    Brand:
        OCS.verify Text by hovering over assets  ${substring}       ${selected_brand}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Click on clear filter button link of discovered assets    Clear Filters
        OCS.Choose filters for discovered asset     Select MAC Address
        OCS.Get text of selected brand, mac address and agent of discovered assets  0
        OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
        Generic.click on the button     Apply
        sleep  ${search_sleep}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Get MAC_Address by hovering over discovered assets     MacAddress:
        OCS.verify Text by hovering over assets  ${hover_MAC_address1}       ${selected_brand}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Click on clear filter button link of discovered assets    Clear Filters
        OCS.Choose filters for discovered asset     Select Agent Tags
        OCS.Get text of selected brand, mac address and agent of discovered assets  0
        OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
        Generic.click on the button     Apply
        sleep  ${search_sleep}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Get text by hovering over assets    Tag:
        OCS.verify Text by hovering over assets  ${substring}       ${selected_brand}
        OCS.Click on clear filter button link of discovered assets    Clear Filters
        sleep   ${search_sleep}
        OCS.Click on the down arrow icon of discovered asset
        sleep   ${search_sleep}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Get text by hovering over assets     Brand:
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Apply filters and clear filter on Existing Assets
    [Tags]      Sanity
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form     johns@mai.25u.com     Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains      discovery-assets
        OCS.Click on newly discovered tab under network discovery
        OCS.click on filter icon of existing assets
        OCS.Choose filters for discovered asset     Select Brand
#       OCS.Enter input in the brand field of existing asset       QABrand555
        OCS.Enter input in the brand field of existing asset       Apple Inc.
        OCS.Get text of selected brand of filter of existing asset
        Generic.click on the button     Apply
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over filters of existing asset
        OCS.Get text by hovering over existing assets   Brand:
        OCS.verify Text by hovering over assets  ${substring1}       ${brand}
        OCS.Click on the down arrow icon of existing assets
        OCS.Click on clear filter button link of discovered assets      Clear Filters
        OCS.Choose filters for discovered asset     Select Product
        OCS.Enter input in the product field of filters of existing agent       Macmini9,1
        OCS.Get text of selected brand of filter of existing asset
        Generic.click on the button     Apply
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over filters of existing asset
        OCS.Get text by hovering over existing assets   Model/Product Name:
        OCS.verify Text by hovering over assets  ${substring1}      ${brand}
        OCS.Click on the down arrow icon of existing assets
        OCS.Click on clear filter button link of discovered assets  Clear Filters
        OCS.Choose filters for discovered asset    Select Department
        OCS.Get text of selected brand, mac address and agent of discovered assets  0
        OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
        Generic.click on the button     Apply
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over filters of existing asset
        OCS.click on the right text asset result of existing asset
        sleep       ${yop_sleep}
        Switch Window   aithentic | Technology - Details
        TechnologyPage.Click on Location tab of technology- list page
        TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     DepartmentName
        OCS.verify Text by hovering over assets  ${assign_loc_input_value}       ${selected_brand}
        sleep       ${yop_sleep}
        Switch Window   aithentic | Asset - Discovery
        OCS.Click on the down arrow icon of existing assets
        OCS.Click on clear filter button link of discovered assets  Clear Filters
        OCS.Choose filters for discovered asset    Select Location
        OCS.Get text of selected brand, mac address and agent of discovered assets  0
        OCS.Select brand_macaddres_agent from dropdown of discovered asset filter   0
        Generic.click on the button     Apply
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over filters of existing asset
        OCS.click on the right text asset result of existing asset
        sleep       ${yop_sleep}
        Switch Window   aithentic | Technology - Details
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Get Value of Assignment Information Location_Department_AssginTo_IDFields     LocationName
        OCS.verify Text by hovering over assets  ${assign_loc_input_value}       ${selected_brand}
        sleep       ${yop_sleep}
        Switch Window   aithentic | Asset - Discovery
        OCS.Click on the down arrow icon of existing assets
        OCS.Click on clear filter button link of discovered assets      Clear Filters
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Add Discovery Asset
    TRY
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
        OCS.Choose Tab under Asset Discovery    agent-discovery
        OCS.Click on plus icon under table of agent discovery
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
        OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        sleep   ${search_sleep}
        Generic.Wait until table get load
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        OCS.Verify Page should contain Element     discovery-info-tab
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    hardware-tab
        OCS.Verify Discovery_info contains following tab    software-tab
        OCS.Verify Discovery_info contains following tab    network-tab
        OCS.Verify Discovery_info contains following tab    devices-tab
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Create Asset from Add Assets Page
    TRY
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
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Enter The Asset_id in Add Technology Page
        TechnologyPage.Create unique serial number random
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
        OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Add component as an asset from Agent Discovery page
    TRY
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
        OCS.Choose Tab under Asset Discovery    agent-discovery
        OCS.Click on plus icon under table of agent discovery
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
        OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        OCS.Verify Page should contain Element     discovery-info-tab
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    hardware-tab
        OCS.Verify Discovery_info contains following tab    software-tab
        sleep   ${search_sleep}
        OCS.Enter input in search bar of software tab under technology details page     python
        Generic.Scroll the page till   499
        OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
        OCS.Click on plus icon of any component
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Create Asset_id for software component
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Technology - Details
        OCS.Verify Software tab Should contain Element
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Upload Image and Document File while Add Discovery Asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset   Apple Inc
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
        OCS.Get Serial number by hovering over discovered assets     Serial Number:
        OCS.Get Host name by hovering over discovered assets     Host name:
        OCS.Choose Tab under Asset Discovery    agent-discovery
        OCS.Click on plus icon under table of agent discovery
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        TechnologyPage.Create unique serial number random
        OCS.Enter The Asset_id in Add Technology Page
        TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
        Generic.Scroll Window To End
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .jpg
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .png
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       aithentic | Add Discovery Asset
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
         OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        TechnologyPage.Click on attachment tab
        TechnologyPage.Upload file          Document_02.pdf
        Generic.Scroll Window To End
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       Main
        TechnologyPage.Download the file by clicking on download icon over file    .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       Main
        OCS.Verify Page should contain Element     discovery-info-tab
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    hardware-tab
        OCS.Verify Discovery_info contains following tab    software-tab
        OCS.Verify Discovery_info contains following tab    network-tab
        OCS.Verify Discovery_info contains following tab    devices-tab
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        Generic.Scroll Window To End
        TechnologyPage.Remove the document by clicking on cross-icon    .pdf
        TechnologyPage.Remove the document by clicking on cross-icon    .png
        TechnologyPage.Upload file      Image_02.png     Document_02.pdf
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .png
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Edit - Technology
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Upload Image and Document File while Add component as an asset from Agent Discovery page
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset   Apple Inc
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
        OCS.Get Serial number by hovering over discovered assets     Serial Number:
        OCS.Get Host name by hovering over discovered assets     Host name:
        OCS.Choose Tab under Asset Discovery    agent-discovery
        OCS.Click on plus icon under table of agent discovery
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Enter The Asset_id in Add Technology Page
        TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
        Generic.Scroll Window To End
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .jpg
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .png
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       aithentic | Add Discovery Asset
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
        OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        OCS.Visible the print qr button to for data loading
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    hardware-tab
        OCS.Verify Discovery_info contains following tab    software-tab
        sleep   ${search_sleep}
        OCS.Enter input in search bar of software tab under technology details page     python
        Generic.Scroll the page till   499
        OCS.Hover Over Add component button and verify text         Please click on the 'plus' icon to add component
        OCS.Click on plus icon of any component
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Create Asset_id for software component
        TechnologyPage.Upload file      Image_01.jpg      Document_02.pdf       Image_02.png
        Generic.Scroll Window To End
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .jpg
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       aithentic | Add Discovery Asset
        TechnologyPage.View the file by clicking on view icon over file     .png
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Technology - Details
        OCS.Verify Discovery_info contains following tab    software-tab
        Generic.Refresh the existing page
        OCS.Click on Discovery_info tab on Technology details Page
        OCS.Verify Discovery_info contains following tab    hardware-tab
        OCS.Verify Discovery_info contains following tab    software-tab
        sleep   ${search_sleep}
        OCS.Enter input in search bar of software tab under technology details page     python
        OCS.Verify Software tab Should contain Element
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        Generic.Scroll Window To End
        TechnologyPage.Remove the document by clicking on cross-icon    .jpg
        TechnologyPage.Remove the document by clicking on cross-icon    .pdf
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Match IP Discovered asset with Existing asset
    Generic.click on the tab	Login
    LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
    LandingPage.Verify you are on dashboard page
    Generic.Verify your current page location contains      management-console
    Generic.Click on the profile name
    Generic.Select option from profile list     view-discovery
    Generic.Verify your current page location contains    ocs
    OCS.Click on newly discovered tab under network discovery
    OCS.Click on search icon of discovery assets
    OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
    OCS.Click on the down arrow icon of discovered asset
    OCS.Mouse Hover over searched IP Assets
    OCS.Get MAC_Address by hovering over IP discovered assets    MacAddress:
    OCS.Select any Discovered asset
    OCS.Click on search icon of discovery assets
    OCS.Click on the down arrow icon of existing assets
    OCS.Mouse Hover over searched existing assets
    OCS.Get asset id by hovering over existing assets    Asset Id:
    OCS.Select any existing asset
    OCS.Verify that line appears between selected assets
    OCS.Click on Button inside Network Discovery Page     Confirm Matches
    Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
    Generic.select the option from the side menu    Technology
    Generic.Verify your current page location contains      technology
    TechnologyPage.Search by AssetId       ${hover_assetid}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_addressIP}
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint

Match Discovery Asset with Static Existing Asset
    TRY
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
        OCS.Select any Discovered asset
        OCS.Click on the down arrow icon of existing assets
        OCS.Mouse Hover over searched existing assets
        OCS.Get asset id by hovering over existing assets    Asset Id:
        OCS.Select any existing asset
        OCS.Verify that line appears between selected assets
        OCS.Click on Button inside Network Discovery Page     Confirm Matches
        Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Search by AssetId         ${hover_assetid}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_address1}
        OCS.Get Value of Serial no. and compare it with    ${hover_serial_number}
        OCS.Get Value of Host-Name and compare it with    ${hover_host name}
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Match IP Discovered Asset with Dynamic Existing Asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Click on action button of technology
        TechnologyPage.Choose add technology from action button of technology
        Generic.Verify your current page location contains      addtechnology
        TechnologyPage.Click technology brand input field
        TechnologyPage.Select parameter from brand dropdown list       QABrand555
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        TechnologyPage.Add assetID for technology lifecycle information random
        TechnologyPage.Add mac address for technology group information for hardware
        TechnologyPage.Add host name for technology group information for hardware random
        TechnologyPage.Create random unique serial number
        TechnologyPage.Click on save technology form button
        Generic.Fetch alert message text and compare it with        Technology created successfully
        TechnologyPage.Click on save technology form pop button
        Generic.Verify your current page location contains      technology-list
        Generic.Wait until table get load
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
        Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
        OCS.Get MAC_Address by hovering over IP discovered assets    MacAddress:
        OCS.Select any Discovered asset
        OCS.Click on search icon of discovery assets
        OCS.Click on search icon of Existing assets
        OCS.Enter text to search existing asset    ${generated_AssetID}
        sleep   ${search_sleep}
        OCS.Click on the down arrow icon of existing assets
    #    OCS.Verify searched existing asset    ${generated_AssetID}
        OCS.Select any existing asset
        OCS.Click on search icon of Existing assets
        OCS.Verify that line appears between selected assets
        OCS.Click on Button inside Network Discovery Page     Confirm Matches
        Generic.Fetch alert message text and compare it with      Matched Assets updated successfully
        Generic.select the option from the side menu    Technology
        Generic.Verify your current page location contains      technology
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_addressIP}
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Add asset with IP Address under discovered asset list
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Choose tab under Discovery Assets   agent-discovery
        Generic.Verify your current page location contains    ocs
        OCS.click on the value of IP discovered devices of inside table
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        OCS.Fetch the Brandname from agent discovery page
        OCS.Click on down arrow link on discovery asset list page
        OCS.Click on view button link on discovery asset list page
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Verify your current page location contains    discovery-asset-details
        OCS.Get MAC_Address by hovering over discovery asset detail page    Mac Address :
        close window
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        TechnologyPage.Click on back to list of technology
        Generic.Verify your current page location contains    ocs
        I_iconPage.Choose tab under Discovery Assets       network-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    ${hover_MAC_addressdiscoveryassetdetail}
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Get MAC_Address by hovering over IP discovered assets    MacAddress:
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
#        TechnologyPage.Add mac address for technology group information for hardware
        TechnologyPage.Add host name for technology group information for hardware random
        TechnologyPage.Create random unique serial number
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Verify your current page location contains      ocs
         OCS.Choose tab under Discovery Assets   agent-discovery
        Generic.Verify your current page location contains    ocs
        OCS.click on the value of IP discovered devices of inside table
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        Generic.Refresh the existing page
        OCS.Click on down arrow link on discovery asset list page
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_addressIP}
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Add Asset with IP address from Network Discovery Page
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Verify Searched discovery asset         00:17:61:10:C6:A1
        OCS.Get MAC_Address by hovering over IP discovered assets   MacAddress:
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
#        TechnologyPage.Add mac address for technology group information for hardware
        TechnologyPage.Add host name for technology group information for hardware random
        TechnologyPage.Create random unique serial number
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with       ${hover_MAC_addressIP}
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Network discovery: search on discovered asset list with Tag Name, IP_address and MAC_address
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu    Asset Discovery
        Generic.Verify your current page location contains     discovery-assets
        OCS.Fetch the IP address tagname from agent discovery page
        OCS.Fetch the Mac_address from agent discovery page
        OCS.click on the value of IP discovered devices of inside table
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        OCS.Fetch the Brandname from agent discovery page
        OCS.Click on Plus icon under table
        Sleep    ${yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Macmini9,1
        TechnologyPage.Create unique serial number random
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window        aithentic | Discovered Assets
        Generic.Verify your current page location contains    discovery-assets-list
        OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List       ${Brand_name}
        TechnologyPage.verify Text from Assignment Information     ${Brand_name}          Apple, Inc.
        OCS.Click on Refresh Icon of discovered asset lists
        OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List       ${generated_AssetID}
        TechnologyPage.verify Text from Assignment Information     ${generated_AssetID}          ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Network discovery: search on discovered asset list with Tag Name, IP_address and MAC_address
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu    Asset Discovery
        Generic.Verify your current page location contains     discovery-assets
        OCS.Fetch the IP address tagname from agent discovery page
        OCS.Fetch the Mac_address from agent discovery page
        OCS.click on the value of IP discovered devices of inside table
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        OCS.Fetch the Brandname from agent discovery page
        OCS.Click on Plus icon under table
        Sleep    ${yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Macmini9,1
        TechnologyPage.Create unique serial number random
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window        aithentic | Discovered Assets
        Generic.Verify your current page location contains    discovery-assets-list
        OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List       ${Brand_name}
        TechnologyPage.verify Text from Assignment Information     ${Brand_name}          Apple, Inc.
        OCS.Click on Refresh Icon of discovered asset lists
        OCS.Search with MAC address and IP Address on the search bar of Discovered Asset List       ${generated_AssetID}
        TechnologyPage.verify Text from Assignment Information     ${generated_AssetID}          ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Search with containing fields under advance search of discovered asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu    Asset Discovery
        Generic.Verify your current page location contains     discovery-assets
        I_iconPage.Choose tab under Discovery Assets       network-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        I_iconPage.Click on advanced search link under create asset network discovery
        sleep   ${search_sleep}
        Generic.click on the button     Reset Filters
        OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
        Generic.click on the button     Search
        sleep      ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for brand
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the Brand Name from the brand field of discovered asset
        TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter and select technology type in advance search of discovered search
        Generic.click on the button     Search
        sleep       ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology type
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the technology type from the technology type field of component of discovered asset
        TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter input in the technology group field of advanced search of discovered asset
        TechnologyPage.Enter product in the product input field     Xampp
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology group
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Get text of technology group inside add technology
        TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter product in the product input field     Vishal luthra
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of product inside add technology
        TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

        Generic.click on the button     Reset Filters
        TechnologyPage.Enter description in the description input field     Aithentic Description
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of description inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter feature in the description input field     Aithentic Feature
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of feature inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Search with containing fields under advance search of component of discovered asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.select the option from the side menu        Asset Discovery
        Generic.Verify your current page location contains      discovery-assets
        I_iconPage.Choose tab under Discovery Assets       network-discovery
        OCS.Click on newly discovered tab under network discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset   Apple Inc
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        TechnologyPage.Create unique serial number random
        OCS.Enter The Asset_id in Add Technology Page
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
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
        OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
        Generic.click on the button     Search
        sleep      ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for brand
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the Brand Name from the brand field of discovered asset
        TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter and select technology type in advance search of discovered search
        Generic.click on the button     Search
        sleep       ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology type
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the technology type from the technology type field of component of discovered asset
        TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter input in the technology group field of advanced search of discovered asset
        TechnologyPage.Enter product in the product input field     Xampp
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology group
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Get text of technology group inside add technology
        TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter product in the product input field     Vishal luthra
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of product inside add technology
        TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

        Generic.click on the button     Reset Filters
        TechnologyPage.Enter description in the description input field     Aithentic Description
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of description inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter feature in the description input field     Aithentic Feature
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of feature inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}
        I_iconPage.Click on the cross icon of advanced search under technology
        sleep   ${search_sleep}

        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

Search with containing fields under advance search of IP Address of discovered asset
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
    #    OCS.Get MAC_Address by hovering over discovered assets    MacAddress:
        OCS.Get MAC_Address by hovering over IP discovered assets   MacAddress:
        Generic.select the option from the side menu    Asset Discovery
        Generic.Verify your current page location contains     discovery-assets
        OCS.click on the value of IP discovered devices of inside table
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Discovered Assets
        Generic.Verify your current page location contains     discovery-assets-list
        OCS.Fetch the Brandname from agent discovery page
        OCS.Click on Plus icon under table
        Sleep    ${Yop_Sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page location contains    add-discovered-asset
        Generic.Verify your current page contains this text    Add Technology
        I_iconPage.Click on advanced search link under create asset network discovery
        sleep   ${search_sleep}
        Generic.click on the button     Reset Filters
        OCS.Enter input in the brand field of advanced search of discovered asset       Lenovo
        Generic.click on the button     Search
        sleep      ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for brand
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the Brand Name from the brand field of discovered asset
        TechnologyPage.verify Text from Assignment Information      Lenovo       ${brand_name}
        sleep   ${yop_sleep}
        Generic.Refresh the existing page
        sleep   ${yop_sleep}
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter and select technology type in advance search of discovered search
        Generic.click on the button     Search
        sleep       ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology type
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        OCS.Fetch the technology type from the technology type field of component of discovered asset
        TechnologyPage.verify Text from Assignment Information      Maintenance       ${Technology_type}
        Generic.Refresh the existing page
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        OCS.Enter input in the technology group field of advanced search of discovered asset
        TechnologyPage.Enter product in the product input field     Xampp
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        OCS.Click on the table inside advanced search of discovered asset for technology group
        Generic.Scroll Window To End
        Generic.click on the button     Select
        sleep   ${search_sleep}
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Get text of technology group inside add technology
        TechnologyPage.verify Text from Assignment Information      Applications      ${Technology_group}
        Generic.Refresh the existing page
        Generic.Refresh the existing page
        I_iconPage.Click on advanced search link under create asset network discovery
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter product in the product input field     Vishal luthra
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of product inside add technology
        TechnologyPage.verify Text from Assignment Information      Vishal luthra      ${product}

        Generic.click on the button     Reset Filters
        TechnologyPage.Enter description in the description input field     Aithentic Description
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of description inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Description     ${description}
        Generic.click on the button     Reset Filters
        TechnologyPage.Enter feature in the description input field     Aithentic Feature
        Generic.click on the button     Search
        sleep   ${search_sleep}
        TechnologyPage.Wait until advanced search table get load
        TechnologyPage.Get text of feature inside add technology
        TechnologyPage.verify Text from Assignment Information      Aithentic Feature     ${feature}
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END

#Disconnect
#    DisconnectConnectorAPI.Hit API to disconnect connector

Upload Image and Document file during Add Asset with IP address from Agent Discovery Page
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets
        OCS.Enter text to search discovery asset    00:17:61:10:C6:A1
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched IP Assets
        OCS.Verify Searched discovery asset    00:17:61:10:C6:A1
        OCS.Get MAC_Address by hovering over IP discovered assets    MacAddress:
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
#        TechnologyPage.Add mac address for technology group information for hardware
        TechnologyPage.Add host name for technology group information for hardware random
        TechnologyPage.Create random unique serial number
        OCS.Enter The Asset_id in Add Technology Page
        Generic.Scroll Window To End
        TechnologyPage.Upload file      Image_01.jpg       Image_02.png     Document_02.pdf
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .jpg
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .png
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       aithentic | Add Discovery Asset
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Verify your current page location contains      discovery-assets
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        OCS.Get Value of MAC-Address from technology details and compare it with      ${hover_MAC_addressIP}
        TechnologyPage.Click on attachment tab
        TechnologyPage.Upload file          Document_02.pdf
        Generic.Scroll Window To End
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       Main
        TechnologyPage.Download the file by clicking on download icon over file    .pdf
        Sleep    ${yop_sleep}
        Switch Window       NEW
        Generic.Verify your current page location contains    amazonaws
        Generic.Verify your current page location contains    .pdf
        Switch Window       Main
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit The Host_Name of Asset
        OCS.Edit the Serial_No. of Asset
        Generic.Scroll Window To End
        TechnologyPage.Remove the document by clicking on cross-icon    .pdf
        TechnologyPage.Remove the document by clicking on cross-icon    .png
        TechnologyPage.Upload file     Image_01.jpg
        Generic.Fetch alert message text and compare it with        Technology documents uploaded successfully
        TechnologyPage.View the file by clicking on view icon over file     .jpg
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-in
        TechnologyPage.Get and Verify the size of the image after zoom      zoom-out
        TechnologyPage.Click on cross icon to close the document
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END



##############################################################################################################

Create Asset from Add Assets Page 2
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
    OCS.Mark check-box of Agent/Discovered Asset
    OCS.Click on Button inside Network Discovery Page       Add Assets
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Add Discovery Asset
    Generic.Verify your current page contains this text    Add Technology
    TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
    OCS.Enter The Asset_id in Add Technology Page
    TechnologyPage.Create unique serial number random
    OCS.Click on save button of Add Technology Page
    OCS.Wait for the invisiblity of alert msg        Technology created successfully
    Sleep    ${yop_sleep}
    Switch Window       aithentic | Asset - Discovery
    Generic.Refresh the existing page
    OCS.Choose Tab under Asset Discovery    agent-discovery
    Generic.Verify your current page contains this text    ${generated_AssetID}
    Generic.select the option from the side menu        Technology
    Generic.Verify your current page location contains      technology-list
    TechnologyPage.Search by AssetId       ${generated_AssetID}
    TechnologyPage.Click on the first row of the technology table
    Generic.Verify your current page location contains    technology-details
    TechnologyPage.Click on edit button on product details page        Edit
    Generic.Verify your current page location contains      edit-technology
    OCS.Edit the MAC_Address of Asset
    OCS.Edit the Serial_No. of Asset
    OCS.Edit The Host_Name of Asset
    TechnologyPage.Click on update button of edit_technology page       Update
    Generic.Fetch alert message text and compare it with        Technology updated successfully
    UnselectAssetAPI.Hit API Endpoint


#Test the method
#    TRY
#        log     this is try method
#    TRY
#        log     this is try method two
#    TRY
#        log     this is try method three
#    EXCEPT
#        log     this is except method
#    ELSE
#        log     this is else method
#    FINALLY
#        log     this is final method
#    END
#
#
#Test Try Blocks
#    TRY
#        OCS.Try Block One
#        OCS.Try Block Two
#        Fail
#        OCS.Try Block Three
#    EXCEPT
#        TRY
#            Log    this is inside try
#        EXCEPT    this is inside catch
#    END

Test Try Blocks 2
    TRY
        Generic.click on the tab	Login
        LandingPage.Fill the login Form       johns@mai.25u.com         Test@123
        LandingPage.Verify you are on dashboard page
        Generic.Verify your current page location contains      management-console
        Generic.Click on the profile name
        Generic.Select option from profile list     view-discovery
        Generic.Verify your current page location contains    ocs
        OCS.Click on newly discovered tab under network discovery
        OCS.Click on search icon of discovery assets

        OCS.Enter text to search discovery asset        Apple Inc
        OCS.Click on the down arrow icon of discovered asset
        OCS.Mouse Hover over searched Discovered Assets
        OCS.Mark check-box of Agent/Discovered Asset
        OCS.Click on Button inside Network Discovery Page       Add Assets
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Add Discovery Asset
        Generic.Verify your current page contains this text    Add Technology
        TechnologyPage.Select parameter from technology dropdown list      Product_00337612322
        OCS.Enter The Asset_id in Add Technology Page
        TechnologyPage.Create unique serial number random
        OCS.Click on save button of Add Technology Page
        OCS.Wait for the invisiblity of alert msg        Technology created successfully
        Sleep    ${yop_sleep}
        Switch Window       aithentic | Asset - Discovery
        Generic.Refresh the existing page
        OCS.Choose Tab under Asset Discovery    agent-discovery
        Generic.Verify your current page contains this text    ${generated_AssetID}
        Generic.select the option from the side menu        Technology
        Generic.Verify your current page location contains      technology-list
        TechnologyPage.Search by AssetId       ${generated_AssetID}
        TechnologyPage.Click on the first row of the technology table
        Generic.Verify your current page location contains    technology-details
        TechnologyPage.Click on edit button on product details page        Edit
        Generic.Verify your current page location contains      edit-technology
        OCS.Edit the MAC_Address of Asset
        OCS.Edit the Serial_No. of Asset
        OCS.Edit The Host_Name of Asset
        TechnologyPage.Click on update button of edit_technology page       Update
        Generic.Fetch alert message text and compare it with        Technology updated successfully
        UnselectAssetAPI.Hit API Endpoint
    EXCEPT
        OCS.My Failure Handling
        Fail
    FINALLY
        OCS.Welcome to the code
    END