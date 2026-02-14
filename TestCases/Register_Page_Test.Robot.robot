*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/RegisterPgLocators.py
Resource    ../Resources/RegisterKeywordsRes.robot

Library    String

Test Template    Register and Verify Error

*** Variables ***
${random_str}=    Generate Random String    4    [NUMBERS]

*** Test Cases ***

TC1 Registration Test with hardcore value
    ${random_str}=    Generate Random String    4    [NUMBERS]

    Open My Browser    ${SITE_URL}    ${BROWSER}
    Enter Firstname    Hardik
    Enter Lastname    pandya
#    Enter Email    hardik@gmail.com
    Enter Email    hardik_${random_str}@gmail.com
    Enter Password    ICCT20wc
    Enter Confirm Password    ICCT20wc
    Enter Telephone    9876543210
    Click Policy Agree Checkbox
    Sleep    3s
    Click Continue button
    Verify Successful registration
    Sleep    5s
    Close All My Browser

TC2 Registration Test with Faker lab
    Open My Browser    ${SITE_URL}    ${BROWSER}

    # Generate data at the test level
    ${RAND_FNAME}=    FakerLibrary.First Name
    ${RAND_LNAME}=    FakerLibrary.Last Name
    ${RAND_EMAIL}=    FakerLibrary.Email
    ${RAND_PHONE}=    FakerLibrary.Phone Number

    Fill Registration Form    ${RAND_FNAME}    ${RAND_LNAME}    ${RAND_EMAIL}    ${RAND_PHONE}    Test@1234

    Click Policy Agree Checkbox
    Sleep    5s
    Click Continue button
    Verify Successful registration
    [Teardown]    Close All My Browser


# Registration with test template

*** Test Cases ***                       # FIRSTNAME    LASTNAME    EMAIL             PHONE        ERROR MESSAGE
TC3 Empty Firstname Registration             ${EMPTY}       Doe         test@mail.com     12345678     First Name must be between 1 and 32 characters!
TC4 Empty Lastname Registration              Rahul          ${EMPTY}    test@mail.com     12345678     Last Name must be between 1 and 32 characters!
TC5 Invalid Email Registration               Rahul          Doe         invalid-email     12345678     E-Mail Address does not appear to be valid!
TC 6Empty Telephone Registration             Rahul          Doe         test@mail.com     ${EMPTY}     Telephone must be between 3 and 32 characters!


*** Keywords ***
Register and Verify Error
    [Arguments]    ${fname}    ${lname}    ${email}    ${phone}    ${expected_error}
    Open My Browser    ${SITE_URL}    ${BROWSER}


    Fill Registration Form    ${fname}    ${lname}    ${email}    ${phone}    Test@1234

    Click Policy Agree Checkbox
    Click Continue button

    # Error verify
    Verify Error Message    ${expected_error}        # error msg it will come from table
    

    [Teardown]    Close All My Browser

