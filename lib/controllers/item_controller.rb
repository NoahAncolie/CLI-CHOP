require 'colorize'
require_relative "../models/item.rb"
require_relative "../models/harddrive.rb"
require_relative "../models/poster.rb"
require_relative "../models/shoe.rb"
require_relative "../views/shop.rb"

class ItemController

    def initialize
        @shop_view = ShopView.new
        @all_items = self.all
    end

    def create(item, typeNb, seller)
        @item = item
        if (@item.check)
            @item.save
            puts "\nObjet Crée avec Succès et Ajouté en Base :) !\n\n".green
        else
            self.createFromType(typeNb, seller)
        end
    end

    def createFromType(typeNb, seller)
        case typeNb
            when 1
                self.create(Item.new(seller, @all_items.length + 1), typeNb, seller)
            when 2
                self.create(Poster.new(seller, @all_items.length + 1), typeNb, seller)
            when 2
                self.create(Shoe.new(seller, @all_items.length + 1), typeNb, seller)
            when 3
                self.create(HardDrive.new(seller, @all_items.length + 1), typeNb, seller)
        end
    end

    def destroy(item_id)
        item_array = self.all 
        item_array.delete_at(item_id)

        while (item_id < item_array.length)
            item_array[item_id][0] = item_id + 1
            item_id += 1
        end
        CSV.open('db/items.csv', 'w') do |csv|
        end
        item_array.each do |item|
            File.open("db/items.csv", 'a+') { |f| f.write("#{item[0]},#{item[1]},#{item[2]},#{item[3]},#{item[4]},#{item[5]},#{item[6]},#{item[7]},#{item[8]},#{item[9]},#{item[10]},#{item[11]}\n")}
        end
    end

    def editing_fields(item_id)
        puts "Que voulez-vous éditer ?\n\n"
        puts "1.Le nom"
        puts "2.Le prix"
        puts "3.La quantité"
        puts "4.La marque"
        puts "5.La description"
        puts "6.La taille"
        puts "7.Le type"
        puts "8.La couleur"
        print "9.Le storage\n>"
        params = gets.chomp.to_i
        if (params <= 0 || params > 9)
            puts "\nChoix indisponible\n\n".red
            return (self.editing_fields(item_id))
        end
        self.edit(item_id, params)
        puts "\nL'Objet a été édité".green
        @shop_view.item(self.all[item_id])
        print "Continuer d'éditer ? (y/n)\n>"
        params = gets.chomp
        if (params == "n")
            return
        end
        self.editing_fields(item_id)
    end

    def all
        @items = Array.new
        CSV.open("db/items.csv").each do |ligne|
            @items << ligne
        end
        return (@items)
    end

    def buy(item_id, quantity)
        item_array = self.all
        item_array[item_id][3] = item_array[item_id][3].to_i - quantity
        CSV.open('db/items.csv', 'w') do |csv|
        end
        i = 0;
        while (i < item_array.length - 1)
            item = item_array[i]
            File.open("db/items.csv", 'a+') { |f| f.write("#{item[0]},#{item[1]},#{item[2]},#{item[3]},#{item[4]},#{item[5]},#{item[6]},#{item[7]},#{item[8]},#{item[9]},#{item[10]},#{item[11]}\n")}
            i += 1
        end
        item = item_array[i]
        File.open("db/items.csv", 'a+') { |f| f.write("#{item[0]},#{item[1]},#{item[2]},#{item[3]},#{item[4]},#{item[5]},#{item[6]},#{item[7]},#{item[8]},#{item[9]},#{item[10]},#{item[11]}")}
        puts "\nObjet acheté avec succès\n\n".green
    end

    def allSorted
        return @all_items.sort { |a,b| a[1] <=> b[1] }
    end

    def sortByDescending(list, index)
        return list.sort { |a,b| b[index] <=> a[index] }
    end

    def sortByAscending(list, index)
        return list.sort { |a,b| a[index] <=> b[index] }
    end

    def onlyType(list, itemType)
        return list.select { |item| item[7] == itemType}
    end

    def onlyFromShop(list, fromShop = true)
        return fromShop ? list.select { |item| item[10] == 'shop' } : list.select { |item| item[10] != 'shop' }
    end

    private

    def edit(item_id, field_id)
        item_array = self.all
        edited_field = ""

        while (edited_field.length <= 0)
            print "Nouvelle valeur\n>"
            edited_field = gets.chomp
        end
        if (field_id == 2)
            edited_field= "$#{edited_field}"
        end

        item_array[item_id][field_id] = edited_field

        CSV.open('db/items.csv', 'w') do |csv|
        end
        i = 0;
        while (i < item_array.length - 1)
            item = item_array[i]
            File.open("db/items.csv", 'a+') { |f| f.write("#{item[0]},#{item[1]},#{item[2]},#{item[3]},#{item[4]},#{item[5]},#{item[6]},#{item[7]},#{item[8]},#{item[9]},#{item[10]},#{item[11]}\n")}
            i += 1
        end
        item = item_array[i]
        File.open("db/items.csv", 'a+') { |f| f.write("#{item[0]},#{item[1]},#{item[2]},#{item[3]},#{item[4]},#{item[5]},#{item[6]},#{item[7]},#{item[8]},#{item[9]},#{item[10]},#{item[11]}")}
    end
end

# Adrien Benaceur
