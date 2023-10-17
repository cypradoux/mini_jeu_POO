require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "| Bienvenu sur 'Ils veulent tous ma POO' !        |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "---------------------------------------------------"

puts "Quel est ton prénom ?"
name = gets.chomp
player3 = HumanPlayer.new(name)
puts "Le joueur #{name} a été créé"

player1 = Player.new("Joséphine")
player2 = Player.new("José")
enemies = [player1, player2]

puts "Deux ennemis ont été créé, #{player1.name} et #{player2.name}"

while player1.life_points > 0 || player2.life_points > 0 && player3.life_points > 0
    puts "Voici l'état des joueurs :"
    puts
    puts player1.show_state
    puts player2.show_state
    puts player3.show_state
    puts "--------------"
    puts "Passons à la phase d'attaque : FIGHT !"
    puts
    
        if player1.life_points <= 0 && player2.life_points <= 0
            break
        else
            puts "Les ennemis t'attaquent !"
            enemies.each do |enemie|
                if enemie.life_points >= 0
                    enemie.attacks(player3)
                    puts
                else
                end
            end
        end

        if player3.life_points <= 0
            break
        else
            puts
            puts "Quelle action veux-tu effectuer ?"
            puts "a - Chercher une meilleure arme"
            puts "s - Chercher à se soigner"
            puts "attaquer un joueur en vue :"
            print "0 - "
            puts player1.show_state.to_s
            print "1 - " 
            puts player2.show_state.to_s
            answer = gets.chomp.to_s
            puts
            if answer == "a"
                player3.search_weapon
            elsif answer == "s"
                player3.search_health_pack
            elsif answer == "0"
                player3.attacks(player1)
            elsif answer == "1"
                player3.attacks(player2)
            else
                puts "Saisi une des commandes (a ; s ; 0 ; 1)"
            end
            puts gets.chomp
        end
end

puts "La partie est terminée"

if player3.life_points > 0
    puts "████████████████████████████████████████████████████████████████████████"
    puts "███████████████████Bravo tu as gagné la partie !!███████████████████████"
    puts "████████████████████████████████████████████████████████████████████████"
else puts "Loser, tu as perdu pauvre naze !"
end
