# MakersBnB

A web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be request for that night.

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

# Notes

## MVP

1. A user (no signing up just yet) can list a space
2. A user can name their space, provide a short description of the space, and a price per night.
3. (A user can list multiple spaces).

## User stories

1. List space (create listing)

```
As a host,
So that I can share details of my space,
I want to be able to list my space.
```

Object | Messages
--------------- | ---------------
Person |
Space | create (submit)


2. Advertise space
```
As a host,
so that I can advertise my space,
I want to be able to add a...
```
2.a -> ```name```

Object | Messages
--------------- | ---------------
Person |
Space | addName


2.b -> ```description```

Object | Messages
--------------- | ---------------
Person |
Space | addName
Space | addDescription


2.c -> ```price per night```

Object | Messages
--------------- | ---------------
Person |
Space | addName
Space | addDescription
Space | addPrice

3. Multiple spaces

```
As a host with multiple spaces,
So that I can offer all of them
I want to be able to list multiple spaces
```

4. Host sign up

```
As a host,
So that users know it's my space
I want to be able to sign up
```

5. Guest signup

```
As a guest,
So that I can require to hire a space
I want to be able to sign up
```

10. User login

```
As a user...
so that my activities are private to me
I want to be able to login to manage my bookings
```

11. User logout

```
As a user...
So that my details are secure
I want to be able to logout
```

**HERE at end of WEDNESDAY**

6. Range of dates

```
As a host,
So that I can share when the space is available
I want to be able to offer a range of dates
```

7. Guest request space

```
As a guest,
So that I can go on holiday
I want to request a space for a night
```

8. Host can approve space

```
As a host,
So that I can manage my space,
I want to be able to approve a booking request
```

9. Availability update

```
As a host,
So that I don't double book the space
I want to show only available dates
```

```
As a guest,
So that I only see places that I can book
I want to see only available spaces
```

```
As a host,
So that I have more change of filling my space
I want the space to show as available until I confirm a booking
```


## Technology decisions

- Ruby
- Rspec
- Capybara

## Database set up

- Open PSQL
- Create `pinkbnb` postgres db locally
- Create `pinkbnb_test` postgres db locally
- Run queries in db/migrations folder

## Usage

`git clone https://github.com/mattTea/makersBnB`     
`gem install bundle`     
`bundle install`     

In Command Line, run `ruby app.rb` and open `localhost:4567`

## Running tests

`rspec`
