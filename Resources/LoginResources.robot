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
${admin_login_page_btn}    //a[text()=" Admin Login"]
${doctor_login_btn}    (//a[@class="btn btn-primary width100"])[2]
${admin_login_btn}    //i[@class="fa fa-user ispace"]//parent::a
${user_login_button}    //ul[@class="top-right"]//a

*** Keywords ***
Fill the login form with login credentials for doctor
    [Arguments]    ${username}    ${password}
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Input Text    ${username_field}    ${username}
        Input Password    ${password_field}    ${password}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed in login form credentials for doctor
    END

Fill the successfull login form by clicking the doctor role
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Click Link    ${valid_doctor_button}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed in successful login form for doctor
    END

Fill the unsuccessfull login form by clicking the doctor role
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Click Link    ${invalid_doctor_button}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed in unsuccessful login form for doctor
    END

Click the signin button
    TRY
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed to click signin button
    END

Click the admin login button
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
    EXCEPT
        Log To Console    failed to click admin login button
    END

Fill the login form by default credentials for user role
    TRY
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed in login form by default credentials for user role
    END

Verify the successful login with valid credentials for doctor
    TRY
        Click Link    ${pofile_icon}
        Wait Until Element Is Enabled   ${profile_name}
        Element Text Should Be    ${profile_name}    Doctor
    EXCEPT
        Log To Console    failed to verify successful login for doctor
    END

Verify the unsuccessfull login with valid credentials for doctor
    TRY
        Click Link    ${pofile_icon}
        Element Text Should Not Be    ${profile_name}    Doctor
    EXCEPT
        Log To Console    failed to verify unsuccessful login for doctor
    END

Verify the successfull login with valid credentials for user
    TRY
        Click Link    ${pofile_icon}
        Wait Until Element Is Enabled   ${profile_name}
        Element Text Should Be    ${profile_name}    Patient
    EXCEPT
        Log To Console    failed to verify successful login for user
    END

Verify the unsucessfull login with invalid credentials
    TRY
        Element Text Should Be    ${invalid_credentials_message}    Invalid Username or Password
    EXCEPT
        Log To Console    failed to verify unsuccessful login with invalid credentials
    END

Verify the unsucessfull login with the blank username
    TRY
        Element Text Should Be    ${required_username_message}    The Username field is required.
    EXCEPT
        Log To Console    failed to verify unsuccessful login with blank username
    END

Verify the unsucessfull login with the blank password
    TRY
        Element Text Should Be    ${required_password_message}    The Password field is required.
    EXCEPT
        Log To Console    failed to verify unsuccessful login with blank password
    END

Verify the unsuccessfull login with blank credentials
    TRY
        Element Text Should Be    ${required_username_message}    The Username field is required.
        Element Text Should Be    ${required_password_message}    The Password field is required.
    EXCEPT
        Log To Console    failed to verify unsuccessful login with blank credentials
    END

Click the doctor button
    TRY
        Click Element    ${doctor_button}
    EXCEPT
        Log To Console    failed to click doctor button
    END

Click the admin login
    TRY
        Click Element    ${admin_login}
    EXCEPT
        Log To Console    failed to click admin login
    END

Go to user login
    TRY
        Click Link    ${user_login_button}
    EXCEPT
        Log To Console    failed to go to user login
    END

Go to admin page
    TRY
        Click Link    ${admin_login_page_btn}
    EXCEPT
        Log To Console    failed to go to admin page
    END

Go to doctor page
    TRY
        Click Link    ${doctor_login_btn}
    EXCEPT
        Log To Console    failed to go to doctor page
    END

Fill the admin login form
    TRY
        Click Link    ${admin_login_btn}
    EXCEPT
        Log To Console    failed to fill admin login form
    END

Fill the login form for doctor
    TRY
        Go to admin page
        Switch Window    new
        Click Link    ${doctor_login_btn}
        Sleep    5s
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed to fill login form for doctor
    END

Fill the login form
    [Arguments]    ${username}    ${password}
    TRY
        Input Text    ${username_field}    ${username}
        Input Password    ${password_field}    ${password}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    failed to fill login form
    END
