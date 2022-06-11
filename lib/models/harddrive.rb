require_relative 'item'

class HardDrive < Item
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
        print "Taille\n>"
        @size = gets.chomp
        print "Storage\n>"
        @storage = gets.chomp
        @item = {id: id, name: @name, price: @price, brand: @brand, quantity: @quantity, description: @description, size: @size, type: "hard drive", color: @color, storage: @storage, seller: @seller}
    end

    def check
        errors = []
        success = true
        if (@item[:name].length < 3 || @item[:brand].length < 3 || @item[:color].length < 3)
            errors.push("·Le nom de l'objet, de la marque et la couleur doivent faire au moins 3 caractères de long".red)
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
        unless (/(\d+)(?=(?:\/\d+)*\s*([MGT]B))/.match(@item[:storage]))
            errors.push("·La capacité de storage doit être en MB GB ou TB".red)
            success = false
        end
        unless (success)
            puts errors
        end
        return (success)
    end
end

# Adrien Benaceur
