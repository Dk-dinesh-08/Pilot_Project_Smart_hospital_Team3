*** Settings ***
Documentation    All the page objects and keywords of Admin Login page
Library    SeleniumLibrary  

*** Variables ***
${username_login}    css:input[id='email']
${password_login}    css:input[id='password']
${sigin_btn}         xpath://div[@class="form-bottom"]//button   #//button[text()="Sign In"]

${admin_login_page_btn}    //a[text()=" Admin Login"]
${doctor_login_btn}    (//a[@class="btn btn-primary width100"])[2]

${admin_login_btn}    //i[@class="fa fa-user ispace"]//parent::a
${user_login_button}    //ul[@class="top-right"]//a



*** Keywords ***

Go to user login
    Click Link    ${User_login_button}

Go to admin page
    Click link    ${admin_login_page_btn}

Go to doctor page
    Click Link    ${doctor_login_btn}

fill the admin login form
    Click Link    ${admin_login_btn}

click the sign in button
    Click Button    ${sigin_btn}


Fill the login form for doctor
    Go to admin page
    Switch Window    new
    Click Link    ${doctor_login_btn}
    Sleep     5s
    click the sign in button

