*** Settings ***

Documentation           This is some basic info about the whole test suite.
Resource                ../Resources/VG.robot
Library                 SeleniumLibrary
Suite Setup              Begin Web Test
Suite Teardown           End Web Test

*** Variables ***

${BROWSER}              chrome
${URL}                  http://rental1.infotiv.net/
${URL2}                 http://rental1.infotiv.net/webpage/html/gui/userRegistration.php
${email}                adam.ballard@iths.se
${password}             gulsnö
${cardnumber}           1234567891234567
${fullName}             Adam Ballard
@{cvc}                  123



*** Test Cases ***

Login and Book a Car
    [Documentation]             Login and Book A Car: The user can login to an existing account and book a car
    [Tags]                      Login & Book

    Given user has access to the Infotiv Car Rental page and is logged in with email "${email}" and password "${password}"
    When the user confirmes an allowed date in the date-selection
    And picks an avaliable car to book
    And inputs the cardnumber "${cardNumber}", the full name "${fullName}" and uses the cvc "${cvc}" and confirms the booking
    Then car should be booked
