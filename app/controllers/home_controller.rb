class HomeController < ApplicationController
  layout false

  def status
    render text: ActiveRecord::Migrator.current_version
  end

  def about
  end

  def contact
  end

  def guidance
  end

  def terms
  end

  def teacherhome
  end

  def teacherfaq
  end
end