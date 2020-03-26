# Flight Booking Application
This is a Flight booking application which is done with `Ruby on rails` and `Bootstrap 4.4.` 
Hosted on Heroku - [FBA-Commutatus](https://fba-commutatus.herokuapp.com/).

## Introduction

This application has a rich user friendly UI and UX, authentication which is handled by `Devise` gem. 
The key features about this application are -

- Proper authentication, for users and admin accounts.
- The admins can delete any of the trips or aeroplanes of that fact which would inturn delete all the passengers and also the tickets. 
- Admins can set the aeroplane capacity which is automatically calculated using `before_save` from the rows and columns of different classes which are set as well. 
- On further creating / booking a ticket an email sent to the passenger through the `SMTP` server set up with rails on the server. Here one user can have or create many passengers and book tickets for them.
- On updating the ticket the updated fares are also updated and the passengers are sent an email with the updated ticket.

## Instructions
To run the application you need to do a few things : 

- Run `rails server` followed by `rails db:migrate` ( or rake )
- Change your `development.rb` file credentials to match your account details. 
( The email which you want to send tickets from. )
- If you're going to use it in production do the same changes in `production.rb` file as well. 
- [Development.rb](config/environments/development.rb) & [Production.rb](config/environments/production.rb)

## Schema Structure 

```
user.rb -
  has_many :passengers

aeroplane.rb -
    has_many :trips, dependent: :destroy
    has_many :passengers

passenger.rb -
    belongs_to :user
    has_many :tickets, dependent: :destroy
    has_many :trips, through: :tickets

trip.rb -
    belongs_to :aeroplane
    has_many :tickets, dependent: :destroy
    has_many :passengers, through: :tickets

ticket.rb -
    belongs_to :passenger
    belongs_to :trip
    accepts_nested_attributes_for :passenger
```

## Making use of Helpers
In this case I filled them up with functions which you can always use ( alot of times in your views for formatting things. ). In your `Application_helper.erb` add functions such as parsing Time and date formats to be readable ones. Call these from your views so these get called on runtime. 
Make sure to add this to your controller for the view you're trying to call it -
`helper :application`

## Creating Admins
On localhost get into the console by -
- `rails console` and now assign a user you want to make it admin. An example active record query would be : 
- ```
  @user = User.where(email: "youremailinDB")
  @user.admin = true
  @user.save
  ```
- This will make that user an admin now. Refresh the page and it'll be redirected to the `aeroplanes_path`
- For **Heroku** : SSH into the server or just run -
  `heroku run rails console`, this will run the console in the heroku remote server and execute the exact same steps above.

## Screenshots
Will be updated in a short while.

## Useful links and references 

- [Official Documentation](https://guides.rubyonrails.org/getting_started.html)
- [Select2](https://medium.com/@psmy/rails-6-stimulus-and-select2-de4a4d2b59e4)
- [Action Mailers with SMTP](https://dev.to/morinoko/sending-emails-in-rails-with-action-mailer-and-gmail-35g4)
- [Chosen](https://harvesthq.github.io/chosen/)
- [Slim](http://slim-lang.com/)
- [Coffee Script](https://coffeescript.org/)
- [Devise Auth](https://github.com/heartcombo/devise)
- [Simple Calendar](https://github.com/excid3/simple_calendar)

_Thank you, for stopping by_          
 
