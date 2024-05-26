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