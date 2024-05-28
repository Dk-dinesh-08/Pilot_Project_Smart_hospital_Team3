*** Settings ***
Documentation    A login resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${admin_login_button}   xpath://i[@class="fa fa-user"]//parent::a
${user_login_button}    xpath://i[@class="fa fa-user"]//parent::a
${username_field}    css:input[name='username']
${password_field}    css:input[name='password']
${signin_button}    css:button[class='btn']
${admin_button}    xpath://i[@class="fa fa-user ispace"]//parent::a
${valid_doctor_button}    xpath://a[text()='Doctor']
${invalid_doctor_button}    xpath://a[text()='Pharmacist']
${pofile_icon}    css:a[class="dropdown-toggle"]
${profile_name}    css:div[class="sstopuser-test"] h5    
${invalid_credentials_message}    css:div[class="alert alert-danger"]
${required_username_message}    css:input[name='username']+span>p
${required_password_message}    css:input[name='password']+span>p
${doctor_valid_username}    sonia@gmail.com
${doctor_invalid_password}    sonia@gmail
${doctor_logout_url}    https://demo.smart-hospital.in/admin/admin/dashboard
${doctorlogout_button}    css:a[class='pull-right']
${doctor_button}    xpath:(//a[@class='btn btn-primary width100'])[2]
${admin_login}    xpath:(//a[@class='forgot pull-right'])[1]
${username_login}    css:input[id='email']
${password_login}    css:input[id='password']
# ${sigin_btn}         xpath://div[@class="form-bottom"]//button   #//button[text()="Sign In"]
${admin_login_page_btn}    //a[text()=" Admin Login"]
${doctor_login_btn}    (//a[@class="btn btn-primary width100"])[2]
${admin_login_btn}    //i[@class="fa fa-user ispace"]//parent::a
${user_login_button}    //ul[@class="top-right"]//a

*** Keywords ***
Fill the login form with login credentials for doctor
    [Arguments]    ${username}    ${password}
    Click Link    ${admin_login_button}
    Switch Window    new
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}
    Click Button    ${signin_button}

Fill the successfull login form by clicking the doctor role
    Click Link    ${admin_login_button}
    Switch Window    new
    Click Link    ${valid_doctor_button}
    Click Button    ${signin_button}

Fill the unsuccessfull login form by clicking the doctor role
    Click Link    ${admin_login_button}
    Switch Window    new
    Click Link    ${invalid_doctor_button}
    Click Button    ${signin_button}

Click the signin button
    Click Button    ${signin_button}

Click the admin login button
    Click Link    ${admin_login_button}
    Switch Window    new

Fill the login form by default credentials for user role
    Click Button    ${signin_button}

Verify the successfull login with valid credentials for doctor
    Click Link    ${pofile_icon}
    Wait Until Element Is Enabled   ${profile_name}
    Element Text Should Be    ${profile_name}    Doctor

Verify the unsuccessfull login with valid credentials for doctor
    Click Link    ${pofile_icon}
    Element Text Should Not Be    ${profile_name}    Doctor

Verify the successfull login with valid credentials for user
    Click Link    ${pofile_icon}
    Wait Until Element Is Enabled   ${profile_name}
    Element Text Should Be    ${profile_name}    Patient

Verify the unsucessfull login with invalid credentials
    Element Text Should Be    ${invalid_credentials_message}    Invalid Username or Password

Verify the unsucessfull login with the blank username
    Element Text Should Be    ${required_username_message}    The Username field is required.

Verify the unsucessfull login with the blank password
    Element Text Should Be    ${required_password_message}    The Password field is required.

Verify the unsuccessfull login with blank credentials
    Element Text Should Be    ${required_username_message}    The Username field is required.
    Element Text Should Be    ${required_password_message}    The Password field is required.

#Logout the user
 #   Go To    ${doctor_logout_url}
 #   Click Button    ${pofile_icon}
  #  Click Link    ${doctorlogout_button}

click the doctor button
    Click Element    ${doctor_button}


click the admin login
    Click Element    ${admin_login} 


Go to user login
    Click Link    ${User_login_button}

Go to admin page
    Click link    ${admin_login_page_btn}

Go to doctor page
    Click Link    ${doctor_login_btn}

fill the admin login form
    Click Link    ${admin_login_btn}


Fill the login form for doctor
    Go to admin page
    Switch Window    new
    Click Link    ${doctor_login_btn}
    Sleep     5s
    click the sign in button

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    ${username_field}    ${username} 
    Input Password    ${password_field}    ${password}
    Click Button    ${signin_button}
    


