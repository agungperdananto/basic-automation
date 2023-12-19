*** Settings ***
Library           SeleniumLibrary    
Library    XML

*** variables ***
${BROWSER}     headlesschrome
${HOST}    https://myanimelist.net

${USERNAME}    fuad-burner-acc
${PASS}    .Y@@-&L/6ppEgz?    # correct password
${WRONG_PASS}    test123    # wrong password

${ANIME_LINK}    https://myanimelist.net/anime.php?id=21273

*** Test Cases ***
# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER} 
    Click Element     xpath://a[@id='malLogin']
    Page Should Contain Element   xpath://input[@name='user_name']
    input text        name:user_name    ${USERNAME}
    input text        name:password    ${WRONG_PASS}
    Click Element     xpath://button[@type='submit']
    Page Should Not Contain Element     xpath://a[@class='header-profile-link']
    Close Browser    

# logout
testcase-3
    Login Success
    Click Element     xpath://*[@id="header-menu"]/div[8]/a
    Click Element     xpath://*[@id="header-menu"]/div[8]/div/ul/li[11]/form/a
    Page Should Contain Element    xpath://a[@id='malLogin']
    Close Browser 

# add new anime to list
testcase-4
    Login Success
    Go To    ${ANIME_LINK}
    Click Element    xpath://a[@id="myinfo_status"]
    Page Should Contain Element    xpath://select[@id="myinfo_status"]
    Close Browser 

# edit anime score
testcase-5
    Login Success
    Go To    ${HOST}/animelist/${USERNAME}
    Click Element    xpath://*[@id="list-container"]/div[4]/div/table/tbody[2]/tr[1]/td[4]/div[2]/span[1]/a
    Sleep    3
    Set Window Size    1400    1000
    Select Frame    xpath://*[@id="fancybox-frame"]
    Wait Until Keyword Succeeds    3 times    5 second    Click Element    xpath://*[@id="add_anime_score"]
    Click Element    xpath://*[@id="add_anime_score"]
    Select From List By Value    name:add_anime[score]   10
    Input Text    xpath://*[@id="add_anime_num_watched_episodes"]    12
    Click Element    xpath://*[@id="dialog"]/tbody/tr/td/div[3]/input
    Sleep    3
    Element Text Should Be    xpath:/html/body/div[1]/strong    Successfully updated entry.
    Close Browser 

# delete anime from list
testcase-6
    Login Success
    Set Window Size    1400    1000
    Go To    ${HOST}/animelist/${USERNAME}
    Click Element    xpath://*[@id="list-container"]/div[4]/div/table/tbody[2]/tr[1]/td[4]/div[2]/span[1]/a
    Sleep    3
    Select Frame    xpath://*[@id="fancybox-frame"]
    Scroll Element Into View    xpath:/html/body/table/tbody/tr/td/div[3]/form/input
    Click Element    xpath:/html/body/table/tbody/tr/td/div[3]/form/input
    Alert Should Be Present
    Sleep    3
    Element Text Should Be    xpath:/html/body/div[1]/strong    Successfully deleted entry.
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
