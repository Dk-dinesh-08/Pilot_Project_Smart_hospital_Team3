*** Settings ***
Documentation    All the page objects and keywords of Admin Page
Library    SeleniumLibrary  
Library    Collections

*** Variables ***
${appoinment_link}    //ul[@class="sidebar-menu verttop"]//li[3]/a
${doctor_wise_appionment_btn}    (//div[@class="box-tools pull-right"])//a
${queue_button}      (//div[@class="box-tools pull-right"])//a[3]
${login_password}    css:input[id='loginpassword']
${login_btn}    xpath://button[text()='Log in']
${close_btn}    xpath://div[@id="logInModal"]/div/div/div[3]/button[1]
${date_field}    //input[@name="date"]
${search_button}    //button[@class="btn btn-primary btn-sm pull-right"]
${shift_field}    select[id="global_shift"]
${slot_field}    select[id=slot]
${date_field}    input[id=datetimepicker]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]
${doctor_wise_appionment_btn}    //a[@href="https://demo.smart-hospital.in/admin/onlineappointment/patientschedule"]
${doctor_field}   //span[@class='select2-selection__rendered']
${date_field}    //input[@name="date"]
${search_button}    //button[@class="btn btn-primary btn-sm pull-right"]
${shift_field}    select[id="global_shift"]
${slot_locator}    //select[@id="slot"]
${date_field}    input[id=datetimepicker]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]
${doctor_wise_search_btn}    (//a[@class="btn btn-primary btn-sm"])[1]
${login_password}    css:input[id='loginpassword']
${login_btn}    xpath://button[text()='Log in']
${close_btn}    xpath://div[@id="logInModal"]/div/div/div[3]/button[1]
${doctor_field}    //span[@class="select2-selection__arrow"]
${date_fld}    //input[@name="date"]
${search_button}    //button[@class="btn btn-primary btn-sm pull-right"]
${verify_text}    Records: 1 to 1 of 1
${search_result}     //div[@class="dataTables_info"]  

#for form Queue search
${select_doctor_field}    (//select[@class="form-control select2"])[1]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]
${queue_doctor_field}    select[id=doctor]    #//select[@name="doctor"]
${select_shift_field}    (//select[@class="form-control select2"])[2]
${slot_field}    (//div[@class="col-md-3"]//select[@class="form-control"])[1]
${queue_search_button}    //button[@class="btn btn-primary btn-sm"]

#for valid queue search results
${queue_result}    //td[@class="text text-center text-danger"]
${queue_text}    No Record Found

#for overall patient search
${patient_search}    //input[@class="form-control search-form search-form3"]
${patient_search_button}    (//button[@class="btn btn-flat"]/i)[1]
${table_value}    (//a[@class="btn btn-default btn-xs"])[1]

#add stock item
${inventory}    //i[@class="fas fa-luggage-cart"]//parent::a
${item_stockList}    //div[@class="box-header ptbnull"]//h3
${add_item_stock}    //a[@class="btn btn-primary btn-sm additemstock"]
${item_category}    (//div[@class="form-group"])[1]//select[@name="item_category_id"]
${item}    (//div[@class="form-group"])[2]//select[@name="item_id"]
${store}    (//div[@class="form-group"])[4]//select[@name="store_id"]
${supplier}    (//div[@class="form-group"])[3]//select[@name="supplier_id"]
${quantity}    (//input[@class="form-control miplusinput"])[1]
${puchase_price}    (//input[@name="purchase_price"])[1]
${date}    //input[@value="05/26/2024"]
${save_btn}    //button[@id="form1btn"]
${date_in_appointment}    xpath://input[@class='form-control date']
${date_value}    05/16/2024
${invalid_search_loc}    (//span[@class="text-danger"])[1]    
${invalid_search_text}    The Doctor field is required.



*** Keywords ***
Fill the appointment wise search form
    [Arguments]    ${doctor_name}   
    Click Element    ${doctor_field}
    ${list_of_elements}=    Get WebElements    //span[@class="select2-results"]//li
    ${options_texts}=    Create List
    FOR  ${element}    IN    @{list_of_elements}
         ${text}=    Get Text    ${element}
         Append To List    ${options_texts}    ${text}
         Run Keyword If    '${text}' == '${doctor_name}'      Click Element    ${element}
         
    END
Enter the date feild
    Click Element  ${date_in_appointment}      
    Input Text    ${date_in_appointment}    ${date_value}
       

Click the search button
    Click Button    ${search_button}

Click the Queue button
    Click Link    ${queue_button}


Click the Appoinment wise search button
    Click Link   ${doctor_wise_search_btn}

Verify patient queue page opens
    Element Text Should Not Be    .box-title.titlefix    Patient Queue

Verify doctor wise appoinment search for invalid doctor name
   Element Text Should Be   ${invalid_search_loc}    ${invalid_search_text}


Click Appoinment link
    Click Link    ${appoinment_link}



Fill the Queue form
    [Arguments]     ${doctor_name}  ${shift}  ${date}    ${slot}    
    Click Element    ${select_doctor_field}
    
    Select From List By Value   ${select_doctor_field}     ${doctor_name}
    Click Element    ${select_shift_field}

    Select From List By Value   ${select_shift_field}    ${shift}
    Click Element    ${date_field}
    
    Input Text   ${date_field}     ${date}
    Click Element    ${slot_locator}
    # Input Text   ${slot_field}     ${date}
    Select From List By Value   ${slot_locator}            ${slot}
   

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


Click the inventory button
    Scroll Element Into View    ${inventory}
    Click Link    ${inventory}

Verify item stock list page opened
    Element Text Should Be    ${item_stockList}     Item Stock List



Click add stock item
    Click Link    ${add_item_stock}


Fill add item stock form
    Select From List By Label    ${item_category}    Medical Equipment
    Select From List By Label    ${supplier}    Quick Service
    Input Text    ${quantity}    10   
    Select From List By Label    ${item}    Syringe Pump
    Select From List By Label    ${store}    Vinay Pharmacy
    Input Text    ${quantity}    3
    Input Text    ${puchase_price}    text=50

Click the save button
    Click Button    ${save_btn}

Verify item added to stock
    Element Text Should Be    //td/a    Syringe Pump

Verify doctor wise appoinment search
    Wait Until Page Contains Element    ${search_result}
    Element Text Should Be   ${search_result}    ${verify_text}