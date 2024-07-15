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
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Input Text    ${username_field}    ${username}
        Input Password    ${password_field}    ${password}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Login form filling with login credentials for doctor is failed
    END

Fill the successfull login form by clicking the doctor role
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Click Link    ${valid_doctor_button}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Succesfull login form filling by clicking doctor role is failed
    END

Fill the unsuccessfull login form by clicking the doctor role
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
        Click Link    ${invalid_doctor_button}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Unsuccesfull login form filling by clicking doctor role is failed
    END

Click the signin button
    TRY
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Click the signin button is failed
    END

Click the admin login button
    TRY
        Click Link    ${admin_login_button}
        Switch Window    new
    EXCEPT
        Log To Console    Click the admin login button is failed
    END

Fill the login form by default credentials for user role
    TRY
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Login form filling by default credentials for user role is failed
    END

Verify the successfull login with valid credentials for doctor
    TRY
        Click Link    ${pofile_icon}
        Wait Until Element Is Enabled   ${profile_name}
        Element Text Should Be    ${profile_name}    Doctor
    EXCEPT
        Log To Console    Succesfull login with valid credentials for doctor verification is failed
    END

Verify the unsuccessfull login with valid credentials for doctor
    TRY
        Click Link    ${pofile_icon}
        Element Text Should Not Be    ${profile_name}    Doctor
    EXCEPT
        Log To Console    Unsuccesfull login with valid credentials for doctor verification is failed
    END

Verify the successfull login with valid credentials for user
    TRY
        Click Link    ${pofile_icon}
        Wait Until Element Is Enabled   ${profile_name}
        Element Text Should Be    ${profile_name}    Patient
    EXCEPT
        Log To Console    Succesfull login with valid credentials for user verification is failed
    END

Verify the unsucessfull login with invalid credentials
    TRY
        Element Text Should Be    ${invalid_credentials_message}    Invalid Username or Password
    EXCEPT
        Log To Console    Unsuccesfull login with invalid credentials verification is failed
    END

Verify the unsucessfull login with the blank username
    TRY
        Element Text Should Be    ${required_username_message}    The Username field is required.
    EXCEPT
        Log To Console    Unsuccesfull login with blank username verification is failed
    END

Verify the unsucessfull login with the blank password
    TRY
        Element Text Should Be    ${required_password_message}    The Password field is required.
    EXCEPT
        Log To Console    Unsuccesfull login with blank password verification is failed
    END

Verify the unsuccessfull login with blank credentials
    TRY
        Element Text Should Be    ${required_username_message}    The Username field is required.
        Element Text Should Be    ${required_password_message}    The Password field is required.
    EXCEPT
        Log To Console    Unsuccesfull login with blank credentials verification is failed
    END

click the doctor button
    TRY
        Click Element    ${doctor_button}
    EXCEPT
        Log To Console    Click the doctor button is failed
    END


click the admin login
    TRY
        Click Element    ${admin_login}
    EXCEPT
        Log To Console    Click the admin login is failed
    END 


Go to user login
    TRY
        Click Link    ${User_login_button}
    EXCEPT
        Log To Console    Go to user login is failed
    END

Go to admin page
    TRY
        Click link    ${admin_login_page_btn}
    EXCEPT
        Log To Console    Go to admin page is failed
    END

Go to doctor page
    TRY
        Click Link    ${doctor_login_btn}
    EXCEPT
        Log To Console    Go to doctor page is failed
    END

fill the admin login form
    TRY
        Click Link    ${admin_login_btn}
    EXCEPT
        Log To Console    Login form filling for admin is failed
    END


Fill the login form for doctor
    TRY
        Go to admin page
        Switch Window    new
        Click Link    ${doctor_login_btn}
        Sleep     5s
        click the sign in button
    EXCEPT
        Log To Console    Login form filling for doctor is failed
    END

Fill the login form
    [Arguments]    ${username}    ${password}
    TRY
        Input Text    ${username_field}    ${username} 
        Input Password    ${password_field}    ${password}
        Click Button    ${signin_button}
    EXCEPT
        Log To Console    Login form filling is failed
    END
    



