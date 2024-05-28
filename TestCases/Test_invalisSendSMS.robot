*** Settings ***
Documentation    Test to verify the message functionality
Library    SeleniumLibrary
# Library    DataDriver    file=../TestData/SampleMessage.xlsx   sheet_name=Sheet1
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot
# Test Template    To validate succesful queue search



*** Test Cases ***
    
To validate the functionality of send sms
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Fill the login form for doctor
    DoctorResources.Verify successful login of doctor
    DoctorResources.Click messaging button
    DoctorResources.click send sms button
    DoctorResources.Fill the send SMS form withought clicking send through
    DoctorResources.Send the message
    DoctorResources.To verify the unsucessful message sent