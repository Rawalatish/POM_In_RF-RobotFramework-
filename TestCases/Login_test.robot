*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/LoginPageLocators.py
Resource    ../Resources/LoginKeywordsRes.robot

Metadata    Executed by    AutomationPOM tester



*** Variables ***
${BROWSER}    chrome
${SITE_URL}    https://tutorialsninja.com/demo/index.php?route=account/login
${username}    nanapatekar@gmail.com
${password}    nanapatekar

*** Test Cases ***
Login test

    Open My Browser    ${SITE_URL}    ${BROWSER}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Sleep    2s
    Verify Successful Login
    Close My Browser

Login test with Try and Except block
    [Tags]    Smoke

    Open My Browser    ${SITE_URL}    ${BROWSER}
    TRY

    Enter Username    ${username}
    Enter Password    ${password}
    Click Login
    Sleep    2s
    Verify Successful Login

    EXCEPT    Element 'id=login-button' not found            # Element 'id=login-button' not found this is a msg
        Log    The login button was missing from the page.    level=ERROR

#    EXCEPT    Element with locator 'xpath://input[@type='submitt']' not found.            # Element 'id=login-button' not found this is a msg
#        Log    The login button was missing from the page.    level=ERROR

    EXCEPT    *    AS    ${error_msg}
        Log To Console    An unexpected error occurred: ${error_msg}        # console mai dikhega 
        Log    An unexpected error occurred: ${error_msg}                    # Log report mai dikhega
        Capture Page Screenshot    filename=login_failure.png

    FINALLY
        Close My Browser
    END




    