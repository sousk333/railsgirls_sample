class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to idea_path(@comment.idea_id)
    else
      redirect_to idea_path(@comment.idea_id), alert: "Error"
    end
  end

  def destroy
    @idea_id = @comment.idea_id
    @comment.destroy
    redirect_to idea_path(@comment.idea_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_name, :body, :idea_id)
    end
end
