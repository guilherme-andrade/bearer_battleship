module ViewComponentExt
  module Storybook
    module MethodArgs
      module MethodParametersNames
        module DryInitializable
          def supports_keyrest?
            super || defined?(Dry::Initializer::Mixin::Root) && target_method.owner == Dry::Initializer::Mixin::Root
          end
        end
      end
    end
  end
end
