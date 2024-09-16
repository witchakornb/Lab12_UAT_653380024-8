*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:7272/Lab12/Registration.html
${BROWSER}    Firefox

*** Test Cases ***
Empty Last Name
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง Last Name และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # Step 1: กรอกข้อมูลที่ช่อง First Name
    Input Text    id=firstname    Somsri
    
    # Step 2: กรอกข้อมูลที่ช่อง Organization
    Input Text    id=organization    CS KKU
    
    # Step 3: กรอกข้อมูลที่ช่อง Email
    Input Text    id=email    somsri@kkumail.com
    
    # Step 4: กรอกข้อมูลที่ช่อง Phone No.
    Input Text    id=phone    081-001-1234
    
    # Step 5: กดปุ่ม Register
    Click Button    id=registerButton
    
    # Wait until the page has fully loaded
    Wait For Condition    return document.readyState == "complete"
    
    # Expected Result: ตรวจสอบว่าหน้าไม่ได้เปลี่ยนไปและแสดงข้อความเตือน
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your last name!!
    
    [Teardown]    Close Browser
