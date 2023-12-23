*** Settings ***
Library           SeleniumLibrary

*** variables ***


*** Test Cases ***

testcase-login-1
    Open Browser    https://dwiputraespyb.000webhostapp.com/Projek_Akhir/login.php    chrome
    # Click Element     xpath://a[@href='/login']
    #Page Should Contain Element   xpath://input[@name='pengguna']
    input text        name:pengguna       admin
    Input Text    name:katasandi    admin
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element    xpath://span[@id='welcome']
    Close Browser
