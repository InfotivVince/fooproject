*** Settings ***
Library             SeleniumLibrary

*** Keywords ***

Begin Web Test
    open browser                about:blank         ${BROWSER}
    set selenium timeout        15
Go to Web Page
    Load Page
    Verify Page Loaded
Load Page
    go to                       ${URL}
Verify Page Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}            Infotiv Car Rental


Input email
    input text          xpath://*[@id="email"]       ${email}

Input password
    input text          xpath://*[@id="password"]       ${password}


Click Login and Verify
    click element       id:login
    wait until page contains element    id:welcomePhrase
    page should contain     You are signed in as Adam

Click Button Continue
    click element               id:continue

Click Button Book
    wait until page contains element        id:bookModelSpass5
    click element               id:bookModelSpass5

Input Card Number
    input text          xpath://*[@id="cardNum"]       ${cardNumber}

Input Full Name
    input text          xpath://*[@id="fullName"]       ${full_name}

Select ExpYear Card
    select from list by index               xpath://*[@id="confirmSelection"]/form/select[2]       4

Input Cvc
    input text          xpath://*[@id="cvc"]       ${cvc}

Click Button Confirm
    click element               id:confirm

Verify Car Booked
    wait until page contains element        id:confirmMessage


End Web Test
    close browser


Given user has access to the Infotiv Car Rental page and is logged in with email "${email}" and password "${password}"
    Go to Web Page
    Load Page
    Verify Page Loaded
    Input email
    input password
    Click Login and Verify


When the user confirmes an allowed date in the date-selection
    Click Button Continue

And picks an avaliable car to book
    Click Button Book

And inputs the cardnumber "${cardNumber}", the full name "${fullName}" and uses the cvc "${cvc}" and confirms the booking
    Input Card Number
    Input Full Name
    Select ExpYear Card
    Input Cvc
    Click Button Confirm

Then car should be booked
    Verify Car Booked




