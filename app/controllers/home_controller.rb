class HomeController < ApplicationController
  caches_page :about, :contact, :guidance, :index, :teacherfaq, :teacherhome, :terms

  layout 'home'

  def status
    render plain: ActiveRecord::Migrator.current_version, layout: false
  end
end