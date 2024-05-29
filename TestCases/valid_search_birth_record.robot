*** Settings ***
Documentation    To validate the Login form
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot


*** Test Cases ***
validate add birth record
    click the log in button
    click the admin login
    Switch Window     new
    click the doctor button
    click the sign In button
    click birth record and death record
    click birth record
    search value in birth record
    assert the birth record search
    #assert the birth record search
    








