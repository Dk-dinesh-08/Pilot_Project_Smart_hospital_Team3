*** Settings ***
Documentation    To validate the Empty user appointment
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot
Library    DataDriver    file=../TestData/UserData.xlsx   sheet_name=Empty
Test Template     validate the Empty user appointment


*** Variables ***
${Date_data}
${Message_data}
${adress}

*** Test Cases ***
valid user appointement    ${Date_data}    ${Message_data}    ${adress}
    [Tags]    smoke

*** Keywords ***
validate the Empty user appointment
    [Arguments]    ${Date_data}    ${Message_data}    ${adress}
    click the log in button
    click the sign In button
    click the my appointment button
    Add appointment button in User
    save button
    assert the it shows the empty error message
   
    
    
