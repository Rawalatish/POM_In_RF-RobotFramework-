*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/LoginPageLocators.py

Library    ../Resources/CustomLibUtils/LoginHelper.py

*** Keywords ***

Open My Browser
    [Arguments]    ${SITE_URL}    ${BROWSER}
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window



Enter Username
    [Arguments]    ${username}
    # Correct: Using ${} to fetch the value from LoginPageLocators.py
    Input Text    ${txt_loginUsername}    ${username}

Enter Password
    [Arguments]    ${password}
    # Correct: Using ${} to fetch the value from LoginPageLocators.py
    Input Text    ${txt_loginPassword}    ${password}

Click Login
    # Correct: Using ${} and Click Element for Xpath
    Click Element    ${btn_Login}

Verify Successful Login
    Page Should Contain    Edit your account information

Close My Browser
    Close All Browsers

Register New User
    ${email}=    Generate Random Email
    Input Text    ${txt_loginUsername}    ${email}
    # ... baki steps ...