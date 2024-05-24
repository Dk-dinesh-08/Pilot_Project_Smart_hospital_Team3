*** Settings ***
Documentation    All the page objects and keywords of Admin Page
Library    SeleniumLibrary  
Library    Collections


*** Variables ***
${appoinment_link}    //ul[@class="sidebar-menu verttop"]//li[3]/a
${doctor_wise_appionment_btn}    //a[@href="https://demo.smart-hospital.in/admin/onlineappointment/patientschedule"]

${login_password}    css:input[id='loginpassword']
${login_btn}    xpath://button[text()='Log in']
${close_btn}    xpath://div[@id="logInModal"]/div/div/div[3]/button[1]
${doctor_field}    //span[@class="select2-selection__arrow"]
${date_field}    //input[@name="date"]
${search_button}    //button[@class="btn btn-primary btn-sm pull-right"]

${date_field}    input[id=datetimepicker]

#for valid doctor wise search results
${verify_text}   Records: 0 to 0 of 0
${search_result}    //div[@id="DataTables_Table_0_info"] 

#for form Queue search
${select_doctor_field}    (//select[@class="form-control select2"])[1]
${queue_button}    (//div[@class="box-tools pull-right"])//a[3]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]
${queue_doctor_field}    select[id=doctor]    #//select[@name="doctor"]
${select_shift_field}    (//select[@class="form-control select2"])[2]
${slot_field}    //select[@class="form-control"]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]

#for valid queue search results
${queue_result}    //td[@class="text text-center text-danger"]
${queue_text}    No Record Found

#for overall patient search
${patient_search}    //input[@class="form-control search-form search-form3"]
${patient_search_button}    (//button[@class="btn btn-flat"]/i)[1]
${table_value}    (//a[@class="btn btn-default btn-xs"])[1]



*** Keywords ***
Fill the appointment wise search form
    [Arguments]    ${doctor_name}    ${date}
    Click Element    ${doctor_field}
    ${list_of_elements}=    Get WebElements    //span[@class="select2-results"]//li
    ${options_texts}=    Create List
    FOR  ${element}    IN    @{list_of_elements}
         ${text}=    Get Text    ${element}
         Append To List    ${options_texts}    ${text}
         Run Keyword If    '${text}' == '${doctor_name}'      Click Element    ${element}
         Sleep    5s
    END
    # Log    ${options_texts}
    # Log To Console    ${options_texts}
    
    Click Element    ${date_field}
    Input Text    ${date_field}    ${date} 

       


Click the search button
    Click Button    ${search_button}

Click the Queue button
    Click link    ${queue_button}

Verify patient queue page opens
    Element Text Should Not Be    .box-title.titlefix    Patient Queue

Click the Appoinment wise search button
    Click Link   ${doctor_wise_appionment_btn}

Click Appoinment link
    Click Link    ${appoinment_link}

Verify doctor wise appoinment search
   Element Text Should Be    ${search_result}    ${verify_text}

Verify doctor wise appoinment search for invalid doctor name
   Element Text Should Be    ${search_result}    ${verify_text}



Fill the Queue form
    [Arguments]     ${doctor_name}  ${shift}  ${date}    ${slot}    
    Click Element    ${select_doctor_field}
    
    Select From List By Value   ${select_doctor_field}     ${doctor_name}
    Click Element    ${select_shift_field}

    Select From List By Value   ${select_shift_field}    ${shift}
    Click Element    ${date_field}
    
    Input Text   ${date_field}     ${date}
    Click Element    ${slot_field}
    Select From List By Value   ${slot_field}     ${slot}
   

click search button for queue 
    Click Button    ${queue_search_button}

Verify results for queue search
    Element Text Should Be    ${queue_result}    ${queue_text}

Enter patient name
    [Arguments]    ${patient_name}
    Input Text    ${patient_search}    ${patient_name}
    Click Element    ${patient_search_button}
    
Verify the patient search details
    ${name}    Get Text    ${table_value}
    Should Be Equal As Strings    ${name}     Olivier Thomas (1)