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

The `nearest-fuel-station` directory includes a Rails app with some starter code and a single passing test.

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
- At a high level, I organized my code by creating a service class and a poro. The service class is responsible for making the service call and the poro was responsible for returning the electric station information requested by the spec.  There are many ways one could organize this code and I think much of these decisions have to do with what the over all intentions of the code are. Looking ahead, widening one’s understanding of a project’s scope or product design can really impact how a developer might organize their code. Sometimes the code base is really entangled, and there isn’t a consistent pattern used— sometimes there might be models for everything where there should be poros— sometimes all of the logic is in the viewer rather than abstracted out into a controller and poros. For me, ensuring there is consistency and a regularly followed pattern throughout the code base is important to think about. I chose to organize it the way I did based on my understanding of what the code might be used for and keeping it simple, easy to follow and following guidelines such as SRP.
* This is sometimes used as a mid-mod assessment for students in Module 3. In Module 2 students spend a lot of time memorizing the basic rules and conventions of Rails, but in Module 3 we ask them to be more creative in their problem solving and create the classes they need to organize their code (even if it's not a model, view, or a controller). Sometimes students struggle with this change, and try to memorize any patterns instructors provide when going over a challenge like this. What strategies would you recommend to help students understand that there are many different approaches they could take to solve this problem?
- I think analogies work well— which I realize I mentioned in a previous response in this take home. If we teach concepts and explain tools and intentions of tools, I think it could be helpful in helping break away from people ‘mimicking’ a pattern. ‘’’For example, this tool (which we do not have to name) is small, lightweight and has an end that is sharp. Here is another tool, heavier, longer handle, wider end and is even sharper. Finally we have this large, heavyweight tool with a thicker and very sharp end— each of these tools works well with wood. Let’s take this time to see what happens when you use the largest tool with kindling fire wood and what happens with you use the smallest took with a log. What was challenging about using these tools for the given materials— which tool do you think might work better than the one you chose?’’’ 
With that said, I think it is also important as teachers, to understand that humans naturally look for patterns, it is a core survival tactic. Maybe we could use this to shift how we think about delivering information or structuring our lectures for students to learn.
* We frequently ask students to focus on their problem solving *process* in lieu of the *outcome* of a timed challenge. At a high level, how would you describe your process to this challenge to a group of students who might not yet be very good at talking about how they go about solving a problem? What strategies could you use to help students begin to articulate their own approach to technical problems?
- One thing I learned with technical challenges and interviews was to take notes on my process that I can later articulate to someone. First, I read the repo, cloned it down and ran bundle. I realized the ruby version that was needed wasn’t installed yet, so I ran the command to install the needed ruby version. Then I realized my bundler version and ruby version were incompatible, so I updated my bundler as well. After reading through the instructions, I made a task list: run the test, create a new scenario in the test to include all required information from the user story and then get the test to pass. Finally, answer the questions. I then skimmed through the questions so as to keep in mind specific things while I worked through the code and tests.  I started by building the scaffolding of a test. One thing I have learned about my process, is that while I start with a test, I don’t fully build out the test and expectations completely up front. I build the basics and fill it in as I go— depending on how large the code base it— sometimes I have to work with many redirects and thus many controllers, etc… so it helps to put in a pry and get a better understanding of where you are and what you have access to in order to know where you are adding functionality or fixing code— with this in mind, I fill in the test and work to get it to pass with new functionality. Though this code base was so small, that is the pattern I have developed over time and stuck with it. I remembered I should be committing my work as I go, so I did that. This took a few minutes as I needed to create a new upstream branch to my own repo so as to not push up to Turing’s. I then answered the questions and moved on. I then ran the test and looked at the routes file— saw it had a ‘/search’ path already, which was great. I made a matching controller to hold the index method, which in my brain renders a list of things. I had the controller make the service call to NREL— ensuring my api_key and required params worked as needed before pulling it out into it’s own service folder. I chose to use a service folder, because in my mind, organizing all api calls into one folder called services( we also do this at my current job) makes it easy to find. I then pulled out the logic that did more than just making the service all and put that into a poro. I chose this over saving the object as a model because based on my understanding of the desired functionality, we only need to make the call and render the results in a particular way to the client— we do not need to store any information for the client at this time. I continued to run the test and create the expectations based on the user story criteria and made small corrections to the spec until it passed. 
- Articulating one’s process I realize is not a skill everyone is used to utilizing regularly. As I mentioned above, I tend to write out my process first, or make notes as I go— especially with take home challenges. This helps me organize my thoughts around how I did something prior to trying to verbalize things. Just as with babies, we can understand how things are working and what’s going on well before we can articular them— and expressing ourselves via another form ie. writing it out can be very helpful to later articulate it.

## Submission

In order to submit, zip this directory and then send via email to ellenmary@turing.edu, and alex@turing.edu.
