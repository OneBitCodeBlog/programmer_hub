class LikesController < ApplicationController
  load_and_authorize_resource
  before_action :set_post
  
  def create
    @like = Like.new(user: current_user, post: @post)
    respond_to do |format|
      if @like.save
        format.json { render json: @like }
        format.html { redirect_to :back, notice: 'Post liked with success.' }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @like = Like.find_by(user: current_user, post: @post)
    @like.destroy

    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to :back, notice: 'Post unliked with success.' }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end
end
