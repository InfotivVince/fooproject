*** Settings ***

Documentation           This is some basic info about the whole test suite.
Resource                ../Resources/carrental1_dateSelection.robot
Library                 SeleniumLibrary
Suite Setup              Begin Web Test
Suite Teardown           End Web Test

*** Variables ***

${BROWSER}              chrome
${URL}                  http://rental1.infotiv.net/


*** Test Cases ***

User can accsess car page without any input

    [Documentation]             Date Selection: Test verifies access to car page
    [Tags]                      Car_Page_Access_Test

    Go to Web Page
    Verify Page Loaded
    Click button Continue
    Verify Access To Car Page


User can make own input in date-boxes

    [Documentation]             Date Selection: This test assumes the user follows the rules of booking ( no dates before todays date + no books longer than 1 mnth nor more than 1 month away)
    [Tags]                      Correct_Input_Date_Selection

    Go to Web Page
    Verify Page Loaded
    Click Button DateLeft       0401
    Click Button DateRight      0404
    Click Button Continue
    Verify Access To Car Page


Use can't access car page if dates already passed

    [Documentation]             Date Selection: The user can not book a car using a date in the past.
    [Tags]                      Boundary_Values_Test


    Go to Web Page
    Verify Page Loaded
    Click Button DateLeft       0227
    Click Button DateRight      0228
    Click Button Continue
    Verify Page Loaded

Use can't access car page if the booking are longer than 30 days.

    [Documentation]             Date Selection: The user can not book a car for more than 30 days in one booking.
    [Tags]                      Boundary_Values_Test


    Go to Web Page
    Verify Page Loaded
    Click Button DateLeft       0319
    Click Button DateRight      0420
    Click Button Continue
    Verify Page Loaded

Use can't access car page if the start-date are more than 30 days in the future.

    [Documentation]             Date Selection: The user can not book a car with a start date more than 30 days in the future.
    [Tags]                      Boundary_Values_Test


    Go to Web Page
    Verify Page Loaded
    Click Button DateLeft       0420
    Click Button DateRight      0421
    Click Button Continue
    Verify Page Loaded

