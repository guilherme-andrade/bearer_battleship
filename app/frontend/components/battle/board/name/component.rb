module Battle
  module Board
    module Name
      class Component < ApplicationComponent
        option :variant, default: proc { nil }, optional: true
        option :text, default: proc { 'Heading' }, optional: true

        def call
          content_tag(:h3, text, class: class_name(:heading, variant))
        end
      end
    end
  end
end

