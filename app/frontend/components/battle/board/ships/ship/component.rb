module Battle
  module Board
    module Ships
      module Ship
        class Component < ApplicationComponent
          option :ship, default: proc { 'destroyer' }
          option :ghost, default: proc { false }
          option :placed, default: proc { false }

          def call
            component_controller class: class_name(:ship, ghost_class, placed_class), draggable: true, data: { action: component_action('dragstart->ghost'), ship: ship } do
              ::Ship::PARTS[ship].reverse.map do |part|
                content_tag :span, class: class_name(:part) do
                  render Atom::Component.new(part: part, direction: 'right', clickable: false)
                end
              end.join.html_safe
            end              
          end

          def ghost_class
            'ghost' if ghost
          end

          def placed_class
            'placed' if placed
          end

          def collection_key
            ship
          end
        end
      end
    end
  end
end
