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

Click Button Continue
    click element               id:continue

Verify Access To Car Page
    wait until page contains element        id:questionText

Click Button DateLeft
    [Arguments]                 ${search_term}
    input text                  id:start                ${search_term}

Click Button DateRight
    [Arguments]                 ${search_term}
    input text                  id:end                  ${search_term}

End Web Test
    close browser
