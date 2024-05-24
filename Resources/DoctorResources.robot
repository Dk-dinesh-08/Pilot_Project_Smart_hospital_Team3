*** Settings ***
Documentation    All the page objects and keywords of doctor page
Library    SeleniumLibrary  

*** Variables ***
#login for doctor
${image_icon}   img[class=topuser-image]
${doctor_text_locator}    //div[@class="sstopuser-test"]/h5

#messaging
${msg_locator}    //i[@class="fas fa-bullhorn"]/parent::a
${post_new_msg_locator}    (//a[@class="btn btn-primary btn-sm"])[1]
${send_msg_locator}    (//a[@class="btn btn-primary btn-sm"])[2]

#post msg form
${title_locator}    input[id=title]
${notice_date}    (//input[@class="form-control date"])[1]
${msg_body}    //body[@class="form-control wysihtml5-editor"]
${publish_on}    (//input[@class="form-control date"])[2]
${send_btn}    (//div[@class="pull-right"])[2]/button

*** Keywords ***

Verify successful login of doctor
    Click Image    ${image_icon}
    # ${user_text}    Get Text    ${doctor_text_locator}
    Element Text Should Be    ${doctor_text_locator}    Doctor

Fill post new message form
    [Arguments]
        Input Text    ${title_locator}    To my friend
        Input Text    ${msg_body}    text=Hiiii! Sandhiya
        Input Text    ${notice_date}    05/29/2024
        Input Text    ${publish_on}    05/30/2024

Send the message
    Click Link    ${send_btn}