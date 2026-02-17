*** Settings ***

Library    SeleniumLibrary
Variables    ../PageObjects/LoginPageLocators.py
Resource    ../Resources/BDD_Resources_Files/LoginKwrdsResBdd.robot


*** Variables ***
${BROWSER}    chrome
${SITE_URL}    https://tutorialsninja.com/demo/index.php?route=account/login
${username}    nanapatekar@gmail.com
${password}    nanapatekar


*** Test Cases ***
Scenario: Successful Login with Valid Credentials
    [Tags]    Smoke    BDD
    Given the user is on the login page    ${SITE_URL}    ${BROWSER}
    When the user enters valid credentials    ${username}    ${password}
    And clicks the login button
    Then the dashboard should be visible
    [Teardown]    Close My Browser

Scenario: Unsuccessful Login with Invalid Credentials
    [Tags]    Regression    BDD
    Given the user is on the login page    ${SITE_URL}    ${BROWSER}
    When the user enters valid credentials    wronguser@gmail.com    wrongpass
    And clicks the login button
#    Then the dashboard should not be visible
    [Teardown]    Close My Browser