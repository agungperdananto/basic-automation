*** Settings ***
Library     SeleniumLibrary
Library     XML


*** Variables ***
${BROWSER}      headlesschrome
${HOST}         https://chemons.site/login


*** Test Cases ***
# login

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element    xpath://input[@name='username']
    Input Text    type:email    dosen1@example.com
    Input Text    type:password    Test123$
    Click Element    type:submit
    Page Should Not Contain Element    xpath://a[@href='/homepage']

# Login Failed
#    Open Browser    ${HOST}    ${BROWSER}
#    Page Should Contain Element    xpath://input[@name='username']
#    Input Text    name:username    student
#    Input Text    name:password    Password1234
#    Click Element    xpath://button[@id='submit']
#    ${error_message}=    Get Text    css:div#error.show
#    Log    Error Message: ${error_message}

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
