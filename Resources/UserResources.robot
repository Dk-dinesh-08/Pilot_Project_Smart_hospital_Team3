*** Settings ***
Documentation    A User page resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${pharmacy_bill_search}    css:div[id="DataTables_Table_0_filter"] input
${show_field}    css:i[class="fa fa-reorder"]
${pay_button}    css:button[class="btn btn-primary btn-xs"]
${view_payment_option}    css:a[class="btn btn-default view_payment btn-xs"]
${payment_amount_field}    css:input[id="amount_total_paid"]
${pay_button}    css:button[id="pay_button"]
${paywithcard_button}    css:button[class="stripe-button-el"]
${payment_email_field}    css:input[id="email"]
${payment_cardnumber_field}    css:input[id="card_number"]
${card_expiry_date_field}    css:input[id="cc-exp"]
${card_cvv_field}    css:input[id="cc-csc"]
${final_pay_button}    css:button[id="submitButton"]

*** Keywords ***
#Sucessfull search by bill number
    