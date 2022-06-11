require_relative '../views/shop.rb'
require_relative 'item_controller.rb'
require 'colorize'

class ShopController
    def initialize
        @shop_view = ShopView.new
        @app_controller = AppController.new
        @item_controller = ItemController.new
        @all_items = @item_controller.all
    end

    def show_items(list)
        @shop_view.item_list(list)
    end

    def show_item
        while(true)
            print "Quel Objet voulez-vous voir ? (Il y en a #{@all_items.length})\n>"
            item_id = gets.chomp.to_i
            if (item_id >= 0 && item_id <= @all_items.length - 1)
                break
            else
                puts "\nObjet Indisponible\n\n".red
            end
        end
        puts "\nObjet Disponible".green
        @shop_view.item(@all_items[item_id - 1])
        return (item_id - 1)
    end

    def create_item(seller = 'shop')
        while (true)
            puts "\nQuel type d'objet voulez-vous ajouter en magasin ?\n\n"
            puts '1.Objet Générique'
            puts '2.Poster'
            puts '3.Chaussure'
            puts '4.Disque Dur'
            choice = gets.chomp.to_i
            if (choice >= 1 && choice <= 4)
                @item_controller.createFromType(choice, seller)
                break
            end
            puts "Choix Indisponible".red
        end
    end

    def return_menu
        @shop_view.menu
        return
    end
end

# Adrien Benaceur
