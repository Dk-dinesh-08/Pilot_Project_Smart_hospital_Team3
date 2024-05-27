*** Settings ***
Documentation    Tests to login to login page
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/QueueSearch_ValidData.xlsx    sheet_name=Sheet1
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
Test Template    To validate queue functionality of appoinment option



*** Test Cases ***

To validate queue functionality of appoinment option     ${Doctor}    ${Shift}    ${Date}    ${Slot}    
     [Documentation]   To verify search results of patient list
     
    
*** Keywords ***

To validate queue functionality of appoinment option
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


