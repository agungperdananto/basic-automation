*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://github.com/login
${BROWSER}        safari  # Ganti dengan browser yang Anda gunakan

*** Test Cases ***
Login to GitHub
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text      id=login_field    Your_GitHub_Username
    Input Password  id=password    Your_GitHub_Password
    Click Button    Sign in
    Capture Page Screenshot
    [Documentation]    Capture a screenshot for reference
    [Tags]    Login

*** Keywords ***
Input Password
    [Arguments]    ${locator}    ${password}
    Input Password    ${locator}    ${password}
