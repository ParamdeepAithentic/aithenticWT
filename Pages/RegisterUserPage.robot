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


