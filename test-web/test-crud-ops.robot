*** Settings ***
Library           SeleniumLibrary

*** variables ***


*** Test Cases ***
testcase-login
    Open Browser    https://anakpetani.com/ops/    chrome
    input text        name:username       admin
    Input Text    name:password    bajuri
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element    xpath://span[@id='dashboard']
    Close Browser

testcase-input-user 
    Open Browser    https://anakpetani.com/ops/    chrome
    input text        name:username       admin
    Input Text    name:password    bajuri
    Click Element     xpath://button[@type='submit']
    Click Element     xpath://a[@href='/ops/index.php?page=user']
    Click Element   xpath://a[@href='index.php?page=add-user']
    input text        name:nama       unpam
    input text        name:username       unpam1
    input text        name:email       unpam@mail.com
    input text        name:password       unpam123
    input text        name:telepon       89181787278
    input text        name:alamat       Pamulang
    Select From List by Value    name:level    User
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element    xpath://span[@id='success']
    #Close Browser

testcase-edit-user
    Open Browser    https://anakpetani.com/ops/    chrome
    input text        name:username       admin
    Input Text    name:password    bajuri
    Click Element     xpath://button[@type='submit']
    Click Element     xpath://a[@href='/ops/index.php?page=user']
    Click Element   xpath://a[@id='unpam1']
    input text        name:nama       unpam2
    input text        name:password       unpam1000
    input text        name:telepon       89639566634
    input text        name:alamat       Tanggerang Selatan
    Select From List by Value    name:level    User
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element    xpath://span[@id='edited']
    #Close Browser

testcase-delete-user
    Open Browser    https://anakpetani.com/ops/    chrome
    input text        name:username       admin
    Input Text    name:password    bajuri
    Click Element     xpath://button[@type='submit']
    Click Element     xpath://a[@href='/ops/index.php?page=user']
    Click Element     xpath://a[@id='unpam@mail.com']
    Page Should Contain Element    xpath://span[@id='removed']
    Close Browser
    
    
   
   


