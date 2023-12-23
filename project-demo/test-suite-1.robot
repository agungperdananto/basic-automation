*** Settings ***
Library           SeleniumLibrary    
Library    XML

*** variables ***
${BROWSER}     headlesschrome
${HOST}    https://mylb.unpam.ac.id/login

${USERNAME}    201011402254
${PASS}    unpam#402254   # correct password
${WRONG_PASS}    test123    # wrong password

${MENU_LINK}    https://mylb.unpam.ac.id/biodata/

*** Test Cases ***
# login
# positive test

# login success
testcase-2
    Open Browser    ${HOST}    ${BROWSER} 
    Click Element     xpath://a[@id='malLogin']
    Page Should Contain Element   xpath://input[@name='user_name']
    input text        xpath://*[@aria-label="NIM / Username *"]    ${USERNAME}
    input text        xpath://*[@aria-label="Password *"]   ${PASS}
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element     xpath://*[@id="q-app"]/div/div[2]/main/div/div[2]
    Close Browser    

*** Keywords ***

Scroll Down Until End
    ${previous_height}=    Execute Javascript    return document.body.scrollHeight;
    FOR  ${i}    IN RANGE    10
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Sleep    1s
        ${current_height}=    Execute Javascript    return document.body.scrollHeight;
        Exit For Loop If    '${current_height}' == '${previous_height}'
        ${previous_height}=    Set Variable    ${current_height}
        Sleep    2s
    END

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Click Element     xpath://a[@id='malLogin']
    Wait Until Location Is    ${HOST}/login.php?from=%2F&
    Page Should Contain Element   xpath://input[@name='user_name']
    input text        name:user_name    ${USERNAME}
    input text        name:password    ${PASS}
    Click Element     xpath://input[@class='inputButton btn-form-submit btn-recaptcha-submit']
    Wait Until Element Contains    xpath://a[@class='header-profile-link']    fuad-burner-acc
    Page Should Contain Element     xpath://a[@class='header-profile-link']