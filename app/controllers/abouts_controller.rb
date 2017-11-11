class AboutsController < ApplicationController
  def about
    @about = About.find_by(current: true)
  end
end
