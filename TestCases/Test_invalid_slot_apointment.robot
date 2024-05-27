*** Settings ***
Documentation    To validate the user apointment
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot
Library    DataDriver    file=../TestData/UserData.xlsx   sheet_name=Invalid
Test Template     validate the invalid slot in user appointment

*** Variables ***
${Date_data}
${Message_data}
${adress}

*** Test Cases ***
user appointment     ${Date_data}    ${Message_data}    ${adress}


*** Keywords ***
validate the invalid slot in user appointment
    [Arguments]      ${Date_data}    ${Message_data}    ${adress}
    click the log in button      
    click the sign In button
    click the my appointment button
    Fill the user apointment form    ${Date_data} 
    alert accpet
    Fill the user apointment remaining form    ${Message_data}    ${adress}
    choose invalid slot
    alert accpet
    


    
    
    
