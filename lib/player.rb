class Player
    attr_accessor :name, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10

    end

    def show_state
        if @life_points > 0
        print "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
        else print "le joueur #{@name} est mort"
        end
    end

    def gets_damage(damage_received)
        @life_points = @life_points - damage_received
        if @life_points <= 0
            puts "Le joueur #{@name} est mort"
        else
        end
    end

    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        damage_received = compute_damage
        puts "Il lui inflige #{damage_received} points de dommages"
        player.gets_damage(damage_received)

    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 100
        @weapon_level = 1
    end

    def compute_damage
        return rand(1..6) * weapon_level
    end

    def search_weapon
        weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_level} !"

        if weapon_level > @weapon_level
            @weapon_level = weapon_level
            puts "Super, tu as augmenté le niveau de ton arme !"
        else 
            @weapon_level
            puts "L'arme que tu viens de trouver est éclatée au sol, garde la tienne"
        end
    end

    def search_health_pack
        health_pack = rand(1..6)
        if health_pack == 1
            puts "Tu n'as rien trouvé poto"
        elsif health_pack >= 2 && health_pack <= 5
            if @life_points <= 50
                @life_points = @life_points + 50
            else
            health_gain = 100 - @life_points
            @life_points = @life_points + health_gain
            end
            puts "Bravo tu as trouvé un putain de pack à 50 pv"
            else health_pack == 6
            if @life_points <= 80
                @life_points = @life_points + 80
            else
                health_gain = 100 - @life_points
            @life_points = @life_points + health_gain
            end
            puts "Waow tu as trouvé un putain de pack à 80 pv"
        end
    end

end