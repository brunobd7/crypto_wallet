class WelcomeController < ApplicationController

  def index

    cookies[:curso] = "Ruby on Rails - [COOKIE]"
    session[:curso] = "Ruby on Rails - [SESSION]"

    @nome = params[:my_name]
    @curso = params[:my_course]
  end
end
