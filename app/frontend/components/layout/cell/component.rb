module Layout
  module Cell
    class Component < ApplicationComponent
      def call
        content_tag(:div, content, class: class_name(:cell))
      end
    end
  end
end
