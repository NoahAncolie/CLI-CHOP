require_relative 'admin'
require 'colorize'

class ShopView
    def initialize
    end

    def menu
        puts "\n\n{{ {  {   { 🏠 | ACCUEIL | 🏠 }   }  } }}"
        puts "\nVous êtes ?"
        puts "1. #{"Administrateur".blue} 🛡️"
        puts "2. #{"Utilisateur".blue} 👤"
        puts "0. #{"Sortir".red} 🚪🚶"
        print ">"
    end

    def item_list(list)
        puts "\n{{ {  {   { 🦑 | OBJETS | 🦑 }   }  } }}\n\n"
        list.each do |item|
            puts "#{item[0]}.#{item[1]}"
            if (item[7] == "hard drive")
                puts "#{"   Storage".yellow} #{item[9]}"
            end
            print "\n"
        end
    end

    def item(item)
        puts "\n💎 #{item[1]} 💎"
        puts"#{"coût".blue} : #{item[2]}"
        puts"#{"quantité".blue} : #{item[3].to_i <= 0 ? "Rupture de stock" : item[3]}"
        puts"#{"marque".blue} : #{item[4]}"
        puts"#{"description".blue} : #{item[5]}"
        if (item[7] != 'other')
            puts "#{"Taille".blue} : #{item[6]}"
        end
        if (item[7] == "hard drive")
            puts "#{"Storage".blue} #{item[9]}"
        end
        puts"#{"Color".blue} : #{item[8]}"
        if (item[10] != 'shop')
            puts "#{"Contact du vendeur".blue} : #{item[10]}"
        end
    end
end

# Adrien Benaceur
