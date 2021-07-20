class Sidebar::ComponentController < ApplicationController
  include TurboComponent::Concerns::Controller

  # Category.after_create_commit lambda {
  #   broadcast_replace_to('sidebar', target: 'sidebar', content: TurboComponent::Helpers.new().turbo_component_inline_frame(:sidebar, {}))
  # }

  display :show
  def show
    @categories = Category.all
    @categories = @categories.where('name like :name', name: "%#{params[:name]}%") if params[:name]
  end

  post :toggle_categories
  def toggle_categories
    session[:show_categories] = !session[:show_categories]
    show
    render :show
  end
end
