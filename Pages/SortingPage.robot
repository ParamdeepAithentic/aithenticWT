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



*** Keywords ***
Verify the sorting of the table
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}
    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]

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

    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//following-sibling::div//button    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//following-sibling::div//button

#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}

    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


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


    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//following-sibling::div//button    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//following-sibling::div//button
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}


    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}






Verify the sorting of the table method two
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}
    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]

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
    Log   Sorted Text List (Ascending): ${sorted_text_list}

    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//app-sort-button    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//app-sort-button

#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}

    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]
    Log     ${element_list}

    @{text_list_after_sort_asec}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_asec}    ${text}
        Log    Ascending List: ${text}
        Log     ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_asec}    ${sorted_text_list}

#sort in decending order
    ${sorted_descending_list}=    Copy List    ${text_list}
    ${sorted_list}=    Evaluate    sorted($sorted_descending_list, reverse=True)
    Log   Sorted Text List (Decending): ${sorted_list}


    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//app-sort-button     ${wait_time}
    click element   //div[normalize-space()='${headingName}']//app-sort-button
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}


    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log     Decending List: ${text}
        Log     ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}


Verify the sorting of the table method three
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}
    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]

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

    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]

#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}

    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


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


    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody//tr//td[normalize-space()='1']     ${wait_time}


    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}



Verify the sorting of the table method four
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]    ${wait_time}
    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]

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

    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]

#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]     ${wait_time}

    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


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


    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//div[contains(@class,'sortingIcon')]
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]     ${wait_time}


    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}


Verify the sorting of the table method five
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //div[normalize-space()='1']    ${wait_time}
    wait until element is enabled       //div[normalize-space()='1']    ${wait_time}
    Wait Until Element Is Visible    //div[@aria-colindex='${columnNumber}']    ${wait_time}
    Wait Until Element Is enabled    //div[@aria-colindex='${columnNumber}']    ${wait_time}
    Double Click element   (//div[@data-ref='eResize'])[${columnNumber}]

    ${element_list}=    Get WebElements    //div[@aria-colindex='${columnNumber}']

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

    Wait Until Element Is Visible    //span[normalize-space()='${headingName}']//span
    Wait Until Element Is enabled    //span[normalize-space()='${headingName}']//span
#    //following-sibling::span[@class='ag-header-icon ag-sort-none-icon']    ${wait_time}
    click element   //span[normalize-space()='${headingName}']//span
#    //following-sibling::span[@class='ag-header-icon ag-sort-none-icon']


#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //div[normalize-space()='1']    ${wait_time}
    wait until element is enabled       //div[normalize-space()='1']    ${wait_time}
    Wait Until Element Is Visible    //div[@aria-colindex='${columnNumber}']    ${wait_time}
    Wait Until Element Is enabled    //div[@aria-colindex='${columnNumber}']    ${wait_time}

    ${element_list}=    Get WebElements    //div[@aria-colindex='${columnNumber}']


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


    Wait Until Element Is Visible    //span[normalize-space()='${headingName}']//span
    Wait Until Element Is enabled    //span[normalize-space()='${headingName}']//span
#    //following-sibling::span[@class='ag-header-icon ag-sort-ascending-icon']    ${wait_time}
    click element   //span[normalize-space()='${headingName}']//span
#    //following-sibling::span[@class='ag-header-icon ag-sort-ascending-icon']
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //div[normalize-space()='1']     ${wait_time}
    wait until element is enabled       //div[normalize-space()='1']     ${wait_time}


    Wait Until Element Is Visible    //div[@aria-colindex='${columnNumber}']    ${wait_time}
    Wait Until Element Is enabled    //div[@aria-colindex='${columnNumber}']    ${wait_time}
    ${element_list}=    Get WebElements    //div[@aria-colindex='${columnNumber}']


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}


Expand all sorting field
    ${element_count}=    Get Element Count    //div[@role='columnheader']
    Log to console      ${element_count}

    FOR    ${index}    IN RANGE    ${element_count}    0    -1
    Double Click element   (//div[@ref='eResize'])[${index}]
    END

Verify the sorting of the table method six
    [Arguments]    ${columnNumber}      ${headingName}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]    ${wait_time}
    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]

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

    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//app-sort-button    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//app-sort-button

#    wait until element is not visible      css:#dropdownMenuButton.disabled-button       ${wait_time}
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]     ${wait_time}

    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


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


    Wait Until Element Is Visible    //div[normalize-space()='${headingName}']//app-sort-button    ${wait_time}
    click element   //div[normalize-space()='${headingName}']//app-sort-button
    wait until element is not visible      ${loaderIcon}       ${wait_time}
    wait until element is visible       //tbody/tr[1]     ${wait_time}


    Wait Until Element Is Visible    //tbody//tr//td[${columnNumber}]    ${wait_time}
    ${element_list}=    Get WebElements    //tbody//tr//td[${columnNumber}]


    @{text_list_after_sort_desc}=    Create List
    FOR    ${element}    IN    @{element_list}
        ${text}=    Get Text    ${element}
        Append To List    ${text_list_after_sort_desc}    ${text}
        Log To Console    Decending List: ${text}
        Log To Console    ---------------------
    END

    Lists Should Be Equal    ${text_list_after_sort_desc}    ${sorted_list}


Click on specific column for method one
    [Arguments]    ${option}
    Generic.Wait until table get load
    Wait Until Element Is Visible    //div[normalize-space()='${option}']//following-sibling::div//button    ${wait_time}
    Wait Until Element Is enabled    //div[normalize-space()='${option}']//following-sibling::div//button    ${wait_time}
    click element       //div[normalize-space()='${option}']//following-sibling::div//button
    Generic.Wait until table get load



