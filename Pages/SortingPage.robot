*** Settings ***
Documentation   Contains all keyword of Subscription page
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
Resource        ../Pages/SortingPage.robot

*** Variables ***



*** Keywords ***
Sort Test
    Wait Until Element Is Visible    //tbody//tr//td[2]    60
    ${element_list}=    Get WebElements    //tbody//tr//td[2]

    @{text_list}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list}    ${text}
        Log To Console    Original List: ${text}
        Log To Console    ---------------------
    END

#sort in ascending order
    ${sorted_text_list}=    Copy List    ${text_list}
    Sort List    ${sorted_text_list}
    Log to console  Sorted Text List (Ascending): ${sorted_text_list}

    Wait Until Element Is Visible    //div[normalize-space()='Asset ID']//following-sibling::div//button    60
    click element   //div[normalize-space()='Asset ID']//following-sibling::div//button
    wait until element is not visible      ${loaderIcon}       60

    Wait Until Element Is Visible    //tbody//tr//td[2]    60
    ${element_list}=    Get WebElements    //tbody//tr//td[2]


    @{text_list_after_sort_asec}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_asec}    ${text}
        Log To Console    Ascending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_asec}    ${sorted_text_list}




    ${sorted_descending_list}=    Copy List    ${text_list}
    ${sorted_list}=    Evaluate    sorted($sorted_descending_list, reverse=True)
    Log to console  Sorted Text List (Decending): ${sorted_list}


    Wait Until Element Is Visible    //div[normalize-space()='Asset ID']//following-sibling::div//button    60
    click element   //div[normalize-space()='Asset ID']//following-sibling::div//button
    wait until element is not visible      ${loaderIcon}       60

    Wait Until Element Is Visible    //tbody//tr//td[2]    60
    ${element_list}=    Get WebElements    //tbody//tr//td[2]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}

