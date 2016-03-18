class PagesController < ApplicationController
  def home
    @basic = Plan.find(1)
    @pro   = Plan.find(2)
  end

  def about

  end
end
