*** Settings ***
Documentation   Contains all keyword of Register user page
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
${registerLink}     css:.register-button-qa
${register_Fname}     css:#FirstName
${register_Lname}       css:#LastName
${register_CompanyName}   css:#companyName
${register_memberType}     css:.qa-RoleId
${register_Email}     css:#Email
${register_FormCheckBox}   css:label[for='policy'] span     #checkbox
${register_FormSubmitBTN}   css:button[type='submit']
${loaderIcon}     //div[@role='status']
${activeAssetPOPup}     //h5[normalize-space()='Available Inactive Assests']
${profile_position}     css:#Position
${profile_email}        css:.qa-Email
${profile_phone}        //div[contains(@class,'iti')]//input[@id='phone']
${profile_company}         css:#CompanyName

*** Keywords ***
Download Agent popup
    [Arguments]    ${option}
    wait until element is visible      //button[normalize-space()='${option}']     ${wait_time}
    wait until element is enabled      //button[normalize-space()='${option}']     ${wait_time}
    click element       //button[normalize-space()='${option}']
    wait until element is not visible       ${shadow}          ${wait_time}


#Verify that agent is ready to get download
#    wait until element is not visible     ${preparingAgent_text}      ${wait_time}
#    wait until element is visible     ${AgentReady_text}      ${wait_time}



Create random register first name
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is enabled       ${register_Fname}        ${wait_time}
    click element   ${register_Fname}
    Clear element text      ${register_Fname}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_register_Fname}=    Catenate    FName${random_string}
    input text   ${register_Fname}   ${generate_register_Fname}
    set global variable    ${generate_register_Fname}

Create self register first name
    [Arguments]    ${option}
    wait until element is enabled       ${register_Fname}        ${wait_time}
    click element   ${register_Fname}
    Clear element text      ${register_Fname}
    input text   ${register_Fname}   ${option}


Create random register last name
    wait until element is enabled       ${register_Lname}        ${wait_time}
    click element   ${register_Lname}
    Clear element text      ${register_Lname}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_register_Lname}=    Catenate    LName${random_string}
    input text   ${register_Lname}   ${generate_register_Lname}
    set global variable    ${generate_register_Lname}

Create self register last name
    [Arguments]    ${option}
    wait until element is enabled       ${register_Lname}        ${wait_time}
    click element   ${register_Lname}
    Clear element text      ${register_Lname}
    input text   ${register_Lname}   ${option}

Create random register company name
    wait until element is enabled       ${register_CompanyName}        ${wait_time}
    click element   ${register_CompanyName}
    Clear element text      ${register_CompanyName}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_register_CompanyName}=    Catenate    CompanyName${random_string}
    input text   ${register_CompanyName}   ${generate_register_CompanyName}
    set global variable    ${generate_register_CompanyName}


Create self register company name
    [Arguments]    ${option}
    wait until element is enabled       ${register_CompanyName}        ${wait_time}
    click element   ${register_CompanyName}
    Clear element text      ${register_CompanyName}
    input text   ${register_CompanyName}   ${option}


Click on member type
    wait until element is enabled       ${register_memberType}        ${wait_time}
    click element   ${register_memberType}

Select the member type
    [Arguments]    ${option}
    wait until element is visible      //span[contains(text(),'${option}')]     ${wait_time}
    wait until element is enabled      //span[contains(text(),'${option}')]     ${wait_time}
    click element       //span[contains(text(),'${option}')]


Create partner random business email
    wait until element is enabled       ${register_Email}        ${wait_time}
    click element   ${register_Email}
    Clear element text      ${register_Email}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_register_Email}=    Catenate    BusinessEmail${random_string}@yopmail.net
    input text   ${register_Email}   ${generate_register_Email}
    log to console      registerEmail:${generate_register_Email}
    set global variable    ${generate_register_Email}

Create self register business name
    [Arguments]    ${option}
    wait until element is enabled       ${register_Email}        ${wait_time}
    click element   ${register_Email}
    Clear element text      ${register_Email}
    input text   ${register_Email}   ${option}@yopmail.net

Select the checkbox
    wait until element is visible      ${register_FormCheckBox}     ${wait_time}
    wait until element is enabled      ${register_FormCheckBox}     ${wait_time}
    click element       ${register_FormCheckBox}

Save the register form
    wait until element is visible      ${register_FormSubmitBTN}    ${wait_time}
    wait until element is enabled      ${register_FormSubmitBTN}    ${wait_time}
    click element       ${register_FormSubmitBTN}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is not visible       ${shadow}          ${wait_time}

Choose register user country
    [Arguments]    ${country}   ${code}     ${phoneNo}
    click element   ${click_countryTag}
    wait until element is visible   ${contact_Country_search}
    click element   ${contact_Country_search}
    ${StartTime1} =     Get Current Time in Milliseconds
    input text  ${contact_Country_search}   ${country}
    Generic.Select parameter      ${code}
    input text     ${phone}     ${phoneNo}
    ${EndTime1} =     Get Current Time in Milliseconds
    ${ActualTime}         Evaluate     ${EndTime1}-${StartTime1}
    Calculate Running time  3  ${pageHeading}   RegisterUserPage - Select the option from country dropdown on register new member     3    ${pageTime}     ${ActualTime}    RegisterPage_Time


Select the option from the personal details sidebar
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible     css:.sidebar-${option}-qa         ${wait_time}
    Wait Until Element Is Enabled    css:.sidebar-${option}-qa          ${wait_time}
    Click Element    css:.sidebar-${option}-qa


Fetch the profile personal_details and compare with registration details
    [Arguments]     ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    ${option1}      ${wait_time}
    ${profile_details}=      get value          ${option1}
    Log To Console    ${profile_details}
    Set Global Variable    ${profile_details}
    Should Be Equal    ${profile_details}       ${option2}


Fetch the location name from personal_details and compare with registration details
    [Arguments]         ${option}
    Wait Until Element Is not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       //ng-select[contains(@class,'qa-profile-location-update')]//div//div//span[2]    ${wait_time}
    ${profile_locationtext}=      get text       //ng-select[contains(@class,'qa-profile-location-update')]//div//div//span[2]
    ${parts}    Split String    ${profile_locationtext}    -
    ${profile_locationdetails1}=  Get From List  ${parts}  0
    ${profile_locationdetails}      Strip String    ${profile_locationdetails1}
    Set Global Variable    ${profile_locationdetails}
    Should Be Equal    ${profile_locationdetails}      ${option}

Fetch the department name from personal_details and compare with registration details
    [Arguments]         ${option}
    wait until element is visible       //ng-select[contains(@class,'qa-DepartmentId')]//div//div//span[2]      ${wait_time}
    ${profile_departmentdetails}=       Get text           //ng-select[contains(@class,'qa-DepartmentId')]//div//div//span[2]
    Log To Console    ${profile_departmentdetails}
    Set Global Variable    ${profile_departmentdetails}
    Should Be Equal    ${profile_departmentdetails}    ${option}

Edit the department from personal profile
    [Arguments]    ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.qa-DepartmentId          ${wait_time}
    Wait Until Element Is Enabled     css:.qa-DepartmentId     ${wait_time}
    Clear Element Text      css:.qa-DepartmentId
    input text      css:.qa-DepartmentId     ${option1}
    Generic.Select parameter    ${option1}

Edit the Position from personal profile
    wait until element is enabled       css:#Position        ${wait_time}
    click element   css:#Position
    Clear element text      css:#Position
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_position}=    Catenate    Pos_${random_string}
    input text   css:#Position   ${generate_position}
    set global variable    ${generate_position}


Click on edit button to edit the profile details
    [Arguments]     ${option}
    Generic.click on the button    ${option}

Edit phone number from profile details
    [Arguments]    ${country}   ${code}     ${phoneNo}
    click element   ${click_countryTag}
    wait until element is visible   ${contact_Country_search}
    click element   ${contact_Country_search}
    input text  ${contact_Country_search}   ${country}
    Generic.Select parameter      ${code}
    input text     ${profile_phone}     ${phoneNo}

Edit Location from profile details
    [Arguments]    ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible       css:.qa-profile-location-update          ${wait_time}
    Wait Until Element Is Enabled     css:.qa-profile-location-update    ${wait_time}
    Click Element    css:.qa-profile-location-update
    input text      css:.qa-profile-location-update input      ${option1}
    wait until element is visible           //span[contains(text(),'${option1}')]
    wait until element is enabled           //span[contains(text(),'${option1}')]
    click element   //span[contains(text(),'${option1}')]

Save the Profile details
    [Arguments]     ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[contains(@class,'buttons')]//button[normalize-space()='${option1}']          ${wait_time}
    Wait Until Element Is Enabled    //div[contains(@class,'buttons')]//button[normalize-space()='${option1}']          ${wait_time}
    Click Element    //div[contains(@class,'buttons')]//button[normalize-space()='${option1}']

Fetch the Company name from personal_details and compare with registration details
    [Arguments]         ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible     ${profile_company}         ${wait_time}
    ${profile_companydetails}=       Get value       ${profile_company}
    Log To Console    ${profile_companydetails}
    Set Global Variable    ${profile_companydetails}
    Should Be Equal    ${profile_companydetails}    ${option}

Fetch the Company name Address from personal_details and compare
    [Arguments]         ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible     //ng-select[contains(@class,'qa-${option1}')]//span[2]        ${wait_time}
    ${profile_companydetails}=       Get text       //ng-select[contains(@class,'qa-${option1}')]//span[2]
    Log To Console    ${profile_companydetails}
    Set Global Variable    ${profile_companydetails}
    Should Be Equal    ${profile_companydetails}    ${option2}

Fetch the Address and zip code from personal_details and compare
    [Arguments]         ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    wait until element is visible     css:.${option1}-qa         ${wait_time}
    ${profile_companydetails}=       Get value       css:.${option1}-qa
    Log To Console    ${profile_companydetails}
    Set Global Variable    ${profile_companydetails}
    Should Be Equal    ${profile_companydetails}    ${option2}

Edit profile company name
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible     css:#CompanyName     ${wait_time}
    wait until element is enabled      css:#CompanyName        ${wait_time}
    click element   css:#CompanyName
    Clear element text      css:#CompanyName
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_profile_CompanyName}=    Catenate    CompanyName${random_string}
    input text   css:#CompanyName   ${generate_profile_CompanyName}
    set global variable    ${generate_profile_CompanyName}

Edit the personal business_email of user
     wait until element is enabled       ${profile_email}        ${wait_time}
    click element    ${profile_email}
    Clear element text      ${profile_email}
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generate_profile_Email}=    Catenate    BusinessEmail${random_string}@yopmail.net
    input text   ${profile_email}   ${generate_profile_Email}
    log to console      profileEmail:${generate_profile_Email}
    set global variable    ${generate_profile_Email}

Edit location country inside company details
    [Arguments]    ${option}
    Wait Until Element Is Visible       css:.qa-Country    ${wait_time}
    Wait Until Element Is Enabled      css:.qa-Country     ${wait_time}
    Clear Element Text      css:.qa-Country
    Input Text    css:.qa-Country    ${option}
    Generic.Select parameter    ${option}

Input text into manufacturer address one inside comapny details
    [Arguments]    ${option}        ${option1}
    Generic.Enter value into field      css:#StreetAddress${option1}     ${option}

Clear the data from Address1 field
    wait until element is not visible   ${loaderIcon}      ${wait_time}
    wait until element is visible        css:#StreetAddress1     ${wait_time}
    click element      css:#StreetAddress1
    Press Keys    css:#StreetAddress1   CTRL+A
    input text      css:#StreetAddress1     A
    Double Click Element   css:#StreetAddress1
    Press Keys    css:#StreetAddress1    BACKSPACE

Verify the email change warning pop-up and choose option
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //div[@id='emailChangeWarning']        ${wait_time}
    Wait Until Element Is Enabled    //div[@id='emailChangeWarning']        ${wait_time}
    click button       //div[@id='emailChangeWarning']//button[contains(@class,'button-${option}')]
    Wait Until Element Is Not Visible    //div[@id='emailChangeWarning']        ${wait_time}

select number of days inside alerts section
    [Arguments]         ${option1}        ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //label[@for='YesEmailPingAlert']//span[@class='checkmark']        ${wait_time}
    click element           //label[@for='YesEmailPingAlert']//span[@class='checkmark']
    Wait Until Element Is Visible    css:.qa-${option1}      ${wait_time}
    Wait Until Element Is Enabled    css:.qa-${option1}      ${wait_time}
    Click Element    css:.qa-${option1} input
    Generic.Select parameter    ${option2}

Select asset limit exhausation inside alerts section
    [Arguments]     ${option}       ${option1}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//ng-select[contains(@class,'qa-audit-interval')])[${option}]      ${wait_time}
    Wait Until Element Is Enabled    (//ng-select[contains(@class,'qa-audit-interval')])[${option}]      ${wait_time}
#    clear element text      (//ng-select[contains(@class,'qa-audit-interval')])[${option}]//input
    Click Element    (//ng-select[contains(@class,'qa-audit-interval')])[${option}]//input
    Generic.Select parameter    ${option1}

Select asset center notifications inside alerts section
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.alertCenter-notification-qa      ${wait_time}
    Wait Until Element Is Enabled    css:.alertCenter-notification-qa      ${wait_time}
#    clear element text          css:.alertCenter-notification-qa input
    Click Element    css:.alertCenter-notification-qa input
    Generic.Select parameter    ${option}

Select number of days                          #This method is replaced with "select parameter later"
    [Arguments]    ${address1}          ${address2}
    Wait Until Element Is Not Visible    ${loaderIcon}   ${wait_time}
    wait until element is visible     //span[normalize-space()='${address1}  ${address2}']        ${wait_time}
    wait until element is enabled       //span[normalize-space()='${address1}  ${address2}']          ${wait_time}
    click element      //span[normalize-space()='${address1}  ${address2}']

Choose Industry under company financial information
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.qa-industry-code-data         ${wait_time}
    Wait Until Element Is Enabled   css:.qa-industry-code-data          ${wait_time}
    Click Element    css:.qa-industry-code-data
    Generic.Select parameter        ${option}

Choose Currency under company financial information
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.qa-currency-code         ${wait_time}
    Wait Until Element Is Enabled   css:.qa-currency-code         ${wait_time}
    Click Element    css:.qa-currency-code
    Generic.Select parameter        ${option}

Enter the following company information
    [Arguments]     ${option1}      ${option2}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:#${option1}       ${wait_time}
    Wait Until Element Is Enabled   css:#${option1}         ${wait_time}
    clear element text      css:#${option1}
    input text      css:#${option1}       ${option2}
    press keys      css:#${option1}     TAB

Click on plus icon to add new company domain
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    css:.add-companyDomain-qa       ${wait_time}
    Wait Until Element Is Enabled    css:.add-companyDomain-qa        ${wait_time}
    click element    css:.add-companyDomain-qa

Add the new domain
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    (//input[contains(@class,'company-domain-qa')])[2]       ${wait_time}
    Wait Until Element Is Enabled    (//input[contains(@class,'company-domain-qa')])[2]        ${wait_time}
    click element    (//input[contains(@class,'company-domain-qa')])[2]
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_domain_name}=    Catenate    ${random_string}.com
    input text      (//input[contains(@class,'company-domain-qa')])[2]      ${generated_domain_name}

Save the company domain
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       //button[contains(@class,'save-company-qa')]        ${wait_time}
    wait until element is enabled     //button[contains(@class,'save-company-qa')]      ${wait_time}
    click element       //button[contains(@class,'save-company-qa')]

View the added domains under company information
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait until element is visible       css:.view-added-domains        ${wait_time}
    wait until element is enabled     css:.view-added-domains      ${wait_time}
    click element       css:.view-added-domains

Delete the company domain
    wait until element is not visible       ${loaderIcon}       ${wait_time}
    wait until element is visible        css:.delete-company-domain-qa       ${wait_time}
    wait until element is enabled       css:.delete-company-domain-qa       ${wait_time}
    click element       css:.delete-company-domain-qa

Enter user name under forgot password page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='username']          ${wait_time}
    Wait Until Element Is Enabled    //input[@id='username']          ${wait_time}
    Click Element    //input[@id='username']
    input text      //input[@id='username']     ${option}

Click on the submit button under forgot password page
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@value='Submit']          ${wait_time}
    Wait Until Element Is Enabled    //input[@value='Submit']          ${wait_time}
    Click Element    //input[@value='Submit']
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}

Click on the reset password link under mail
    Wait Until Element Is Visible    //div[@id='mail']//a[normalize-space()='Link to reset credentials']          ${wait_time}
    Wait Until Element Is Enabled    //div[@id='mail']//a[normalize-space()='Link to reset credentials']          ${wait_time}
    Click Element    //div[@id='mail']//a[normalize-space()='Link to reset credentials']

Enter new password under reset password page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='password-new']          ${wait_time}
    Wait Until Element Is Enabled    //input[@id='password-new']         ${wait_time}
    Click Element    //input[@id='password-new']
    input text      //input[@id='password-new']     ${option}

Enter confirm password under reset password page
    [Arguments]     ${option}
    Wait Until Element Is Not Visible    ${loaderIcon}      ${wait_time}
    Wait Until Element Is Visible    //input[@id='password-confirm']          ${wait_time}
    Wait Until Element Is Enabled    //input[@id='password-confirm']         ${wait_time}
    Click Element    //input[@id='password-confirm']
    input text      //input[@id='password-confirm']     ${option}

Verify the visibility of validation when entering password more than the limit
    Wait Until Element Is Visible    //span[normalize-space()='Invalid password: maximum length 32.']         ${wait_time}

Verify the visibility of validation when entering password less than the limit
    Wait Until Element Is Visible    //span[normalize-space()='Invalid password: minimum length 8.']         ${wait_time}

wait for the invisiblity of the city field loader
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    sleep       ${search_sleep}
    wait until element is not visible    css:.qa-City .ng-spinner-loader         ${wait_time}

Click on the delete icon to delete the ach card
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //div[contains(@class,'edit-bill')]//following-sibling::div//i[contains(@class,'trash-alt')]        ${wait_time}
    wait until element is enabled    //div[contains(@class,'edit-bill')]//following-sibling::div//i[contains(@class,'trash-alt')]         ${wait_time}
    click element   //div[contains(@class,'edit-bill')]//following-sibling::div//i[contains(@class,'trash-alt')]

Click on click here to add new location
    [Arguments]     ${option}
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //span[@title='Add new Location']//a[normalize-space()='${option}']        ${wait_time}
    wait until element is enabled    //span[@title='Add new Location']//a[normalize-space()='${option}']        ${wait_time}
    click element   //span[@title='Add new Location']//a[normalize-space()='${option}']

Click on refresh icon of user location
    wait until element is not visible       ${loaderIcon}      ${wait_time}
    wait until element is visible      //b[normalize-space()='click here to refresh the location list']        ${wait_time}
    wait until element is enabled    //b[normalize-space()='click here to refresh the location list']        ${wait_time}
    click element   //b[normalize-space()='click here to refresh the location list']

