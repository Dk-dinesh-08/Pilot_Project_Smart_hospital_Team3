*** Settings ***
Documentation    All the page objects and keywords of Admin Page
Library    SeleniumLibrary
Library     Collections


*** Variables ***
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
 
*** Keywords ***
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
    Wait Until Element Is Visible   ${search_in_birthRate} 
    Input Text    ${search_in_birthRate}   3704

Invalid search in birth record
    Input Text    ${search_in_birthRate}   1111

assert the invalid birth and death record
    Element Should Contain   ${Invalid_search_record_assert}    No data available in table  
    

assert the birth record search
    Wait Until Element Contains   ${assert_birth_record}    BREF66

search value in death record
    Input Text    ${search_in_birthRate}   4723

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

check the alert for invalid add death record
    Wait Until Page Contains Element    ${assert_invalid_add_Death_record}
    Element Text Should Be    ${assert_invalid_add_Death_record}    Patient Not Found
    