*** Settings ***

Documentation           This is some basic info about the whole test suite.
Resource                ../Resources/carrental1_createUser.robot
Library                 SeleniumLibrary
Suite Setup              Begin Web Test
Suite Teardown           End Web Test

*** Variables ***

${BROWSER}              chrome
${URL}                  http://rental1.infotiv.net/
${URL2}                 http://rental1.infotiv.net/webpage/html/gui/userRegistration.php


*** Test Cases ***

User can access website
    [Documentation]             Create User: Verify correct webpage is loaded
    [Tags]                      Test1_webpage

    Go to Web Page


Navigate to Create User Page
    [Documentation]             Create User: Test that the user can access "create user" page
    [Tags]                      Navigate_To_Create_User_Page

    Go to Web Page
    Create User Page
    Verify Page UserRegistration Loaded

Create User
    [Documentation]             Create User: The user can create a login on the website.
    [Tags]                      Create_User

    go to          ${URL2}
    Verify Page UserRegistration Loaded

    Input firstname         Adam
    Input lastname          Ballard
    Input phonenumber       0704323212
    input email             adam8.ballard@iths.se
    input comfirmemail      adam8.ballard@iths.se
    input password          gulsnö
    input confirmpassword   gulsnö
    Click Create and Verify











