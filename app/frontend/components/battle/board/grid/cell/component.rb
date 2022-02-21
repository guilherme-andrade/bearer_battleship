module Battle
  module Board
    module Grid
      module Cell
        class Component < ApplicationComponent
          option :player, default: proc { 'opponent' }
          option :bombed, default: proc { false }
          option :coordinates, default: proc { nil }
          option :ship_part, default: proc { 'front' }
          option :direction, default: proc { 'top' }

          alias bombed? bombed

          def call
            component_controller(data: { testid: "cell" }) do
              reflex_tag('click->bomb', :span, nil, class: class_name(:cell, player, hit_or_miss), data: { action: component_action('dragover->dragging', 'drop->placeShip'), cell: coordinates, part: ship_part }) do
                html = []
                
                html << render_ship if ship_part && player != 'opponent'
                html << render_hit if bombed?

                html.join.html_safe
              end
            end
          end

          def bomb
            stimulate 'Battle::Component#bomb', { key: battlefield_key, player: player, coordinates: coordinates }
            prevent_refresh!
          end

          def render_ship
            render(Ships::Atom::Component.new(part: ship_part, direction: direction)) 
          end

          def render_hit
            render(Hit::Component.new(hit: hit_or_miss, player: player)) 
          end

          def hit_or_miss
            ship_part.present? ? 'hit' : 'miss'
          end

          def collection_key
            return [player, coordinates].join if player && coordinates

            nil
          end

          def battlefield_key
            Battle::Component.new.key
          end
        end
      end
    end
  end
end
