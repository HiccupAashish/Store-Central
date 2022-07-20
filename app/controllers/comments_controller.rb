class CommentsController < ApplicationController
    def new
        @comment=Comment.new
    end
    def create
        @comment = Comment.new(comment_params)
          if @comment.save
            redirect_to posts_path
          else
            format.html { render :new, status: :unprocessable_entity }
          end 
    end

    def destroy
      @comment=Comment.find(params[:id])
      current_user.comments.delete(@comment)
      @comment.destroy
      redirect_to posts_path
    end
    
    private
    def comment_params
        params.require(:comment).permit(:post_id, :comment,:user_id)
    end
end
