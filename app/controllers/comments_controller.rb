class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: [:destroy, :update]
  before_action :set_post, only: [:create]

  def create
    @comment = @post.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { render json: @comment, status: :created }
        format.html { redirect_to :back, notice: 'Comment created with success.' }        
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.html { redirect_to :back }        
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.json { render json: :no_content }
      format.html { redirect_to :back, notice: 'Comment deleted with success.' }
    end
  end

  def update
    #desafio
  end

  private

    def set_post
      @post = Post.find(params[:comment][:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment).merge(user: current_user)
    end
end
