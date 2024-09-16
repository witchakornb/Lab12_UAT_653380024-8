*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:7272/Lab12/Registration.html
${BROWSER}    Firefox

*** Test Cases ***
Register Success
    [Documentation]    ทดสอบการลงทะเบียนสำเร็จในหน้า Event Registration
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    
    Input Text    id=lastname    Sodsai
    
    Input Text    id=organization    CS KKU
    
    Input Text    id=email    somsri@kkumail.com
    
    Input Text    id=phone    081-001-1234
    
    Click Button    id=registerButton
    
    # Wait longer to ensure the page has loaded
    Wait For Condition	return document.readyState == "complete"
    Page Should Contain    Thank you for participating in our event
    
    [Teardown]    Close Browser
