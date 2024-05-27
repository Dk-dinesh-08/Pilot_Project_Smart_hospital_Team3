*** Settings ***
Documentation    All the page objects and keywords of Admin Page
Library    SeleniumLibrary  


*** Variables ***
${appoinment_link}    //ul[@class="sidebar-menu verttop"]//li[3]/a
${doctor_wise_appionment_btn}    (//div[@class="box-tools pull-right"])//a
${queue_button}    (//div[@class="box-tools pull-right"])//a[3]
${login_password}    css:input[id='loginpassword']
${login_btn}    xpath://button[text()='Log in']
${close_btn}    xpath://div[@id="logInModal"]/div/div/div[3]/button[1]
${doctor_field}    span[id='select2-doctor-container']
${date_field}    //input[@name="date"]
${search_button}    //button[@class="btn btn-primary btn-sm pull-right"]
${shift_field}    select[id="global_shift"]
${slot_field}    select[id=slot]
${date_field}    input[id=datetimepicker]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]


*** Keywords ***
    
Fill the appoinment wise search form
    [Arguments]    ${doctor_name}     ${date}
    Input Text    ${doctor_field}    ${doctor_name}
    Input Text    ${date_field}    ${date}

Click the search button
    Click Button    ${search_button}

Click the Queue button
    Click Button    ${queue_button}

Click the Appoinment wise search button
    Click Button    ${doctor_wise_appionment_btn}

<<<<<<< Updated upstream
=======
Verify patient queue page opens
    Element Text Should Not Be    .box-title.titlefix    Patient Queue

>>>>>>> Stashed changes
Click Appoinment link
    Click Link    ${appoinment_link}



    