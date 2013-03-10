# Authpro

Authpro is a simple authentication generator for Rails. It:

* Gives you sign up, log in, remember me & password reset funtionality
* Has no hidden code, weird sub classing or mixins
* Has no configuration
* Can be removed from the Gemfile after the generator has been executed.

Authpro assumes you want:

* User as the model
* Email for login
* Erb for views. This might be configurable in the future because I like writing views using Slim.

However, you can easily change the code that Authpro generates if you want to. It's just simple Ruby / Rails code.

To be honest you really should change the generated code. Most of the code in the user model should be moved to a different place. You can use the new concerns functionality in Rails 4. More information about concerns can be found [here](http://37signals.com/svn/posts/3372-put-chubby-models-on-a-diet-with-concerns).

If concerns concerns you, you can always extract the code into Service Objects. More info about Service Objects can be found [here](http://railscasts.com/episodes/398-service-objects).

## Installation

Add this line to your application's Gemfile:

    gem 'authpro'

And then execute:

    $ bundle

Run the generator:
    
    $ rails generate authpro

Start server:
    
    $ rails server

Open browser:

    $ open http://localhost:3000

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request