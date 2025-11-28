*** Settings ***
Library    Browser
Resource    resources/keywords/kw_saucedemo.robot
Suite Setup    New Browser    chromium    headless=False
Suite Teardown    Close Browser
Test Setup    New Page    ${URL}

*** Test Cases ***
End To End Test
    Open and Login
    Add Items to Cart
    Checkout and Verify

Locked Out User Can Not Login
    Attempt to Login with Invalid Credentials
