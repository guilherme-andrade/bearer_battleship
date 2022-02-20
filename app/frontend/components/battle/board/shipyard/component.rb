module Battle
  module Board
    module Shipyard
      class Component < ApplicationComponent
        option :player, default: proc { nil }
        option :battlefield, default: proc { {} }

        def render_ship(ship)
          already_placed = ship_placed?(ship)
          render Battle::Board::Ships::Ship::Component.new(ship: ship, placed: already_placed)
        end

        def ship_placed?(ship)
          battlefield.ship_placed?(player, ship)
        end
      end
    end
  end
end
