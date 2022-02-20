module Battle
  module Board
    module Grid
      module Letter
        class Component < ApplicationComponent
          option :letter, default: proc { 'A' }, optional: true

          def call
            content_tag(:span, letter, class: cell_class_name)
          end

          def cell_class_name
            class_name(:letter)
          end        
        end
      end
    end
  end
end
