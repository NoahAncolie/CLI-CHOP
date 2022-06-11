require 'colorize'
require_relative '../views/admin.rb'
require_relative '../views/user.rb'
require_relative '../views/shop.rb'
require_relative 'admin_controller.rb'
require_relative 'user_controller.rb'

class AppController

    def initialize
        @shop_view = ShopView.new
        @admin_view = AdminView.new
        @user_view = UserView.new
        @admin_controller = AdminController.new
        @user_controller = UserController.new
    end

    def menu
        while (true)
            params = gets.chomp.to_i
              
            case params
                when 1
                    puts "Mot de passe : "
                    password = gets.chomp
                    if (password == "123123123")
                        puts "Vous êtes connecté".green
                        @admin_view.adminDashboard
                        @admin_controller.adminDashboardControl
                    else
                        puts ("\n❌ Pas le bon mot de passe ! ❌".yellow)
                        @shop_view.menu
                    end
                when 2
                    @user_view.userDashboard
                    @user_controller.userDashboardControl
                when 0
                    puts "À Bientôt !"
                    break
                else
                    puts "Ce choix n'existe pas, merci de ressayer".red
                    @shop_view.menu
        end
    end
end


end

# Adrien Benaceur
