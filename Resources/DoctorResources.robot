*** Settings ***
Documentation    A Doctor page resource file with reusable keywords and variables.
Library    SeleniumLibrary
Library     Collections

*** Variables ***
${bed_145}    xpath://div[text()='FF - 145']
${Addmision_date}    css:input[id="admission_date"]
${patientSelect_field}    xpath://span[@class="select2-selection select2-selection--single" and @aria-labelledby="select2-addpatient_id-container"]
${patientinput_field}    css:input[class="select2-search__field"]
${consultant_select_field}    xpath://span[@class="select2-selection select2-selection--single" and @aria-labelledby="select2-consultant_doctor-container"]
${bed_status_save_button}    css:button[id="formaddbtn"]
${doctal_consultant_select}    xpath://select[@id='consultant_doctor']
${patient_name}    xpath://li[@class='select2-results__option select2-results__option--highlighted']
${Dashboard}    css:i[class="fas fa-television"]
${Appointment}    xpath://i[@class='fa fa-calendar-check-o']//following-sibling::span
${IPD_in_patient}    xpath://i[@class="fas fa-procedures"]//parent::a
${notification_icon}    xpath://i[@class="fa fa-bell-o"]//parent::a
${language_icon}    xpath://button[@class="btn dropdown-toggle selectpicker btn-default"]
${betstatus_icon}    xpath://i[@class="fas fa-bed cal15"]//parent::a
${delete_notification_button}    xpath://i[@class="fa fa-trash"]//parent::button
${delete_notification_button}    xpath://i[@class="fa fa-trash"]//parent::button
${valid_hindi_language}    xpath://a[normalize-space()='Hindi']
${invalid_hindi_language}    xpath://a[normalize-space()='Spanish']
${add_patient_button}    css:a[id="addp"]
${new_patient_button}    css:a[id="addpip"]
${name_field}    css:input[id="name"]
${guardian_name_field}    css:div[class="col-lg-6 col-md-6 col-sm-6"] input[name="guardian_name"]
${dob_field}    xpath://div[@class="col-sm-4"]//input[@name="dob"]
${blood_group_field}    css:div[class="col-sm-3"] select[name="blood_group"]
${blood_group_field_specific}    css:div[class="col-sm-3"] select[name="blood_group"] option
${marital_status_field}    css:div[class="col-sm-3"] select[id="marital_status"]
${phone_number_field}    css:input[id="number"]
${email_field}    css:input[id="addformemail"]
${address_field}    css:input[name="address"]
${remarks}    css:textarea[id="note"]
${known_allergies_field}    css:div[class="col-lg-12 col-md-12 col-sm-12"] textarea[name="known_allergies"]
${TPA_ID_field}    css:input[name="insurance_id"]
${TPA_validity_field}    css:input[name="validity"]
${national_identity_number_field}    css:input[name="identification_number"]
${alternate_number_field}    css:input[id="custom_fields[patient][3]"]
${save_button}    css:button[id="formaddpabtn"]
${addnewpatient_validalert}    css:div[class='toast-message']
${addnewpatient_invalidalert}    css:div[class='toast-message'] p
${add_death_record}    xpath://a[@class='btn btn-primary btn-sm deathrecord']
${add_birth_record}    xpath://a[@class='btn btn-primary btn-sm birthrecord']
${birth_record_death_record}    xpath://a/i[@class='fa fa-birthday-cake']
${birth_record}    xpath://a[text()= ' Birth Record ']
${death_record}    xpath://a[text()= ' Death Record']
${add_birthrecord_deathrecord_button}    class:fa fa-plus
${child_name}    name:child_name
${Gender_drop_down}    xpath:(//select[@class='form-control'])[1]
${male_gender_option}    Male
${female_gender_option}    Female
${Gender_option_male}    xpath:(//option[@value='Male'])[1]
${Gender_option_female}    xpath:(//option[@value='Female'])[1]
${weight_feild}    name:weight
${birth_date_feild}    id:birth_date
${contact_feild}    id:contact
${adress_feild}    id:address
${case_id_feild}    id:case_id
${fathers_name_feild}    id:father_name
${b_reports}    id:birth_report
${save_btn}    id:formaddbtn
${deadDate}    id:death_date
${deadReports}    id:death_report
${search_in_birthRate}    xpath://input[@type='search']
${assert_birth_record}    xpath://tr[@class='even']
${death_record_list}    xpath://div/table[@class='table table-striped table-bordered table-hover ajaxlist dataTable no-footer']
${value}    DREF49
${Invalid_search_record_assert}    xpath=//div[contains(text(), 'No data available in table')] 
${addnewpatient_validalert}    css:div[class='toast-message']
${addnewpatient_invalidalert}    css:div[class='toast-message'] p
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
${assert_invalid_add_Death_record}    xpath://div[text()='Patient Not Found']
${verification_text_invalid}    The Send Through field is required.
${sms_body}    Hiiii all
${template_id}    MSGID0001
${title}    Gropu message to doctor,Pathologist,Pharmacy
${unsuccessful_msg}    (//span[@class="text-danger"])[3]/p
${unsuccessful_msg_text}    The Notice Date field is required.

 
*** Keywords ***

Addition of new patient in the IPD inpatient with valid Credentials
    [Arguments]    ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}
    TRY
        Click Link    ${IPD_in_patient}
        Click Link    ${add_patient_button}
        Click Link    ${new_patient_button}
        Input Text    ${name_field}    ${patient_name}
        Input Text    ${guardian_name_field}    ${guardian_name}
        Input Text    ${dob_field}    ${dob}
        Input Text    ${phone_number_field}    ${phone_number}
        Input Text    ${email_field}    ${email}
        Input Text    ${address_field}    ${address}
        Input Text    ${known_allergies_field}    ${known_allergies}
        Input Text    ${TPA_ID_field}    ${TPA_ID}
        Input Text    ${TPA_validity_field}    ${TPA_Validity}
        Input Text    ${national_identity_number_field}    ${ni_number}
        Input Text    ${alternate_number_field}    ${alternate_number}
        Click Button    ${save_button}
    EXCEPT
        Log    An error occurred while adding a new patient.
        
    END
        Close Browser

View the notification messages
    Click Link    ${notification_icon}

Delete the all notification message
    TRY
        Click Link    ${notification_icon}
        Click Button    ${delete_notification_button}
        Alert Should Be Present
    EXCEPT
        Log To Console    Failed to delete all notification messages
    END

Verify successful deletion of all notification messages
    TRY
        Click Link    ${notification_icon}
        Element Text Should Be    css:div[class="alert alert-danger"]    No Record Found
    EXCEPT
        Log To Console    Successful deletion of all notification messages verification failed
    END


Verify unsuccessful deletion of all notification messages
    TRY
        Click Link    ${notification_icon}
        Element Text Should Not Be    css:div[class="alert alert-danger"]    No Record Found
    EXCEPT
        Log To Console    Unsuccessful deletion of all notification messages verification failed
    END

Verify the successful adding of new patient 
    TRY
        Element Text Should Be    ${addnewpatient_validalert}    Record Saved Successfully
    EXCEPT
        Log To Console    Verification of successful addition of new patient failed
    END

Verify the unsuccessfull addition of new patient
    TRY
        Element Text Should Be    ${addnewpatient_invalidalert}    The Name field is required.
    EXCEPT
        Log To Console    Verification of unsuccessful addition of new patient failed
    END


fill the birth record form
    [Arguments]     ${Cname}    ${weight}	    ${birthDate}	    ${Contact}	    ${Address}   	${CaseId}	  ${FathersName}    ${birthReports}	 
    TRY
        Input Text    ${child_name}    ${Cname}
        Select From List By Index   ${Gender_drop_down}   1                                       
        Input Text    ${weight_feild}    ${weight}
        Input Text    ${birth_date_feild}    ${birthDate}
        Input Text    ${contact_feild}    ${contact}
        Input Text    ${adress_feild}     ${Address}  
        Input Text    ${case_id_feild}    ${CaseId}
        Input Text    ${fathers_name_feild}    ${FathersName}
        Input Text    ${b_reports}    ${birthReports}
        Click Button    ${save_btn}    
        
    EXCEPT
        Log To Console  Failed to add birth record in birth record form

    END
        Close Browser

click birth record and death record
    Click Element    ${birth_record_death_record}

click birth record
    Click Element    ${birth_record}

click death record
    Click Element    ${death_record}

Add birth record button
    Click Element    ${add_birthrecord_deathrecord_button}

Add death record button
    Click Element    ${add_birthrecord_deathrecord_button}

fill the death record form
    [Arguments]    ${caseID}    ${DeathDate}    ${DeathReports}
    TRY
        Input Text    ${case_id_feild}    ${caseID}
        Input Text    ${deadDate}      ${DeathDate}
        Input Text    ${deadReports}    ${DeathReports}
        Click Element    ${save_btn}
    EXCEPT
        Log To Console    failed to fill the date record form
    END

click add birth record
    Click Element    ${add_birth_record}

click add death record
    Click Element    ${add_death_record}

search value in birth record
    Input Text    ${search_in_birthRate}   3704

Invalid search in birth record
    Input Text    ${search_in_birthRate}   1111

assert the invalid birth and death record
    Element Should Contain   ${Invalid_search_record_assert}    No data available in table  
    

assert the birth record search
    Wait Until Element Contains   ${assert_birth_record}    BREF66

search value in death record
    Input Text    ${search_in_birthRate}   Dennis Coates

Invalid value in death record
    Input Text    ${search_in_birthRate}   dinesh


assert value in death record 
    Input Text    ${search_in_birthRate}    ${value}
    ${list_of_elements}=    Get WebElements    ${death_record_list}
    ${options_texts}=    Create List
    FOR    ${element}    IN    @{list_of_elements}
        ${text}=    Get Text    ${element}
        Append To List    ${options_texts}    ${text}
        Run Keyword If    '${text}' == '${value}'    Log To Console  ${text}
        Sleep    5s    
    END


Verify successful login of doctor
    TRY
        Click Link    ${image_icon}
        Element Text Should Be    ${doctor_text_locator}    Doctor
    EXCEPT
        Log To Console    failed to verify successful login
    END

Successfull update of the bed status
    TRY
        Click Link    ${betstatus_icon}
        Click Element    ${bed_145}
        Click Element    ${patientSelect_field}
        Input Text    ${patientinput_field}   Evander  
        Click Element    ${patient_name}
        Click Element    ${Addmision_date}
        Select From List By Value   ${doctal_consultant_select}     11    
        Click Button    ${bed_status_save_button}
    EXCEPT
        Log To Console    failed to verify successful login
    END


Unsuccessfull update of the bed status
    TRY
        Click Link    ${betstatus_icon}
        Click Element    ${bed_145}
        Click Element    ${patientSelect_field}
        Input Text    ${patientinput_field}   Olivier  
        Click Element    ${patient_name}
        Click Element    ${Addmision_date}
        Select From List By Value   ${doctal_consultant_select}     11    
        Click Button    ${bed_status_save_button}
    EXCEPT
            Log To Console    failed to verify successful login
    END


Verify the successfull updation of the bed status
    TRY
        Wait Until Element Is Visible    css:div[class="toast-message"] 
        Element Text Should Be    css:div[class="toast-message"]    Patient Added Successfully
    EXCEPT
            Log To Console    failed to verify successful login
    END

Verify the unsuccessfull updation of the bed status
    TRY
        Wait Until Element Is Visible    css:div[class="toast-message"] 
        Element Text Should Not Be    css:div[class="toast-message"]    Patient Added Successfully
    EXCEPT
            Log To Console    failed to verify successful login
    END

Click messaging button
    TRY
        Scroll Element Into View    ${msg_btn}
        Click Element   ${msg_btn}
    EXCEPT
        Log To Console    failed to click messaging button
    END

Click post new message button
    TRY
        Click Link    ${post_new_msg_locator}
    EXCEPT
        Log To Console    failed to click post new message button
    END

Fill post new message form
    [Arguments]
    TRY
        Input Text    ${title_locator}    To my friend
        Select Frame    ${messaging_frame}
        Click Element    ${msg_body}
        Input Text    ${msg_body}    text=Hiiii! Sandhiya
        Unselect Frame
        Input Text    ${notice_date}    05/29/2024
        Input Text    ${publish_on}    05/30/2024
    EXCEPT
        Log To Console    failed to fill post new message form
    END

Send the message
    TRY
        Scroll Element Into View    ${send_btn}
        Click Button    ${send_btn}
    EXCEPT
        Log To Console    failed to send the message
    END

Verify message send successfully
    TRY
        Element Text Should Be    ${sucess_msg}    ${verification_text}
    EXCEPT
        Log To Console    failed to verify message send successfully
    END

click send sms button
    TRY
        Click Link    ${send_msg_locator}
    EXCEPT
        Log To Console    failed to click send sms button
    END

Verify send sms Page is opened
    TRY
        Element Text Should Be    ${sms_page}     Send SMS
    EXCEPT
        Log To Console    failed to verify send sms page is opened
    END

Fill the send SMS form
    TRY
        Input Text    ${sms_title}    Gropu message to doctor,Pathologist,Pharmacy
        Input Text    ${sms_template}    MSGID0001
        Click Element    ${sms_checkbox}
        Input Text    ${text_area}    Hiiii all
        Click Element    ${admin_check_box}
        Click Element    ${doctor_check_box}
        Click Element    ${Pathologist_check_box}
        Click Element    ${Pharmacist_check_box}
        Click Button    ${send_sms_btn}
    EXCEPT
        Log To Console    failed to fill the send SMS form
    END

To assert sucessfully message sent
    TRY
        Element Text Should Be    ${assert_sms}    ${verification_text}
    EXCEPT
        Log To Console    failed to assert successfully message sent
    END

check the alert for invalid add death record
    Wait Until Page Contains Element    ${assert_invalid_add_Death_record}
    Element Text Should Be    ${assert_invalid_add_Death_record}    Patient Not Found

    

To verify the unsucessful message sent
    Element Text Should Be    ${assert_sms}    The Send Through field is required.

To verify the sucessful message sent
    Element Text Should Be    ${assert_sms}    Record Saved Successfully


Fill the send SMS form using invalid details
    TRY
        Input Text    ${sms_title}    Gropu message to doctor,Pathologist,Pharmacy
        Input Text    ${sms_template}    MSGID0001
        # Click Element    ${sms_checkbox}
        Input Text    ${text_area}    Hiiii all
        Click Element    ${admin_check_box}
        Click Element    ${doctor_check_box}
        Click Element    ${Pathologist_check_box}
        Click Element    ${Pharmacist_check_box}
        Click Button    ${send_sms_btn}
    EXCEPT
        Log To Console    failed to fill the send SMS form using invalid details
    END

Fill the send SMS form without clicking send through
    TRY
        Input Text    ${sms_title}    ${title}
        Input Text    ${sms_template}    ${template_id}
        Input Text    ${text_area}    ${sms_body}
        Click Element    ${admin_check_box}
        Click Element    ${doctor_check_box}
        Click Element    ${Pathologist_check_box}
        Click Element    ${Pharmacist_check_box}
        Click Button    ${send_sms_btn}
    EXCEPT
        Log To Console    failed to fill the send SMS form without clicking send through
    END

Fill post new message form using invalid notification date
    TRY
        Input Text    ${title_locator}    To my friend
        Select Frame    ${messaging_frame}
        Click Element    ${msg_body}
        Input Text    ${msg_body}    text=Hiiii! Sandhiya
        Unselect Frame
        Input Text    ${publish_on}    05/30/2024
    EXCEPT
        Log To Console    failed to fill post new message form using invalid notification date
    END

Fill post new message form using invalid title
    TRY
        Select Frame    ${messaging_frame}
        Click Element    ${msg_body}
        Input Text    ${msg_body}    text=Hiiii! Sandhiya
        Unselect Frame
        Input Text    ${notice_date}    05/29/2024
        Input Text    ${publish_on}    05/30/2024
    EXCEPT
        Log To Console    failed to fill post new message form using invalid title
    END

Verify unsuccessful msg sent using invalid notification date
    TRY
        Element Text Should Be    ${unsuccessful_msg}    ${unsuccessful_msg_text}
    EXCEPT
        Log To Console    failed to verify unsuccessful msg sent using invalid notification date
    END

Verify unsuccessful msg sent using invalid title
    TRY
        Element Text Should Be    (//span[@class="text-danger"])/p    The Title field is required.
    EXCEPT
        Log To Console    failed to verify unsuccessful msg sent using invalid title
    END
