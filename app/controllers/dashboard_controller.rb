class DashboardController < ApplicationController
  include Apotomo::Rails::ControllerMethods

  has_widgets do |root|
    root << widget(:twitter_widget, 'parrot', :show)
  end

  def index
  end
end
