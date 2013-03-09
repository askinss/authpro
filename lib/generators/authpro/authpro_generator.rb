class AuthproGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_models
    puts "copy_models"
    copy_file "user.rb", "app/models/user.rb"
  end

  # def copy_controllers
  #   puts "copy_controllers"
  #   copy_file "users_controller.rb", "app/controllers/users_controller.rb"
  #   copy_file "sessions_controller.rb", "app/controllers/sessions_controller.rb"
  #   copy_file "password_resets_controller.rb", "app/controllers/password_resets_controller.rb"
  #   copy_file "home_controller.rb", "app/controllers/home_controller.rb"
    
  #   inject_into_file "app/controllers/application_controller.rb", :after => "protect_from_forgery with: :exception\n" do
  #     "   private\n\n" +
  #     "   def current_user\n" +
  #     "     @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]\n" +
  #     "   end\n\n" +
  #     "   helper_method :current_user\n"
  #   end
  # end

  # def copy_views
  #   puts "copy_views"
  #   copy_file "new_user.html.erb", "app/views/users/new.html.erb"
  #   copy_file "new_password_resets.html.erb", "app/views/password_resets/new.html.erb"
  #   copy_file "password_resets_edit.html.erb", "app/views/password_resets/edit.html.erb"
  #   copy_file "new_sessions.html.erb", "app/views/sessions/new.html.erb"
  #   copy_file "application.html.erb", "app/views/layouts/application.html.erb"
  #   copy_file "index.html.erb", "app/views/home/index.html.erb"
  #   copy_file "password_reset.text.erb", "app/views/user_mailer/password_reset.text.erb"
  # end

  # def add_routes
  #   puts "add_routes"
  #   route "resources :password_resets"
  #   route "resources :sessions"
  #   route "resources :users"
  #   route "get 'login' => 'sessions#new', :as => 'login'"
  #   route "get 'signup' => 'users#new', :as => 'signup'"
  #   route "get 'logout' => 'sessions#destroy', :as => 'logout'"
  #   route "root to: 'home#index'"
  # end

  # def copy_mailers
  #   puts "copy_mailers"
  #   copy_file "user_mailer.rb", "app/mailers/user_mailer.rb"
  # end

  # def inject_default_mailer_url_to_dev_env
  #   puts "inject_default_mailer_url_to_dev_env"
  #   inject_into_file "config/environments/development.rb", :after => "config.assets.debug = true\n" do
  #     "  config.action_mailer.default_url_options = { :host => 'localhost:3000' }\n"
  #   end
  # end

  # def gems
  #   puts "gems"
  #   gem("bcrypt-ruby", :require => "bcrypt")
  # end

  # $ rails g model user email:string password_digest:string auth_token:string password_reset_token:string password_reset_sent_at:datetime
  # Use concerns
end