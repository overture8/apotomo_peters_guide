class DashboardController < ApplicationController
  include Apotomo::Rails::ControllerMethods

  has_widgets do |root|
    root << widget(:twitter_widget, 'parrot', :display_form)
    root << widget(:trashbin_widget, 'bin', :display)
    root.respond_to_event :tweetDeleted, :with => :redraw, :on => 'parrot'
  end

  def index
  end
end
