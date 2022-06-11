require_relative '../controllers/admin_controller.rb'

class AdminView

    def initialize
    end

    def adminDashboard
        puts "\n"
        puts "{{ {  {   { 📦 | INVENTAIRE DU MAGASIN | 📦 }   }  } }}\n"
        puts "\nque veux-tu faire ?"
        puts "1. #{"Ajouter un Objet".blue}"
        puts "2. Afficher tous les Objet"
        puts "3. Afficher tous les Objet par #{"prix croissant".yellow}"
        puts "4. Afficher tous les Objet par #{"prix décroissant".yellow}"
        puts "5. #{"Modifier".green} un Objet."
        puts "6. #{"Supprimer".yellow} un Objet"
        print "0. #{"Quitter l'inventaire".red}\n>"
    end
end

# Adrien Benaceur
