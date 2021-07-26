# Back End Engineering Tech Challenge

There are two pieces to this challenge:

1. A refactoring exercise (in the `refactoring` directory)
1. A Rails exercise (in the nearest-fuel-station directory)

Additional details on each are included below.

We recommend spending **no more than 3 hours** on this challenge. 

In order to complete these challenges, clone (don't fork) this repository. Make your changes and commits in your cloned repository.

## Refactoring

The `refactoring` directory includes a working CreditCard class that is able to determine whether or not a credit card number is valid using the [Luhn Algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm). There are tests included in that directory to confirm this. In order to run those tests,

1. `cd` into the `refactoring` directory.
1. `bundle install`
1. `rspec`

There is one failing test that uses [Reek](https://github.com/troessner/reek) as a measure of the quality of the code in the CreditCard class.

Refactor the code to make that test pass, then make an update to this document to answer the questions below in this document.

* It's not uncommon that a student just learning Ruby would feel comfortable with the code as it was initially provided. Is the code that you created to make the Reek test pass better than the previous version? Why or why not? How would you describe the advantages/disadvantages of your refactored code to a student who is still fairly new to Ruby?
- Yes, I would say that the refactored code is better than the previous code as it better follows one of the core principles of object oriented programming—that of single responsibility. While this class was quite small with only two pieces of responsibility, I try to think about scalability— if this code was part of a much larger code base that included hundreds of classes and we didn’t apply SRP well, the classes would easily hold too much functionality—creating entangled code that is difficult to test, debug and refactor at a later time.
- I think analogies go a long way, especially when learning new concepts and skills. I might explain the advantages and disadvantages of these changes using the layout and organization of a house;  each room (or class) in a house has a main purpose/intention for what it does, what it holds and how we organize it.
- By abstracting out the functionality for validating a credit card number, we let the CreditCard class hold only one responsibility and let the NumberValidation class hold the validation functionality— passing it back to the CreditCard class to store when it is validated. We would do the same thing in a home— we might use the dishwasher to wash dishes and then put them in the cupboards once cleaned. We would not expect the dishwasher to both wash and store the dishes.
- One advantage of using this standardized way of organizing our space or code is that if we have a visitor staying out our home while we are away, they will most likely look for things they need such as bathroom supplies (or in respect to the code— they may look for models in the models folder, controllers, in the controllers folder—etc. If we store the bathroom supplies in the kitchen— though we, the regular occupants, know where things are and how they work. Our guests will most likely spend more time than they’d like looking for supplies in an unexpected place rather than a more generally known place such as in a bathroom or nearby hall closet.
- A disadvantage to this might be that if we abstract out too much or more than is necessary, it might be equally challenging to track how things work together. If you have a three story home, with a bathroom on every floor, yet only one bathroom storage closet on the third floor, guests may still have a challenging time finding the supplies they need.
* Is there anything you would change if you weren't using Reek as a way to judge code quality?
- I would have abstracted out the functionality for manipulating the credit card number as well as abstracted out the verification check for the total.

## Rails API Consumption

The `nearest-fuel-station` directory includes a Rails app with some starter code and a signle passing test.

This challenge will use information from the National Renewable Energy Laboratory. Sign up for an API key [here](https://developer.nrel.gov/signup/). If you have any trouble obtaining an API key, please let us know.

Once you have your API key, update the application based on the user story below using the API endpoint documented [here](https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/#station-count-record-fields).

```
As a user
When I visit "/"
And I select "Turing" from the start location drop down (Note: Use the existing search form)
And I click "Find Nearest Electric Station"
Then I should be on page "/search"
And I should see a count of Electric Stations within 5 miles of my location.
And I should see details about the five closest electric fuel stations to Turing, including their:

- Name
- Address
- Fuel Type
- Access Times
```

Once you've finished, answer the questions below in this document.

* At a high level, how did you organize the code that you added? For example, if you added a class or classes, what responsibilities do they have? Are there alternatives you considered or could envision? If so, why did you choose this path instead?
* This is sometimes used as a mid-mod assessment for students in Module 3. In Module 2 students spend a lot of time memorizing the basic rules and conventions of Rails, but in Module 3 we ask them to be more creative in their problem solving and create the classes they need to organize their code (even if it's not a model, view, or a controller). Sometimes students struggle with this change, and try to memorize any patterns instructors provide when going over a challenge like this. What strategies would you recommend to help students understand that there are many different approaches they could take to solve this problem?
* We frequently ask students to focus on their problem solving *process* in lieu of the *outcome* of a timed challenge. At a high level, how would you describe your process to this challenge to a group of students who might not yet be very good at talking about how they go about solving a problem? What strategies could you use to help students begin to articulate their own approach to technical problems?

## Submission

In order to submit, zip this directory and then send via email to ellenmary@turing.edu, and alex@turing.edu.
