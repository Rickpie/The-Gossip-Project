class WelcomeController < ApplicationController
  def index
    @first_name = params[:first_name]
  end
end
