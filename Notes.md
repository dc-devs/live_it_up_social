Steven Review
=============

## Startup and Build

Yay!  It worked.

## Seeds

They tell me what the basic model of this app universe is.  So thanks for
writing a good one.  Just watch out for trailing whitespace and indentation.

## Tests

* Don't commit empty tests
* You have broken test bc your imlementation of current_user is whack
* Also don't need to call it `@_current_user`, `@_current_user` should suffice
* You don't have probably enough coverage from what I saw in the demo, so some
  more tests would be advised, but you are writing them (yay) and writing them
  in a sensible fashion with focus on particular conditions and cases that need
  to be tested, so....yay!
* Your model tests aren't testing a lot of methods that are built onto the
  model clases.  This would imply that you are not doing a lot of work in the
  models besides allowing them to be ActiveRecord::Base subclasses.  I hope
  this is the case.

## Env

Try using dotenv gem to specify your twilio dependencies


## AuthenticationsController

This is an opportunity to practice some AWESOME OO skill.

Why not create a class called an

AuthenticationProcessor.new(params).authenticate!

## Controllers

All methods in a controller are conceived of as being available via HTTP
routes.  If you want a method to be in a controller but be cued as being a
"helper" you put it beneath a `private` block

## Views

* typically class names are `set-like-this`
* mind your indentation.....it's important even though it seems trivial

## JS

* Perfect scrollbar file probably belongs in vendor/javascripts

You're using basic eventy-jQuery, not any OO JS.  This may not be a problem for
a small site that's basically a RAILS app.  If you were to go more into a JS
app kind of focus, then you probably want to be a bit more sophisticated in how
you're approaching the JS design.

My main comment here is that you should have 1 and only 1 call to
document.ready and that means you will have to build several other JS functions
which apply event handling which are called from that document.ready call.

## N+1 error

Activites#index is prob. slow because of N+1 error, see Rails Guide
