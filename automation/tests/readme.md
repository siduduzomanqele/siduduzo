#  Project Structure

* data folder - this is where you will find all data to pass to your key words. e.g csv files and txt files.
* results folder- this is where you will find your test run results after test case execution. view test that passed and failed also see the logs.
* Scripts folder - here we store all the project tests suites.
* resources folder - here we aadd all our reusable key words that we can call to perform some task for us (usually we call these in our test cases).
* env.bat - this is the batch file which sets our enviroment variables.
* test.bat - this is the batch file with commands to run our tests
* run.bat  - calls both our batch files to execute our test cases (pass required variables).
* json db - json database server for our REST endpoints.

# To run the application

* Ensure that the "keep me signed in check box is not selected on your Microsoft account",
* It should allow you to key in your username and password when you call the sign in page. altnatively comment out  #sign_in.Microsoft Login  ${USER}  ${PASSWORD}

* expand Automation\tests folder and create new Batch file, name the file sensative.bat, copy and paste the below env variables and remember to change the 
* username, password and the connection strring values.

    * set USERNAME=example@gmail.com
    * set PASS=Password01


* Open run.bat file under tests folder, make sure that you call sensative.bat by adding call sensative.bat
* on your terminal - cd tests - \Automation\tests
* then run command - run.bat

# Global variables 

* stored in Enviroment.robot script