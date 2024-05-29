*** Settings ***
Documentation    Test to verify the message functionality
Library    SeleniumLibrary
# Library    DataDriver    file=../TestData/SampleMessage.xlsx   sheet_name=Sheet1
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot
# Test Template    To validate succesful queue search



*** Test Cases ***
    
    

