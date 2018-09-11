*** Settings ***
Documentation     A test suite with a single test for register.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Register Page
    Input Username    testuser1
    Input Password    123456
    Input Repassword  123456
    Input email       yyy@163.com
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
