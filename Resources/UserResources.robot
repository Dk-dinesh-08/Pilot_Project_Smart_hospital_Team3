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
${Slot_feild}    //select[@id="shift_id"]
${appointment_prioirity_feild}    name:priority
${message_feild}    name:message
${live_consulting}    id:live_consult
${alternate_adress}    css:textarea[id='custom_fields[appointment][4]']
${Available_slots}    id:slot_0
${save_btn}    css:button[class='btn btn-info pull-right']
${invalid_assert_slot}    id:slot_0
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
${status_button}    //th[contains(@aria-controls,'DataTables_Table_0') and text()='Status']
${email_in_Payment}    //div[@class='emailInput input']/input
${Card_number_payment}    ull sadf
${month/yr}    //input[@id='cc-exp']
${payment_form_pay_button}    //span[@class='iconTick']

*** Keywords ***
Sucessfull search by bill number
    TRY
        Click Link    ${pharmacy_option}
        Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
        Input Text    ${pharmacy_bill_search_field}    PHARMAB307
    EXCEPT
        Log To Console    Sucessfull search by bill number is failed
    END

Unsuccessfull search by bill number
    TRY
        Click Link    ${pharmacy_option}
        Wait Until Element Is Enabled    ${pharmacy_bill_search_field}
        Input Text    ${pharmacy_bill_search_field}    lkjhgfcvb
    EXCEPT
        Log To Console    Unsuccessfull search by bill number is failed
    END

Verify the successfull search by bill number
    TRY
        Wait Until Element Is Visible    ${pharmacy_bill_record_assert}
        Should Not Contain    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0
    EXCEPT
        Log To Console    Successfull search by bill number verification is failed
    END

Verify the unsuccessfull search by bill number
    TRY
        Wait Until Element Is Visible    ${pharmacy_bill_record_assert} 
        Element Text Should Be    ${pharmacy_bill_record_assert}    Records: 0 to 0 of 0 (filtered from 14 total records)
    EXCEPT
        Log To Console    Unsuccessfull search by bill number verification is failed
    END

Successfull view of the bill details
    TRY
        Wait Until Element Is Enabled    ${pharmacy_view_details}
        Click Link    ${pharmacy_view_details}
    EXCEPT
        Log To Console    Successfull view of the bill details is failed
    END

Verify the successfull view of the bill details
    TRY
        Wait Until Element Is Visible    ${view_detail_assert}
        Element Text Should Be    ${view_detail_assert}    Bill No : PHARMAB307
    EXCEPT
        Log To Console   Successfull view of the bill details verification is failed
    END

verify the unsuccessfull view of the bill details
    TRY
        Wait Until Element Is Visible    ${view_detail_assert}
        Element Text Should Not Be    ${view_detail_assert}    Bill No : PHARMAB307
    EXCEPT
        Log To Console    Unsuccessfull view of the bill details verification is failed
    END

Successfull payment for the bill
    TRY
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
    EXCEPT
        Log To Console    Successfull payment for the bill is failed
    END

Verify the successfull payment for the bill
    TRY
        Wait Until Element Is Visible    ${successfull_payment_alert}
        Should Contain    ${successfull_payment_alert}     Success
    EXCEPT
        Log To Console    Successfull payment for the bill verification is failed
    END 
    
click the my appointment button
    Wait Until Element Is Visible    ${My_appointment_button}
    Click Element    ${My_appointment_button}

Collect and count list of history
    TRY
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
    EXCEPT
        Log To Console    Collect and count list of history is failed
    END

Next page button
    TRY
        Click Element    ${next_page_button}
    EXCEPT
        Log To Console    Next page button is failed
    END

The next page button
    TRY
        Click Element    ${The_next_page_button}
    EXCEPT
        Log To Console    The next page button is failed
    END

Fill the user apointment form
    [Arguments]    ${Date_data}    ${slot_feild_data}
    TRY
        Click Element    ${Add_appointment}
        Input Text    ${Date}    ${Date_data}   
        Select From List By Value    ${Speacialist}    2
        Select From List By Value    ${Doctor}    12
        Select From List By Value    ${Shift_feild}    1
        Select From List By Value    ${Slot_feild}   ${slot_feild_data}
    EXCEPT
        Log To Console    User appointment remaing form filling is failed
    END
    
Fill the user apointment remaining form
    [Arguments]   ${Message_data}     ${adress}
    TRY
        Select From List By Index    ${appointment_prioirity_feild}    2
        Input Text   ${message_feild}     ${Message_data}
        Select From List By Label  ${live_consulting}   Yes  
        Input Text    ${alternate_adress}    ${adress}
    EXCEPT
        Log To Console    User appointment remaing form filling is failed
    END
    
   
alert accpet
    TRY
        Handle Alert    ACCEPT
    EXCEPT
        Log To Console    Alert accpet is failed
    END

save button
    TRY
        Click Button    ${save_btn}
    EXCEPT
        Log To Console    Save button is failed
    END 

choose valid slot
    TRY
        Click Element    ${Available_slots}
    EXCEPT
        Log To Console    Choose valid slot is failed
    END

choose invalid slot
    TRY
        Click Element    ${invalid_assert_slot}
    EXCEPT
        Log To Console    Choose invalid slot is failed
    END 

assert the empty feild should give error message
    TRY
        Alert Should Be Present    ${Empty_alert} 
    EXCEPT
        Log To Console    Assert the empty feild should give error message is failed
    END

click status
    TRY
        Click Element    ${sorting_status}
    EXCEPT
        Log To Console    Click status is failed
    END

click pay button
    TRY
        Wait Until Element Is Visible    ${pay}
        Click Element    ${pay}
    EXCEPT
        Log To Console    Click pay button is failed
    END  

click pay with card
    TRY
        Click Button    ${pay_with_card}
    EXCEPT
        Log To Console    Click pay with card is failed
    END

click test mode
    TRY
        Click Element  ${test_mode}
    EXCEPT
        Log To Console    Click test mode is failed
    END

Get Card Number
    [Documentation]    Extract the card number from the nested span elements
    TRY
        ${card_number_elements}    Get WebElements    //span[@class='CardNumber']/span
        ${card_number}    Create List
        FOR    ${element}    IN    @{card_number_elements}
            ${text}    Get Text    ${element}
            Append To List    ${card_number}    ${text}
        ${full_card_number}    Evaluate    ''.join(${card_number})
        RETURN    ${full_card_number}
        END
    EXCEPT
        Log To Console    Getting card number is failed
    END
 
Fill payment form
    [Arguments]    ${mail}    ${card_num}    ${expDate}    ${ccv}    ${zip_code}
    TRY
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
    EXCEPT
        Log To Console    Payment form filling is failed
    END

assert the payment page
    TRY
        Select Frame    ${mail_iframe}
        Wait Until Element Is Visible    ${mail_feild}    20s
    EXCEPT
        Log To Console    Assert the payment page is failed
    END

cancel appointment button
    TRY
        Click Element    ${Cancel_appointment_button}
    EXCEPT
        Log To Console    Cancel appointment button is failed
    END
    
Add appointment button in User
    TRY
        Click Element    ${Add_appointment}
    EXCEPT
        Log To Console    Add appointment button in User is failed
    END


assert the it shows the empty error message
    TRY
        Element Should Be Visible    ${assert_in_empty_add_appointment}
    EXCEPT
        Log To Console    Assert the it shows the empty error message is failed
    END
    
Enter the value into search
    TRY
        Wait Until Element Is Visible    ${Search_feild_in_history}
        Input Text    ${Search_feild_in_history}    Pending
    EXCEPT
        Log To Console    Value into search is failed
    END

Enter the aproved value into search
    TRY
        Wait Until Element Is Visible    ${Search_feild_in_history}
        Input Text    ${Search_feild_in_history}    APPNO5717
    EXCEPT
        Log To Console    Aproved value into search is failed
    END

Enter details of payment form
    TRY 
        Select Frame    xpath://iframe[@name='stripe_checkout_app']
        Input Text    ${email_in_Payment}    Dheemegam0008@gmail.com
        Input Text    ${Card_number_payment}    42424242
        Input Text    ${month/yr}    022026
        Input Text    ${card_cvv_field}    123
        Input Text    ${card_pincode}    636004
        Click Element    ${payment_form_pay_button} 
    EXCEPT
        Log To Console    payement is fail
    END



