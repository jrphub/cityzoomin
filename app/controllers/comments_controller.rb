class CommentsController < ApplicationController
  
  def destroy
    @post = Comment.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back, :notice=>"Post is deleted successfully" }
      format.json { head :no_content }
      format.js #added
    end
  end
end
