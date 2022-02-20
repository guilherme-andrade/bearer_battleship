module Battle
  module Board
    module Graveyard
      class Component < ApplicationComponent
        option :player, default: proc { nil }
        option :battlefield, default: proc { {} }

        def render_ship(ship, size)
          text = ship.to_s.capitalize + [' (', size.to_s, ' blocks)'].join
          content_tag :div, text, class: ship_class_name(ship)
        end

        def ship_class_name(ship)
          sunk = ship_sunk?(ship.to_s) ? 'sunk' : nil

          class_name(:ship, sunk)
        end

        def ship_sunk?(ship)
          battlefield.ship_sunk?(player, ship)
        end
      end
    end
  end
end
