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
Resource                  ../resources/product.robot
Resource                  ../resources/cart.robot
Resource                  ../resources/checkout.robot
*** Test Case ***
Item should be added to the cart
    [Tags]   QA  UAT  Performance  Problem  Standard
    cart.add to cart
    
Item should be removed from the cart
    [Tags]   QA  UAT  Performance  Problem  Standard
    cart.remove items from the cart
