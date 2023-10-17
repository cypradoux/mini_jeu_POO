require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Joséphine")
puts "A ma droite #{player1.name} !"
player2 = Player.new("José")
puts "A ma gauche #{player2.name} !"

while player1.life_points > 0 && player2.life_points > 0
puts "Voici l'état des deux joueurs :"
puts
puts player1.show_state
puts player2.show_state
puts "--------------"
puts "Passons à la phase d'attaque : FIGHT !"
puts

    if player1.life_points <= 0
        break
    else
        puts player1.attacks(player2)
    end

    if player2.life_points <= 0
        break
    else 
        puts player2.attacks(player1)
    end
end

binding.pry