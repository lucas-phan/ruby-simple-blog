class CommentsController < ApplicationController
    http_basic_authenticate_with name: "chinhdung", password: "12345", only: [:destroy]
    before_action :set_locale

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
        {locale: I18n.locale}.merge options
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_pramas)
        redirect_to post_path(@post)

    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private def comment_pramas
        params.require(:comment).permit(:username, :body)
    end
end
