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

Create User Page
     click element                xpath://*[@id="createUser"]           RETURN

Verify Page UserRegistration Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}            Create user

Input firstname
    [Arguments]         ${search_term}
    input text          xpath://*[@id="name"]       ${search_term}

Input lastname
    [Arguments]         ${search_term}
    input text          xpath://*[@id="last"]       ${search_term}

Input phonenumber
    [Arguments]         ${search_term}
    input text          xpath://*[@id="phone"]       ${search_term}

Input email
    [Arguments]         ${search_term}
    input text          xpath://*[@id="emailCreate"]       ${search_term}

Input comfirmEmail
    [Arguments]         ${search_term}
    input text          xpath://*[@id="confirmEmail"]       ${search_term}

Input password
    [Arguments]         ${search_term}
    input text          xpath://*[@id="passwordCreate"]       ${search_term}

Input confirmPassword
    [Arguments]         ${search_term}
    input text          xpath://*[@id="confirmPassword"]      ${search_term}

Click Create and Verify
    click element       id:create
    wait until page contains element    id:welcomePhrase
    page should contain     You are signed in as Adam



Click Button myPage
    click element       id:mypage

End Web Test
    close browser
