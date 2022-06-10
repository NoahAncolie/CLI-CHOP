require_relative 'shop_controller.rb'
require_relative '../views/shop.rb'
require_relative '../views/admin.rb'
require_relative 'item_controller.rb'

class AdminController < ShopController

    def initialize
        @shop_view = ShopView.new
        @admin_view = AdminView.new
        @item_controller = ItemController.new
        @all_items_sorted = @item_controller.allSorted
        @all_items = @item_controller.all
    end

    def adminDashboardControl
        params = gets.chomp.to_i
              
        case params
            when 1
                self.create_item
            when 2
                self.show_items(ItemController.new.all_items_sorted)
            when 3
                self.show_items(@item_controller.sortByAscending(ItemController.new.all_items_sorted, 2))            
            when 4
                self.show_items(@item_controller.sortByDescending(ItemController.new.all_items_sorted, 2))
            when 5
                self.update_item
            when 6
                self.delete_item
            when 0
                puts "A bientôt !"
                return (self.return_menu)
            else
                puts "Ce choix n'existe pas, merci de ressayer".red
        end
        @admin_view.adminDashboard
        self.adminDashboardControl
    end

    def delete_item
        while(true)
            print "Quel Item voulez-vous Supprimer ? (Il y en a #{@all_items.length})\n>"
            item_id = gets.chomp.to_i
            if (item_id >= 0 && item_id - 1 <= @all_items.length)
                break
            else
                puts "\nItem Inexistant\n\n".red
            end
        end
        puts "\nItem trouvé !".green
        @shop_view.item(@all_items[item_id - 1])
        print "Êtes-vous sûr de vouloir le détruire ? (y/n)\n>"
        params = gets.chomp
        if (params == "n")
            return
        end
        @item_controller.destroy(item_id - 1)
        puts "Item Détruit !".green
    end

    def update_item
        while(true)
            print "Quel Item voulez-vous Modifier ? (Il y en a #{@all_items.length})\n>"
            item_id = gets.chomp.to_i
            if (item_id >= 0 && item_id - 1 <= @all_items.length)
                break
            else
                puts "\nItem Inexistant\n\n".red
            end
        end
        puts "\nItem trouvé !".green
        @shop_view.item(@all_items[item_id - 1])
        @item_controller.editing_fields(item_id - 1)
        puts "Item Édité !".green
    end
end

# Adrien Benaceur