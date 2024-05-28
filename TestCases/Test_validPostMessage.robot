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
    
To validate the functionality of post a new message

    [Tags]    smoke

    LoginResources.Go to user login
    LoginResources.Fill the login form for doctor
    DoctorResources.Verify successful login of doctor
    DoctorResources.Click messaging button
    DoctorResources.Click post new message button
    DoctorResources.Fill post new message form
    DoctorResources.Send the message
    DoctorResources.Verify message send sucessfully


