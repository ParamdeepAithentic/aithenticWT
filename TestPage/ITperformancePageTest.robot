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
    ITperformancePage.Get and verify the count of aging analytics table     Critical Aged Assets        Critical Aged Assets
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     pastduerenewals
    ITperformancePage.Get and verify the count of aging analytics table     Past Due Renewals       Past Due Renewals
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     upcomingrenewalsforecast
    ITperformancePage.Get and verify the count of aging analytics table     Upcoming Renewals       Upcoming Renewals
    ITperformancePage.Click on aging analytics tab
    ITperformancePage.Click on tab under aging analytics     upcomingeolforecast
    ITperformancePage.Get and verify the count of aging analytics table     Upcoming End Of Life        Upcoming End Of Life

IT perfomance drill down data quality
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on tabs under it perfomance      spend-forecast-reports
    ITperformancePage.Click on data quality button link under it perfomance     1
    ITperformancePage.Get And Verify The Count Of Data Quality Under Tabs   dataquality1        dataquality1
    ITperformancePage.Click on current and previous year tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     2
    ITperformancePage.Get And Verify The Count Of Data Quality Under Tabs   dataquality2        dataquality2
    ITperformancePage.Click on five year forecast tab under spend forecast
    ITperformancePage.Click on data quality button link under it perfomance     3
    ITperformancePage.Get And Verify The Count Of Data Quality Under Tabs   dataquality3        dataquality3

IT perfomance drill down data quality of Investments by partner tab
    Generic.click on the tab	Login
    LandingPage.Fill the login Form    ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandBudget
    ITperformancePage.Click on data quality button link under investments by partner tab    1
    ITperformancePage.Get And Verify The Count Of Data Quality Under Investment by partner tab   dataquality-partner-1        dataquality-partner-1
    ITperformancePage.Click on tabs under investment by partner tab     supplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    2
    ITperformancePage.Get And Verify The Count Of Data Quality Under Investment by partner tab   dataquality-partner-2        dataquality-partner-2
    ITperformancePage.Click on tabs under investment by partner tab     brandsupplierbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    3
    ITperformancePage.Get And Verify The Count Of Data Quality Under Investment by partner tab   dataquality-partner-3        dataquality-partner-3
    ITperformancePage.Click on tabs under investment by partner tab     supportlocationbudget
    ITperformancePage.Click on data quality button link under investments by partner tab    4
    ITperformancePage.Get And Verify The Count Of Data Quality Under Investment by partner tab   dataquality-partner-4        dataquality-partner-4

It performnace drill down investment by partner
    Generic.click on the tab	Login
    LandingPage.Fill the login Form      ${email}     ${valid_password}
    DashboardPage.select the option from the dashboard drawer     IT Performances
    Generic.Verify your current page location contains      it-performance
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandBudget
    ITperformancePage.Get and verify the count of table of investment by partner     QACompany96590301 Budget by Brand       QACompany96590301 Budget by Brand
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supplierbudget
    ITperformancePage.Get and verify the count of table of investment by partner     QACompany96590301 Budget by Supplier       QACompany96590301 Budget by Supplier
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     brandsupplierbudget
    ITperformancePage.Get and verify the count of table of brand spend by supplier and supplier spend my location of investment by partner     QACompany96590301 Budget by Brand and Supplier     QACompany96590301 Budget by Brand and Supplier
    ITperformancePage.Click on tabs under it perfomance     investments-partners
    ITperformancePage.Click on tabs under investment by partner tab     supportlocationbudget
    ITperformancePage.Get and verify the count of table of brand spend by supplier and supplier spend my location of investment by partner     QACompany96590301 Budget by Supplier and Location        QACompany96590301 Budget by Supplier and Location