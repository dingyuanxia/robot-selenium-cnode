*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               测试登录
# 注释
Library           Selenium2Library

*** Keywords ***
用户登录
    Open Browser    url=http://118.31.19.120:3000   browser=chrome
    Click Element	link:登录
    Input Text      id:name                         testuser1
    Input Text      id:pass                         123456



*** Test Cases *** 
# 测试登录
open login
    用户登录



#测试发帖
发帖
    用户登录
    
