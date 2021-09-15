class WelcomeController < ApplicationController

  def index
    @nome = params[:my_name]
    @curso = params[:my_course]
  end
end
