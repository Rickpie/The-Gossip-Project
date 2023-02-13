class HomeController < ApplicationController
 
  def index
    @gossip = Gossip.includes(:user).all
  end
  def show
  @gossip = Gossip.find(params[:id])
  end

end
