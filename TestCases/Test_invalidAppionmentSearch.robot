*** Settings ***
Documentation   To verify search results of patients with respect to doctor and date
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot



*** Test Cases ***
To verify the invalid search using invalid doctor name
    [Tags]    Regression
    [Documentation]   To verify search results of patients with respect to doctor and date
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Click Appoinment link
    AdminResources.Click the Appoinment wise search button
    ${option_to_select}=    Set Variable   Amit Singh (9009)
    
    AdminResources.Fill the appointment wise search form    ${option_to_select}        05/23/2024
    
    Click the search button    

    Verify doctor wise appoinment search

    

    


