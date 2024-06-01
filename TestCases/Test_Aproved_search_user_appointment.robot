*** Settings ***
Documentation    To validate user appointment history
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot



*** Test Cases ***

validate user appointment history
    [Tags]    smoke
    click the log in button
    click the sign In button
    click the my appointment button
    Enter the aproved value into search
    Collect and count list of history





    








