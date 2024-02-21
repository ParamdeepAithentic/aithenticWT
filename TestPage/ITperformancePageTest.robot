*** Settings ***
Documentation   Contains all test cases of ITperformance page
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
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/MemberPage.robot
Resource        ../Pages/OCS.robot
Resource        ../Pages/BillingPage.robot
Resource        ../Pages/ReportsPage.robot
Resource        ../Pages/I_iconPage.robot
Resource        ../Pages/SortingPage.robot
Resource        ../Pages/Bulk_Import_ExportPage.robot

Test Setup      open the browser with the url
Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Download sheet for Forecasts
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of supplier_partner_location and download sheet
    Generic.Fetch alert message text and compare it with        Spend Forecasts sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        SpendForecastsReports

Download sheet for aging
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of brand report and download sheet
    Generic.Fetch alert message text and compare it with        Aging Analytics sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        AgingAnalyticsReports

Download sheet for investments
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Verify all tabs of asset report and download sheet
    Generic.Fetch alert message text and compare it with        Investment by Partners sheets will get download soon
    ITperformancePage.Verify sheet is downloaded        sspslReport

Download all sheets with download all button
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on download all button

It performnace drill down agging analytics
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     criticalagedassetsreport
    ITperformancePage.Get and verify the count of aging analytics table     Critical Aged Assets        criticalagedassetsreport
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     pastduerenewals
    ITperformancePage.Get and verify the count of aging analytics table     Past Due Renewals       pastduerenewals
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     upcomingrenewalsforecast
    ITperformancePage.Get and verify the count of aging analytics table     Upcoming Renewals       upcomingrenewalsforecast
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     upcomingeolforecast
    ITperformancePage.Get and verify the count of aging analytics table     Upcoming End Of Life       upcomingeolforecast

IT perfomance drill down data quality
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on tabs under it perfomance      spend-forecast-reports
    ITperformancePage.Click on data quality button link under it perfomance     1
    ITperformancePage.Fetch the value under data quality   dataquality1     1
    ITperformancePage.click on values under data quality    dataquality1    1
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on data quality button link under it perfomance     1
    ITperformancePage.Fetch the value under data quality   dataquality1     2
    ITperformancePage.click on values under data quality    dataquality1     2
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on data quality button link under it perfomance     1
    ITperformancePage.Fetch the value under data quality   dataquality1     3
    ITperformancePage.click on values under data quality    dataquality1     3
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on data quality button link under it perfomance     1
    ITperformancePage.Fetch the value under data quality   dataquality1     4
    ITperformancePage.click on values under data quality    dataquality1     4
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on current and previous year tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     2
    ITperformancePage.Fetch the value under data quality   dataquality2     1
    ITperformancePage.click on values under data quality    dataquality2     1
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on current and previous year tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     2
    ITperformancePage.Fetch the value under data quality   dataquality2     2
    ITperformancePage.click on values under data quality    dataquality2     2
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on five year forecast tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     3
    ITperformancePage.Fetch the value under data quality   dataquality3     1
    ITperformancePage.click on values under data quality    dataquality3     1
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on five year forecast tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     3
    ITperformancePage.Fetch the value under data quality   dataquality3     2
    ITperformancePage.click on values under data quality    dataquality3     2
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on five year forecast tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     3
    ITperformancePage.Fetch the value under data quality   dataquality3     3
    ITperformancePage.click on values under data quality    dataquality3     3
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_value}          ${total_count}

IT perfomance drill down data quality of Investments by partner tab
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandBudget
    ITperformancePage.Click on data quality button link under investments by partner tab    1
    ITperformancePage.Fetch the value under data quality of investment by partner tab  1   2
    ITperformancePage.click on values under data quality of investment by partner tab   1   2
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    2
    ITperformancePage.Fetch the value under data quality of investment by partner tab  2   1
    ITperformancePage.click on values under data quality of investment by partner tab   2   1
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    2
    ITperformancePage.Fetch the value under data quality of investment by partner tab  2   2
    ITperformancePage.click on values under data quality of investment by partner tab   2   2
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    2
    ITperformancePage.Fetch the value under data quality of investment by partner tab  2   3
    ITperformancePage.click on values under data quality of investment by partner tab   2   3
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandsupplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    3
    ITperformancePage.Fetch the value under data quality of investment by partner tab  3   2
    ITperformancePage.click on values under data quality of investment by partner tab   3   2
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandsupplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    3
    ITperformancePage.Fetch the value under data quality of investment by partner tab  3   3
    ITperformancePage.click on values under data quality of investment by partner tab   3   3
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandsupplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    3
    ITperformancePage.Fetch the value under data quality of investment by partner tab  3   6
    ITperformancePage.click on values under data quality of investment by partner tab   3   6
    Generic.Verify your current page location contains      technology-it-performance
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supportlocationbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    4
    ITperformancePage.Fetch the value under data quality of investment by partner tab  4   1
    ITperformancePage.click on values under data quality of investment by partner tab   4   1
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supportlocationbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    4
    ITperformancePage.Fetch the value under data quality of investment by partner tab  4   3
    ITperformancePage.click on values under data quality of investment by partner tab   4   3
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}
    ContractsPage.Click on back to contract link
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supportlocationbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    4
    ITperformancePage.Fetch the value under data quality of investment by partner tab  4   4
    ITperformancePage.click on values under data quality of investment by partner tab   4   4
    Generic.Verify your current page location contains      technology-it-performance
    Generic.Scroll Window To End
    ITperformancePage.Search by brand, asset id , product and assignee      Product_9470971051

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      BrandName0091409214
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .xlsx
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .xlsx
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .ods
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .ods
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .csv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .csv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!
    PartnersPage.Click on the export Button
    PartnersPage.Download the selected extension file      .tsv
    PartnersPage.Confirm to export file
    PartnersPage.Verify that the selected extension file is downloaded       .tsv
    PartnersPage.Remove the file from downloaded list
    Generic.click on the button     Okay, Thanks!

    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      AssetID_1255240019
    Click on refresh icon of technolofy it performance page
    ITperformancePage.Search by brand, asset id , product and assignee      Dc Dc
    Click on refresh icon of technolofy it performance page
    Generic.Scroll Window To End
    ReportsPage.Fetch the total count         Total Count :
    TechnologyPage.verify Text from Assignment Information     ${get_fetch_valueinvestment}          ${total_count}