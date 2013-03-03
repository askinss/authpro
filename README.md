# Authpro

auth-pro is a simple authenication generator for Rails. It:

* Gives you sign up, log in, remember me & password reset funtionality
* Has no external dependencies
* Has no hidden code, weird sub classing or mixins
* Has no configuration

auth-pro assumes you want:

* User as the model
* Email for login
* Erb for views

However, you can easily change the code that auth-pro generates if you want to. It's just simple Rails code.

To be honest you really should change the code. Most of the code in the user model should be moved to a different place but it's 
up to you if you want to move it into concerns ala Rails 4 or extract the logic into Service Objects.