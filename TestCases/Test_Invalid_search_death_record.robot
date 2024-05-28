*** Settings ***
Documentation    To validate the invalid search death record
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot


*** Test Cases ***
validate Invalid search death record
    [Tags]    regression
    click the log in button
    click the admin login
    Switch Window     new
    click the doctor button
    click the sign In button
    click birth record and death record
    click death record
    Invalid value in death record
    assert the invalid birth and death record   
    
    








