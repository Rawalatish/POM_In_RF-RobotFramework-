
*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/RegisterPgLocators.py
#Library    FakerLibrary
Library    FakerLibrary    locale=en_IN

*** Variables ***
${SITE_URL} =    https://tutorialsninja.com/demo/index.php?route=account/register
${BROWSER}=    chrome
#${BROWSER}=    headlesschrome


*** Keywords ***
Open My Browser
    [Arguments]    ${SITE_URL}    ${BROWSER}
    Open Browser    ${SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Register Account

Enter Firstname
    [Arguments]    ${user_firstname}
    Input Text    ${txt_firstname}    ${user_firstname}
Enter Lastname
    [Arguments]    ${user_Lastname}
    Input Text    ${txt_lastname}    ${user_Lastname}
Enter Email
    [Arguments]    ${user_email}
    Input Text    ${txt_email}    ${user_email}
Enter Telephone
    [Arguments]    ${user_number}
    Input Text    ${txt_telephone}    ${user_number}

Enter Password
    [Arguments]    ${user_password}
    # It will automatically clear the field first     #input_password(locator, password, clear):
    Input Password    ${txt_password}    ${user_password}

Enter Confirm Password
    [Arguments]    ${user_password}
    # It will automatically clear the field first     #input_password(locator, password, clear):
    Input Password    ${txt_confirm_password}    ${user_password}

Click Policy Agree Checkbox
    Select Checkbox    ${ckbox_policy}
    
Click Continue button
    Click Element    ${btn_continue}

Verify Successful registration
    Wait Until Page Contains        Your Account Has Been Created
    Page Should Contain    Your Account Has Been Created

Close All My Browser
    Close All Browsers


Verify Error Message
    [Arguments]    ${expected_error}
    Page Should Contain    ${expected_error}



Fill Registration Form
    [Arguments]    ${fname}    ${lname}    ${email}    ${phone}    ${password}
    Enter Firstname    ${fname}
    Enter Lastname     ${lname}
    Enter Email        ${email}
    Enter Telephone    ${phone}
    Enter Password     ${password}
    Enter Confirm Password    ${password}


    # TO display in the report
    Log To Console    Created User: ${fname} with Email: ${email}

