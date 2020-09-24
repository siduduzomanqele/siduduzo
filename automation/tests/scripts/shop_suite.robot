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
Resource                  ../resources/shop.robot
*** Test Case ***
Place and finilize the order
    [Tags]   QA  UAT  Problem  Standard  Performance
    shop.Place an Order
    