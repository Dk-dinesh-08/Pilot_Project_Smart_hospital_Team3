*** Settings ***
Documentation    To validate appointment history
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot



*** Test Cases ***
validate appointment history
    [Tags]    smoke
    click the log in button
    click the sign In button
    click the my appointment button
    Collect and count list of history
    Next page button
    Collect and count list of history
    The next page button
    Collect and count list of history

    




    








