* Settings *
Documentation    Test to verify the message functionality
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot




* Test Cases *
    
To validate the functionality of send sms
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Fill the login form for doctor
    DoctorResources.Verify successful login of doctor
    DoctorResources.Click messaging button
    DoctorResources.click send sms button
    DoctorResources.Fill the send SMS form 
    DoctorResources.Send the message
