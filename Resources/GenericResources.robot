*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${url}    https://demo.smart-hospital.in/
${login_button}    xpath://ul[@class="top-right"]//a


*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Go To   ${url}    
    Maximize Browser Window
    Set Selenium Implicit Wait    5
    
Close the browser
    Close Browser

Click the login in button
    Click Element   ${login_button}


click accept in alert
    ${alert_present} =    Alert Should Be Present    5s    # Wait for alert
    Run Keyword If    ${alert_present}    click alert button

click the log in button
    Click Element    ${login_button}

click alert button
    Handle Alert    ACCEPT




