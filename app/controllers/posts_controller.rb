class PostsController < ApplicationController
    before_action :is_signed_in?
    def index
        @post= Post.all.order('created_at DESC')
    end

    def new
        @post= Post.new
        
    end
    
    def edit
        @post=Post.find(params[:id])
    end

    def update
        @post=Post.update(post_params)
         if @post
            redirect_to posts_path
         else
            render 'edit'
         end
    end
    
    def create
        @post=Post.create(post_params)
        if @post
            redirect_to posts_path
        else
            redirect_to new_user_post_path(current_user)
        end
    end

    def destroy
        @post=Post.find(params[:id])
        # @post.comments.destroy
        @post.destroy
        redirect_to posts_path
    end

    def show
        @post=Post.find(params[:id])
        @comment = @post.comments.build
    end
    private
    def post_params
        raise params.inspect
        params.require(:post).permit([:title,:user_id,:image])
    end
end
