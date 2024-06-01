*** Settings ***
Documentation    To validate Invalid birth record
Library        SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/DoctorResources.robot
Library    DataDriver    file=../TestData/InvalidBirthRateFrom.xlsx   sheet_name=InvalidBirthRecord
Test Template   validate add birth record

*** Variables ***
${Cname} 
${weight}	    
${birthDate}	    
${Contact}	   
${Address}   	
${CaseId}	  
${FathersName}	   
${birthReports}
*** Test Cases ***
Login test template    ${Cname}    ${weight}	    ${birthDate}	    ${Contact}	    ${Address}   	${CaseId}	  ${FathersName}	   ${birthReports}


*** Keywords ***
validate add birth record
    [Arguments]    ${Cname}    ${weight}	    ${birthDate}	    ${Contact}	    ${Address}   	${CaseId}	  ${FathersName}	   ${birthReports}
    click the log in button
    click the admin login
    Switch Window     new
    click the doctor button
    click the sign In button
    click birth record and death record
    click birth record
    click add birth record
    fill the birth record form     ${Cname}    ${weight}	    ${birthDate}	    ${Contact}	    ${Address}   	${CaseId}	  ${FathersName}	   ${birthReports}








