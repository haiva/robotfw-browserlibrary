*** Settings ***
Library    Browser
Resource    ../variables.robot

*** Keywords ***
Open and Login
    Type Text    id=user-name    ${USERNAME}
    Type Text    id=password    ${PASSWORD}
    Click    id=login-button
    Get Text    .title    ==    Products

Add Items to Cart
    Click    id=add-to-cart-sauce-labs-backpack
    Click    id=add-to-cart-sauce-labs-bike-light
    Get Text    .shopping_cart_badge    ==    2

Checkout and Verify
    Click    .shopping_cart_link
    Click    id=checkout
    Type Text    id=first-name    John
    Type Text    id=last-name    Doe
    Type Text    id=postal-code    12345
    Click    id=continue
    Click    id=finish
    Get Text    h2.complete-header    ==    Thank you for your order!

Attempt to Login with Invalid Credentials
    Type Text    id=user-name    locked_out_user
    Type Text    id=password    secret_sauce
    Click    id=login-button
    Get Text    h3[data-test="error"]    ==    Epic sadface: Sorry, this user has been locked out.
