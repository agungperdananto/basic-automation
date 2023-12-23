*** Settings ***
Library     SeleniumLibrary

*** Test Cases *** 
Login to Website
    Open Browser    https://mdafitapriansyah.000webhostapp.com/projek_akhir/    chrome
    Input Text      //input[@name='username']    guest
    Input Password  //input[@name='password']    guest
    Click Button    //button[@type='submit']
    
