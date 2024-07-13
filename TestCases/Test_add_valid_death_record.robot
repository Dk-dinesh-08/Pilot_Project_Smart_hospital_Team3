*** Settings ***
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot
Library    DataDriver    file=../TestData/DeathRateForm.xlsx   sheet_name=validLogin
Test Template   validate add death record

*** Variables ***
${caseID}
${DeathDate}    
${DeathReports}

*** Test Cases ***
Login test template    ${caseID}    ${DeathDate}    ${DeathReports}
    [Tags]    regression

*** Keywords ***
validate add death record
    [Arguments]    ${caseID}    ${DeathDate}    ${DeathReports}
    click the log in button
    click the admin login
    Switch Window     new
    click the doctor button
    click the sign In button
    click birth record and death record
    click death record
    click add death record
    fill the death record form    ${caseID}    ${DeathDate}    ${DeathReports}
    








