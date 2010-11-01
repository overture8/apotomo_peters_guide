class DashboardController < ApplicationController
  include Apotomo::Rails::ControllerMethods

  has_widgets do |root|
    root << widget("twitter/panel", 'parrot', :display_form)
    root << widget("twitter/trashbin_widget", 'bin', :title => "Trash tweets here!")
  end

  def index
  end
end
