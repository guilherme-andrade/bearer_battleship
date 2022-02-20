require 'dry-initializer'

class ApplicationComponent < ViewComponentReflex::Component
  extend Dry::Initializer

  option :key, default: proc { initialize_key }
  option :class_names, default: proc { {} }

  delegate :inline_svg_pack_tag, to: :view_context

  def self.stimulus_controller
    super.chomp('--')
  end  

  def identifier(component = nil)
    @identifier ||= (component || self.class)
                      .name
                      .sub(/::Component/, '')
                      .underscore
                      .dasherize
                      .split('/')
                      .join('--')
  end

  def component_target(element, component: nil)
    "#{identifier(component)}.#{element}"
  end

  def component_action(*actions, component: nil)
    actions.map do |action|
      action, function = action.split('->')
      "#{action}->#{identifier(component)}##{function}"
    end.join(' ')
  end

  def class_name(element = nil, *modifiers, component: nil)
    classes = []
    base = [identifier(component), element.to_s.dasherize].join('__')
    classes.push base
    classes.push *modifiers.compact.map { |modifier| [base, modifier.to_s.dasherize].join('--') }
    classes.push *class_names[element] if class_names
    classes.join(' ')
  end

  def initialize_key
    @key = ''
    @key += identifier(self.class)
    @key += collection_key.to_s if collection_key
    @key
  end

  def safe_instance_variables
    super.reject { |ivar| ivar.to_s.start_with?("@__vc") }
  end
end
