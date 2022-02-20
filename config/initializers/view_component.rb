components_path = Rails.root.join('app', 'frontend', 'components')

 Rails.application.configure do
   config.view_component.preview_paths ||= []
   config.view_component.preview_paths << components_path
  #  config.view_component_storybook.stories_path = components_path
 end

 ActiveSupport.on_load(:view_component) do
   ViewComponent::Preview.extend ViewComponentContrib::Preview::Sidecarable
  #  ViewComponent::Storybook::Stories.prepend ViewComponentExt::Storybook::Stories::Sidecarable
  #  ViewComponent::Storybook::MethodArgs::MethodParametersNames.prepend ViewComponentExt::Storybook::MethodArgs::MethodParametersNames::DryInitializable
 end
