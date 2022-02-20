module ViewComponentExt
  module Storybook
    module Stories
      module Sidecarable
        def self.prepended(base)
          base.class_eval do
            class<< self
              def load_stories
                Dir["#{stories_path}/**/stories.rb"].sort.each { |file| require_dependency file } if stories_path
              end

              def stories_name
                name.chomp("::Stories").underscore
              end

              def write_csf_json
                json_path = File.join(stories_path, stories_name, "#{stories_name.gsub('/', '_')}.stories.json")
                File.open(json_path, "wb") do |f|
                  f.write(JSON.pretty_generate(to_csf_params))
                end
                json_path
              end
            end
          end
        end
      end
    end
  end
end
