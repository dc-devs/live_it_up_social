class MainController < ApplicationController

  def index
    render layout: 'home_layout'
  end

  def razzle
    require 'texter'
    render text: Texter.razzle
  end
end
