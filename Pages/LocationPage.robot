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

${MAX_LIMIT}            500

${search_LocationName}     css:.search-location-qa

${rowMenu}     css:.three-dots


*** Keywords ***

Click on Location action button
    Wait Until Element Is Visible       ${location_Action}    ${wait_time}
    Wait Until Element Is Enabled      ${location_Action}     ${wait_time}
    sleep       ${search_sleep}
    click element       ${location_Action}


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
    Wait Until Element Is Visible   css:#country       ${wait_time}
    Wait Until Element Is Enabled   css:#country        ${wait_time}
    click element       css:#country
    Clear Element Text      css:#country
    input text  css:#country     ${option}
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
    wait until element is visible      css:div[aria-label='Rich Select Field'] div:nth-child(3) div    ${wait_time}
    click element      css:div[aria-label='Rich Select Field'] div:nth-child(3) div

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
     Calculate Running time    3    ${pageHeading}   Location Page - Search location name on the location page listing    3    ${pageTime}     ${ActualTime}    LocationPage_Time

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
    sleep   ${search_sleep}
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
    Clear Element Text      ${location_country}
    Input Text    ${location_country}    ${option}
#    Generic.Select parameter    ${option}
    Wait Until Element Is Visible       //ng-select[contains(@class,'qa-country-name')]//ng-dropdown-panel//span[normalize-space()='${option}']    ${wait_time}
    Wait Until Element Is Enabled       //ng-select[contains(@class,'qa-country-name')]//ng-dropdown-panel//span[normalize-space()='${option}']     ${wait_time}
    click element       //ng-select[contains(@class,'qa-country-name')]//ng-dropdown-panel//span[normalize-space()='${option}']

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

Click on the status filter under location
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.qa-location-filter-status       ${wait_time}
    Wait Until Element Is Visible    css:.qa-location-filter-status       ${wait_time}
    click element    css:.qa-location-filter-status

Select the option from status filter under location
    [Arguments]     ${option}
    Wait Until Element Is Visible    //div[contains(@class,'sidenav-content ')]//following-sibling::div//label[normalize-space()=' ${option}']      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'sidenav-content ')]//following-sibling::div//label[normalize-space()=' ${option}']      ${wait_time}
    click element    //div[contains(@class,'sidenav-content ')]//following-sibling::div//label[normalize-space()=' ${option}']


Get the text of selected filter under location
    [Arguments]     ${option}
    wait until element is visible      //div[contains(@class,'sidenav-content ')]//following-sibling::div[contains(@class,'row')]//label[contains(text(),'${option}')]    ${wait_time}
    ${fetch_Name_of_selected_filter} =    get text    //div[contains(@class,'sidenav-content ')]//following-sibling::div[contains(@class,'row')]//label[contains(text(),'${option}')]
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_filter}
    ${New_Name}=    Evaluate    '${original_string}'.strip()
    log to console    ${New_Name}
    set global variable    ${New_Name}

Click on the location filter under location
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.select-location-filters-qa       ${wait_time}
    Wait Until Element Is Visible    css:.select-location-filters-qa      ${wait_time}
    click element    css:.select-location-filters-qa

Select the option from location filter under location
    [Arguments]     ${option}
    Wait Until Element Is Visible   //div[contains(@class,'sidenav-content ')]//following-sibling::div[contains(@class,'row')]//label[contains(text(),'${option}')]     ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'sidenav-content ')]//following-sibling::div[contains(@class,'row')]//label[contains(text(),'${option}')]      ${wait_time}
    click element    //div[contains(@class,'sidenav-content ')]//following-sibling::div[contains(@class,'row')]//label[contains(text(),'${option}')]

Fetch the country from location filter and click
    [Arguments]     ${option}       ${option1}      ${option2}     ${option3}
#    ${element_count}=    Get Element Count    css:.qa-total-count-list
#    Log      ${element_count}
    FOR    ${index}    IN RANGE    1    ${total_data_count + 1}
        Wait Until Element Is Visible   (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]      ${wait_time}
        Wait Until Element Is Enabled   (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]       ${wait_time}
        ${element1}=    Get Text    (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]
        ${original_string}=    Set Variable    ${element1}
        ${New_Country}=    Evaluate    '${original_string}'.strip()
        Log    Element ${index}: ${New_Country}
        Run Keyword If    '${New_Country}' == '${option3}'    Run Keywords    Empty Action of location   AND     Continue For Loop

    END




Empty Action of location
    Log    Elements value are equal

Get the text of selected status filter under location
    [Arguments]     ${option}
    wait until element is visible      //div[contains(@class,'sidenav-content ')]//following-sibling::div//label[normalize-space()=' ${option}']    ${wait_time}
    ${fetch_Name_of_selected_status} =    get text  //div[contains(@class,'sidenav-content ')]//following-sibling::div//label[normalize-space()=' ${option}']
    ${original_string}=    Set Variable    ${fetch_Name_of_selected_status}
    ${New_status}=    Evaluate    '${original_string}'.strip()
    log to console    ${New_status}
    set global variable   ${New_status}

Method 1
    [Arguments]    ${option}
    ${status}=    Run Keyword And Return Status    Element Should Be Visible    //td[normalize-space()='${option}']   ${wait_time}
    Set Global Variable    ${status}
    RETURN    ${status}


Get new location
    [Arguments]         ${option}
    Run Keyword If    ${status} == True
        ...    LocationPage.Skip case
        ...    ELSE  Run Keywords     LocationPage.Create the location  ${option}
        ...    AND    Return From Keyword


Skip case
     log   Element is already there

Create the location
    [Arguments]         ${option}
    LocationPage.Click on Location action button
    LocationPage.Click on add location button    Add New Location
    Generic.Verify your current page location contains      add-location
    LocationPage.Select location country     United States
    LocationPage.Create static location name        ${option}
    LocationPage.Save location form     save
    Generic.Fetch alert message text and compare it with    Location created successfully


Create static location name
    [Arguments]     ${option}
    wait until element is visible       ${location_Name}    ${wait_time}
    wait until element is enabled          ${location_Name}    ${wait_time}
    click element   ${location_Name}
    input text   ${location_Name}   ${option}

Search by location name using statc location
    [Arguments]    ${LocationName}
     wait until element is not visible      ${loaderIcon}     ${wait_time}
     wait until element is visible       css:thead tr       ${wait_time}
     wait until element is not visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]      ${wait_time}
     click element      ${search_LocationName}
     Clear Element Text      ${search_LocationName}
     ${StartTime1} =     Get Current Time in Milliseconds
     input text   ${search_LocationName}   ${LocationName}
     sleep   ${search_sleep}
     wait until element is not visible       (//tbody//tr[2]//div[contains(@class,'skeleton')])[1]      ${wait_time}


Verify the validation of country name field
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //ng-select[contains(@class,'qa-country-name')]//following-sibling::p//span      ${wait_time}
    wait until element is enabled       //ng-select[contains(@class,'qa-country-name')]//following-sibling::p//span      ${wait_time}
    ${Locationcountry_validation}=     Get text       //ng-select[contains(@class,'qa-country-name')]//following-sibling::p//span
    log     ${Locationcountry_validation}
    set global variable     ${Locationcountry_validation}


Verify the validation of Location name field
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //input[contains(@class,'qa-LocationTypeName')]//parent::app-text-input//following-sibling::p//span      ${wait_time}
    wait until element is enabled       //input[contains(@class,'qa-LocationTypeName')]//parent::app-text-input//following-sibling::p//span      ${wait_time}
    ${Locationname_validation}=     Get text       //input[contains(@class,'qa-LocationTypeName')]//parent::app-text-input//following-sibling::p//span
    log     ${Locationname_validation}
    set global variable     ${Locationname_validation}

Compare and verify the validation messages of Location
    [Arguments]         ${option1}      ${option2}
    Should be equal       ${option1}      ${option2}

Add invalid Location country
    [Arguments]    ${country}
    wait until element is visible       ${location_country}        ${wait_time}
    click element   ${location_country}
    Clear Element Text      ${location_country}
    input text   ${location_country}   ${country}
    wait until element is visible       //div[contains(@class,"ng-option-disabled")][normalize-space()='No items found']        ${wait_time}

Add invalid Location Name
    [Arguments]    ${option1}       ${option2}
    wait until element is visible      //input[@id='${option1}']        ${wait_time}
    click element   //input[@id='${option1}']
    Clear Element Text      //input[@id='${option1}']
    input text   //input[@id='${option1}']   ${option2}

Click on Save to add location
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.saveLocation-QA        ${wait_time}
    wait until element is enabled       css:.saveLocation-QA        ${wait_time}
    click element   css:.saveLocation-QA

Click on cancel Location
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.qa-cancel-location        ${wait_time}
    wait until element is enabled       css:.qa-cancel-location        ${wait_time}
    click element   css:.qa-cancel-location
    wait until element is not visible    ${loaderIcon}      ${wait_time}

Verify the validation of Location name field when organization settings is yes
    wait until element is not visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //input[contains(@class,'qa-LocationTypeName')]//parent::div//following-sibling::p//span      ${wait_time}
    wait until element is enabled       //input[contains(@class,'qa-LocationTypeName')]//parent::div//following-sibling::p//span      ${wait_time}
    ${Locationnameyes_validation}=     Get text       //input[contains(@class,'qa-LocationTypeName')]//parent::div//following-sibling::p//span
    log     ${Locationnameyes_validation}
    set global variable     ${Locationnameyes_validation}

Clear the data of location country
    [Arguments]    ${option}
    Wait Until Element Is Visible       ${location_country}    ${wait_time}
    Wait Until Element Is Enabled      ${location_country}     ${wait_time}
    wait until element is visible     css:.${option} span[title='Clear all']        ${wait_time}
    click element   css:.${option} span[title='Clear all']


clear the data of location name
    Wait Until Element Is Visible       ${location_Name}    ${wait_time}
    Wait Until Element Is Enabled      ${location_Name}     ${wait_time}
    click element       ${location_Name}
    Clear Element Text      ${location_Name}



#Fetch the country from location filter and click
#    [Arguments]     ${option}       ${option1}      ${option2}       ${option3}
##    ${element_count}=    Get Element Count    css:.qa-total-count-list
##    Log      ${element_count}
#    ${total_data_count} =    Get Element Count    xpath=//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')]
#    ${a} =    Set Count Variable    ${total_data_count}
#    Log    Total data count (limited to 500 if applicable): ${a}
#
#    FOR    ${index}    IN RANGE    1    ${a + 1}
#        ${xpath}=    Set Variable    (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]
#
#        Wait Until Element Is Visible    (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]    ${wait_time}
#        Wait Until Element Is Enabled    (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]    ${wait_time}
#
#        ${element1}=    Get Text    (//th//div[contains(@class,'columnName')][normalize-space()='${option}']//ancestor::table//following::tr//td[${option1}][contains(text(),'${option2}')])[${index}]
#        ${original_string}=    Set Variable    ${element1}
#        ${New_Country}=    Evaluate    '${original_string}'.strip()
#
#        Log    Element ${index}: ${New_Country}
#
#        Run Keyword If    '${New_Country}' == '${option3}'    Run Keywords    Empty Action of Location    AND    Continue For Loop
#    END
#
#
#
#Set Count Variable
#    [Arguments]    ${total_count}
#    ${a} =    Run Keyword If    ${total_count} <= ${MAX_LIMIT}    Set Variable    ${total_count}    ELSE    Set Variable    ${MAX_LIMIT}
#    [Return]    ${a}