class Player
    attr_accessor :name, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10

    end

    def show_state
        print "#{@name} a #{@life_points} points de vie"
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