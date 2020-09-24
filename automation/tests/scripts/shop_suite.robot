*** Settings ***
Library             RequestsLibrary
Library             String
Library             Collections
Library             JSONLibrary
Library             FakerLibrary
Library             DatabaseLibrary
Library             OperatingSystem
Library             SeleniumLibrary
Library             ScreenCapLibrary
Resource                  ../resources/csv.robot
Resource                  ../resources/environment.robot
Resource                  ../resources/product.robot
Resource                  ../resources/cart.robot
Resource                  ../resources/checkout.robot
*** Test Case ***
Place and checkout the order
    [Tags]   QA  UAT  Problem  Standard
    checkout.check out items
    