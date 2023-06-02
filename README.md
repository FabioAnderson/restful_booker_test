# About the project:

This is a API automation written in Ruby, aiming to validate the functionalities of the restful-booker API.

The main libraries used.:

- Cucumber

- HTTParty

- RSpec

- Faker

# 1- Test results
Durante a execução do teste foram encontrados alguns problemas, são eles:
- The "totalprice" attribute is being saved as an integer. However, as these are monetary values, I believe that it would be a point to be corrected, as a few cents would be lost with each appointment.

- The "depositpaid" attribute is not saving as false, only as true.

- The "bookingIdList" functionality is not listing bookings that have a checkin/checkout date exactly equal to the filter

# 2 - Evaluation on the status of the restful-booker API.
In my view, Restful-Booker requires some corrections, with the most urgent ones being related to the totalprice and depositpaid attributes. Particularly, the depositpaid attribute could be masking financial losses for the business since all bookings are saved as paid without necessarily reflecting the true payment status.

# 3 - project structure
The project was organized under the optics of BDD. That is, focused on the behavior of the system.
For this I used the cucumber framework to create the scenarios (in gherkin language).
The entire structure was designed so that there was no strong dependency between the scenarios, that each functionality was tested, that the integration between different functions was tested and that it was possible to reuse test code.
Separated test data from test logic.
An execution report is also generated at the end of each run.
In addition to having the configuration file, to run the tests through CircleCI.

- The structure of the project is illustrated below:

- features -> Here is the main folder that stores all feature folders.
  - specifications -> It is responsible for the BDDs, separating the features by functionality.
    - auth.feature -> Responsible for test scenarios involving the user authentication. Each scenario has its own tag and tags to run together.
    - booking.feature -> Responsible for test scenarios involving booking management. Each scenario has its own tag and tags to run together. There is also a reuse of steps in common.
    - health.feature -> Responsible for test scenarios involving the system's health. Is a simple scenario for system's health check.

  - step_definitions -> It is responsible for the steps of the BDDs, linking them with the test code itself.
      - AuthSteps.rb
      - BookingSteps.rb
      - AuthSteps.rb

  - support
    - env.rb -> Prepares the environment before running the tests.

  - services -> Where are the test codes actually, separated by functionality
    - Auth
      - AuthPayload.rb -> Class and methods that manage authentication payloads.
      - AuthService.rb -> Class and methods that manage requests for the authentication API.
      - AuthValidator.rb -> Class and methods where the results of requests are handled and validated
    - Booking
      - BookingPayload.rb -> Class and methods that manage Booking payloads.
      - BookingService.rb -> Class and methods that manage requests for the Booking API.
      - BookingValidator.rb -> Class and methods where the results of requests are handled and validated
    - Booking
      - HealthService.rb -> Class and methods that manage requests for the Health API.
      - HealthValidator.rb -> Class and methods where the results of requests are handled and validated

  - hooks.rb -> configures actions for before each scenario.

  - data -> Stores mass of data and reports.
    - data.yaml -> where some key elements are mapped, to facilitate code maintenance.
    - reports -> Location where cucumber reports are generated.
  - .circleci -> Location where are the CircleCI configuration.
  - Gemfile -> Where used packages are listed.
  - cucumber.yml -> Where some run configurations are made.

# 4 - Details of why I think I did a good job testing it.
To validate various Restful-Booker functionalities, I made sure to test a variety of different scenarios. There are both positive and negative test cases.
I carefully examined the core operations of Restful-Booker to make sure they worked as they should. Creating reservations, getting access to reservation information, editing reservations, and deleting reservations all fall under this category.
Paid close attention to input validation, making sure that unexpected or invalid input was dealt with appropriately. This helps to guard against potential security flaws and guarantees that the application functions properly in a variety of situations.


# 5 - Suggestions as to how I would build an effective test framework for use by the product development team (developers and testers) in terms of maintenance, extension and execution of these tests.
To build an effective test framework for the product development team I have to use an automation framework that supports the technology stack used in your product, with these automated tests, it would be easier to guarantee quality and scalability.
I would build scenarios thinking in modularity and reusability, minimizing code duplication and helping with maintenance.
Create report and loggings, and if possible, create alerts on the team's communication tools (slack for example).
And Integrate my test framework with CI/CD tools, like Jenkins or CircleCI.


# 6 - Suggestions as what factors are important to creating and maintaining an effective suite of tests in the long term.
In order to do that, I would take care of test coverage, Ensuring the coverage of the functionalities. Create well-designed scenarios, and perform test automation.
And of course, don't forget about maintaining documentation and references.


# Running the project:

> Local Execution
- Make sure you have ruby installed
- Install the bundler gem
```
gem install bundler
``` 
- go to the project folder and execute bundler
```
bundler install
```
- After the install, the project can be run with the command:
```
cucumber
```
> Execution with tag selection
- We can also select the desired browser and tags:
```
cucumber -t @delete_booking
```

> Circle CI
- The project is also ready to run in Circle CI, just indicate the configuration file that is in the .circleci folder
