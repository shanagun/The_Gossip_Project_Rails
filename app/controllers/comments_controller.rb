class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]

  def show
  end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def create
    @comment = Comment.new('content' => params[:content],user: current_user, gossip: Gossip.find(params[:gossip_id]))
    if @comment.save
        redirect_to :controller => 'gossips', :action => 'show', notice: 'Success', :id => params[:gossip_id]
    else
      redirect_to :action => 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    comment_param = params.require(:comment).permit(:content)
    if @comment.update(comment_param)
      redirect_to :controller => 'gossips', action: 'show', :id => params[:gossip_id]
    else
      redirect_to :action => 'edit'
    end
  end

  def destroy
    if Comment.destroy(params[:comment_id])
      redirect_to :controller => 'gossips', action: "show", :id => params[:id]
    else
      redirect_to action: "show", :id => params[:id]
    end
  end

  def authenticate_user
    unless current_user
      flash[:notice] = "Tu n'as pas accès à cette page"
      redirect_to new_session_path
    end
  end 
  
end
