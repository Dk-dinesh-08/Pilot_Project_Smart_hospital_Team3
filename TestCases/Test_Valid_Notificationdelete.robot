*** Settings ***
Documentation         Test case for valid delete all notification messages
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    Close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot


*** Test Cases ***

Sucsessfull deletion of notification message
    [Tags]    regression
    GenericResources.Click the login in button
    LoginResources.Fill the successfull login form by clicking the doctor role
    LoginResources.Verify the successfull login with valid credentials for doctor
    DoctorResources.Delete the all notification message
    DoctorResources.Verify successful deletion of all notification messages
    