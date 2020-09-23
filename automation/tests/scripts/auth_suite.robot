*** Settings ***
Library             RequestsLibrary
Library             String
Library             Collections
Library             JSONLibrary
Library             FakerLibrary
Library             DatabaseLibrary
Library             OperatingSystem
Library             SeleniumLibrary
Library             ScreenCapLibrary
Resource                  ../resources/csv.robot
Resource                  ../resources/environment.robot
Resource                  ../resources/sign_in.robot
Suite Setup    Run Keywords  Open Browser  ${F_URL}  ${BROSWER}   AND  Maximize Browser Window
*** Test Case ***
Locked user Login
    [Tags]  Locked
    sign_in.Login  ${LOCK_USER}  ${PASSWORD}

Standard user Login
    [Tags]  Standard
    sign_in.Login  ${USER}  ${PASSWORD}

Problem user Login
    [Tags]  Problem
    sign_in.Login  ${PROBLEM_USER}  ${PASSWORD}

Performance user Login
    [Tags]  Performance
    sign_in.Login  ${PERFORMANCE_USER}  ${PASSWORD}
