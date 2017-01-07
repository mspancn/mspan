class HomeController < ApplicationController
  include Accessible
  before_action :check_user, except: [:status]

  caches_action :about, :contact, :guidance, :index, :teacherfaq, :teacherhome, :terms, expires_in: 1.day

  layout 'home'

  def status
    render plain: ActiveRecord::Migrator.current_version, layout: false
  end
end