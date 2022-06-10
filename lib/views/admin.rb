require_relative '../controllers/admin_controller.rb'

class AdminView

    def initialize
    end

    def adminDashboard
        puts "\n"
        puts "{{ {  {   { 📦 | INVENTAIRE DE MAGASIN | 📦 }   }  } }}\n"
        puts "\nque veux-tu faire ?"
        puts "1. #{"Ajouter un Item".blue}"
        puts "2. Afficher tous les Items"
        puts "3. Afficher tous les Items par #{"prix croissant".yellow}"
        puts "4. Afficher tous les Items par #{"prix décroissant".yellow}"
        puts "5. #{"Modifier".green} un Item."
        puts "6. #{"Supprimer".yellow} un Item"
        print "0. #{"Quitter le dashboard".red}\n>"
    end
end

# Adrien Benaceur