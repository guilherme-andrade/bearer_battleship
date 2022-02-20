module Layout
  module Header
    class Component < ApplicationComponent
      TEXT = 'Based on the great work of unfold.co'.freeze

      def call
        content_tag(:header, class: class_name(:header)) do
          inline_svg_pack_tag('assets/images/logo.svg', class: class_name(:logo)) +
            content_tag(:span, TEXT, class: class_name(:text))
        end
      end
    end
  end
end
