*** Settings ***
Documentation    To validate unsuccessful addition of stock item
Library    SeleniumLibrary
Test Setup    Open the Browser with URL
Test Teardown    close the browser
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/AdminResources.robot
Resource    ../Resources/LoginResources.robot



*** Test Cases ***


To verify successful addition of stock item
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Click the inventory button
    AdminResources.Click add stock item
    AdminResources.Fill add item stock form
    AdminResources.Verify item stock list page opened

To verify successful addition of stock item without choosing suppiler store
    [Tags]    smoke
    LoginResources.Go to user login
    LoginResources.Go to admin page
    Switch Window    new
    LoginResources.fill the admin login form
    LoginResources.click the sign in button
    AdminResources.Click the inventory button
    AdminResources.Verify item stock list page opened
    AdminResources.Click add stock item
    AdminResources.Fill add item stock form without supplier store
    