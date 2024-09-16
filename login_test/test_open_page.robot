*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:7272/Lab12/Registration.html
${BROWSER}    firefox

*** Test Cases ***
Open Event Registration Page
    [Documentation]    Open Event Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Event Registration
    [Teardown]    Close Browser
