*** Settings ***
Documentation   Contains all keyword of Location page
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
*** Variables ***

${location_Action}     css:.qa-location-actions
${location_country}     css:.qa-country-name input
${location_buildingName}     css:#buildingName
${location_floor}     css:#floor
${location_room}     css:#room
${location_addressOne}     css:#strretAddress1
${location_addressTwo}     css:#strretAddress2
${location_State}     css:.qa-State input
${location_City}     css:.qa-City input
${location_Zip}     css:#zip
${location_Name}     css:#locationName

${search_LocationName}     css:.search-location-qa

${rowMenu}     css:.three-dots


*** Keywords ***

Click on Location action button
    Wait Until Element Is Visible       ${location_Action}    ${wait_time}
    Wait Until Element Is Enabled      ${location_Action}     ${wait_time}
    click element       ${location_Action}
    wait until element is not visible       ${shadow}          ${wait_time}

Click on add location button
    [Arguments]    ${option}
    Wait Until Element Is Visible       //a[@title='${option}']    ${wait_time}
    Wait Until Element Is Enabled      //a[@title='${option}']     ${wait_time}
    click element       //a[@title='${option}']
    wait until element is not visible       ${shadow}          ${wait_time}

#----------------------- only bulk edit location is not having title-----------------------
Select the option from action menu
    [Arguments]    ${option}
    wait until element is visible       css:.qa-location-bulk-${option}     ${wait_time}
    wait until element is enabled       css:.qa-location-bulk-${option}     ${wait_time}
    click element   css:.qa-location-bulk-${option}
    wait until element is not visible       ${shadow}          ${wait_time}

Select location country
    [Arguments]    ${option}
    Wait Until Element Is Visible       //ng-select[@formcontrolname='Country']//following-sibling::ng-dropdown-panel//div//span[normalize-space()='${option}']    ${wait_time}
    Wait Until Element Is Enabled      //ng-select[@formcontrolname='Country']//following-sibling::ng-dropdown-panel//div//span[normalize-space()='${option}']     ${wait_time}
    click element       //ng-select[@formcontrolname='Country']//following-sibling::ng-dropdown-panel//div//span[normalize-space()='United States']

#    Clear Element Text      ${location_country}
#    Generic.Select parameter    ${option}

Select location building name
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_buildingName}    ${wait_time}
    click element       ${location_buildingName}
    input text  ${location_buildingName}     ${option}

Select location floor
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_floor}    ${wait_time}
    click element       ${location_floor}
    input text  ${location_floor}     ${option}

Select location room
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_room}    ${wait_time}
    click element       ${location_room}
    input text  ${location_room}     ${option}

Select location address one
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_addressOne}    ${wait_time}
    click element       ${location_addressOne}
    input text  ${location_addressOne}     ${option}

Select location address two
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_addressTwo}    ${wait_time}
    click element       ${location_addressTwo}
    input text  ${location_addressTwo}     ${option}


Select location state
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_State}    ${wait_time}
    Wait Until Element Is Enabled      ${location_State}     ${wait_time}
    click element       ${location_State}
    Clear Element Text      ${location_State}
    Generic.Select parameter    ${option}

Select location city
    [Arguments]    ${option}
    Wait Until Element Is Visible      ${location_City}   ${wait_time}
    Wait Until Element Is Enabled      ${location_City}     ${wait_time}
    click element       ${location_City}
    Clear Element Text      ${location_City}
    Generic.Select parameter    ${option}

Select location zip
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_Zip}    ${wait_time}
    click element       ${location_Zip}
    input text  ${location_Zip}     ${option}

Create random location name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_location}=    Catenate    LocationName${random_string}
    wait until element is visible       ${location_Name}    ${wait_time}
    input text   ${location_Name}   ${generated_location}
    set global variable    ${generated_location}

Create self location name
    [Arguments]    ${option}
    wait until element is visible       ${location_Name}    ${wait_time}
    input text   ${location_Name}   ${option}

Save location form
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:.qa-${option}-location    ${wait_time}
    click element       css:.qa-${option}-location
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          ${wait_time}

Fetch the location Name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_locationName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_locationName}
    log to console     Location_Name=${fetch_locationName}

Fetch and verify the location status from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     ${wait_time}
    ${fetch_locationStatus} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_locationStatus}
    log to console     Location_Status=${fetch_locationStatus}
    should be equal    ${fetch_locationStatus}     ${option}


Click on three dots on row
    Wait Until Element Is Visible       ${rowMenu}    ${wait_time}
    Wait Until Element Is Enabled       ${rowMenu}    ${wait_time}
    click element       ${rowMenu}

Select the option from row menu
    [Arguments]    ${option}
    Wait Until Element Is Visible      //a[normalize-space()='${option}']    ${wait_time}
    Wait Until Element Is enabled      //a[normalize-space()='${option}']   ${wait_time}
    click element       //a[normalize-space()='${option}']

Select option from change location status pop up
    [Arguments]    ${option}
    Wait Until Element Is Visible      css:.qa-update-location-status-${option}-action    ${wait_time}
    Wait Until Element Is enabled      css:.qa-update-location-status-${option}-action    ${wait_time}
    Mouse over      css:.qa-update-location-status-${option}-action
    click element      css:.qa-update-location-status-${option}-action
    wait until element is not visible       ${shadow}          ${wait_time}
#    sleep       1

#------------------------------------------------------------------------------------------------

Select option from country column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='List'] div:nth-child(3) div    ${wait_time}
    click element       css:div[aria-label='List'] div:nth-child(3) div

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    ${wait_time}
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Search by location name
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     click element      ${search_LocationName}
     Clear Element Text      ${search_LocationName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_LocationName}   ${LocationName}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
     Fetch the location Name from the row   ${LocationName}
     should be equal    ${fetch_locationName}     ${LocationName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time    3    ${pageHeading}   Location Page - Search location name in the table    3    ${pageTime}     ${ActualTime}    LocationPage_Time

Enter random cost center value
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_location}=    Catenate    CostCenter_${random_string}
    wait until element is visible       css:.qa-cost-center    ${wait_time}
    wait until element is enabled       css:.qa-cost-center    ${wait_time}
    input text   css:.qa-cost-center   ${generated_location}
    set global variable    ${generated_location}

Create Random IP Subnet
    ${random_string1} =     Evaluate    random.randint(1, 255)
    ${random_string2} =     Evaluate    random.randint(1, 255)
    ${random_string3} =     Evaluate    random.randint(1, 255)
    ${random_string4} =     Evaluate    random.randint(1, 255)
    ${generated_SubnetIP} =    Catenate    ${random_string1}.${random_string2}.${random_string3}.${random_string4}
    Wait Until Element Is Visible    css:input[formcontrolname='IPSubnets']    ${wait_time}
    Wait Until Element Is Enabled    css:input[formcontrolname='IPSubnets']    ${wait_time}
    Input Text    css:input[formcontrolname='IPSubnets']    ${generated_SubnetIP}
    set global variable    ${generated_SubnetIP}

Click on the export button of location under technology details page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@id,'location')]//button[@id='dropdownMenuButton']        ${wait_time}
    wait until element is enabled      //div[contains(@id,'location')]//button[@id='dropdownMenuButton']        ${wait_time}
    click element  //div[contains(@id,'location')]//button[@id='dropdownMenuButton']


Download the selected extension file of location under technology details
    [Arguments]    ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@id,'location')]//a[contains(text(),'${option}')]       ${wait_time}
    wait until element is enabled     //div[contains(@id,'location')]//a[contains(text(),'${option}')]       ${wait_time}
    click element   //div[contains(@id,'location')]//a[contains(text(),'${option}')]

Select option from pop-up to remove location
    [Arguments]     ${option}
    Generic.click on the button    ${option}

Get Location name when add location
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.qa-LocationTypeName       ${wait_time}
    ${location_name_systemgenerated}=   get text     css:.qa-LocationTypeName
    Log To Console    ${location_name_systemgenerated}
    Set Global Variable    ${location_name_systemgenerated}

Create random location_name when generated by user
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_location_user}=    Catenate    LocationName${random_string}
    wait until element is visible      css:#LocationTypeName    ${wait_time}
    input text   css:#LocationTypeName   ${generated_location_user}
    set global variable    ${generated_location_user}

Enter building_name location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#BuildingName    ${wait_time}
    click element       css:#BuildingName
    input text  css:#BuildingName     ${option}

Enter floor location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#Floor    ${wait_time}
    click element       css:#Floor
    input text  css:#Floor     ${option}

Enter room location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#Room    ${wait_time}
    click element       css:#Room
    input text  css:#Room     ${option}

Enter address_1 location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#StreetAddress1    ${wait_time}
    click element       css:#StreetAddress1
    input text  css:#StreetAddress1     ${option}

Enter address_2 location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#StreetAddress2    ${wait_time}
    click element       css:#StreetAddress2
    input text  css:#StreetAddress2      ${option}

Enter zip_code location_name when generated by user
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:#Zip    ${wait_time}
    click element       css:#Zip
    input text  css:#Zip     ${option}

Edit location country
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_country}    ${wait_time}
    Wait Until Element Is Enabled      ${location_country}     ${wait_time}
    Input Text    ${location_country}    ${option}
    Generic.Select parameter    ${option}

Edit location state
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_State}    ${wait_time}
    Wait Until Element Is Enabled      ${location_State}     ${wait_time}
    Input Text    ${location_State}    ${option}
    Generic.Select parameter    ${option}

Edit location city
    [Arguments]    ${option}
    Wait Until Element Is Visible      ${location_City}   ${wait_time}
    Wait Until Element Is Enabled      ${location_City}     ${wait_time}
    Input Text      ${location_City}        ${option}
    Generic.Select parameter    ${option}