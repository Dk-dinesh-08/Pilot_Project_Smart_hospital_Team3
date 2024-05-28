*** Settings ***
Documentation    A User page resource file with reusable keywords and variables.
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${pharmacy_bill_search_field}    css:input[type="search"]
${show_field}    css:i[class="fa fa-reorder"]
${pay_button}    css:button[class="btn btn-primary btn-xs"]
${view_payment_option}    css:a[class="btn btn-default view_payment btn-xs"]
${payment_amount_field}    css:input[id="amount_total_paid"]
${add_pay_button}    css:button[id="pay_button"]
${paywithcard_button}    css:button[class="stripe-button-el"]
${payment_email_field}    css:div[class="emailInput input"] input[id='email']
${payment_cardnumber_field}    css:input[id="card_number"]
${card_expiry_date_field}    css:input[id="cc-exp"]
${card_cvv_field}    css:input[id="cc-csc"]
${final_pay_button}    css:button[id="submitButton"]
${pharmacy_option}    xpath://i[@class="fas fa-mortar-pestle"]//parent::a
${pharmacy_bill_record_assert}    css:div[id="DataTables_Table_0_info"]
${pharmacy_view_details}    xpath://a[@class="btn btn-default btn-xs"]
${view_detail_assert}    xpath://h5[text()='Bill No : PHARMAB307']
${norecord}    xpath://td[@class="dataTables_empty"]
${card_pincode}    css:input[id="billing-zip"]
${successfull_payment_alert}    css:div[class="alert alert-success alert-dismissible"] h4 i
${My_appointment_button}    css:i[class='fas fa-hospital-alt']
${list_of_history}    DataTables_Table_0_wrapper
${timeout}=    10s
${next_page_button}    xpath:(//a[@class='paginate_button '])[1]
${The_next_page_button}    xpath://a[text()='3']
${Add_appointment}    css:a[class='btn btn-primary btn-sm']
${Date}    id:dates
${Speacialist}    id:specialist
${Doctor}    id:doctor
${Shift_feild}    xpath:(//select[@class='form-control select2'])[1]
${Slot_feild}    id:shift_id
${appointment_prioirity_feild}    name:priority
${message_feild}    name:message
${live_consulting}    id:live_consult
${alternate_adress}    css:textarea[id='custom_fields[appointment][4]']
${Available_slots}    id:slot_0
${save_btn}    css:button[class='btn btn-info pull-right']
${invalid_assert_slot}    id:slot_1
${Empty_alert}    div[class='toast toast-error']
${sorting_status}    xpath://th[@class='sorting' and text()='Status']
${pay}    xpath:(//a[@class='btn btn-info btn-xs']/i)[1]
${pay_with_card}    css:button[class='stripe-button-el']
${test_mode}    css:a[class='testMode']  
${mail_feild}    xpath://input[@placeholder='Email']
${card_number}    xpath://input[@placeholder='Card number']
${month_feild}    xpath://input[@placeholder='MM / YY']
${Ccv_feild}    xpath://input[@placeholder='CVC']
${zip_Code_field}    xpath://div[@class='zipCodeInput input bottom']
${pay_button}    xpath://span[@class='iconTick']
#${pay_button}    css:span[class='iconTick']
${mail_iframe}    xpath=//iframe[contains(@src, 'stripe.com')]
${Cancel_appointment_button}    css:i[class='fa fa-trash']
${assert_in_empty_add_appointment}    xpath://div[@class='toast toast-error']
${Search_feild_in_history}    xpath://div[@class='dataTables_filter']/label/input

*** Keywords ***
Sucessfull search by bill number
    Click Link    ${pharmacy_option}
    Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
    Input Text    ${pharmacy_bill_search_field}    PHARMAB307

Unsuccessfull search by bill number
    Click Link    ${pharmacy_option}
    Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
    Input Text    ${pharmacy_bill_search_field}    lkjhgfcvb

Verify the successfull search by bill number
    Wait Until Element Is Visible    ${pharmacy_bill_record_assert}
    Should Not Contain    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0

Verify the unsuccessfull search by bill number
    Wait Until Element Is Visible    ${pharmacy_bill_record_assert} 
    Element Text Should Be    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0 (filtered from 10 total records)

Successfull view of the bill details
    Wait Until Element Is Enabled    ${pharmacy_view_details}
    Click Link    ${pharmacy_view_details}

Verify the successfull view of the bill details
    Wait Until Element Is Visible    ${view_detail_assert}
    Element Text Should Be    ${view_detail_assert}    Bill No : PHARMAB307

Successfull payment for the bill
    Click Button    ${pay_button}
    Click Button    ${add_pay_button}
    Click Button    ${paywithcard_button}
    Wait Until Element Is Enabled    ${payment_email_field}
    Input Text    ${payment_email_field}    olivier@gmail.com
    Input Text    ${payment_cardnumber_field}    6555900000604105
    Input Text    ${card_expiry_date_field}    08/30
    Input Text    ${card_cvv_field}    345
    Input Text    ${card_pincode}    345678
    Click Button    ${final_pay_button}

Verify the successfull payment for the bill
    Wait Until Element Is Visible    ${successfull_payment_alert}
    Should Contain    ${successfull_payment_alert}     Success 
    
click the my appointment button
    Wait Until Element Is Visible    ${My_appointment_button}
    Click Element    ${My_appointment_button}

Collect and count list of history
    ${table_xpath}=    Set Variable    //div[@id='DataTables_Table_0_wrapper']//table
    ${table_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${table_xpath}    timeout=${timeout}
    Run Keyword If    not ${table_visible}    Fail    Element '${table_xpath}' not visible after ${timeout}
    ${rows}=    Get WebElements    ${table_xpath}//tbody//tr
    ${table_data}=    Create List
    FOR    ${row}    IN    @{rows}
        ${cols}=    Get WebElements    ${row}//td
        ${row_data}=    Create List
        FOR    ${col}    IN    @{cols}
            ${cell_text}=    Get Text    ${col}
            Append To List    ${row_data}    ${cell_text}
        END
        Append To List    ${table_data}    ${row_data}
    END
    FOR    ${row}    IN    @{table_data}
        Log    ${row}
    END
    ${row_count}=    Get Length    ${table_data}
    Log    Number of rows: ${row_count}    console=True

Next page button
    Click Element    ${next_page_button}

The next page button
    Click Element    ${The_next_page_button}

Fill the user apointment form
    [Arguments]    ${Date_data}    
    Click Element    ${Add_appointment}
    Input Text    ${Date}    ${Date_data}   
    Select From List By Value    ${Speacialist}    2
    Select From List By Value    ${Doctor}    12
    Select From List By Value    ${Shift_feild}    1
    Select From List By Value    ${Slot_feild}    39
    
Fill the user apointment remaining form
    [Arguments]   ${Message_data}     ${adress}
    Select From List By Index    ${appointment_prioirity_feild}    2
    Input Text   ${message_feild}     ${Message_data}
    Select From List By Label  ${live_consulting}   Yes  
    Input Text    ${alternate_adress}    ${adress}
    
   
alert accpet
    Handle Alert    ACCEPT

save button
    Click Button    ${save_btn} 

choose valid slot
    Click Element    ${Available_slots}

choose invalid slot
    Click Element    ${invalid_assert_slot} 

assert the empty feild should give error message
    Alert Should Be Present    ${Empty_alert} 

click status
    Click Element    ${sorting_status}

click pay button
    Wait Until Element Is Visible    ${pay}
    Click Element    ${pay}  

click pay with card
    Click Button    ${pay_with_card}

click test mode
    Click Element  ${test_mode}

Get Card Number
    [Documentation]    Extract the card number from the nested span elements
    ${card_number_elements}    Get WebElements    //span[@class='CardNumber']/span
    ${card_number}    Create List
    FOR    ${element}    IN    @{card_number_elements}
        ${text}    Get Text    ${element}
        Append To List    ${card_number}    ${text}
    ${full_card_number}    Evaluate    ''.join(${card_number})
    RETURN    ${full_card_number}
    END
 
Fill payment form
    [Arguments]    ${mail}    ${card_num}    ${expDate}    ${ccv}    ${zip_code}
    Select Frame    ${mail_iframe}
    Wait Until Element Is Visible    ${mail_feild}    20s
    Input Text    ${mail_feild}    ${mail}
    Wait Until Element Is Visible    ${card_number}    20s
    Input Text    ${card_number}    ${card_num}
    Wait Until Element Is Visible    ${month_feild}    20s
    Input Text    ${month_feild}    ${expDate}
    Wait Until Element Is Visible    ${Ccv_feild}    20s
    Input Text    ${Ccv_feild}    ${ccv}
    Wait Until Element Is Visible    ${zip_Code_field}    20s
    Input Text    ${zip_Code_field}    ${zip_code}
    Wait Until Element Is Visible    ${pay_button}    20s
    Click Element    ${pay_button}
    Unselect Frame

assert the payment page
    Select Frame    ${mail_iframe}
    Wait Until Element Is Visible    ${mail_feild}    20s

cancel appointment button
    Click Element    ${Cancel_appointment_button}
    
Add appointment button in User
    Click Element    ${Add_appointment}


assert the it shows the empty error message
    Element Should Be Visible    ${assert_in_empty_add_appointment}
    
Enter the value into search
    Wait Until Element Is Visible    ${Search_feild_in_history}
    Input Text    ${Search_feild_in_history}    Pending

Enter the aproved value into search
    Wait Until Element Is Visible    ${Search_feild_in_history}
    Input Text    ${Search_feild_in_history}    APPNO5717

