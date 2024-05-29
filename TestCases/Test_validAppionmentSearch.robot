* Settings *
Documentation    To verify valid appionment search doctor wise
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot



* Test Cases *

To verify valid appionment search doctor wise
    [Tags]    smoke
    [Documentation]   To verify search results of patients with respect to doctor and date
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form

    LoginResources.click the sign in button
   
    
    AdminResources.Click Appoinment link

    AdminResources.Click the Appoinment wise search button

    ${option_to_select}=    Set Variable    Sonia Bush (9002)
    
    AdminResources.Fill the appointment wise search form    ${option_to_select}
    Enter the date feild
    Click the search button    