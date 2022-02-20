module Battle
  module Board
    module Hit
      class Component < ApplicationComponent
        option :hit, default: proc { 'hit' }
        option :player, default: proc { 'main-player' }

        def call
          content_tag(:span, nil, class: hit_class_name)
        end

        def hit_class_name
          class_name(:hit, hit, player)
        end
      end
    end
  end
end
