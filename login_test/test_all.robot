*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:7272/Lab12/Registration.html
${BROWSER}    Firefox

*** Test Cases ***
# ทดสอบการเปิดหน้า Event Registration Page
Open Event Registration Page
    [Documentation]    เปิดหน้า Event Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Event Registration
    [Teardown]    Close Browser

# ทดสอบการลงทะเบียนสำเร็จ
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
    
    Wait For Condition    return document.readyState == "complete"
    Wait Until Page Contains    Thank you for participating in our event
    
    [Teardown]    Close Browser

# ทดสอบการลงทะเบียนสำเร็จโดยไม่กรอก Organization
Register Success No Organization Info
    [Documentation]    ทดสอบการลงทะเบียนสำเร็จโดยไม่กรอกข้อมูล Organization
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    Input Text    id=lastname    Sodsai
    Input Text    id=email    somsri@kkumail.com
    Input Text    id=phone    081-001-1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Wait Until Page Contains    Thank you for participating in our event
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่ไม่ได้กรอก First Name
Empty First Name
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง First Name และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email    somsri@kkumail.com
    Input Text    id=phone    081-001-1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your first name!!
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่ไม่ได้กรอก Last Name
Empty Last Name
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง Last Name และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    Input Text    id=organization    CS KKU
    Input Text    id=email    somsri@kkumail.com
    Input Text    id=phone    081-001-1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your last name!!
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่ไม่ได้กรอก First Name และ Last Name
Empty First Name and Last Name
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง First Name และ Last Name และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=organization    CS KKU
    Input Text    id=email    somsri@kkumail.com
    Input Text    id=phone    081-001-1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your name!!
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่ไม่ได้กรอก Email
Empty Email
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง Email และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=phone    081-001-1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your email!!
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่ไม่ได้กรอก Phone Number
Empty Phone Number
    [Documentation]    ทดสอบกรณีที่ไม่ได้กรอกข้อมูลในช่อง Phone No. และตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email    somsri@kkumail.com
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter your phone number!!
    
    [Teardown]    Close Browser

# ทดสอบกรณีที่กรอกหมายเลขโทรศัพท์ไม่ถูกต้อง
Invalid Phone Number
    [Documentation]    ทดสอบกรณีที่กรอกข้อมูลเบอร์โทรศัพท์ไม่ถูกต้องและตรวจสอบข้อความเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    Input Text    id=firstname    Somsri
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email    somsri@kkumail.com
    Input Text    id=phone    1234
    Click Button    id=registerButton
    
    Wait For Condition    return document.readyState == "complete"
    Page Should Contain    Event Registration
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678
    
    [Teardown]    Close Browser
