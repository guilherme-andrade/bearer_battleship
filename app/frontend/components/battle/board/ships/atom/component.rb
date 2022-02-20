module Battle
  module Board
    module Ships
      module Atom
        class Component < ApplicationComponent
          option :part
          option :direction, default: proc { 'right' }
          option :clickable, default: proc { true }

          IMAGES = {
            'front' => 'assets/images/ship-parts/front.svg',
            'back' => 'assets/images/ship-parts/back.svg',
            'middle' => 'assets/images/ship-parts/middle.svg',
            'back-aircraft-carrier' => 'assets/images/ship-parts/back-aircraft-carrier.svg',
            'front-aircraft-carrier' => 'assets/images/ship-parts/front-aircraft-carrier.svg',
            'front-submarine' => 'assets/images/ship-parts/front-submarine.svg',
          }

          def call
            html = inline_svg_pack_tag(IMAGES[part], class: class_name(:atom, part, direction,))
            html += content_tag(:span, nil, class: class_name(:hitbox, clickable_class))
            html.html_safe
          end

          def clickable_class
            'clickable' if clickable
          end
        end
      end
    end
  end
end
