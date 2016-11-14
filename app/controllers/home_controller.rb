class HomeController < ApplicationController
  layout false

  def status
    render text: ActiveRecord::Migrator.current_version
  end
end
