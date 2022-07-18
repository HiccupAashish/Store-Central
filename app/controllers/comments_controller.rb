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
    
    private
    def comment_params
        params.require(:comment).permit(:post_id, :comment)
    end
end
