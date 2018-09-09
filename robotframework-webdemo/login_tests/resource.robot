*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         118.31.19.120:3000
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     testuser1
${VALID PASSWORD}    123456
${LOGIN URL}      http://${SERVER}/
#${WELCOME URL}    http://${SERVER}/welcome.html
${INDEX PAGE}     http://${SERVER}/
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Element    link:登录
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    CNode：Node.js专业中文社区

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text     id:name         ${username}

Input Password
    [Arguments]    ${password}
    Input Text     id:pass         ${password}

Submit Credentials
    Click Element    css:.span-primary

Welcome Page Should Be Open
    Location Should Be    ${INDEX PAGE}
    Title Should Be    CNode：Node.js专业中文社区
