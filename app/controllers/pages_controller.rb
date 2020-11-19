class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:home]
  before_action :home_page, only: [:home]
  def home
  end

  private

  def home_page
    @disable_footer = true
  end
end
