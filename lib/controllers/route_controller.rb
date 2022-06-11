require_relative '../views/admin.rb'
require_relative '../views/shop.rb'
require_relative '../views/user.rb'
require_relative 'app_controller.rb'
require_relative 'item_controller.rb'

class RouteController

    def initialize
        @admin_view = AdminView.new
        @shop_view = ShopView.new
        @user_view = UserView.new
        @app_controller = AppController.new
        @item_controller = ItemController.new
    end

    def show_shop
        @shop_view.menu
        @app_controller.menu
    end
end

# Adrien Benaceur
