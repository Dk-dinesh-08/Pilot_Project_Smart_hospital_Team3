*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${url}    https://demo.smart-hospital.in/
${login_button}   class:fa fa-user 


*** Keywords ***

Open the browser with url
    Create Webdriver    Chrome
    Go To   ${url}    
    Maximize Browser Window
    Set Selenium Implicit Wait    5

close the browser
    Close Browser


click the log in button
    Click Element    ${login_button}