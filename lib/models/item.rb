require 'csv'
require 'colorize'

class Item

    def initialize(seller, id)
        print "Nom\n>"
        @name = gets.chomp
        print "Prix\n>"
        @price = gets.chomp
        print "Quantité\n>"
        @quantity = gets.chomp
        print "Marque\n>"
        @brand = gets.chomp
        print "Description\n>"
        @description = gets.chomp
        print "Couleur\n>"
        @color = gets.chomp
        @item = {id: id, name: @name, price: @price, brand: @brand, quantity: @quantity, description: @description, size: "", type: "other", color: @color, storage: "", seller: @seller}
    end

    def save
        File.open("db/items.csv", 'a+') { |f| f.write("\n#{@item[:id]},#{@item[:name]},$#{@item[:price]},#{@item[:quantity]},#{@item[:brand]},#{@item[:description]},#{@item[:size]},#{@item[:type]},#{@item[:color]},#{@item[:storage]},#{@item[:seller]}")}
    end

    def check
        errors = []
        success = true
        if (@item[:name].length < 3 || @item[:brand].length < 3 || @item[:color].length < 3)
            errors.push("·Le nom de l'item, de la marque et la couleur doivent faire au moins 3 caractères de long".red)
            success = false
        end
        if (@item[:price].to_i <= 0 || @item[:quantity].to_i < 0)
            errors.push("·Le prix et la quantité doivent être supérieur à 0".red)
            success = false
        end
        if (@item[:description].length < 10)
            errors.push("·La description doit faire au moins dix caractères de long".red)
            success = false
        end
        unless (success)
            puts errors
        end
        return (success)
    end
end

# Adrien Benaceur