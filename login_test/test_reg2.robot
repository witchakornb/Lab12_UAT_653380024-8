*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:7272/Lab12/Registration.html
${BROWSER}    Firefox

*** Test Cases ***
Register Success No Organization Info
    [Documentation]    ทดสอบการลงทะเบียนสำเร็จในหน้า Event Registration โดยไม่กรอกข้อมูล Organization
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # Step 1: กรอกข้อมูลที่ช่อง First Name
    Input Text    id=firstname    Somsri
    
    # Step 2: กรอกข้อมูลที่ช่อง Last Name
    Input Text    id=lastname    Sodsai
    
    # Step 3: กรอกข้อมูลที่ช่อง Email
    Input Text    id=email    somsri@kkumail.com
    
    # Step 4: กรอกข้อมูลที่ช่อง Phone No.
    Input Text    id=phone    081-001-1234
    
    # Step 5: กดปุ่ม Register
    Click Button    id=registerButton
    
    # Wait until the page has fully loaded
    Wait For Condition    return document.readyState == "complete"
    
    # Verify the success message on the page
    Wait Until Page Contains    Thank you for participating in our event
    
    [Teardown]    Close Browser
