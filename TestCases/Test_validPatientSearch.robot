*** Settings ***
Documentation    Tests to login to login page
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot


*** Variables ***
${patient_name}    Olivier


*** Test Cases ***

LoginResources.Go to user login
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
   
    LoginResources.click the sign in button

    AdminResources.Enter patient name    ${patient_name}
    AdminResources.Verify the patient search details

