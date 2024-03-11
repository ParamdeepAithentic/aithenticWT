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
Resource        ../Pages/ITperformancePage.robot
Resource        ../Pages/LandingPage.robot
Resource        ../Pages/TechnologyPage.robot
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
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot

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
    Wait Until Element Is Visible       ${location_Action}    60
    Wait Until Element Is Enabled      ${location_Action}     60
    click element       ${location_Action}

Click on add location button
    [Arguments]    ${option}
    Wait Until Element Is Visible       //a[@title='${option}']    60
    Wait Until Element Is Enabled      //a[@title='${option}']     60
    click element       //a[@title='${option}']

#----------------------- only bulk edit location is not having title-----------------------
Select the option from action menu
    [Arguments]    ${option}
    wait until element is visible       css:.qa-location-bulk-${option}     60
    wait until element is enabled       css:.qa-location-bulk-${option}     60
    click element   css:.qa-location-bulk-${option}

Select location country
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_country}    60
    Wait Until Element Is Enabled      ${location_country}     60
    click element       ${location_country}
    Clear Element Text      ${location_country}
    Generic.Select parameter    ${option}

Select location building name
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_buildingName}    60
    click element       ${location_buildingName}
    input text  ${location_buildingName}     ${option}

Select location floor
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_floor}    60
    click element       ${location_floor}
    input text  ${location_floor}     ${option}

Select location room
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_room}    60
    click element       ${location_room}
    input text  ${location_room}     ${option}

Select location address one
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_addressOne}    60
    click element       ${location_addressOne}
    input text  ${location_addressOne}     ${option}

Select location address two
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_addressTwo}    60
    click element       ${location_addressTwo}
    input text  ${location_addressTwo}     ${option}


Select location state
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_State}    60
    Wait Until Element Is Enabled      ${location_State}     60
    click element       ${location_State}
    Clear Element Text      ${location_State}
    Generic.Select parameter    ${option}

Select location city
    [Arguments]    ${option}
    Wait Until Element Is Visible      ${location_City}   60
    Wait Until Element Is Enabled      ${location_City}     60
    click element       ${location_City}
    Clear Element Text      ${location_City}
    Generic.Select parameter    ${option}

Select location zip
    [Arguments]    ${option}
    Wait Until Element Is Enabled       ${location_Zip}    60
    click element       ${location_Zip}
    input text  ${location_Zip}     ${option}

Create random location name
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_location}=    Catenate    LocationName${random_string}
    wait until element is visible       ${location_Name}    60
    input text   ${location_Name}   ${generated_location}
    set global variable    ${generated_location}

Create self location name
    [Arguments]    ${option}
    wait until element is visible       ${location_Name}    60
    input text   ${location_Name}   ${option}

Save location form
    [Arguments]    ${option}
    Wait Until Element Is Enabled       css:.qa-${option}-location    60
    click element       css:.qa-${option}-location
    Wait Until Element Is Not Visible    ${loaderIcon}      60

Fetch the location Name from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_locationName} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_locationName}
    log to console     Location_Name=${fetch_locationName}

Fetch and verify the location status from the row
    [Arguments]    ${option}
    wait until element is visible       //td[normalize-space()='${option}']     60
    ${fetch_locationStatus} =    get text    //td[normalize-space()='${option}']
    set global variable    ${fetch_locationStatus}
    log to console     Location_Status=${fetch_locationStatus}
    should be equal    ${fetch_locationStatus}     ${option}


Click on three dots on row
    Wait Until Element Is Visible       ${rowMenu}    60
    Wait Until Element Is Enabled       ${rowMenu}    60
    click element       ${rowMenu}

Select the option from row menu
    [Arguments]    ${option}
    Wait Until Element Is Visible      //a[normalize-space()='${option}']    60
    Wait Until Element Is enabled      //a[normalize-space()='${option}']   60
    click element       //a[normalize-space()='${option}']

Select option from change location status pop up
    [Arguments]    ${option}
    Wait Until Element Is Visible      css:.qa-update-location-status-${option}-action    60
    Wait Until Element Is enabled      css:.qa-update-location-status-${option}-action    60
    Mouse over      css:.qa-update-location-status-${option}-action
    click element      css:.qa-update-location-status-${option}-action
#    sleep       1

#------------------------------------------------------------------------------------------------

Select option from country column
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    wait until element is visible      css:div[aria-label='List'] div:nth-child(3) div    60
    click element       css:div[aria-label='List'] div:nth-child(3) div

Double click
    [Arguments]    ${option}
    wait until element is visible      css:.ag-center-cols-container div[col-id='${option}']    60
    Double click element      css:.ag-center-cols-container div[col-id='${option}']
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     CONTROL+A
    Press Keys    css:.ag-center-cols-container div[col-id='${option}']     DELETE

Search by location name
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     60
     wait until element is visible       css:thead tr       60
     click element      ${search_LocationName}
     Clear Element Text      ${search_LocationName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_LocationName}   ${LocationName}
     sleep   ${search_sleep}
     Wait Until Element Is Not Visible    ${loaderIcon}      60
     Fetch the location Name from the row   ${LocationName}
     should be equal    ${fetch_locationName}     ${LocationName}
     ${EndTime1} =     Get Current Time in Milliseconds
     ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
     Calculate Running time    3    ${pageHeading}   Location Page - Search location name in the table    3    ${pageTime}     ${ActualTime}    LocationPage_Time

Enter random cost center value
    ${random_string} =    Generate Random String       5      [NUMBERS]
    ${generated_location}=    Catenate    CostCenter_${random_string}
    wait until element is visible       css:.qa-cost-center    60
    wait until element is enabled       css:.qa-cost-center    60
    input text   css:.qa-cost-center   ${generated_location}
    set global variable    ${generated_location}

Create Random IP Subnet
    ${random_string1} =     Evaluate    random.randint(1, 255)
    ${random_string2} =     Evaluate    random.randint(1, 255)
    ${random_string3} =     Evaluate    random.randint(1, 255)
    ${random_string4} =     Evaluate    random.randint(1, 255)
    ${generated_SubnetIP} =    Catenate    ${random_string1}.${random_string2}.${random_string3}.${random_string4}
    Wait Until Element Is Visible    css:input[formcontrolname='IPSubnets']    60
    Wait Until Element Is Enabled    css:input[formcontrolname='IPSubnets']    60
    Input Text    css:input[formcontrolname='IPSubnets']    ${generated_SubnetIP}
    set global variable    ${generated_SubnetIP}