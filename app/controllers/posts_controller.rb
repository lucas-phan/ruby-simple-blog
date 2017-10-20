class PostsController < ApplicationController
  before_action :set_locale
  http_basic_authenticate_with name: "chinhdung", password: "12345", except: [:index, :show]

  def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
      {locale: I18n.locale}.merge options
  end

  def index
      @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
      # render :json => params
      @post = Post.new(post_params)

      if @post.save
          redirect_to @post
      else
          render 'new'
      end
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
          redirect_to @post
      else
          render 'edit'
      end
  end

  def destroy
      @post = Post.find(params[:id])

      @post.destroy

      redirect_to posts_path
  end

  private def post_params
      params.require(:post).permit(:title, :body)
  end
end
