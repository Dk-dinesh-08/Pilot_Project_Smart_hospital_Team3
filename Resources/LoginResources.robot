*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${doctor_button}    xpath:(//a[@class='btn btn-primary width100'])[2]
${sign_in_button}    xpath://button[text()='Sign In']
${admin_login}    xpath:(//a[@class='forgot pull-right'])[1]

*** Keywords ***
click the doctor button
    Click Element    ${doctor_button}

click the sign In button
    Click Element    ${sign_in_button}

click the admin login
    Click Element    ${admin_login}