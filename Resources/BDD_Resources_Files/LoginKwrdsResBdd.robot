
*** Settings ***
Library    SeleniumLibrary
Resource    Resources/LoginKeywordsRes.robot

Variables    ../../PageObjects/LoginPageLocators.py
#Variables    ${EXECDIR}/PageObjects/LoginPageLocators.py

*** Keywords ***
the user is on the login page
    [Arguments]    ${SITE_URL}    ${BROWSER}
    Open My Browser    ${SITE_URL}    ${BROWSER}

the user enters valid credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}

clicks the login button
    Click Login
    # Using your "Fighter" keyword we discussed:
    Wait Until Keyword Succeeds    10s    2s    Verify Successful Login

the dashboard should be visible
    Verify Successful Login
    [Teardown]    Close My Browser


