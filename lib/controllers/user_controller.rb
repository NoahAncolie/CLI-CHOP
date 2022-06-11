require_relative 'shop_controller'
require_relative '../views/shop.rb'
require_relative '../views/user.rb'
require_relative 'item_controller.rb'

class UserController < ShopController

    def initialize
        @shop_view = ShopView.new
        @user_view = UserView.new
        @item_controller = ItemController.new
        @all_items_sorted = @item_controller.allSorted
        @all_items = @item_controller.all
    end

    def userDashboardControl
        params = gets.chomp.to_i
      
        case params
            when 1
                puts "==> Création de l'Objet <=="
                puts "Entrez votre numéro de téléphone"
                phone = gets.chomp
                self.create_item(phone)
            when 2
                self.item_options(self.show_item)
            when 3
                self.show_items(@all_items_sorted)
            when 4
                self.show_items(@item_controller.sortByAscending(@all_items_sorted, 2))
            when 5
                self.show_items(@item_controller.sortByDescending(@all_items_sorted, 2))
            when 6
                return (self.chooseItemTypes)
            when 7
                self.show_items(@item_controller.onlyFromShop(@all_items_sorted))
            when 8
                self.show_items(@item_controller.onlyFromShop(@all_items_sorted, false))
            when 0
                puts "A bientôt !"
                return (self.return_menu)
            else
                self.wrong_choice
        end
        @user_view.userDashboard
        self.userDashboardControl
    end

    private

    def chooseItemTypes
        puts "Quel Type d'objets voulez-vous voir ?"
        puts "1.Chaussures"
        puts "2.Posters"
        puts "3.Hard Drives"
        puts "0.Revenir au tableau de bord"
        print ">"
        type = gets.chomp.to_i
        case type
            when 1
                self.chooseItemSort(@item_controller.onlyType(@all_items_sorted, 'shoe'))
            when 2
                self.chooseItemSort(@item_controller.onlyType(@all_items_sorted, 'poster'))
            when 3
                self.chooseItemSort(@item_controller.onlyType(@all_items_sorted, 'hard drive'))
            when 0
                @user_view.userDashboard
                self.userDashboardControl
            else
                self.wrong_choice
                self.chooseItemTypes
        end
    end

    def chooseItemSort(list)
        puts "Comment voulez-vous les voir arrangés ?"
        puts "1.Par ordre #{"Alphabétique".yellow}"
        puts "2.Par ordre de #{"prix Croissant".yellow}"
        puts "3.Par ordre de #{"prix Décroissant".yellow}"
        puts "4.Par ordre de #{"taille Croissante".yellow}"
        puts "5.Par ordre de #{"taille Décroissante".yellow}"
        puts "0.Revenir au type d'objets"
        print ">"
        type = gets.chomp.to_i
        case type
            when 1
               self.show_items(list)
            when 2
                self.show_items(@item_controller.sortByAscending(list, 2))
                @user_view.userDashboard
                self.userDashboardControl
            when 3
                self.show_items(@item_controller.sortByDescending(list, 2))
                @user_view.userDashboard
                self.userDashboardControl
            when 4
                self.show_items(@item_controller.sortByAscending(list, 6))
                @user_view.userDashboard
                self.userDashboardControl
            when 5
                self.show_items(@item_controller.sortByDescending(list, 6))
                @user_view.userDashboard
                self.userDashboardControl
            when 0
                self.chooseItemTypes
            else
                self.wrong_choice
                self.chooseItemSort
        end
    end

    def item_options(item_id)
        puts "\n1.Acheter l'objet"
        puts "2.Choisir un autre objet"
        print "0.Revenir au tableau de bord\n>"
        choice = gets.chomp.to_i
        case choice
            when 1
                self.buyItem(item_id)
            when 2
                self.item_options(self.show_item)
            when 0
                return
            else
                self.wrong_choice
                self.item_options(item_id)
        end
    end

    def buyItem(item_id)
        item = @all_items[item_id]
        print "\n#{item[1]} coûte #{item[2]} Combien voulez-vous en acheter ? (#{item[3]} en stock)\n>"
        quantity = gets.chomp.to_i
        if (quantity <= 0 || quantity > item[3].to_i)
            puts "Entrez une quantité valide.".red
            return (self.buyItem(item_id))
        end
        puts "\n#{item[1]} en #{quantity} exemplaires coûte $#{item[2].split('$')[1].to_f * quantity}. Procéder au payment ? (y/n)"
        params = gets.chomp
        if (params == "n")
            return (self.item_options(item_id))
        end
        @item_controller.buy(item_id, quantity)
    end

    private

    def wrong_choice
        puts "\nCe choix n'est pas disponible\n\n".red
    end
end

# Adrien Benaceur
