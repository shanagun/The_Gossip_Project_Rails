class DynamicPagesController < ApplicationController
  def welcome
  end

  def gossip
    @gossip = Gossip.find(params[:id])
  end

  def user
    @user = User.find(params[:id])
  end
end
