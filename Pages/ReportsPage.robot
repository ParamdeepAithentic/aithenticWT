*** Settings ***
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

*** Variables ***
${Error_Message_Login}      css:.alert.alert-danger.col-md-12
${login_heading}        css:.heading-login.d-inline-block
${drawerList}        css:.profileContainer .list-unstyled li       #//ul[@class='list-unstyled w-100 d-inline-block mt-3 pt-0']/li
${side_options}     //ul[@id='common-side-bar-left']//li
${profile_option}        //img[@alt='icon']
${loaderIcon}     //div[@role='status']

${Totalcount_field}        css:.qa-total-count-list

*** Keywords ***
Click on tab under Modules
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       60
    Generic.Scroll the page till        7000
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     300
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    ${parts}        split string        ${count}    /
    ${first_part}=    set variable    ${parts[0]}
    log to console      Modules: ${first_part}
    set global variable     ${first_part}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p

Verify number of modules are equals to total counts
    [Arguments]    ${option}
    should be equal      ${first_part}    ${total_count}
    log to console      The Modules of ${option} is equal to total counts in ${option}

Fetch total installed Agents
    [Arguments]     ${data}
    wait until element is not visible      ${loaderIcon}       60
    wait until element is visible       //p[contains(text(),'Installed Agents -')]      60
    ${Agent}=       get text          //p[contains(text(),'Installed Agents -')]
    ${parts}    Split String    ${Agent}    ${data}
    ${total_count}    Get Substring    ${parts[1]}      1
    log to console      ${total_count}
    set global variable     ${total_count}

Click on tab under Technology Types
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       60
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     60
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    log to console      Technology: ${count}
    set global variable     ${count}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p

Fetch the total count
    wait until element is enabled       ${Totalcount_field}      60
    wait until element is visible   ${Totalcount_field}      60
    ${text}=     get text   ${Totalcount_field}
    ${parts}    Split String    ${text}    Total Count :
    ${total_count}    Get Substring    ${parts[1]}    3
    Log to console  Total count is :${total_count}
    set global variable    ${total_count}

Verify that key_data is equals to total number of counts
    [Arguments]    ${option}
    should be equal      ${count}    ${total_count}
    log to console      The Key data of ${option} is equal to total counts in ${option}

Click on tab under key data
    [Arguments]     ${tab_name}
    wait until element is not visible       ${loaderIcon}       60
    Generic.Scroll the page till        7000
    wait until element is visible     //p[normalize-space()='${tab_name}']//following-sibling::p     60
    ${count}=       get text        //p[normalize-space()='${tab_name}']//following-sibling::p
    log to console      key data: ${count}
    set global variable     ${count}
    click element       //p[normalize-space()='${tab_name}']//following-sibling::p