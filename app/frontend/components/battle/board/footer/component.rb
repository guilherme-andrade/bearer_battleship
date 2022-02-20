module Battle
  module Board
    module Footer
      class Component < ApplicationComponent
        option :title

        def call
          content_tag(:footer, class: class_name(:wrapper)) do
            html = []
            html << content_tag(:div, title, class: class_name(:title))
            html << content_tag(:div, content, class: class_name(:content))

            html.join.html_safe
          end
        end
      end
    end
  end
end
