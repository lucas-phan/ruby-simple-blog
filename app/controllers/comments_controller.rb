class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:id])
        @comment = @post.comments.create(comment_pramas)
        redirect_to post_path(@post)

    end

    private def comment_pramas
        params.require(:comment).permit(:username, :body)
    end
end
