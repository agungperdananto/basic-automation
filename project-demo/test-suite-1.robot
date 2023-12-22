*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     headlesschrome
${HOST}    https://practice.expandtesting.com

${USERNAME}    practice
${PASS-1}    SuperSecretPassword!    # correct password
${PASS-2}    aaa123    # wrong password

*** Test Cases ***

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    Click Element     xpath://a[@href='/login']
    Page Should Contain Element   xpath://input[@name='username']
    input text        name:username       ${USERNAME}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Close Browser 

# logout
testcase-3
    Login Success
    Click Element     xpath://a[@href='/logout']
    Page Should Contain Element    xpath://a[@href='/login']
    Close Browser 

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Click Element     xpath://a[@href='/login']
    Page Should Contain Element   xpath://input[@name='username']
    input text        name:username       ${USERNAME}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']
