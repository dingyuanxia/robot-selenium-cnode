*** Settings ***
Documentation     A test suite containing tests related to invalid register.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Register Page
Suite Teardown    Close Browser
Test Setup        Go To Register Page
Test Template     Register With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD            REPASSWORD             EMAIL
Invalid Username                 invalid          ${VALID PASSWORD}   ${VALID REPASSWORD}    ${VALID EMAIL}
Invalid Password And Repassword  ${VALID USER}    invalid             whatever               ${VALID EMAIL}
Invalid Email                    ${VALID USER}    ${VALID PASSWORD}   ${VALID REPASSWORD}    invalid
Empty Username                   ${EMPTY}         ${VALID PASSWORD}   ${VALID REPASSWORD}    ${VALID EMAIL}
Empty Email                      ${VALID USER}    ${VALID PASSWORD}   ${VALID REPASSWORD}    ${EMPTY}
Empty Password                   ${VALID USER}    ${EMPTY}            ${VALID REPASSWORD}    ${VALID EMAIL}
Empty Repassword                 ${VALID USER}    ${VALID PASSWORD}   ${EMPTY}               ${VALID EMAIL}
Empty Password And Repassword    ${VALID USER}    ${EMPTY}            ${EMPTY}               ${VALID EMAIL}
Empty Username And Password      ${EMPTY}         ${EMPTY}            ${VALID REPASSWORD}    ${VALID EMAIL}


*** Keywords ***
Register With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${repassword}    ${email}
    Input Username    ${username}
    Input Password    ${password}
    Input Repassword   ${repassword}
    Input Email       ${email}
    Submit Credentials
    Register Should Have Failed

Register Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    CNode：Node.js专业中文社区
