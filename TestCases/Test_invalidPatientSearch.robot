*** Settings ***
Documentation    Tests to verify sucessful search of patient list
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot


*** Variables ***
${invalid_patient_name}    1234
${blank_patient_name}


*** Test Cases ***
    
To verify unsucessful search of patient list
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Enter patient name    ${invalid_patient_name}
    AdminResources.Verify invalid patient search results 
      


To verify unsucessful search of patient list using blank entry
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Enter patient name    ${blank_patient_name}
    AdminResources.Verify invalid search results 
