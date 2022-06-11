class UserView

    def initialize
    end

    def userDashboard
        puts "\n"
        puts "{{ {  {   { 🛒 | MAGASIN | 🛒 }   }  } }}\n\n"
        puts "1.#{"Ajouter".blue} un Objet"
        puts "2.#{"Choisir".blue} un Objet"
        puts "3.Afficher tous les objets"
        puts "4.Afficher par ordre de #{"prix croissant".yellow}"
        puts "5.Afficher par ordre de #{"prix décroissant".yellow}"
        puts "6.Afficher par #{"type".yellow}\n7.Afficher les objets du #{"Magasin".yellow}"
        puts "8.Afficher les objets des #{"Utilisateurs".yellow}"
        print "0.#{"Quitter le magasin".red}\n>"
    end
end

# Adrien Benaceur
