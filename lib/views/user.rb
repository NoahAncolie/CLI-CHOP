class UserView

    def initialize
    end

    def userDashboard
        puts "\n"
        puts "{{ {  {   { 🛒 | MAGASIN | 🛒 }   }  } }}\n\n"
        puts "1.#{"Ajouter".blue} un Item"
        puts "2.#{"Choisir".blue} un Item"
        puts "3.Afficher tous les items"
        puts "4.Afficher par ordre de #{"prix croissant".yellow}"
        puts "5.Afficher par ordre de #{"prix décroissant".yellow}"
        puts "6.Afficher par #{"type".yellow}\n7.Afficher les items du #{"Magasin".yellow}"
        puts "8.Afficher les items des #{"Users".yellow}"
        print "0.#{"Revenir en arrière".red}\n>"
    end
end

# Adrien Benaceur