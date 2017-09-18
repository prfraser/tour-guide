class CommentsController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.create(comment_params)
    redirect_to tour_path(@tour)
  end

   def destroy
    @tour = Tour.find(params[:tour_id])
    @comment = @tour.comments.find(params[:id])
    @comment.destroy
    redirect_to tour_path(@tour)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end