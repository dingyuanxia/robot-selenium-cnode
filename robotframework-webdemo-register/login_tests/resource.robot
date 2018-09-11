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
${VALID REPASSWORD}  123456
${VALID EMAIL}       yyy@163.com
${REGISTER URL}      http://${SERVER}/signup
#${WELCOME URL}    http://${SERVER}/welcome.html
${INDEX PAGE}     http://${SERVER}/signup
${ERROR URL}      http://${SERVER}/signup

*** Keywords ***
Open Browser To Register Page
    Open Browser    ${REGISTER URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    #Click Element    link:登录
    Register Page Should Be Open

Register Page Should Be Open
    Title Should Be    CNode：Node.js专业中文社区

Go To Register Page
    Go To    ${REGISTER URL}
    Register Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text     id:loginname         ${username}

Input Password
    [Arguments]    ${password}
    Input Text     id:pass         ${password}

Input Repassword
    [Arguments]     ${repassword}
    Input Text      id:re_pass      ${repassword}

Input email
    [Arguments]     ${email}
    Input Text      id:email      ${email}


Submit Credentials
    Click Element    css:.span-primary

Welcome Page Should Be Open
    Location Should Be    ${INDEX PAGE}
    Title Should Be    CNode：Node.js专业中文社区
