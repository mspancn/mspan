class HomeController < ApplicationController
  include Accessible
  before_action :check_user, except: [:status, :video_requirement]

  caches_action :about, :contact, :guidance, :index, :teacherfaq, :teacherhome, :terms, :video_requirement, expires_in: 1.day

  layout 'home'

  def status
    render plain: ActiveRecord::Migrator.current_version, layout: false
  end

  def video_requirement
    render 'video_requirement', layout: 'application'
  end
end