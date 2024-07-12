*** Settings ***
Documentation    To verify succesful queue search  
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/QueueSearch_ValidData.xlsx    sheet_name=Sheet1
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    To validate succesful queue search


*** Variables ***

${Doctor} 
${Shift}
${Date}   
<<<<<<< HEAD
${Slot}    
=======
${Slot}  


>>>>>>> f77fe68bb04c3aba70e7d72bdc7f9f0e45c0c9b6


*** Test Cases ***

To validate succesful queue search     ${Doctor}    ${Shift}    ${Date}    ${Slot}   
    [Tags]    regression 
    [Documentation]   To verify search results of patient list
     
    
*** Keywords ***

To validate succesful queue search
    
    [Arguments]    ${Doctor}    ${Shift}    ${Date}    ${Slot}
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Click Appoinment link
    AdminResources.Click the Queue button
    AdminResources.Fill the Queue form    ${Doctor}    ${Shift}    ${Date}    ${Slot}
    AdminResources.click search button for queue
    AdminResources.Verify results for queue search