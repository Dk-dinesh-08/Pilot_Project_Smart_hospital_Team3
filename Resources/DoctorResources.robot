*** Settings ***
Documentation    A Doctor page resource file with reusable keywords and variables.
Library    SeleniumLibrary
Library     Collections

*** Variables ***
${Dashboard}    css:i[class="fas fa-television"]
${Appointment}    xpath://i[@class='fa fa-calendar-check-o']//following-sibling::span
${IPD_in_patient}    xpath://i[@class="fas fa-procedures"]//parent::a
${notification_icon}    xpath://i[@class="fa fa-bell-o"]//parent::a
${language_icon}    xpath://button[@class="btn dropdown-toggle selectpicker btn-default"]
${betstatus_icon}    xpath://i[@class="fas fa-bed cal15"]//parent::a
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
${assert_birth_record}    xpath://tr[@class='odd']
${death_record_list}    xpath://div/table[@class='table table-striped table-bordered table-hover ajaxlist dataTable no-footer']
${value}    DREF49
${Invalid_search_record_assert}    xpath=//div[contains(text(), 'No data available in table')] 
*** Keywords ***

Change the valid system language
    Wait Until Element Is Enabled    ${language_icon}
    Click Button    ${language_icon}
    #Select From List By Value    //a[normalize-space()='Hindi']    Hindi
    Click Link    ${valid_hindi_language}

Change the invalid system language
    Wait Until Element Is Enabled    ${language_icon}
    Click Button    ${language_icon}
    #Select From List By Value    //a[normalize-space()='Hindi']    Hindi
    Click Link    ${invalid_hindi_language}

Addition of new patient in the IPD inpatient with valid Credentials
    [Arguments]    ${patient_name}    ${guardian_name}    ${dob}    ${bloodgroup}    ${marital_status}    ${phone_number}    ${email}    ${address}    ${known_allergies}    ${TPA_ID}    ${TPA_Validity}    ${ni_number}    ${alternate_number}
    Click Link    ${IPD_in_patient}
    Click Link    ${add_patient_button}
    Click Link    ${new_patient_button}
    Input Text    ${name_field}    ${patient_name}
    Input Text    ${guardian_name_field}    ${guardian_name}
    Input Text    ${dob_field}    ${dob}
   # Click Element    ${blood_group_field}
    #Input Text    ${blood_group_field}    ${bloodgroup}
    #Select From List By Value    ${blood_group_field_specific}    ${bloodgroup}
    #Click Element   ${marital_status_field}
    #Input Text    ${marital_status_field}    ${marital_status}
    #Select From List By Value    ${marital_status_field}    ${marital_status}
    Input Text    ${phone_number_field}    ${phone_number}
    Input Text    ${email_field}    ${email}
    Input Text    ${address_field}    ${address}
    Input Text    ${known_allergies_field}    ${known_allergies}
    Input Text    ${TPA_ID_field}    ${TPA_ID}
    Input Text    ${TPA_validity_field}    ${TPA_Validity}
    Input Text    ${national_identity_number_field}    ${ni_number}
    Input Text    ${alternate_number_field}    ${alternate_number}
    Click Button    ${save_button}

View the notification messages
    Click Link    ${notification_icon}

Delete the all notification message
    Click Link    ${notification_icon}
    Click Button    ${delete_notification_button}
    Alert Should Be Present

Verify the successfull sytem language change
    Wait Until Element Is Enabled    ${language_icon}
    ${result}=    Get Text    ${language_icon}
    Should Contain    ${result}    Hindi

Verify the unsuccessfull sytem language change
    Wait Until Element Is Enabled    ${language_icon}
    ${result}=    Get Text    ${language_icon}
    Should Not Contain  ${result}    Hindi

Verify sucsessfull deletion of all notification messages
    Click Link    ${notification_icon}
    Element Text Should Be    css:div[class="alert alert-danger"]    No Record Found

Verify unsuccessfull deletion of all notification messages
    Click Link    ${notification_icon}
    Element Text Should Not Be    css:div[class="alert alert-danger"]    No Record Found

Verify the successfull adding of new patient 
    Element Text Should Be    ${addnewpatient_validalert}    Record Saved Successfully

Verify the unsuccessfull addition of new patient
    Element Text Should Be    ${addnewpatient_invalidalert}    The Name field is required. 

fill the birth record form
    [Arguments]     ${Cname}    ${weight}	    ${birthDate}	    ${Contact}	    ${Address}   	${CaseId}	  ${FathersName}    ${birthReports}	 
    Click Element   ${Gender_drop_down}
    Click Element    ${Gender_option_male}                                                      
    Input Text    ${weight_feild}    ${weight}
    Input Text    ${birth_date_feild}    ${birthDate}
    Input Text    ${contact_feild}    ${contact}
    Input Text    ${adress_feild}     ${Address}  
    Input Text    ${case_id_feild}    ${CaseId}
    Input Text    ${fathers_name_feild}    ${FathersName}
    Input Text    ${b_reports}    ${birthReports}
    Click Button    ${save_btn}    
    
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
    Input Text    ${case_id_feild}    ${caseID}
    Input Text    ${deadDate}      ${DeathDate}
    Input Text    ${deadReports}    ${DeathReports}
    Click Element    ${save_btn}


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

