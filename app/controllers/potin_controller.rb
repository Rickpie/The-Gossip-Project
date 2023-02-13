class PotinController < ApplicationController
  def index
    @potin = Gossip.find(params[:id])
  end
end
