*** Settings ***
Documentation    To test the login functionality of admin using invalid datas
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/Admin_loginData_invalid.xlsx  sheet_name=Sheet1
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    To validate invalid login of admin

*** Variables ***
${username} 
${password}

*** Test Cases *** 

To validate invalid login of admin      ${username}    ${password}
     [Documentation]   To verify search results of patient list
     
    
*** Keywords ***

To validate invalid login of admin
    [Tags]    confirmation
    [Arguments]    ${username}    ${password} 
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    Log    Admin page Opened
    LoginResources.Fill the login form    ${username}    ${password} 


