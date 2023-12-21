*** Settings ***
Library     SeleniumLibrary
Library     XML


*** Variables ***
${BROWSER}      headlesschrome
${HOST}         https://staging.erp.fumui.my.id/login


*** Test Cases ***
# login

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Wait Until Element Is Visible    name:email    timeout=10s
    Input Text    name:email    superadmin@maskit.co.id
    Input Text    name:password    superadmin
    Click Element    xpath://button[@type='submit']    # Assuming your submit button is a <button> element
    Page Should Not Contain Element    xpath://a[@href='/']

Login Failed
    Open Browser    ${HOST}    ${BROWSER}
    Wait Until Element Is Visible    name:email    timeout=10s
    Input Text    name:email    superadmin@maskit.co.id
    Input Text    name:password    passwordsalah
    Click Element    xpath://button[@type='submit']
    Wait Until Element Is Visible    xpath://div[@class='Toastify__toast-body']/div    timeout=10s
    ${error_message}=    Get Text    xpath://div[@class='Toastify__toast-body']/div
    Log    ${error_message}

# Logout Success
#    Open Browser    ${HOST}    ${BROWSER}
#    Page Should Contain Element    xpath://input[@name='username']
#    Input Text    name:username    student
#    Input Text    name:password    Password123
#    Click Element    xpath://button[@id='submit']
#    Page Should Not Contain Element    xpath://a[@href='/logged-in-successfully']
#    Click Element    css:a.wp-block-button__link[href="https://practicetestautomation.com/practice-test-login/"]
#    Page Should Not Contain Element    xpath://a[@href='/practice-test-login']
#    # Add any additional steps or verifications as needed
#    Close Browser
