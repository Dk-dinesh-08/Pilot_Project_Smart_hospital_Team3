*** Settings ***
Documentation    To validate the Login form
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/UserResources.robot
Library    DataDriver    file=../TestData/PaymentData.xlsx   sheet_name=valid
Test Template   validate payment method

*** Variables ***
${mail}
${expDate}	
${ccv}	
${card_num}	
${zip_code}

*** Test Cases ***
Payment Test Template    ${mail}  	${expDate}  	${ccv}	  ${card_num}	 ${zip_code}


*** Keywords ***
validate payment method
    [Arguments]     ${mail}  	${expDate}  	${ccv}	  ${card_num}	 ${zip_code}
    click the log in button
    click the sign In button
    click the my appointment button
    click pay button
    click pay with card
    Fill payment form    dinesh@gmail.com 	 4242424242424242  05/24	  123	 636004
    

    





