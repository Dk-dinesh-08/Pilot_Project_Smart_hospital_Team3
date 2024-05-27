*** Settings ***
Documentation    All the page objects and keywords of doctor page
Library    SeleniumLibrary  

*** Variables ***
#login for doctor
${image_icon}   //a[@class="dropdown-toggle"]
${doctor_text_locator}    //div[@class="sstopuser-test"]/h5

#messaging
${msg_locator}    //i[@class="fas fa-bullhorn"]/parent::a
${post_new_msg_locator}    (//a[@class="btn btn-primary btn-sm"])[1]
${send_msg_locator}    (//a[@class="btn btn-primary btn-sm"])[2]

#messaging btn
${msg_btn}   //a/i[@class='fas fa-bullhorn']  # //span[text()="Messaging"]

#post msg form
${title_locator}    //div[@class="col-md-9"]//input[@name="title"]
${notice_date}    (//input[@class="form-control date"])[1]
${messaging_frame}    //div[@class="form-group"]//iframe    #iframe[class=wysihtml5-sandbox]
${msg_body}    //body[@class="form-control wysihtml5-editor"]
${publish_on}    (//input[@class="form-control date"])[2]
${send_btn}    (//div[@class="pull-right"])[2]/button
${sucess_msg}    //div[@class="alert alert-success"]
${verification_text}    Record Saved Successfully

#send sms form
${sms_page}    .pull-left.header
${sms_title}    //div[@class="form-group"]//input[@name="group_title"]
${sms_template}    //input[@name="group_template_id"] 
${sms_checkbox}    (//label[@class="checkbox-inline"]/input)[1]
${text_area}    //textarea[@name="group_message"]
${send_sms_btn}    //button[@class="btn btn-primary submit_group"]
${admin_check_box}    (//input[@type="checkbox"])[4]
${doctor_check_box}    (//input[@type="checkbox"])[6]
${Pathologist_check_box}    (//input[@type="checkbox"])[8]
${Pharmacist_check_box}    (//input[@type="checkbox"])[7]
${assert_sms}    //div[@class="toast-message"]
 



*** Keywords ***

Verify successful login of doctor
    Click Link    ${image_icon}
    # ${user_text}    Get Text    ${doctor_text_locator}
    Element Text Should Be    ${doctor_text_locator}    Doctor



Click messaging button
    Scroll Element Into View    ${msg_btn}
    Click Element   ${msg_btn}

Click post new message button
    Click Link    ${post_new_msg_locator}

Fill post new message form
    [Arguments]
        Input Text    ${title_locator}    To my friend
        Select Frame    ${messaging_frame}
        Click Element    ${msg_body}
        Input Text    ${msg_body}    text=Hiiii! Sandhiya
        Unselect Frame
        Input Text    ${notice_date}    05/29/2024
        Input Text    ${publish_on}    05/30/2024

Send the message
    Scroll Element Into View    ${send_btn}
    Click Button    ${send_btn}

Verify message send sucessfully
    Element Text Should Be    ${sucess_msg}    ${verification_text}

click send sms button
    Click Link    ${send_msg_locator}

Verify send sms Page is opened
    Element Text Should Be    ${sms_page}     Send SMS

Fill the send SMS form
    Input Text    ${sms_title}    Gropu message to doctor,Pathologist,Pharmacy
    Input Text    ${sms_template}    MSGID0001
    Click Element    ${sms_checkbox}
    Input Text    ${text_area}    Hiiii all
    Click Element    ${admin_check_box}
    Click Element    ${doctor_check_box}
    Click Element    ${Pathologist_check_box}
    Click Element    ${Pharmacist_check_box}
    Click Button    ${send_sms_btn}

To assert sucessfully message sent
    Element Text Should Be    ${assert_sms}    ${verification_text}
    