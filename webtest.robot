*** Setting ***
Documentation                   This assignment is designed to test Selenium Tool. The motive is to check some functionalities in the website "http://rental4.infotiv.net/".
Library                         SeleniumLibrary
Test Setup                      Begin Web Test
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          http://rental4.infotiv.net/
*** Keywords ***
Begin Web Test
    Open browser                about:blank     ${BROWSER}
    set selenium speed          0.25
Go To Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    Wait until Page Contains    When do you want to make your trip?
Search For Product
    [Arguments]                 ${search_term}  ${search_result}
    Enter Search Term           ${search_term}
    Submit Search
    Verify Search Completed     ${search_result}

Verify Search Completed
    ${search_result}            get text    id = questionText
    SHOULD BE  Equal            "What would you like to drive?"   ${search_result}
    Wait until Page Contains    ${search_result}

Verify Search Completed
    ${search_result}            get text    id = categoryText
    SHOULD BE  Equal            "Welcome"   ${search_result}
    Wait until Page Contains    ${search_result}

End Web Test

    Close ALL Browsers
*** Test Cases ***
User can access website
         [Documentation]                This is a test case part to check a functionality in the website "http://rental4.infotiv.net/". The functionality is to check whether the CONTINUE button is working fine and is displaying the showcase of cars.
         [Tags]                         Test_CONTINUE_Button_Functionality
    Given Begin Web Test
    When Go To Web Page
         Go to                          http://rental4.infotiv.net/webpage/html/gui/index.php
         set selenium speed             0.25
         Wait until Page Contains       When do you want to make your trip?
         set selenium implicit wait     0.25
         click element                  xpath=//*[@id="continue"]
         Wait until Page Contains       What would you like to drive?
         set selenium implicit wait     0.25
         click element                  xpath=//*[@id="backToDateButton"]
   THEN end web test

User can access website
         [Documentation]                This is a test case part to check the navigation flow to book a car.
         [Tags]                         VG_tests
#Feature: Navigation Flow of booking a car
#Background: The user is on the prescribed website "http://rental4.infotiv.net/".
#Scenario
    # Given the user is on the "Infotiv Car Rental" website
    Given Begin Web Test
    #When the user opens the first webpage containing the text "When do you want to make your trip?".
    When Go To Web Page
         Go to                          http://rental4.infotiv.net/webpage/html/gui/index.php
         set selenium speed             0.25
         Wait until Page Contains       When do you want to make your trip?
         set selenium implicit wait     0.25
         click element                  xpath=//*[@id="email"]
         Input text                     id=email    amer.rasheed@gmail.com
         click element                  xpath=//*[@id="password"]
         Input Password                 id=password   4487a1b1&
         click element                  id=login
         click element                  id=continue
         click element                  id=bookQ7pass5
         click element                  xpath=//*[@id="cardNum"]
         Input text                     id=cardNum   1111222233334444
         click element                  xpath=//*[@id="fullName"]
         Input text                     id=fullName    Amer Rasheed
         click element                  xpath=//*[@id="cvc"]
         Input text                     id=cvc    786
         click element                  id=confirm
         click element                  id=mypage
         click element                  id=logout
         set selenium implicit wait     0.25
    #Then the user is able to book the car
    THEN end web test

User can access website
         [Documentation]                This is a test case part to check a functionality in the website "http://rental4.infotiv.net/". The functionality is to check whether the ABOUT button is working fine and is displaying the information about the Documentation and Source Code Link.
         [Tags]                         Test_ABOUT_Button_Functionality
    Given Begin Web Test
    When Go To Web Page
         Go to                          http://rental4.infotiv.net/webpage/html/gui/index.php
         set selenium speed             0.25
         Wait until Page Contains       When do you want to make your trip?
         set selenium implicit wait     0.25
         click element                  xpath=//*[@id="about"]
         Wait until Page Contains       Welcome
         set selenium implicit wait     0.25
         click element                  xpath=//*[@id="title"]
         Wait until Page Contains       When do you want to make your trip?
    THEN end web test
