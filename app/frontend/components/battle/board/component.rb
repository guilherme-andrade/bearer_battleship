module Battle
  module Board
    class Component < ApplicationComponent
      renders_one :header, Name::Component
      renders_one :footer, Footer::Component

      def call
        content_tag(:article, class: class_name(:board)) do
          header_html = content_tag(:header, header, class: class_name(:header))
          body_html = content_tag(:section, content, class: class_name(:body))
          footer_html = content_tag(:footer, footer, class: class_name(:footer))

          [header_html, body_html, footer_html].join.html_safe
        end
      end
    end
  end
end
