# Chitter

## Getting Started

To run the app on your machine, download the files, run `bundle install` to install the gems, run rackup on your terminal and navigate to localhost:9292 in your browser.

To run the tests, make sure RSpec is installed (`bundle install`) and run `rspec` from the command line.

## User Stories

Chitter satisfies the following User Stories:

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

## Technologies used

- Ruby 2.5.0
- Sinatra
- Rspec
- Capybara
- PostgreSQL
- CSS
- Simplecov
- Rubocop
- Rake
