require_relative 'lib/controllers/route_controller.rb'

class App
    def initialize
        @router = RouteController.new
    end

    def perform
        @router.show_shop
    end
end

app = App.new
app.perform