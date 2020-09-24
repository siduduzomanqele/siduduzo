# Introduction 

SeleniumLibrary
===============



    SeleniumLibrary_ is a web testing library for `Robot Framework`_ that
    utilizes the Selenium_ tool internally.

    SeleniumLibrary works with Selenium 3 and 4. It supports Python 2.7 as well as
    Python 3.6 or newer. In addition to the normal Python_ interpreter, it
    works also with PyPy_ and Jython_. Unfortunately Selenium_ is not
    currently supported by IronPython_ and thus this library does not work with
    IronPython either.

    SeleniumLibrary is based on the `old SeleniumLibrary`_ that was forked to
    Selenium2Library_ and then later renamed back to SeleniumLibrary.
    See the Versions_ and History_ sections below for more information about
    different versions and the overall history.

    .. image:: https://img.shields.io/pypi/v/robotframework-seleniumlibrary.svg?label=version
    :target: https://pypi.python.org/pypi/robotframework-seleniumlibrary
    
    .. image:: https://img.shields.io/pypi/dm/robotframework-seleniumlibrary.svg
    :target: https://pypi.python.org/pypi/robotframework-seleniumlibrary

    .. image:: https://img.shields.io/pypi/l/robotframework-seleniumlibrary.svg
    :target: https://www.apache.org/licenses/LICENSE-2.0

    .. image:: https://github.com/robotframework/SeleniumLibrary/workflows/SeleniumLibrary%20CI/badge.svg
        :target: https://github.com/robotframework/SeleniumLibrary/actions?query=workflow%3A%22SeleniumLibrary+CI%22


Keyword documentation
=====================

    See `keyword documentation`_ for available keywords and more information
    about the library in general.
    .. https://robotframework.org/#libraries


# Getting Started
TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:

1.	Installation process
    * Robot Framework is supported on Python (both Python 2 and Python 3), Jython (JVM) and IronPython (.NET) and PyPy. The interpreter you want to use should be installed (Python) before installing the framework itself.
    * After installing Python, you probably still want to configure PATH to make Python itself as well as the robot and rebot runner scripts executable on the command line.
    * The PATH environment variable lists locations where commands executed in a system are searched from. To make using Robot Framework easier from the command prompt, it is recommended to add the locations where the runner scripts are installed into the PATH. It is also often useful to have the interpreter itself in the PATH to make executing it easy.

    * What directories to add to PATH

        What directories you need to add to the PATH depends on the interpreter and the operating system. The first location is the installation directory of the interpreter (e.g. C:\Python27) and the other is the location where scripts are installed with that interpreter. Both Python and IronPython install scripts to Scripts directory under the installation directory on Windows (e.g. C:\Python27\Scripts) and Jython uses bin directory regardless the operating system (e.g. C:\jython2.7.0\bin).

        Notice that the Scripts and bin directories may not be created as part of the interpreter installation, but only later when Robot Framework or some other third party module is installed.

        When using Python on UNIX-like machines both Python itself and scripts installed with should be automatically in the PATH and no extra actions needed. On Windows and with other interpreters the PATH must be configured separately.

    * Setting PATH on Windows

        On Windows you can configure PATH by following the steps below. Notice that the exact setting names may be different on different Windows versions, but the basic approach should still be the same.

        Open Control Panel > System > Advanced > Environment Variables. There are User variables and System variables, and the difference between them is that user variables affect only the current users, whereas system variables affect all users.
        To edit an existing PATH value, select Edit and add ;<InstallationDir>;<ScriptsDir> at the end of the value (e.g. ;C:\Python27;C:\Python27\Scripts). Note that the semicolons (;) are important as they separate the different entries. To add a new PATH value, select New and set both the name and the value, this time without the leading semicolon.
        Exit the dialog with Ok to save the changes.
        Start a new command prompt for the changes to take effect.
        Notice that if you have multiple Python versions installed, the executed robot or rebot runner script will always use the one that is first in the PATH regardless under what Python version that script is installed. To avoid that, you can always execute the installed robot module directly like C:\Python27\python.exe -m robot.

    * You will need to Install Visual studio.

    * Installing Robot Framework

        The recommended installation method is using pip_:: then install Robot framework. [in your termila or command line]

            pip install --upgrade robotframework-seleniumlibrary

        Running this command installs also the latest Selenium and Robot Framework
        versions, but you still need to install `browser drivers`_ separately.
        The ``--upgrade`` option can be omitted when installing the library for the
        first time.

        Those migrating from Selenium2Library_ can install SeleniumLibrary so that
        it is exposed also as Selenium2Library::

            pip install --upgrade robotframework-selenium2library

        The above command installs the normal SeleniumLibrary as well as a new
        Selenium2Library version that is just a thin wrapper to SeleniumLibrary.
        That allows importing Selenium2Library in tests while migrating to
        SeleniumLibrary.

        Browser drivers
        ===============

        After installing the library, you still need to install browser and
        operating system specific browser drivers for all those browsers you
        want to use in tests. These are the exact same drivers you need to use with
        Selenium also when not using SeleniumLibrary. More information about
        drivers can be found from `Selenium documentation`__.

        The general approach to install a browser driver is downloading a right
        driver, such as ``chromedriver`` for Chrome, and placing it into
        a directory that is in PATH__. Drivers for different browsers
        can be found via Selenium documentation or by using your favorite
        search engine with a search term like ``selenium chrome browser driver``.
        New browser driver versions are released to support features in
        new browsers, fix bug, or otherwise, and you need to keep an eye on them
        to know when to update drivers you use.

        Alternatively, you can use a tool called WebdriverManager__ which can
        find the latest version or when required, any version of appropriate
        webdrivers for you and then download and link/copy it into right
        location. Tool can run on all major operating systems and supports
        downloading of Chrome, Firefox, Opera & Edge webdrivers.

        Here's an example:

        .. code:: bash

            pip install webdrivermanager
            webdrivermanager firefox chrome --linkpath /usr/local/bin
        for more info: There is a documentation on how to install robot framework on the N:drive  N:\robotframework  [install.txt]

    *  install the following Libraries 

        Library             RequestsLibrary
        Library             String
        Library             Collections
        Library             JSONLibrary
        Library             FakerLibrary
        Library             DatabaseLibrary
        Library             OperatingSystem
        Library             SeleniumLibrary
        Library             ScreenCapLibrary

        see : https://robotframework.org/#libraries  for more details.


3.	Latest releases

    SeleniumLibrary has over the years lived under SeleniumLibrary and
    Selenium2Library names and different library versions have supported
    different Selenium and Python versions. This is summarized in the table
    below and the History_ section afterwards explains the project history
    a bit more.

    ==================================  ==========================  ==========================  ===============
                Project                     Selenium Version             Python Version         Comment
    ==================================  ==========================  ==========================  ===============
    SeleniumLibrary 2.9.2 and earlier   Selenium 1 and 2            Python 2.5-2.7              The original SeleniumLibrary using Selenium RC API.
    Selenium2Library 1.8.0 and earlier  Selenium 2 and 3            Python 2.6-2.7              Fork of SeleniumLibrary using Selenium WebDriver API.
    SeleniumLibrary 3.0 and 3.1         Selenium 2 and 3            Python 2.7 and 3.3+         Selenium2Library renamed and with Python 3 support and new architecture.
    SeleniumLibrary 3.2                 Selenium 3                  Python 2.7 and 3.4+         Drops Selenium 2 support.
    SeleniumLibrary 4.0                 Selenium 3                  Python 2.7 and 3.4+         Plugin API and support for event friging webdriver.
    SeleniumLibrary 4.1                 Selenium 3                  Python 2.7 and 3.5+         Drops Python 3.4 support.
    SeleniumLibrary 4.2                 Selenium 3                  Python 2.7 and 3.5+         Supports only Selenium 3.141.0 or newer.
    SeleniumLibrary 4.4                 Selenium 3 and 4            Python 2.7 and 3.6+         New PythonLibCore and dropped Python 3.5 support.
    Selenium2Library 3.0                Depends on SeleniumLibrary  Depends on SeleniumLibrary  Thin wrapper for SeleniumLibrary 3.0 to ease transition.
    ==================================  ==========================  ==========================  ===============

4.	API references

# Build and Test
TODO: Describe and show how to build your code and run the tests.

#  Project Structure

    * data folder - In this folder you will find all test data to pass to your keywords. e.g csv, xml and txt files.
    * results folder- In this folder you will find your test run results after test case execution. you will be able to view tests that passed and failed also see the logs.
    * Scripts folder - In this folder you will see all the project tests suites.
    * resources folder - In this folder you will store / find all our reusable key words that we can call to perform some tasks. note these are keywords that are re-usable to   other   scripts that you create (usually we call these in our test cases).
    * env.bat - This is the batch file which sets our enviroment variables.
    * test.bat - This is the batch file with commands to run our tests
    * run.bat  - Calls both our batch files to execute our test cases (pass required variables tags act).


# To run the application

    * Expand Automation\tests folder and create new Batch file, name the file sensative.bat, copy and paste the below env variables and remember to change the 
      username and password.

        * set USERNAME=..........
        * set LOCKEDOUTUSER=.....gffg...
        * set PROBLEMUSER=prob
        * set PERFORMANCEUSER=siduduzo
        * set PASS=myPass@002#


    * Open Visual studio code, Choose file, Open Folder. Browser Robot Framework siduduzo Test project on your local Machine (after clonin g the project from GITHUB) and select Automation folder to open the project using Visual Studio Code.
    * To add Robot Framework intellisense - On Visual studio code, click extensions or press ( CRL + shift + X) search for Robot Framework intellisense and click install.
    * for your test run results report - To add Open in Default Browser intellisense - On Visual studio code, click extensions or press ( CRL + shift + X) search for Robot Open in Default Browser and click install.
    * To add Robotf Extension - On Visual studio (VS) code, click extensions or press ( CRL + shift + X) search for Robotf Extension and click install.

    To run the application

    * On VS code terminal - cd automation . cd test

    * To run tests for standard_user in your terminal call standard.bat
    * To run tests for locked_out_user in your terminal call locked.bat
    * To run tests for problem_user in your terminal call problem.bat
    * To run tests for performance_glitch_user in your terminal call run.bat

    Viewing test run results

    * Expand Results folder, right click on report and choose Open in default browser.



# Global variables 

    * stored in Enviroment.robot script

# Contribute
TODO: Explain how other users and developers can contribute to make your code better.

Interested to contribute to Robot Framework? Great! In that case it is a good start by looking at the Contribution guidelines. 

When using Robot Framework, it is generally recommended to write as
easy-to-understand tests as possible. The keywords provided by
SeleniumLibrary are pretty low level, though, and often require
implementation specific arguments like element locators to be passed
as arguments. It is thus typically a good idea to write tests using
Robot Framework's higher level keywords that utilize SeleniumLibrary
keywords internally. This is illustrated by the following example
where SeleniumLibrary keywords like ``Input Text`` are primarily
used by higher level keywords like ``Input Username``.

.. code:: robotframework

    *** Settings ***
    Documentation     Simple example using SeleniumLibrary.
    Library           SeleniumLibrary

    *** Variables ***
    ${LOGIN URL}      http://localhost:7272
    ${BROWSER}        Chrome

    *** Test Cases ***
    Valid Login
        Open Browser To Login Page
        Input Username    demo
        Input Password    mode
        Submit Credentials
        Welcome Page Should Be Open
        [Teardown]    Close Browser

    *** Keywords ***
    Open Browser To Login Page
        Open Browser    ${LOGIN URL}    ${BROWSER}
        Title Should Be    Login Page

    Input Username
        [Arguments]    ${username}
        Input Text    username_field    ${username}

    Input Password
        [Arguments]    ${password}
        Input Text    password_field    ${password}

    Submit Credentials
        Click Button    login_button

    Welcome Page Should Be Open
        Title Should Be    Welcome Page


The above example illustrates using Robot Framework and SeleniumLibrary.
For more information about Robot Framework test data syntax in
general see the `Robot Framework User Guide`_.
.. https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html


If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)