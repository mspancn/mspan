class HomeController < ApplicationController
  layout 'home'

  def status
    render text: ActiveRecord::Migrator.current_version, layout: false
  end
end