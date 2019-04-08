# MakersBnB

A web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Mockups

Mockups for MakersBnB are available [here](https://github.com/makersacademy/course/blob/master/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).


![Tracking pixel](https://githubanalytics.herokuapp.com/course/makersbnb/specification_and_mockups.md)


# Notes

## MVP

1. A user (no signing up just yet) can list a space
2. A user can name their space, provide a short description of the space, and a price per night.
3. (A user can list multiple spaces).


## User stories

1. List space

As a person with a space,
so that I can share details of it,
I want to be able to list my space.

Object | Messages
--------------- | ---------------
Person |
Space | create (submit)


2. Advertise space

As a person with a space,
so that I can advertise it,
I want to be able to add a...

2.a -> name

Object | Messages
--------------- | ---------------
Person |
Space | addName


2.b -> description

Object | Messages
--------------- | ---------------
Person |
Space | addName
Space | addDescription


2.c -> price per night

Object | Messages
--------------- | ---------------
Person |
Space | addName
Space | addDescription
Space | addPrice


## Technology decisions

- JavaScript -> learning goals and likely to be interactive front-end
- Jasmine testing framework

