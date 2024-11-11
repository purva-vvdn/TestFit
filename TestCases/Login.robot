*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              http://example.com/login      # Replace with your login URL
${BROWSER}          Chrome
${USERNAME}         your_username                 # Replace with a valid username
${PASSWORD}         your_password                 # Replace with a valid password
${LOGIN_BUTTON}     xpath://*[@id='login-button'] # Replace with the correct locator
${USERNAME_FIELD}   xpath://*[@id='username']     # Replace with the correct locator
${PASSWORD_FIELD}   xpath://*[@id='password']     # Replace with the correct locator

*** Test Cases ***
Login to Application in Headless Mode
    [Documentation]  Test Case to log into the application in headless mode.
    Open Headless Browser
    Maximize Browser Window
    Input Text      ${USERNAME_FIELD}    ${USERNAME}
    Input Text      ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    xpath://*[@id='logout-button']    10s    # Replace with a locator that verifies login success
    [Teardown]      Close Browser

*** Keywords ***
Open Headless Browser
    Open Browser    ${URL}    ${BROWSER}    options=${HEADLESS_OPTIONS}

*** Variables ***
${HEADLESS_OPTIONS}    --headless --no-sandbox --disable-dev-shm-usage --disable-gpu --window-size=1920,1080
